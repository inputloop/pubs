produced-by: paper · writer arm WB, between the acts · 2026-09-30

# PAPER · 30 September 2026 · Green when blind: checks that pass over nothing, and the third answer

## Corrected (30 September 2026, after Act II)

This draft was written between the two acts. Act II then corrected the Act I paper it draws on. What changed
here, and why:

- **What the 29 are.** The draft said "29 of 48 checks report success over nothing". The 29 are the tools that
  exit 0 over empty input in both readers' runs, out of the 47 both ran. Reader 1 counts 30 of its 48, reader 2
  29 of its 48. Not all 29 print a pass word (Act I §5a item 11). §3 now says so.
- **One tool exits 77.** The draft said only one answers NOT CHECKED. Reader 2 sorts 4 tools as not checked;
  only one of them uses exit 77 (P1B L16). §3 now says so.
- **Own plants overstate, and that makes this paper's point stronger.** Act II found that in six pairs, each
  author's check caught all of its own plants and the second reader's faults were caught once in 55
  (R3S-001, as corrected by ERR-001 of 2026-10-01). The Act I floor now asks for checks proven by faults someone else planted (Act I §5a item 15). §3
  and §5 each gain one sentence. §6 gains a short paragraph: the harness is proven so far by its author's own
  plants.
- **The third answer can be overused.** A rebuilt consent gate answered NOT CHECKED on 5 of the 6 records that
  should pass, and FAIL on the sixth (Act I §5a item 6). New limit in §7.
- **Small fixes.** A line number in the Act I paper moved when Act II added §5a. The credit line now names the
  file it is carried from (Act I §5a item 14).

Ids: "Act I §5a" is §5a of `turn-2026-09-30/PAPER-2026-09-30-act-1-bringing-the-review-home.md`. R3S ids are in
`turn-2026-09-30/act2/r3/SCORE-2026-09-30-row-3.md`. The draft as first written is kept at
`turn-2026-09-30/act2/shelf-check/pre-green-when-blind.md`.

## What this paper is

**Edition 0.0.50, working.** In this shop a three-part number marks a working draft; a release carries two parts.

**Status: DRAFT, unsigned. Landed on the reading shelf. NOT released and NOT branded.** Signing, release and
branding are for the shop's owner, Corwin Brust, to decide.

**Who minted it.** The instrument: the shop's name for its AI assistant, here Claude in Cowork. One writer arm
wrote it between the two acts of the 30 September 2026 turn. It is about the work, in a plain voice, not written as
any person.

**At whose ask.** Corwin Brust's, in the turn's prompt. His words, verbatim with typos kept (JOURNAL L20, L22):

> You can also work /vibrobeast:writing-forms between acts for research your first act work suggests can inform either outcome (new minimal, enhanced TA baseline) model that you hand back.

> …please don't spare the horses where you see a reasonable possibility to explore that might invest our work with more suitability to more people for more things or advance our humanitarian (especially Free Software and Open Science) visions.

A reading, labelled as one: research between the acts, to feed the shop's next models. This piece is for people
outside the shop.

**What it supersedes.** Nothing. It retells one strand of the Act I paper (items S6, W6, O5 and F1).

**On voice.** Two piles. OBSERVED lines quote a file with its path and line, or name the command that made the
number. JUDGED lines are a reading and wear a tag: [DOMAIN] the field at large; [SKILL] the method; [PLATFORM] where
it ran; [MINE] this writer's view; [HIS] for the owner to settle. Every concern carries a falsifier: the one check
that would prove it wrong.

**Sources, by short name.** Paths are relative to the project home.

| short name | file |
|---|---|
| P1A | `turn-2026-09-30/act1/r2/P1A/WAVE-20260930T2330Z-act1r2-p1a.md` |
| P1B | `turn-2026-09-30/act1/r2/P1B/WAVE-20260930T2330Z-act1r2-p1b.md` |
| SCORE | `turn-2026-09-30/act1/r2/SCORE-2026-09-30-round-2-cross-arm.md` |
| R5 | `turn-2026-09-30/act1/r3/R5/WAVE-20260930T2330Z-act1r3-r5.md` |
| R6 | `turn-2026-09-30/act1/r3/R6/WAVE-20260930T2330Z-act1r3-r6.md` |
| B1I | `turn-2026-09-30/act1/r1/B1-informed/WAVE-20260930T2200Z-act1r1-b1-review-conclusions-informed.md` |
| JOURNAL | `turn-2026-09-30/JOURNAL-2026-09-30-bring-home.md` |
| ACT I | `turn-2026-09-30/PAPER-2026-09-30-act-1-bringing-the-review-home.md` |
| OFFERING | `imports/t0/intermediary/OFFERING-2026-09-30.md` |

## Words used here

- **Check.** A small program that answers with its exit code: 0 for "all good", other numbers for "wrong".
- **Green when blind.** A check that says "all good" when it had nothing to look at.
- **NOT CHECKED (exit 77).** A third answer: "I could not look." Neither a pass nor a fail.
- **Prove-red.** Planting a fault on purpose to show that a check catches it ("goes red").
- **Mutant.** A copy of a program with one fault planted in it. If the tests still pass, it "survived".
- **Harness.** A program that runs other programs and grades their answers.
- **Called shot.** Writing down what you expect before you try, then comparing.
- **Seal.** A file's fingerprint (sha256 hash), taken before anyone could see what it predicts.
- **Floor.** The smallest set of things that must always hold.
- **Canon.** The owner's signed statement of his values.
- **Door and part.** The rule file an AI assistant loads first (the door), built from small rule pieces (parts).
- **Keeper.** The shop's owner, Corwin Brust.

## 1. The question

A check can honestly report three things:

- I looked, and all is well (exit 0).
- I looked, and something is wrong (exit 1).
- I could not look (exit 77).

A check with two answers must fold the third into one of the others. When it folds "I could not look" into "all
is well", it is green when blind. A build script that reads only the exit code then sees a pass that means
nothing.

OBSERVED. The shop has this rule in writing, in a review it imported: "a check that cannot see says so in its own
exit: never RED, never OK" (OFFERING L16-17).

OBSERVED. Those words are the instrument's, not the keeper's. A first-round reader found the three-valued form
put "down as the instrument's work, not a sentence of his" (B1I L277-278). The keeper has not yet ruled on it
(P1B L294-298).

The question: in one small free-software shop, how many checks keep this rule?

## 2. How it was counted

- **Two readers, two languages.** Reader 1 (P1A) used the shell and logged every command with its exit code, 198
  rows. Reader 2 (P1B) wrote a Python harness, `three_answers.py`. Neither saw the other's work: "I did not open
  P1A" (P1B L56-57).
- **48 tools each, 47 in common.** Each also chose one tool the other did not.
- **Empty input.** Each tool got the empty form its usage text names: an empty folder, a table with no rows, or a
  zero-byte file.
- **An anchor first.** Reader 2 first ran every tool on an input known to be good. All 48 passed it (P1B L9-10),
  so each empty-input result comes from a tool that works.
- **On copies.** Every run used a copy of a read-only snapshot; its hash did not change (P1A L66-67).

JUDGED [PLATFORM]. Both readers were AI agents from one model family, in one sandbox, with one shell (dash) and
one awk (mawk) (P1A L119-120). Two languages is not two families. Falsifier: a reader from another model family,
or a person, on another shell, finds a different set of 29.

## 3. What was found

**The same 29 tools exit 0 over nothing, in both readers' runs.** OBSERVED, the main session's tally: "same
empty-input exit code 46 of 47; the SAME 29 tools exit 0 over empty input in both" (SCORE L40-41). Re-run for this paper with the script in §8, it holds: 47
in common, 46 the same, 29 at exit 0 in both and none in one only. Each reader also ran one tool the other did
not: reader 1 counts 30 of its 48 at exit 0, reader 2 29 of its 48. The one difference is a date tool. Reader 1
saw it hang until a 60-second timer killed it (exit 124); reader 2 saw exit 3.

**Only one answers with exit 77.** Reader 2 sorts 4 tools as not checked. Three of them say so in words but
exit with a plain failure code (P1B L16). OBSERVED: the home log tool declares "77 NOT CHECKED (nothing could
be checked -- never reported as OK)" (`bin/import-log.sh` L46). Over a log with no imports it prints "NOT CHECKED: the log
has no imports" and exits 77 (L501).

**What the 29 say.** OBSERVED, as printed over nothing: "ship check: clean", "All 0 files match the manifest."
(P1B L20-22). Two even say in words that they saw nothing, "no sidecars" and "F4 SKIP", and still exit 0 (P1B
L23-26).

**A typo reads as clean.** OBSERVED: handed a path that does not exist, one tool printed "clean -- rules defer to
the class", exit 0 (P1B L193).

**A suite inherits the blindness.** The shop's one-command proof, `check-all.sh`, runs 28 checks. Reader 2 wrote
down before the run that emptying its good inputs would leave it green: a called shot. It held. With four inputs
emptied, it printed "ALL GREEN" with 28 PASS, exit 0 (P1B L37-40, L127). A separate researcher took one checker
out of a copy: "SKIP" on one line, "ALL GREEN" two lines later, exit 0 (R6 L125).

**Proofs that cannot fail.** Reader 1 planted one fault per tool, removing the line that does its main job. For
seven tools, the tool's own self-test still passed (P1A L150-176). Act II found the same thing six times over:
in each of six pairs, the author's check caught all of its own plants, and a second reader's faults were
caught once in 55 (R3S-001, as corrected by ERR-001 of 2026-10-01).

**Half-empty passes.** A bundle with an empty checksum list read "CLEAN … 0 file(s) verified by content", exit
0 (P1B L210).

JUDGED [SKILL]. The common cause is a loop over a list. No items means no failures, and no failures reads as a
pass. The fix is one line: count the items, and if the count is 0, say NOT CHECKED and exit 77, as reader 2
proposes (P1B L195, L212). Falsifier: one of the 29 whose code has no such loop.

JUDGED [SKILL]. Not all 29 break a promise. Reader 2 found 21 whose usage text promises a failing exit, and 8
gauges or readers that promise none (P1B L177-178). The split is one reader's judgement. Falsifier: a second
reader sorts the same 29 usage texts differently.

## 4. Where the third answer comes from

The shop did not invent the third answer, and should say so.

OBSERVED, as quoted by R6 on 30 September 2026. Its web tool summarizes each page, so quotes are as it returned
them (R6 L47).

- GNU Automake, the build tool of many GNU projects: "an exit status of 77 a skipped test, an exit status of 99 a
  hard error" (R6 L126).
- Mutation testing, as the PIT tool puts it: "if your tests pass then the mutation lived" (R6 L284). The shop's
  own shelf credits the 1978 paper by De Millo, Lipton and Sayward (R6 L70).

OBSERVED. R6 puts this first among five claims the house "can make plainly, crediting their lineage" (R6 L270):
"A check counts only once it has been shown able to fail, and 'not checked' is a third answer (Automake's exit 77,
mutation testing)" (R6 L19). Its advice: "we follow X, and here is our check that can fail" (R6 L289).

OBSERVED. A second researcher, reading world reports on AI safety, called this "the house's most exportable idea"
(R5 L291). It quotes the International AI Safety Report 2026: "waiting for conclusive data can leave society
vulnerable" (R5 L302-303).

JUDGED [MINE]. A check that says "I could not look" is a small, honest answer to that dilemma: it claims no
safety it has not seen. Falsifier, from R5 itself: "a system under test can make a check fail in the lab and stay
quiet in deployment. The house has no answer for that" (R5 L310-311).

## 5. The second reader: how the one honest tool stays that way

The one tool that answers 77 had the rule in its design. The tests that keep it there came from other readers.

OBSERVED (JOURNAL L31-36). The log tool was built in shell and awk from a written design. Its self-test passed 17
of 17 and caught 6 of 6 planted faults. Then tests were written in Python "from the DESIGN, not the script".
Their first run found "2 of 10 mutants survived". One: "`verify` on a log with no imports said OK instead of NOT
CHECKED". In plain words, a broken copy that said "all good" over an empty log passed every test. The fix was a
test of the 77 path. It stands in the home tree: `check(rc == 77 and 'NOT CHECKED' in out, ...)`
(`tests/test_import_log.py` L389), with its mutant named at L487.

OBSERVED. A third reader, reader 1 of the census, found one more. With the hash compare in `verify` removed, the
tool still printed "selftest: 17 passed" and "PROVE-RED OK" (P1A L171). It was closed that evening: self-test 18
of 18, prove-red 7 of 7 (JOURNAL L88-91).

OBSERVED. The harness's own author fell into the same hole: a test loop printed "rc=0" for every mutant, because
the shell reset `$?` first (P1B L237). "…the loop reading it was blind, which is the fault this census counts"
(P1B L239).

JUDGED [SKILL]. A written rule reached one tool in 48, and even there its guard came from a second reader. The
cheap step most tools skipped: hand the check nothing, and read the exit code. Falsifier: a tool in this shop that
keeps the rule and was never tested by anyone but its author.

OBSERVED. Act II made this the floor's rule: a check is shown able to fail only on faults someone other than
its author planted (Act I §5a item 15, from R3S-001).

## 6. The gift: `three_answers.py`

Reader 2's harness asks each check what it says over nothing, over a known-good input, and over a known-bad one.
It sorts each answer into four classes: OK, RED, NOT-CHECKED and GREEN-WHEN-BLIND. It needs only Python 3.

OBSERVED, from the file's opening notes (`turn-2026-09-30/act1/r2/P1B/three_answers.py`):

- It keeps the rule it measures: 0 when clean, 1 when any row is green when blind or broken, 77 when nothing ran
  (L44-47).
- It trusts the exit code over the printed words: "a caller reads the exit, not the prose" (L17).
- Its `--prove-red` plants six fake tools and checks each is sorted right, that a wrong answer key is caught, and
  that an empty list gives 77.

OBSERVED. Two full census runs matched byte for byte; seven faults planted in the harness each made its own
prove-red fail (P1B L32-36).

JUDGED [SKILL]. Those plants are all its author's own. By §5's rule, and Act II's (R3S-001), that is not yet
proof. Two checks by other hands exist so far. Reader 1's shell census agrees with it on 46 of 47 exit codes
(§3), and this writer's five-line check below was sorted right. Neither plants a fault in the harness itself.
Falsifier: faults planted in the harness by someone other than its author, each caught.

OBSERVED, re-run for this paper on 30 September 2026. `--prove-red` printed "prove-red PASS", exit 0. The file's
sha256 begins `8e9c4b7c`. Then the harness met a five-line check it had never seen, one that fails any file
holding "TODO". Over an empty file, and over a file that does not exist, the check said "OK: no TODOs", exit 0,
and was rated GREEN-WHEN-BLIND. With one line added, it was rated NOT-CHECKED. The commands are in §8.

JUDGED [DOMAIN]. The file carries no licence notice: `grep -n -i -e licen -e spdx three_answers.py` finds
nothing. The Act I paper says the shop's code is GPL-3.0-or-later (ACT I L22), but a stranger holding the file
alone cannot tell. Falsifier: the same grep finds an SPDX line.

OBSERVED. The harness names its own limits (P1B L331-334). Each row is shell code, so a tools table needs the
same trust as the tools. And it reads the class, not whether the stated reason is true.

JUDGED [SKILL]. That last limit bites: two tools here failed for reasons that did not exist (P1B L214-226).
Falsifier: a reason check, run beside the harness, agrees on every red.

## 7. What was not proven

**That callers survive exit 77.** The main open question.

OBSERVED. The shop's own suite prints PASS only on exit 0. Any other exit takes this branch
(`imports/t0/t0-kit/check-all.sh` L14):

    else printf '  FAIL  %s\n' "$lbl"; fail=1; fi

A tool switched to 77 would read there as FAIL. Reader 1 names what would break: "a caller that must treat 'nothing to check yet' as success, such as a pipeline
run before the first records exist" (P1A L428-429).

JUDGED [DOMAIN]. Most build and test runners fail on any non-zero exit. Automake counts 77 as SKIP, and as far
as this writer knows, a SKIP does not fail `make check`: the run ends green, with a SKIP count in its summary. So in Automake's own home, 77 is nearer "pass, counted apart" than "never OK". Falsifier: the Automake
manual's page on script-based test suites says a SKIP fails `make check` (not fetched for this paper).

JUDGED [HIS]. Whether the shop moves every tool to 77 is the keeper's call. Both readers put it to him; neither
ruled for him (P1A L422-436; P1B L289-302). Falsifier: a dated ruling of his on the rule quoted in §1.

Also not shown:

- **That a retrofit works.** Only the log tool has been changed. The Act I floor lists this rule as "ADOPTED 1 of
  48" (ACT I L411). Falsifier: after a retrofit, the census reads 0 green when blind and `check-all` still reads
  green on real inputs.
- **Other shells.** Every run used dash and mawk (P1A L463-464). Falsifier: a rerun under bash and gawk moves a
  row's class.
- **That 77 is used only when there is nothing to check.** The third answer can be overused. In Act II, a
  consent gate rebuilt from a written spec never passed a bad record. But of the 6 records its contract says
  should pass, it answered NOT CHECKED on 5 and FAIL on 1 (Act I §5a item 6). It fails closed, and nobody can use
  it as it stands. Falsifier: a retrofitted tool that answers 77 only on inputs with nothing to check, and 0 on
  every known-good input.

## 8. How to check this yourself

You need Python 3 and a POSIX shell. Run from the project home. Files: the two `census.tsv` tables in
`turn-2026-09-30/act1/r2/P1A/` and `.../P1B/`; the harness `three_answers.py`, with `tools.tsv` and `fixtures/`,
in `.../P1B/`.

**Step 1. Compare the two tables.**

```sh
python3 - <<'EOF'
import csv
def rows(p): return list(csv.DictReader(open(p), delimiter='\t'))
A = {r['tool']: r['empty_exit'] for r in rows('turn-2026-09-30/act1/r2/P1A/census.tsv')}
B = {r['name'].split()[0]: r['empty_rc'] for r in rows('turn-2026-09-30/act1/r2/P1B/census.tsv') if r['set'] == 'P'}
both = sorted(set(A) & set(B))
print(len(both), 'in common;', sum(A[t] == B[t] for t in both), 'same exit code')
print('differ:', [(t, A[t], B[t]) for t in both if A[t] != B[t]])
print('exit 0 in both:', sum(A[t] == B[t] == '0' for t in both),
      '| in one only:', [t for t in both if (A[t] == '0') != (B[t] == '0')])
EOF
```

Expect 47 in common and 46 the same; the date tool differs (124 against 3); 29 at exit 0 in both, none in one
only.

**Step 2. Show the harness can fail.**

```sh
python3 turn-2026-09-30/act1/r2/P1B/three_answers.py --prove-red --workdir ./ta-scratch; echo "exit=$?"
```

Expect a last line starting "prove-red PASS", then `exit=0`.

**Step 3. Run it on your own check.** In an empty folder of your own:

```sh
cat > no-todo.sh <<'EOF'
#!/bin/sh
# no-todo.sh FILE: fail when FILE holds a TODO line
n=$(grep -c TODO "$1" 2>/dev/null)
[ "${n:-0}" -gt 0 ] && { echo "RED: $n TODO line(s)"; exit 1; }
echo "OK: no TODOs"; exit 0
EOF
sed '2a [ -s "$1" ] || { echo "NOT CHECKED: $1 is missing or empty"; exit 77; }' no-todo.sh > no-todo-77.sh
{ printf 'set\tname\ttree\tcmd\tempty\tgood\tbad\tsource\n'
  for t in no-todo no-todo-77; do
    printf 'P\t%s\t-\tsh %s/%s.sh "$IN"\t: > "$IN"\tprintf "done\\n" > "$IN"\tprintf "TODO: fix\\n" > "$IN"\t%s.sh\n' \
      "$t" "$PWD" "$t" "$t"
  done
} > tools.tsv
python3 PATH-TO/three_answers.py census tools.tsv --out census.tsv --workdir ./ta-scratch; echo "exit=$?"
```

Replace `PATH-TO` with the harness's folder. Expect `no-todo` rated GREEN-WHEN-BLIND, `no-todo-77`
rated NOT-CHECKED, then `exit=1`, because one row is green when blind. For your own check, add a row: its command,
then how to build an empty, a good and a bad input, each written to `$IN`.

**Step 4.** Rerunning all 48 rows needs the read-only snapshot the rows name. Steps 1 to 3 do not.

## 9. Reading grade, measured

Measured with the shop's reading gauge,
`sh turn-2026-09-30/act1/r3/R4/reading-gauge/reading-gauge.sh`, on this file.

OBSERVED: grade 4.0 as corrected (3,150 words, 298 sentences), exit 0. Its Python twin, `reading_gauge.py`, printed
the same row, and so did a third reader written in Perl from the gauge's spec for this check
(`turn-2026-09-30/act2/shelf-check/fk-second.pl`). The first draft read 4.1 (2,571 words, 249 sentences). For
the first draft, a copy with the citation marks such as "(P1B L20-22)" taken out read 4.1, so those short tokens
do not explain the low grade.

The number is the Flesch-Kincaid grade: sentence length and syllables. It does not see jargon or meaning, and
the gauge leaves out code, inline code and tables (its SPEC.txt). The target was grade 9 or below.

---

*© 2026 Corwin Brust — this work is licensed CC BY 4.0; please retain attribution to Corwin Brust. Developed and tested with the help of Bryant Frankford and B.K. Graphics (bkgraphics.com), with thanks.*
*(The house credit line, carried verbatim from `operating-model-BASE.md` 1.0.51 L313-315.)*
