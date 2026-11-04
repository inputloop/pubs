#!/usr/bin/env python3
# narrate.py -- source to narration: one Piper recording per line, laid on a
# timeline, levelled, and written as one WAV.
# Copyright 2026 Corwin Brust; GPL-3.0-or-later
#
# Reads:  $GW_SRC/book, the spreads it names, $GW_SRC/cast; $GW_TAKE picks the take.
# Writes: $GW_BUILD/<take>/narration.wav   (44.1 kHz mono, levelled)
#         $GW_BUILD/<take>/timeline.json   (every shot and line, with start and end)
# Caches: $GW_CACHE/lines/<hash>.wav       (one per spoken line; reused across takes)
#
# Pauses (seconds) can be tuned without touching code:
#   GW_GAP_SAME   between two lines by the same voice       (default 0.30)
#   GW_GAP_TURN   when the voice changes                    (default 0.50)
#   GW_GAP_SENT   between sentences inside one line         (default 0.26)
#   GW_LEAD       silence at the start of a shot            (default 0.70)
#   GW_TAIL       silence at the end of a shot              (default 0.80)
#   GW_LUFS       loudness target for the whole narration   (default -19, a little quiet)
# If Piper cannot run, it falls back to espeak-ng and says so in the timeline.

import array
import hashlib
import json
import os
import re
import subprocess
import sys
import wave

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import spread  # noqa: E402

RATE = 44100
F = lambda k, d: float(os.environ.get(k, d))  # noqa: E731
GAP_SAME, GAP_TURN, GAP_SENT = F("GW_GAP_SAME", 0.30), F("GW_GAP_TURN", 0.50), F("GW_GAP_SENT", 0.26)
LEAD, TAIL, LUFS = F("GW_LEAD", 0.70), F("GW_TAIL", 0.80), F("GW_LUFS", -19)
PAGE_LEAD = 1.30   # a longer lead where a new spread begins, to hold the page-turn sound
LINE_MEAN_DB = -21.0


def sh(*cmd, **kw):
    return subprocess.run(cmd, check=True, capture_output=True, text=True, **kw)


class Voices:
    def __init__(self):
        self.loaded, self.engine = {}, "piper"
        try:
            from piper import PiperVoice, SynthesisConfig  # noqa: F401
            self.PiperVoice, self.SynthesisConfig = PiperVoice, SynthesisConfig
        except Exception as e:  # pragma: no cover - only when Piper is missing
            print(f"narrate: Piper cannot run ({e}); FALLING BACK TO espeak-ng", file=sys.stderr)
            self.engine = "espeak-ng"

    @staticmethod
    def sentences(text):
        """Split into sentences, folding any under three words into its neighbour.
        Piper's voices babble on a one-word sentence ("Chad." gave three seconds of
        noise), and Piper splits on every full stop, so a short one becomes a comma."""
        raw = [s for s in re.split(r"(?<=[.!?])\s+", text.strip()) if s]
        out, carry = [], ""
        for s in raw:
            s = (carry + " " + s).strip() if carry else s
            carry = ""
            if len(re.findall(r"[\w']+", s)) < 3:
                carry = re.sub(r"[.!?]+$", ",", s)
            else:
                out.append(s)
        if carry:
            if out:
                out[-1] = re.sub(r"[.!?]+$", ",", out[-1]) + " " + carry.rstrip(",") + "."
            else:
                out.append(carry.rstrip(",") + ".")
        return out

    def synth(self, v, text, dest):
        sentences = self.sentences(text)
        if self.engine == "espeak-ng":
            sh("espeak-ng", "-v", "en-us", "-s", str(int(160 / v["speed"])), "-w", dest, text)
            return
        path = os.path.join(spread.CACHE, "voices", v["voice"] + ".onnx")
        if path not in self.loaded:
            self.loaded[path] = self.PiperVoice.load(path)
        pv = self.loaded[path]
        sid = None
        if v["speaker"]:
            sid = pv.config.speaker_id_map.get(v["speaker"])
            if sid is None:
                sys.exit(f"narrate: speaker {v['speaker']} is not in {v['voice']}")
        cfg = self.SynthesisConfig(speaker_id=sid, length_scale=v["speed"])
        frames, rate = bytearray(), None
        for i, s in enumerate(sentences):
            tmp = dest + f".{i}.wav"
            with wave.open(tmp, "wb") as w:
                pv.synthesize_wav(s, w, syn_config=cfg)
            with wave.open(tmp, "rb") as r:
                rate = r.getframerate()
                secs, nwords = r.getnframes() / rate, len(re.findall(r"[\w']+", s))
                if secs > 0.9 * nwords + 1.2:
                    print(f"narrate: WARNING {secs:.1f} s for {nwords} words, may be babble: {s!r}",
                          file=sys.stderr)
                if i:
                    frames += b"\0\0" * int(GAP_SENT * rate)
                frames += r.readframes(r.getnframes())
            os.remove(tmp)
        with wave.open(dest, "wb") as w:
            w.setnchannels(1)
            w.setsampwidth(2)
            w.setframerate(rate)
            w.writeframes(bytes(frames))


def mean_db(path):
    out = subprocess.run(["ffmpeg", "-hide_banner", "-nostats", "-i", path, "-af", "volumedetect",
                          "-f", "null", "-"], capture_output=True, text=True).stderr
    m = re.search(r"mean_volume:\s*(-?[\d.]+) dB", out)
    return float(m.group(1)) if m else LINE_MEAN_DB


def to_samples(path, gain_db=0.0, fx=""):
    filt = f"volume={gain_db:.2f}dB" + (f",{fx}" if fx else "")
    raw = subprocess.run(["ffmpeg", "-hide_banner", "-loglevel", "error", "-i", path, "-af", filt,
                          "-ac", "1", "-ar", str(RATE), "-f", "s16le", "-"],
                         check=True, capture_output=True).stdout
    a = array.array("h")
    a.frombytes(raw)
    return a


def page_turn(dest):
    """A soft page-turn: a short breath of filtered noise, made here (no recording)."""
    if not os.path.exists(dest):
        sh("ffmpeg", "-hide_banner", "-loglevel", "error", "-y", "-f", "lavfi",
           "-i", "anoisesrc=d=0.55:c=pink:a=0.5:s=7", "-af",
           "highpass=f=900,lowpass=f=5200,afade=t=in:d=0.08,afade=t=out:st=0.12:d=0.43,volume=-14dB",
           "-ar", str(RATE), "-ac", "1", dest)
    return dest


def main():
    take = spread.TAKE
    meta, spreads = spread.read_book()
    cast = spread.read_cast()
    outdir = os.path.join(spread.BUILD, take or "default")
    linedir = os.path.join(spread.CACHE, "lines")
    os.makedirs(outdir, exist_ok=True)
    os.makedirs(linedir, exist_ok=True)
    voices = Voices()
    turn = {}
    shots = spread.shots(spreads)
    if not shots:
        sys.exit(f"narrate: take '{take}' has no narration lines")
    pieces, timeline, t, prev_who, prev_spread = [], [], 0.0, None, None
    for k, shot in enumerate(shots):
        lead = LEAD
        if prev_spread is not None and shot["spread"] != prev_spread:
            lead = PAGE_LEAD
            pieces.append((t + 0.15, page_turn(os.path.join(linedir, "page-turn.wav")), 0.0, ""))
        start = t
        t += lead
        lines = []
        prev_who = None
        for n in shot["lines"]:
            if n["who"] not in cast:
                sys.exit(f"narrate: '{n['who']}' speaks in {shot['id']} but is not in the cast")
            company = cast[n["who"]]
            v = company[turn.get(n["who"], 0) % len(company)]
            turn[n["who"]] = turn.get(n["who"], 0) + 1
            words = spread.said(n["text"])
            key = hashlib.sha1(json.dumps(["split-3", voices.engine, v["voice"], v["speaker"], v["speed"], GAP_SENT, words]).encode()).hexdigest()[:16]
            wav = os.path.join(linedir, key + ".wav")
            if not os.path.exists(wav):
                print(f"narrate: {n['who']:8s} {spread.shown(n['text'])[:60]}", flush=True)
                voices.synth(v, words, wav)
            if prev_who is not None:
                t += GAP_SAME if n["who"] == prev_who else GAP_TURN
            gain = LINE_MEAN_DB - mean_db(wav)
            samples = to_samples(wav, gain, v["fx"])
            dur = len(samples) / RATE
            pieces.append((t, samples, None, n["who"]))
            lines.append({
                "who": n["who"], "label": v["label"], "voice": v["voice"], "speaker": v["speaker"],
                "start": round(t, 3), "end": round(t + dur, 3),
                "text": spread.shown(n["text"]), "said": words, "fact": n["fact"],
            })
            t += dur
            prev_who = n["who"]
        t += TAIL
        timeline.append({"id": shot["id"], "spread": shot["spread"], "page": shot["page"],
                         "start": round(start, 3), "end": round(t, 3), "lines": lines})
        prev_spread = shot["spread"]
    total = t
    mix = array.array("h", bytes(2 * int(round(total * RATE))))
    for at, src, _, _ in pieces:
        if isinstance(src, str):
            src = to_samples(src)
        o = int(round(at * RATE))
        for i, s in enumerate(src):
            j = o + i
            if j < len(mix):
                v = mix[j] + s
                mix[j] = 32767 if v > 32767 else (-32768 if v < -32768 else v)
    raw = os.path.join(outdir, "narration-raw.wav")
    with wave.open(raw, "wb") as w:
        w.setnchannels(1)
        w.setsampwidth(2)
        w.setframerate(RATE)
        w.writeframes(mix.tobytes())
    # two-pass loudness levelling to a quiet, close target
    m = subprocess.run(["ffmpeg", "-hide_banner", "-nostats", "-i", raw, "-af",
                        f"loudnorm=I={LUFS}:TP=-2:LRA=11:print_format=json", "-f", "null", "-"],
                       capture_output=True, text=True).stderr
    js = json.loads(m[m.rindex("{"):m.rindex("}") + 1])
    filt = (f"loudnorm=I={LUFS}:TP=-2:LRA=11:linear=true:measured_I={js['input_i']}:"
            f"measured_TP={js['input_tp']}:measured_LRA={js['input_lra']}:measured_thresh={js['input_thresh']}"
            f":offset={js['target_offset']}")
    final = os.path.join(outdir, "narration.wav")
    sh("ffmpeg", "-hide_banner", "-loglevel", "error", "-y", "-i", raw, "-af", filt,
       "-ar", str(RATE), "-ac", "1", "-t", f"{total:.6f}", final)
    os.remove(raw)
    with open(os.path.join(outdir, "timeline.json"), "w", encoding="utf-8") as fh:
        json.dump({"take": take, "title": meta.get("title", ""), "engine": voices.engine,
                   "rate": RATE, "total": round(total, 3), "lufs": LUFS, "shots": timeline}, fh, indent=1)
    print(f"narrate: take {take or '-'}: {len(timeline)} shots, "
          f"{sum(len(s['lines']) for s in timeline)} lines, {total:.2f} s ({voices.engine})")


if __name__ == "__main__":
    main()
