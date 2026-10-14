#!/usr/bin/env python3
"""Test for CARD-2026-09-27-which-host-to-pull-from.md (the c4-pull.sh block inside it).

Written in Python on purpose: the thing under test is sh, and the test is a second language.
Contacts no host. Three local bare repositories stand in for gw7, gw14 and gw26; a host that is
"down" is a remote whose path does not exist.

    python3 CARD-2026-09-27-which-host-to-pull-from.test.py            run the cases
    python3 CARD-2026-09-27-which-host-to-pull-from.test.py --prove-red also run each mutant; each must fail

Exit 0 only if every case holds (and, with --prove-red, every mutant is caught).
Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.
"""
import os
import re
import shutil
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
CARD = os.path.join(HERE, "CARD-2026-09-27-which-host-to-pull-from.md")
BEGIN = "# --- c4-pull.sh begins ---"
END = "# --- c4-pull.sh ends ---"
SHELL = os.environ.get("C4_TEST_SHELL") or shutil.which("dash") or "sh"   # C4_TEST_SHELL=bash to try another
ENV = dict(os.environ, GIT_AUTHOR_NAME="t", GIT_AUTHOR_EMAIL="t@t", GIT_COMMITTER_NAME="t",
           GIT_COMMITTER_EMAIL="t@t", GIT_CONFIG_NOSYSTEM="1", HOME=tempfile.gettempdir())
for k in ("C4_HOSTS", "C4_REF", "C4_SSH_TIMEOUT", "GIT_SSH_COMMAND"):
    ENV.pop(k, None)


def script_from_card():
    text = open(CARD, encoding="utf-8").read().splitlines()
    i, j = text.index(BEGIN), text.index(END)
    return "\n".join(text[i:j + 1]) + "\n"


def git(*args, cwd=None):
    return subprocess.run(("git",) + args, cwd=cwd, env=ENV, check=True,
                          capture_output=True, text=True).stdout.strip()


class Lab:
    """A source repo with commits A-B-C (linear) and D (child of A, another file), three bare hosts, one partner."""

    def __init__(self, root):
        self.root = root
        src = os.path.join(root, "src")
        git("init", "-q", src)
        self.sha = {}
        for name, parent in (("A", None), ("B", "A"), ("C", "B"), ("D", "A")):
            if parent:
                git("checkout", "-q", "--detach", self.sha[parent], cwd=src)
            fname = "g" if name == "D" else "f"   # D touches another file, so merges never conflict
            with open(os.path.join(src, fname), "w") as fh:
                fh.write(name)
            git("add", fname, cwd=src)
            git("commit", "-q", "-m", name, cwd=src)
            self.sha[name] = git("rev-parse", "HEAD", cwd=src)
        self.src = src

    def host(self, name, commit):
        path = os.path.join(self.root, name + ".git")
        if commit is None:            # down: the remote points at a path that does not exist
            return path
        git("init", "-q", "--bare", path)
        git("symbolic-ref", "HEAD", "refs/heads/main", cwd=path)
        git("push", "-q", "--force", path, self.sha[commit] + ":refs/heads/main", cwd=self.src)
        return path

    def partner(self, hosts, at="A"):
        seed = self.host("seed", at)
        p = os.path.join(self.root, "partner")
        git("clone", "-q", seed, p)
        for name, commit in hosts.items():
            git("remote", "add", name, self.host(name, commit), cwd=p)
        return p


def run(script, partner, *args, env_extra=None):
    path = os.path.join(partner, "..", "c4-pull.sh")
    with open(path, "w") as fh:
        fh.write(script)
    env = dict(ENV, **(env_extra or {}))
    r = subprocess.run((SHELL, path) + args, cwd=partner, env=env, capture_output=True, text=True)
    return r.returncode, r.stdout + r.stderr


def head(p):
    return git("rev-parse", "HEAD", cwd=p)


# Each case: (name, hosts, partner-at, args, env, checks(lab, partner, rc, out) -> list of failures)
def c_all_agree(lab, p, rc, out):
    return [m for ok, m in ((rc == 0, "exit 0"), ("AGREE: 3 of 3" in out, "AGREE 3 of 3"),
                            ("PULLED from gw7" in out, "pulled from gw7"),
                            (head(p) == lab.sha["B"], "HEAD at B")) if not ok]


def c_first_down(lab, p, rc, out):
    return [m for ok, m in ((rc == 0, "exit 0"), ("AGREE: 2 of 3" in out, "AGREE 2 of 3"),
                            ("PULLED from gw14" in out, "pulled from gw14"),
                            ("gw7    NO-ANSWER" in out, "gw7 NO-ANSWER"),
                            (head(p) == lab.sha["B"], "HEAD at B")) if not ok]


def c_stale(lab, p, rc, out):
    return [m for ok, m in ((rc == 0, "exit 0"), ("ODD: gw26 is BEHIND" in out, "gw26 BEHIND"),
                            (head(p) == lab.sha["B"], "HEAD at B")) if not ok]


def c_ahead(lab, p, rc, out):
    return [m for ok, m in ((rc == 0, "exit 0"), ("PULLED from gw14" in out, "pulled from gw14"),
                            ("ODD: gw7 is AHEAD" in out, "gw7 AHEAD"),
                            (head(p) == lab.sha["B"], "HEAD at B, not C")) if not ok]


def c_diverged(lab, p, rc, out):
    return [m for ok, m in ((rc == 0, "exit 0"), ("ODD: gw26 has DIVERGED" in out, "gw26 DIVERGED"),
                            (head(p) == lab.sha["B"], "HEAD at B")) if not ok]


def c_single(lab, p, rc, out):
    fetched = subprocess.run(("git", "cat-file", "-e", lab.sha["B"] + "^{commit}"), cwd=p,
                             env=ENV, stderr=subprocess.DEVNULL).returncode == 0
    return [m for ok, m in ((rc == 3, "exit 3"), ("SINGLE: only gw26" in out, "SINGLE gw26"),
                            ("git merge --ff-only " + lab.sha["B"] in out, "prints merge line"),
                            (fetched, "B fetched"),
                            (head(p) == lab.sha["A"], "HEAD unchanged at A")) if not ok]


def c_none(lab, p, rc, out):
    return [m for ok, m in ((rc == 5, "exit 5"), ("NONE:" in out, "NONE"),
                            (head(p) == lab.sha["A"], "HEAD unchanged")) if not ok]


def c_split(lab, p, rc, out):
    return [m for ok, m in ((rc == 4, "exit 4"), ("SPLIT: 3 hosts" in out, "SPLIT"),
                            (head(p) == lab.sha["A"], "HEAD unchanged")) if not ok]


def c_look(lab, p, rc, out):
    fetched = subprocess.run(("git", "cat-file", "-e", lab.sha["B"] + "^{commit}"), cwd=p,
                             env=ENV, stderr=subprocess.DEVNULL).returncode == 0
    return [m for ok, m in ((rc == 0, "exit 0"), ("AGREE: 3 of 3" in out, "AGREE"),
                            ("PULLED" not in out, "no pull"), (not fetched, "nothing fetched"),
                            (head(p) == lab.sha["A"], "HEAD unchanged")) if not ok]


def c_own_commits(lab, p, rc, out):
    return [m for ok, m in ((rc == 6, "exit 6"), ("fetched, not merged" in out, "says not merged"),
                            (git("log", "-1", "--format=%s", cwd=p) == "mine", "own commit kept on top"))
            if not ok]


def c_current(lab, p, rc, out):
    return [m for ok, m in ((rc == 0, "exit 0"), ("UP-TO-DATE" in out, "UP-TO-DATE")) if not ok]


def c_order(lab, p, rc, out):
    return [m for ok, m in ((rc == 0, "exit 0"), ("PULLED from gw26" in out, "pulled from gw26"))
            if not ok]


def c_no_remote(lab, p, rc, out):
    return [m for ok, m in ((rc == 2, "exit 2"), ("no remote named gw26" in out, "names gw26")) if not ok]


def c_log(lab, p, rc, out):
    log = os.path.join(p, ".git", "c4-pull-log")
    lines = open(log).read().splitlines() if os.path.exists(log) else []
    stamps = {l.split("\t")[0] for l in lines}
    good = len(lines) == 3 and len(stamps) == 1 and all(len(l.split("\t")) == 3 for l in lines)
    return [] if good else ["3 tab-separated log lines, one stamp (got %d)" % len(lines)]


def own_commit(p):
    with open(os.path.join(p, "mine.txt"), "w") as fh:
        fh.write("mine")
    git("add", "mine.txt", cwd=p)
    git("commit", "-q", "-m", "mine", cwd=p)


CASES = [
    ("all three agree", {"gw7": "B", "gw14": "B", "gw26": "B"}, "A", (), None, None, c_all_agree),
    ("first host down", {"gw7": None, "gw14": "B", "gw26": "B"}, "A", (), None, None, c_first_down),
    ("one host stale", {"gw7": "B", "gw14": "B", "gw26": "A"}, "A", (), None, None, c_stale),
    ("one host ahead", {"gw7": "C", "gw14": "B", "gw26": "B"}, "A", (), None, None, c_ahead),
    ("one host diverged", {"gw7": "B", "gw14": "B", "gw26": "D"}, "A", (), None, None, c_diverged),
    ("single witness", {"gw7": None, "gw14": None, "gw26": "B"}, "A", (), None, None, c_single),
    ("none answer", {"gw7": None, "gw14": None, "gw26": None}, "A", (), None, None, c_none),
    ("all disagree", {"gw7": "B", "gw14": "C", "gw26": "D"}, "A", (), None, None, c_split),
    ("--look changes nothing", {"gw7": "B", "gw14": "B", "gw26": "B"}, "A", ("--look",), None, None, c_look),
    ("own commits refuse ff", {"gw7": "B", "gw14": "B", "gw26": "B"}, "D", (), None, own_commit, c_own_commits),
    ("already current", {"gw7": "B", "gw14": "B", "gw26": "B"}, "B", (), None, None, c_current),
    ("order override", {"gw7": "B", "gw14": "B", "gw26": "B"}, "A", (), {"C4_HOSTS": "gw26 gw7 gw14"}, None, c_order),
    ("missing remote", {"gw7": "B", "gw14": "B"}, "A", (), None, None, c_no_remote),
    ("log lines", {"gw7": "B", "gw14": None, "gw26": "B"}, "A", (), None, None, c_log),
]

# Mutants: each weakens one promise the card makes. Each must make at least one case fail.
MUTANTS = [
    ("one witness counts as agreement", r'"\$c" -ge 2', '"$c" -ge 1'),
    ("merge is not fast-forward-only", r"git merge --ff-only -q", "git merge -q --no-edit"),
    ("single witness is merged", r'    echo "Fetched, not merged\. To take it:',
     '    git merge --ff-only -q "$lsha"; echo "Fetched, not merged. To take it:'),
    ("no log line", r'>> "\$GITDIR/c4-pull-log"', "> /dev/null"),
]


def run_cases(script):
    failures = []
    for name, hosts, at, args, env_extra, prep, check in CASES:
        root = tempfile.mkdtemp(prefix="c4pull-")
        try:
            lab = Lab(root)
            p = lab.partner(hosts, at)
            if prep:
                prep(p)
            rc, out = run(script, p, *args, env_extra=env_extra)
            bad = check(lab, p, rc, out)
            if bad:
                failures.append((name, bad, out))
        finally:
            shutil.rmtree(root, ignore_errors=True)
    return failures


def main():
    script = script_from_card()
    fails = run_cases(script)
    for name, bad, out in fails:
        print("FAIL %-24s %s\n%s" % (name, "; ".join(bad), "    " + out.replace("\n", "\n    ")))
    print("cases: %d of %d held (shell: %s)" % (len(CASES) - len(fails), len(CASES), SHELL))
    ok = not fails
    if "--prove-red" in sys.argv[1:]:
        for label, pat, repl in MUTANTS:
            mutant, n = re.subn(pat, lambda _m: repl, script, count=1)
            if n != 1:
                print("MUTANT %-34s could not be applied (pattern gone): RED-CHECK BROKEN" % label)
                ok = False
                continue
            caught = [f[0] for f in run_cases(mutant)]
            print("MUTANT %-34s %s" % (label, ("caught by: " + ", ".join(caught)) if caught else "NOT CAUGHT"))
            ok = ok and bool(caught)
        print("prove-red: " + ("all held, all fired." if ok else "a case or a mutant did not behave."))
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
