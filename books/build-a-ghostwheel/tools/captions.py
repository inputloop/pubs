#!/usr/bin/env python3
# captions.py -- timeline to captions, transcript and chapters.
# Copyright 2026 Corwin Brust; GPL-3.0-or-later
#
# Reads:  $GW_BUILD/<take>/timeline.json, the book
# Writes: $GW_OUT/pilot<-take>.vtt        WebVTT; a character's line starts with its name
#         $GW_OUT/transcript<-take>.txt   plain words, with times
#         $GW_BUILD/<take>/chapters.txt   ffmpeg metadata: title, credit, one chapter per page
# Cues hold at most two lines of 42 characters; a longer line is split at a
# sentence or comma and its time shared out by length.

import json
import os
import re
import sys
import textwrap

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import spread  # noqa: E402

WIDTH, LINES = 42, 2


def ts(t, sep="."):
    t = max(0.0, t)
    h, rem = divmod(int(round(t * 1000)), 3600000)
    m, rem = divmod(rem, 60000)
    s, ms = divmod(rem, 1000)
    return f"{h:02d}:{m:02d}:{s:02d}{sep}{ms:03d}"


def chunks(text):
    """Split text into pieces that each fit WIDTH x LINES."""
    if len(textwrap.wrap(text, WIDTH)) <= LINES:
        return [text]
    parts = re.split(r"(?<=[.!?;:])\s+|(?<=,)\s+", text)
    out, cur = [], ""
    for p in parts:
        trial = (cur + " " + p).strip()
        if len(textwrap.wrap(trial, WIDTH)) <= LINES:
            cur = trial
        else:
            if cur:
                out.append(cur)
            while len(textwrap.wrap(p, WIDTH)) > LINES:  # a very long clause: cut at a word
                words, head = p.split(), ""
                while words and len(textwrap.wrap((head + " " + words[0]).strip(), WIDTH)) <= LINES:
                    head = (head + " " + words.pop(0)).strip()
                out.append(head)
                p = " ".join(words)
            cur = p
    if cur:
        out.append(cur)
    return out


def page_name(shot, spreads):
    sp = next(s for s in spreads if s["name"] == shot["spread"])
    page = {"picture": "picture page", "fuller": "both pages", "card": ""}.get(shot["page"], shot["page"])
    return f"{sp['title']}" + (f": {page}" if page else "")


def main():
    take = spread.TAKE
    suf = spread.suffix()
    meta, spreads = spread.read_book()
    d = os.path.join(spread.BUILD, take or "default")
    with open(os.path.join(d, "timeline.json"), encoding="utf-8") as fh:
        tl = json.load(fh)
    title = meta.get("title", "")
    take_desc = meta.get("takes", {}).get(take, "")
    cues = []
    for shot in tl["shots"]:
        for ln in shot["lines"]:
            named = (f"{ln['label']}: " if ln["who"] != "narrator" else "") + ln["text"]
            pieces = chunks(named)
            span = ln["end"] - ln["start"]
            total = sum(len(p) for p in pieces) or 1
            t = ln["start"]
            for p in pieces:
                dt = span * len(p) / total
                cues.append((t, t + dt, ln["label"], p))
                t += dt
    with open(os.path.join(spread.OUT, f"pilot{suf}.vtt"), "w", encoding="utf-8") as fh:
        fh.write("WEBVTT\n\n")
        fh.write(f"NOTE {title}" + (f", take {take}: {take_desc}" if take else "") + "\n"
                 f"NOTE {meta.get('copyright', '')}\n\n")
        for k, (a, b, who, text) in enumerate(cues, 1):
            body = "\n".join(textwrap.wrap(text, WIDTH))
            fh.write(f"{k}\n{ts(a)} --> {ts(b)}\n<v {who}>{body}\n\n")
    with open(os.path.join(spread.OUT, f"transcript{suf}.txt"), "w", encoding="utf-8") as fh:
        fh.write(f"{title}\n{meta.get('subtitle', '')}" + (f". Take {take}: {take_desc}." if take else "") + "\n")
        fh.write(f"{meta.get('copyright', '')}\nLength {ts(tl['total']).rsplit('.', 1)[0]}. "
                 "Times are minutes and seconds from the start.\n")
        for shot in tl["shots"]:
            fh.write(f"\n== {page_name(shot, spreads)} ==\n")
            for ln in shot["lines"]:
                m, s = divmod(int(ln["start"]), 60)
                fh.write(f"[{m:02d}:{s:02d}] {ln['label']}: {ln['text']}\n")
        fh.write("\nVoices: see COLOPHON.md, which names each voice and quotes its model card.\n")

    def esc(v):
        return re.sub(r"([=;#\\\n])", r"\\\1", v)
    with open(os.path.join(d, "chapters.txt"), "w", encoding="utf-8") as fh:
        fh.write(";FFMETADATA1\n")
        fh.write(f"title={esc(title + (' (pilot, take ' + take + ': ' + take_desc + ')' if take else ' (pilot)'))}\n")
        fh.write("artist=Corwin Brust\n")
        fh.write(f"copyright={esc(meta.get('copyright', ''))}\n")
        fh.write(f"comment={esc('Voices by Piper; every voice and its licence are named in COLOPHON.md. Written and drawn by Mentat (for Corwin, claude-opus-5-5).')}\n")
        for shot in tl["shots"]:
            fh.write(f"\n[CHAPTER]\nTIMEBASE=1/1000\nSTART={int(shot['start'] * 1000)}\nEND={int(shot['end'] * 1000)}\n"
                     f"title={esc(page_name(shot, spreads))}\n")
    print(f"captions: take {take or '-'}: {len(cues)} cues, transcript, {len(tl['shots'])} chapters")


if __name__ == "__main__":
    main()
