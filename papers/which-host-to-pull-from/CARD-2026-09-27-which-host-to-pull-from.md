---
work: which of the three transport hosts a lab partner pulls C4 from, and what to do when one is down
arm: -
wave: -
stamp: 2026-09-27
ledger: -
persona: - (plain voice; gw7 named the card owed, it does not speak here)
reviewer: -
method: derived from the availability table in the signed project instructions; tested only against local bare repositories (no host contacted)
independence: the commands are sh; the test that checks them is Python (CARD-2026-09-27-which-host-to-pull-from.test.py)
completes: analysis/topologies/MODEL-2026-09-22-where-c4-runs.md:73-75 (an ADD beside it; that file is unchanged)
---

# CARD — 2026-09-27 — which host to pull C4 from

**Form.** This is the older kind of CARD, the one a person carries out by hand (WHEN / DO / CHECK /
TELL-ME), and the `c/wf` CARD row names it (`c/wf`, CARD row, last column: "the older keeper-hands
card (WHEN / DO / CHECK / TELL-ME) uses the plain date name"). The frontmatter above is the one that
row names for the brief-style card; the fields that do not apply read `-`. The one-line rule is:
**ask all three hosts, then take the copy from the first host that another host agrees with.**

## The recipe, in the four parts the model's shelf asks for

`analysis/topologies/MODEL-2026-09-22-where-c4-runs.md:59-61` asks every recipe card for four parts.

| part | here |
|---|---|
| the problem, in the words of its solution | Ask every host what it holds; pull from the first host that at least one other host agrees with. |
| the smallest worked case | `sh c4-pull.sh --look` (it asks and reports, and changes nothing) |
| the reader it was written for | a lab partner with a C4 clone, git and a POSIX shell. No C4 tools, no AI. |
| the finest grain it can be maintained at | one git remote per host; one log line per host per try; one script block in this card |

## What the spec says (OBSERVED)

The **Remotes** section of Corwin's clearsigned project instructions (verified GOOD on 2026-09-22,
`h/HANDBACK-2026-09-22-fabel-integrated-domains.md:21`) names three transport hosts,
**gw7**, **gw14** and **gw26**. It also has this table, quoted exactly:

| anticipate | of the three transport hosts |
|---|---|
| 99.99% | at least one reachable |
| 90% | any two reachable |
| 98% (target) | all three, per cases of actual demand |

and this qualifier: "Availability, as monitored against actual git(1) demand and within the bounds
of courtesy/custom and our in-fact practices". The same text is quoted in
`magic-number-theory/HYPOTHESIS-2026-09-26-magic-number-arms.DOSSIER.md:96-98` (C16).

What the tree says about the hosts today:

- All three hosts accepted a connection on 2026-09-22. `spells/onward-turn/runs/2026-09-22T2115Z-preflight.md:8`
  says: "gw7 resolves, port 22 open · gw14 resolves, port 22 open · gw26 resolves, port 22 open, https 200".
- On 2026-09-26 all three were "BACKED for SSH", but git itself was "**for git: not proven** (no SSH key in this VM, and the c4
  tree has no git remote: `git remote -v` prints nothing)" (`onward-readiness/review-2026-09-26-onward/SPELLS-CONSISTENCY.md:42`).
- The job of giving C4 a remote is still open: item 2 in `onward-readiness/READING-2026-09-27-before-onward.md:15-17`, and item D4 in the same review's
  "Do first" table (`SPELLS-CONSISTENCY.md`, row D4; `MEMORY.md:3176` also lists "commit c4 + remote" as owed; D4 reads: "commit the 1,159 changed or untracked paths … say which host(s) carry c4").
- **The URLs are DASHED.** No file in the snapshot gives a git URL for any of the three hosts
  (`grep -rn 'gw[0-9]*\.bru\.st'` finds only host names). The hosts register `c/hosts`
  was created on 2026-09-23 (`h/HANDBACK-2026-09-23-spells-as-books.md:25`: "`c/hosts` + `d/c/hosts` —
  gw7, gw14, gw26 from the project instructions"). It is not in this snapshot (`ls c` shows only
  `wf`), so I have not read its rows.

## What follows from the spec (JUDGED)

1. **Ask all three before pulling from any of them.** Asking is cheap: `git ls-remote` returns one
   line per branch and downloads no files. The spec expects two or more hosts to be up about 90% of
   the time, so most pulls can be checked against a second host. House evidence points the same way:
   the hand-back gate's rule is "**two machines agreeing is the test, not either machine working.**"
   (`MEMORY.md:2558`). [HIS] *Falsifier:* partner logs showing that whenever two hosts answered they
   always agreed, over enough pulls to include at least one push by the keeper. That would make the
   extra step pure ceremony.
2. **"Only one host answered" is the normal bad case, and it has to be easy to handle.** The spec
   allows fewer than two hosts up in as many as 1 pull in 10 (100% minus 90%, from his numbers). So
   the card does not treat a single answer as an error. It fetches that copy, does not merge it, and
   prints the two commands you need to accept it. The choice stays with you. [DOMAIN] *Falsifier:*
   partners who always type the merge line without looking. Then the pause buys nothing and the card
   should merge on its own.
3. **When no host answers, check your own end first.** The spec expects at least one host to be up
   99.99% of the time, so if none answers, the likeliest cause is your network, your key or your URLs.
   [DOMAIN] *Falsifier:* a partner who finds all three hosts down, with their own side checked clean,
   more than once in a short time. Then the 99.99% figure is wrong, or the hosts share a single point
   of failure. Either way it is news for Corwin (TELL-ME 3).
4. **Courtesy/custom means a light touch on hosts run by volunteers.** In practice: one `ls-remote`
   per host per try, a download from only **one** host, a second download only to classify a host
   that disagrees, and no retry loop inside the script. [HIS] *Falsifier:* a host operator asks
   partners to spread downloads across hosts. Then use the rotation in the losing option below.
5. **The log stays on your machine and must never become a score for the operators.** Each try adds
   one line per host to `.git/c4-pull-log` in your clone, which git never pushes. The log checks the
   plan (did I get two witnesses?). It does not grade the hosts. The magic-number essay sets this
   boundary for this exact table: the "98% (target)" "stays honest only because the host operators
   are volunteers, the text leans on courtesy, and nobody is measured against it. If that changed, and
   a volunteer's standing came to depend on the 98, K2 would apply at once."
   (`magic-number-theory/ESSAY-2026-09-26-magic-number-theory.md:695-697`). [HIS] *Falsifier:*
   anyone gathering partner logs to rank the hosts. The card has then been misused, and the log line
   should be removed.
6. **"Anticipate" and "target" are different kinds of number.** If both rows were measured the same
   way, "all three 98%" would force "any two" to at least 98%, above the 90% the table anticipates.
   Read as written, the header says *anticipate* (what a partner should plan for) and the last row says
   *target* (what operators aim at). The card plans on the anticipate column only. The magic-number
   essay reads it the same way ("the header says *anticipate*", ESSAY:689). [MINE] *Falsifier:*
   Corwin saying that both columns are the same kind of measure.

**The order of hosts is a stand-in, not a ranking.** The spec gives no order. The card defaults to
the order in which his signed instructions list the hosts (gw7, gw14, gw26). Order only decides which
of the agreeing hosts serves the download. It never decides what is true. Anyone can change it with
`C4_HOSTS`.

**Losing option, at its strongest: rotate the first host.** Let each partner start from a different
host (for example by day of the month), so that no single volunteer serves every download. This wins
if partners become many, or if the repository becomes heavy. Today it loses because the partners
named in the model are few (`MODEL-2026-09-22-where-c4-runs.md:3`: "for Corwin and lab partners
(Bryant, Alfred)"), and because a fixed order is easier to read back in a log. To rotate by hand:
`C4_HOSTS='gw26 gw7 gw14' sh c4-pull.sh`.

**Second losing reading: put gw26 first.** gw26 is the only host that answered https on 2026-09-22
(preflight:8), and it runs the newest system (the Remotes section lists Debian 6.12.95, against Ubuntu
5.15 for gw7 and 5.4 for gw14). It loses because neither fact says anything about which host holds
the newest C4, and freshness is what the agreement check settles.

## WHEN

- You want Corwin's latest C4 and your copy may be behind.
- A plain `git pull` just failed or hung.
- You were told one of gw7 / gw14 / gw26 is down.

## DO

**DO 0 (once). Name the three hosts as git remotes in your clone.** The URLs come from Corwin. They
are DASHED until the remote is set up (item D4 above). If one host is down on day one, clone from
another:

```sh
git clone <URL-of-any-answering-host> c4 && cd c4
git remote add gw7  <gw7-URL>     # skip the one you cloned from if you named it that way;
git remote add gw14 <gw14-URL>    # a clone's own remote is called origin, and
git remote add gw26 <gw26-URL>    # origin is not used by this card
```

If your key has a passphrase, load it into `ssh-agent` first, so you are not asked for it three times.

**DO 1. Cut the script out of this card and look without touching anything.** This card is the one
copy of the script. The test reads it from here too, so the card and the test cannot drift apart.

```sh
sed -n '/^# --- c4-pull.sh begins ---$/,/^# --- c4-pull.sh ends ---$/p' CARD-2026-09-27-which-host-to-pull-from.md > c4-pull.sh
sh -n c4-pull.sh && sh c4-pull.sh --look
```

**DO 2. Pull.** `sh c4-pull.sh`. It asks each host for the commit its `HEAD` points at. It picks the
first host in `C4_HOSTS` order whose commit at least one other host shares. It downloads from that
host and fast-forwards your branch, and never merges any other way. If a host disagrees, it downloads
from that host too and says whether that host is BEHIND (a stale copy), AHEAD (newer, but only one
host has it, so it is not taken) or DIVERGED.

Optional settings, all off by default:
- `C4_REF=refs/heads/<branch>` compares a named branch instead of `HEAD`.
- `C4_HOSTS='gw26 gw7 gw14'` changes the order (see the losing option above).
- `C4_SSH_TIMEOUT=<seconds>` gives up on a silent host sooner. It applies **only** if you have not set
  `GIT_SSH_COMMAND` or `core.sshCommand` yourself, so it never overrides your own ssh setup. There is
  no default number: `ssh` keeps its own. (`MEMORY.md:3155` records an earlier card whose forced ssh
  option "said no where the push works".)

```sh
# --- c4-pull.sh begins ---
# c4-pull.sh: pull C4 from the transport hosts that agree with each other.
# Needs POSIX sh, git, awk, date. Talks only to the git remotes named in C4_HOSTS.
# Run inside your C4 clone:  sh c4-pull.sh          ask, pick, fetch, fast-forward
#                            sh c4-pull.sh --look   ask and report; fetch and merge nothing
# Exit: 0 pulled, or already current, on agreement of two or more hosts
#       3 one host answered: fetched, NOT merged (your choice)   4 hosts answered but no two agree
#       5 no host answered   6 fetched, but your branch cannot fast-forward   2 setup problem
set -u
HOSTS=${C4_HOSTS:-gw7 gw14 gw26}
REF=${C4_REF:-HEAD}
LOOK=no
case ${1:-} in
  --look) LOOK=yes ;;
  '') ;;
  *) echo "usage: sh c4-pull.sh [--look]" >&2; exit 2 ;;
esac
GITDIR=$(git rev-parse --git-dir 2>/dev/null) || { echo "c4-pull: run me inside your C4 clone" >&2; exit 2; }
if [ -n "${C4_SSH_TIMEOUT:-}" ] && [ -z "${GIT_SSH_COMMAND:-}" ] && [ -z "$(git config core.sshCommand)" ]; then
  GIT_SSH_COMMAND="ssh -o ConnectTimeout=$C4_SSH_TIMEOUT"; export GIT_SSH_COMMAND
fi
NOW=$(date -u +%Y-%m-%dT%H:%MZ)
N=$(set -- $HOSTS; echo $#)
ANSWERS=
ANSWERED=0
for h in $HOSTS; do
  git remote get-url "$h" >/dev/null 2>&1 || { echo "c4-pull: no remote named $h (git remote add $h URL)" >&2; exit 2; }
  sha=$(git ls-remote "$h" "$REF" 2>/dev/null | awk -v r="$REF" '$2 == r { print $1; exit }')
  if [ -n "$sha" ]; then ANSWERED=$((ANSWERED + 1)); else sha=NO-ANSWER; fi
  printf '%s\t%s\t%s\n' "$NOW" "$h" "$sha" >> "$GITDIR/c4-pull-log"
  printf '%-6s %s\n' "$h" "$sha"
  ANSWERS="$ANSWERS$h $sha
"
done
PICK= ; PSHA= ; AGREE=0
for h in $HOSTS; do
  s=$(printf '%s' "$ANSWERS" | awk -v h="$h" '$1 == h { print $2 }')
  [ "$s" = NO-ANSWER ] && continue
  c=$(printf '%s' "$ANSWERS" | awk -v s="$s" '$2 == s { n++ } END { print n + 0 }')
  if [ "$c" -ge 2 ]; then PICK=$h; PSHA=$s; AGREE=$c; break; fi
done
if [ "$ANSWERED" -eq 0 ]; then
  echo "NONE: no host answered. Check your own side first (card: CHECK 3)."
  exit 5
fi
if [ -z "$PICK" ]; then
  if [ "$ANSWERED" -eq 1 ]; then
    lone=$(printf '%s' "$ANSWERS" | awk '$2 != "NO-ANSWER" { print $1 }')
    lsha=$(printf '%s' "$ANSWERS" | awk '$2 != "NO-ANSWER" { print $2 }')
    echo "SINGLE: only $lone answered ($lsha); there is nothing to compare it with."
    [ "$LOOK" = yes ] && exit 3
    git fetch -q "$lone" || { echo "c4-pull: $lone answered but the fetch failed" >&2; exit 5; }
    echo "Fetched, not merged. To take it:   git merge --ff-only $lsha"
    echo "If the keeper signs his commits:  git verify-commit $lsha"
    exit 3
  fi
  echo "SPLIT: $ANSWERED hosts answered and no two agree. Nothing merged (card: TELL-ME 2)."
  exit 4
fi
echo "AGREE: $AGREE of $N hosts point at $PSHA; pulling from $PICK."
ODD=$(printf '%s' "$ANSWERS" | awk -v s="$PSHA" '$2 != s && $2 != "NO-ANSWER" { print $1 "=" $2 }')
if [ "$LOOK" = yes ]; then
  for o in $ODD; do echo "ODD: ${o%%=*} points at ${o#*=} (not compared: --look fetches nothing)"; done
  exit 0
fi
git fetch -q "$PICK" || { echo "c4-pull: $PICK answered but the fetch failed; run me again" >&2; exit 5; }
for o in $ODD; do
  oh=${o%%=*}; os=${o#*=}
  if git fetch -q "$oh" 2>/dev/null && git cat-file -e "$os^{commit}" 2>/dev/null; then
    if git merge-base --is-ancestor "$os" "$PSHA"; then echo "ODD: $oh is BEHIND (a stale copy)"
    elif git merge-base --is-ancestor "$PSHA" "$os"; then echo "ODD: $oh is AHEAD (newer, one witness only; not taken)"
    else echo "ODD: $oh has DIVERGED from the others (card: TELL-ME 2)"; fi
  else
    echo "ODD: $oh points at $os but could not be fetched to compare"
  fi
done
if [ "$(git rev-parse -q --verify HEAD 2>/dev/null)" = "$PSHA" ]; then echo "UP-TO-DATE at $PSHA"; exit 0; fi
git merge --ff-only -q "$PSHA" || { echo "c4-pull: your branch has its own commits; fetched, not merged (card: CHECK 2)" >&2; exit 6; }
echo "PULLED from $PICK: now at $PSHA"
exit 0
# --- c4-pull.sh ends ---
```

## CHECK

1. **After exit 0.** `git log -1 --format=%H` prints the commit named on the `AGREE:` line. Then
   `tail -n 3 .git/c4-pull-log` shows three lines stamped with the same minute.
2. **After exit 6.** Your branch has commits of its own. Nothing was lost, since the fetch only added
   remote-tracking refs. Pick one of these: `git rebase <sha>`, `git merge <sha>`, or start a fresh
   branch with `git switch -c mine <sha>`. The card never picks for you.
3. **After exit 5 (no host answered). Check your own side, in this order:**
   `git remote -v` (are the URLs right?) ·
   `git ls-remote <URL> HEAD` for one host, run by hand so you can read the error ·
   a different network, if you have one.
   If all of that looks fine, the hosts really are down. Ask Corwin for a **bundle**, which is a
   single file that git can read, sent over any channel you both trust. He runs
   `git bundle create c4.bundle --all`. You run:
   ```sh
   git bundle verify c4.bundle && git fetch c4.bundle 'refs/heads/*:refs/remotes/bundle/*'
   ```
   A bundle has one witness, so treat it like exit 3.
4. **After exit 3 (one host answered).** Accept the copy only if you have a reason to trust it.
   Reasons: a good `git verify-commit` or `git verify-tag` against the keeper's key, or his word
   over a second channel. Otherwise wait and try again later, and leave the gap between tries to
   your own sense of courtesy. The card sets no number for it.

## TELL-ME (send to Corwin; plain text is fine)

1. **Exit 3 more than now and then.** Send the last lines of `.git/c4-pull-log`. They show which
   hosts were missing, and when.
2. **SPLIT, AHEAD or DIVERGED.** Send the host lines the script printed. BEHIND is routine (a host
   that missed a push) and worth a line. DIVERGED always is, because two hosts holding different
   histories is the case the agreement check exists to catch.
3. **Exit 5 with your own side checked clean.** Send the three `git ls-remote` error lines. Per the
   spec this should almost never happen, so if it does, the spec needs to hear about it.

## Falsifiers on the card as a whole

- **The test proves nothing.** If `python3 CARD-2026-09-27-which-host-to-pull-from.test.py` passes
  on a copy of the script where "two agree" has been weakened to "one agrees", the test is too weak.
  (It catches that change and three others; see Receipts, below.)
- **The card will not run for a stranger.** A partner who follows WHEN/DO/CHECK with plain git and
  cannot get to exit 0 against hosts that are up. Then the card fails its reader.
- **Agreement picks the wrong copy.** The keeper pushes to one host first, and partners keep getting
  the older copy that the other two hosts still agree on. This is expected for a short time, and the
  AHEAD line makes it visible. If it lasts, the keeper's push should go to at least two hosts
  together, and that is a line for his release card, not for this one.
- **"Git alone" is not true.** The script uses `awk` and `date` as well as git. Both are POSIX
  utilities, but on a system that lacks either one the claim fails.

## Receipts (OBSERVED, 2026-09-27, cloud container, no host contacted)

- `sh -n` and `dash -n` on the cut-out script: both exit 0.
- `python3 CARD-2026-09-27-which-host-to-pull-from.test.py --prove-red` (run 2026-09-27T08:59Z,
  git 2.43, dash) printed `cases: 14 of 14 held`. Each of the four mutants was caught: "one witness
  counts as agreement" by 3 cases, and "merge not fast-forward-only", "single witness merged" and "no
  log line" by 1 case each. It ended `prove-red: all held, all fired.` The same 14 cases also hold
  under bash (`C4_TEST_SHELL=bash`).
- The 14 cases: all three agree · first host down · one stale · one ahead · one diverged · one
  witness · none answer · all disagree · `--look` changes nothing · your own commits refuse a
  fast-forward · already current · order override · a missing remote · three log lines with one stamp.
- Not tested: a real ssh or https remote, a host that hangs instead of refusing, and
  `C4_SSH_TIMEOUT`. All three need a live host, and this card contacted none.

LENS · the which-host card · 2026-09-27
a  my view: the answer is not a host order but a rule of agreement; the order only decides who serves the download.
b  the view I ascribe Corwin: a partner should be able to pull with git alone, and the volunteers' hosts should feel no heavier for it.
c  their pull on mine: courtesy moved the second download from "always" to "only when a host disagrees", and kept the log off any scoreboard.
d  my pull on theirs: the spec's own 90% makes "one witness" a routine case, so it needs a pause and a choice, not an error.
persona / inverse: gw7 says "a name that isn't real, I won't answer to", so the URLs stay DASHED rather than guessed / the inverse says a card with no URLs cannot be run today; true, and D4 is the one act that makes it runnable.
principles reframe: 1. universalism: anyone with git and a shell can run it, and no C4 tool or AI is assumed. 2. four freedoms: the whole script is in the card, where it can be read, changed and shared, and its test is beside it. 3. free software: plain git transport, no forge required. 4. community: courtesy to volunteer operators is written into the mechanics (one download, no retry loop, no ranking of hosts).

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.
