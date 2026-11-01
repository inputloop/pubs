#!/usr/bin/env python3
"""refresh_test.py -- checks refresh.sh against its own usage text, from a second language.

usage: python3 tests/refresh_test.py [--prove-red]
  With no flag: builds a small shelf and a small repository in a temporary folder, runs refresh.sh,
  and checks seven promises. Exit 0 all hold, 1 any fails.
  --prove-red: runs the same checks against the first refresh.sh (git commit 46b5850), which had no
  hold list and never removed anything, and exits 0 only if the checks FAIL there -- a check that
  cannot fail is not a check.

Copyright 2026 Corwin Brust <corwin@bru.st> and Contributors.  Authored by Mentat (for Corwin).
SPDX-License-Identifier: GPL-3.0-or-later OR LGPL-3.0-or-later
"""
import os, subprocess, sys, tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(HERE)


def write(path, text):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(text)


def run_checks(script_text):
    fails = []
    with tempfile.TemporaryDirectory() as t:
        shelf, repo = os.path.join(t, "shelf"), os.path.join(t, "repo")
        write(os.path.join(shelf, "RECIPE.org"), "recipe\n")
        write(os.path.join(shelf, "papers/kept/ESSAY.md"), "new words\n")
        write(os.path.join(shelf, "papers/kept/.c4/PROVENANCE.tsv"), "working\n")
        write(os.path.join(shelf, ".c4/leakwords"), "secret-host\n")
        write(os.path.join(shelf, ".c4/pubs-hold"),
              "# held\nposts/held-item\tdrafts for the keeper\n")
        write(os.path.join(shelf, "posts/held-item/DRAFT.md"), "not yet\n")
        write(os.path.join(shelf, "sites/big/index.html"), "site\n")
        write(os.path.join(repo, "REPO.md"), "repo front door\n")
        write(os.path.join(repo, "COPYING"), "")
        write(os.path.join(repo, "tests/keep.txt"), "a test\n")
        write(os.path.join(repo, "papers/kept/ESSAY.md"), "old words\n")
        write(os.path.join(repo, "papers/withdrawn/OLD.md"), "withdrawn from the shelf\n")
        write(os.path.join(repo, "refresh.sh"), script_text)
        r = subprocess.run(["sh", os.path.join(repo, "refresh.sh"), shelf],
                           capture_output=True, text=True)
        ex = lambda p: os.path.exists(os.path.join(repo, p))
        read = lambda p: open(os.path.join(repo, p), encoding="utf-8").read()
        checks = [
            ("runs and exits 0", r.returncode == 0),
            ("copies a shelf file", ex("RECIPE.org")),
            ("brings a changed file current", ex("papers/kept/ESSAY.md") and read("papers/kept/ESSAY.md") == "new words\n"),
            ("never copies a .c4 folder", not ex(".c4") and not ex("papers/kept/.c4")),
            ("never copies sites/", not ex("sites")),
            ("never copies a held path", not ex("posts/held-item")),
            ("removes what the shelf no longer carries", not ex("papers/withdrawn")),
            ("keeps the repository's own files", ex("REPO.md") and ex("COPYING") and ex("tests/keep.txt") and ex("refresh.sh")),
        ]
        # --dry writes nothing
        write(os.path.join(shelf, "papers/kept/LATER.md"), "later\n")
        d = subprocess.run(["sh", os.path.join(repo, "refresh.sh"), "--dry", shelf],
                           capture_output=True, text=True)
        checks.append(("--dry writes nothing", d.returncode == 0 and not ex("papers/kept/LATER.md")))
        for name, ok in checks:
            print(("ok    " if ok else "FAIL  ") + name)
            if not ok:
                fails.append(name)
    return fails


def main():
    if "--prove-red" in sys.argv[1:]:
        old = subprocess.run(["git", "-C", REPO, "show", "46b5850:refresh.sh"],
                             capture_output=True, text=True)
        if old.returncode != 0:
            print("prove-red: cannot read the first refresh.sh from git (shallow clone? fetch 46b5850)")
            return 2
        fails = run_checks(old.stdout)
        print("prove-red: %d check(s) failed on the old script -- %s"
              % (len(fails), "RED as expected" if fails else "NOT RED: the checks cannot fail"))
        return 0 if fails else 1
    with open(os.path.join(REPO, "refresh.sh"), encoding="utf-8") as f:
        fails = run_checks(f.read())
    print("%d failed" % len(fails))
    return 1 if fails else 0


if __name__ == "__main__":
    sys.exit(main())
