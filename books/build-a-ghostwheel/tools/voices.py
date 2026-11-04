#!/usr/bin/env python3
# voices.py -- fetch the Piper voices the cast names, and read their model cards.
# Copyright 2026 Corwin Brust; GPL-3.0-or-later
#
# Downloads only from the rhasspy/piper-voices repository on Hugging Face.
# Each file is checked against the md5 that the repository's voices.json gives.
# Writes $GW_BUILD/voices.txt: one block per voice with its model card's
# dataset, licence and training lines, for the colophon.

import hashlib
import json
import os
import sys
import urllib.request

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import spread  # noqa: E402

REPO = "https://huggingface.co/rhasspy/piper-voices/resolve/main/"


def fetch(url, dest):
    tmp = dest + ".part"
    with urllib.request.urlopen(url, timeout=120) as r, open(tmp, "wb") as fh:
        while True:
            b = r.read(1 << 20)
            if not b:
                break
            fh.write(b)
    os.replace(tmp, dest)


def md5(path):
    h = hashlib.md5()
    with open(path, "rb") as fh:
        for b in iter(lambda: fh.read(1 << 20), b""):
            h.update(b)
    return h.hexdigest()


def main():
    vdir = os.path.join(spread.CACHE, "voices")
    os.makedirs(vdir, exist_ok=True)
    os.makedirs(spread.BUILD, exist_ok=True)
    index = os.path.join(vdir, "voices.json")
    if not os.path.exists(index):
        fetch(REPO + "voices.json", index)
    with open(index, encoding="utf-8") as fh:
        catalog = json.load(fh)
    report = []
    for name in spread.voices_in_cast():
        if name not in catalog:
            sys.exit(f"voices: {name} is not in rhasspy/piper-voices voices.json")
        entry = catalog[name]
        for rel, info in entry["files"].items():
            dest = os.path.join(vdir, os.path.basename(rel))
            if os.path.basename(rel) == "MODEL_CARD":
                dest = os.path.join(vdir, name + ".MODEL_CARD")
            if not (os.path.exists(dest) and md5(dest) == info["md5_digest"]):
                print(f"voices: fetching {rel}", flush=True)
                fetch(REPO + rel, dest)
            got = md5(dest)
            if got != info["md5_digest"]:
                sys.exit(f"voices: {rel} md5 {got} does not match voices.json {info['md5_digest']}")
        card = open(os.path.join(vdir, name + ".MODEL_CARD"), encoding="utf-8").read()
        keep = [ln.strip("* ").strip() for ln in card.splitlines()
                if ln.strip().startswith(("* URL", "* License", "* Speakers"))]
        train = card.split("## Training", 1)[-1].strip().splitlines()
        train = " ".join(t.strip() for t in train if t.strip() and not t.startswith("See:"))
        report.append(f"voice: {name}\n" + "".join(f"  {k}\n" for k in keep) + f"  Training: {train}\n")
        print(f"voices: {name} ok ({'; '.join(keep)})")
    with open(os.path.join(spread.BUILD, "voices.txt"), "w", encoding="utf-8") as fh:
        fh.write("\n".join(report))


if __name__ == "__main__":
    main()
