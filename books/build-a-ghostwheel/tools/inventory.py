#!/usr/bin/env python3
# inventory.py -- write src/goodnight from src/goodnight.in: every atom in the book, by the day it
# was seen, with a hash over the spreads it read.
# Copyright 2026 Corwin Brust; GPL-3.0-or-later
#
# Goodnight's fuller page names every fact (atom) of every spread before it, grouped by the UTC day
# its witness rows were seen, and a witness row of its own whose sha256 covers those spread files
# joined in book order (goodnight left out, since it holds that row). Any change to a spread changes
# the hash, so this stage runs again; checks/run.sh inventory turns red when it has not.
# The template's @@NAMES@@ are filled here; the rest of it is hand-written and stays as written.
# First written by the part-two writer (2026-11-03) as a one-off; made a stage by Mentat.
import collections
import datetime
import hashlib
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import spread  # noqa: E402

SRC = spread.SRC
DAYS = ["2026-11-03", "2026-11-04"]   # the template's words say "3 November" and "4 November"
OWN = ["2026-11-04T00:19:40Z", "2026-11-04T00:37:47Z"]   # goodnight's own hand-written rows


def main():
    order = [l.split(":", 1)[1].strip() for l in open(os.path.join(SRC, "book"), encoding="utf-8") if l.startswith("spread:")]
    byday, counts, seen_all, h, files = collections.OrderedDict(), [], collections.defaultdict(list), hashlib.sha256(), []
    for n in order:
        if n == "goodnight":
            continue
        p = os.path.join(SRC, n)
        sp = spread.read_spread(p)
        if sp["kind"] != "spread":
            continue
        files.append(n)
        h.update(open(p, "rb").read())
        ids, days = [], set()
        for f in sp["facts"]:
            if f["fact"] not in ids:
                ids.append(f["fact"])
            s = f.get("seen", "")
            days.add(s[:10])
            seen_all[s[:10]].append(s)
        if len(days) != 1:
            raise SystemExit(f"inventory: {n}: its rows were seen on more than one day ({', '.join(sorted(days))}); "
                             "goodnight's words group a spread under one day, so its page needs a hand first")
        poss = sp["title"] + ("'" if sp["title"].endswith("s") else "'s")
        byday.setdefault(days.pop(), []).append(f"{poss} {', '.join(ids)}")
        counts.append((sp["title"], len(ids)))
    if list(byday) != DAYS:
        raise SystemExit(f"inventory: the spreads were seen on {', '.join(byday)}; the template speaks of {', '.join(DAYS)}")
    now = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    t1 = sorted(seen_all[DAYS[0]])
    t2 = sorted(seen_all[DAYS[1]] + OWN + [now])

    def hm(t):
        return t[11:16]

    def cst(t):
        return (datetime.datetime.strptime(t, "%Y-%m-%dT%H:%M:%SZ") - datetime.timedelta(hours=6)).strftime("%-d Nov, %H:%M")
    r1 = f"3 Nov, {hm(t1[0])}" + ("" if hm(t1[0]) == hm(t1[-1]) else f" to {hm(t1[-1])}") + " (Door, Letters)"
    c1 = cst(t1[0]) + ("" if hm(t1[0]) == hm(t1[-1]) else f" to {cst(t1[-1])[-5:]}")
    r2 = f"4 Nov, {hm(t2[0])} to {hm(t2[-1])} (the other fifteen spreads)"
    c2 = f"{cst(t2[0])} to {cst(t2[-1])[-5:]}"
    fill = {
        "@@DAY1@@": "; ".join(byday[DAYS[0]]),
        "@@DAY2@@": "; ".join(byday[DAYS[1]]),
        "@@CLOCKROWS@@": f"{r1} | {c1}\n{r2} | {c2}",
        "@@LISTSAID@@": f"{len(files)} spreads before this one; atoms per spread: " + "; ".join(f"{t} {k}" for t, k in counts) + ".",
        "@@LISTSEEN@@": now,
        "@@LISTSHA@@": h.hexdigest(),
        "@@DAYSSAID@@": (f"seen: lines on {DAYS[0]} for Door and Letters ({t1[0][11:]} to {t1[-1][11:]}); on {DAYS[1]} "
                         f"for the other fourteen spreads ({t2[0][11:]} to {sorted(seen_all[DAYS[1]])[-1][11:]})."),
    }
    s = open(os.path.join(SRC, "goodnight.in"), encoding="utf-8").read()
    for k, v in fill.items():
        s = s.replace(k, v)
    if "@@" in s:
        raise SystemExit("inventory: the template holds a name this stage does not fill")
    s = "# goodnight -- WRITTEN BY tools/inventory.py from goodnight.in; edit that file, then run the stage.\n" + s
    with open(os.path.join(SRC, "goodnight"), "w", encoding="utf-8") as fh:
        fh.write(s)
    print(f"inventory: {SRC}/goodnight: {len(files)} spreads, {sum(k for _, k in counts)} atoms, sha256 {h.hexdigest()[:16]}")


if __name__ == "__main__":
    main()
