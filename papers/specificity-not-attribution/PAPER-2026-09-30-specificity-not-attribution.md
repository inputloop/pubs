produced-by: paper · wave between-acts · arm WD · subject: claim C1 (SCORE P6, P6A, the original ablation) · 2026-09-30

# PAPER · 30 September 2026 · Specificity, not attribution: a blind rerun of claim C1

## Corrected (30 September 2026, after Act II)

This draft was written between the two acts. Its findings on C1 stand: Act II changed none of the numbers it
uses. What changed here, and why:

- **Who scored the first test.** The draft said "the author scored the answers first", meaning the person whose
  lines were tested. The report says only that its own writer did ("One coder (me)", `negative-control.md#L159`),
  and it speaks of "the operator" in the third person (`#L164`). It does not say who that writer was. The paper
  now says "the report's own writer". This was found in this check, not in Act II.
- **How many lines are his.** The draft called the named set "the author's nine lines". That set marks seven
  as his words, cleaned for reading, and two as a summary of his point, not a quote (`GROUNDED.md#L4-5`). Five
  of the seven locate in his signed canon; two locate in no file signed by his key. It now says so. In a paper
  about attribution, credit has to locate (the rule the Act I paper's S2 and F3 carry).
- **Own plants overstate.** The blind check and the scorer are proven by their author's own plants. Act II
  found that such proofs overstate: in six pairs, each author's check caught all of its own plants, and a second
  reader's faults were caught once in 55 (R3S-001, as corrected by ERR-001). One sentence says so.
- **The credit line** now names the file it is carried from (Act I §5a item 14).

Ids: "Act I" is `turn-2026-09-30/PAPER-2026-09-30-act-1-bringing-the-review-home.md`. R3S ids are in
`turn-2026-09-30/act2/r3/SCORE-2026-09-30-row-3.md`. The draft as first written is kept at
`turn-2026-09-30/act2/shelf-check/pre-specificity-not-attribution.md`.

## What this paper is

**Edition 0.1 (working).** The instrument wrote it. "Instrument" is the shop's word for the AI assistant doing
the work; here that is Claude, as one writer sent out by the main session. It was written at the ask of Corwin
Brust, the keeper (the person who owns the work), made on 30 September 2026. His words, verbatim, from
`turn-2026-09-30/JOURNAL-2026-09-30-bring-home.md#L20`:

> You can also work /vibrobeast:writing-forms between acts for research your first act work suggests can inform either outcome (new minimal, enhanced TA baseline) model that you hand back.

**Status: DRAFT, unsigned.** It has landed on the reading shelf. It is **not released and not branded.** Only
the keeper can sign it or send it out.

**It supersedes nothing.** The first test of this claim is the original ablation report, credited to Corwin
Brust (`imports/t1/negative-control/negative-control.md`). That report stays as the record. This paper sits
beside it and does not edit it.

**On voice.** Plain writing about the work, not written as any person. **OBSERVED** is what a file or command
shows, with its path and line, or the command. **JUDGED** is our reading, with a tag: [MINE] is this writer's
view; [DOMAIN] leans on common research practice; [PLATFORM] is a limit of our tools. Each concern has a
falsifier: the one check that would prove it wrong. House words get a plain meaning at first use, and a list near
the end.

## The short answer

A kit for writing an AI assistant's rules made a claim, called C1. It said that using the author's own lines,
with his name on them, makes the AI work better and read more clearly. The first test seemed to back it. But that
test changed two things at once. The author's lines were **named as his**, and they were also **more specific**.

We split the two apart with three sets of rules, and two AI graders scored the answers blind.

- The author's name added **nothing**: named and unnamed lines tied on all 5 tasks, under both graders.
- Being **specific** helped: specific rules beat vague ones on 4 of 5 tasks for one grader, 3 of 5 for the other.
- The test is small. It does not prove that names never matter. It found no sign that they do.

## The claim, and the first test

**OBSERVED.** The kit states the claim this way (`imports/t1/operating-model-BASELINE.md#L158-161`):

> **Claim C1 (functionality + clarity).** Replacing generic operating-model prose with the originating author's
> own attributed lines makes the kit (i) *more functional* — a like-for-like system produces the intended behavior
> more reliably — and (ii) *clearer* — a reader grasps and can cross-check the intent faster.

It also says how the claim could fail. If the plain version "matches or beats the grounded one on
behavior-fidelity and reader-comprehension, **C1 fails.**" (`imports/t1/operating-model-BASELINE.md#L170-171`).
The first test's report has "or" where the kit has "and" (`imports/t1/negative-control/negative-control.md#L25-28`).
We come back to that below.

**OBSERVED.** The first test gave an AI the same five tasks twice: once with nine lines from the kit's model of
the author, once with nine short, general lines. For example, "What can't be substantiated is only data." became
"Prefer verified information." (`negative-control.md#L36`). The report's own writer scored the answers first ("One
coder (me)", `negative-control.md#L159`). A different model then scored them again, blind. Named lines won on every task. On behaviour they won by +0.68 on a 0-to-1 scale
(`negative-control.md#L189-195`; `python3 score.py blind-scores.csv` reprints `delta(g-a)=+0.68`).

**JUDGED [MINE].** The author's line is not only named. (It locates in his signed canon: "Information that can't
be substantiated is only data.", `imports/pub-new/canon/principles/CANON.md#L27`.) It is sharper. It says what to
do with a claim you cannot back up: treat it as data to test. The general line does not. The kit calls this line its floor, meaning the
smallest thing that must always hold (`turn-2026-09-30/act1/r2/P6A/sealed/conditions/GROUNDED.md#L10`). So a win
for the named line could come from the name, the sharpness, or both. The first test could not tell them apart
(its own limits: `negative-control.md#L206-209`). Falsifier: a test that keeps the sharpness and drops the name.
That is the test below.

## What we did: three sets of rules

The rerun is recorded in `turn-2026-09-30/act1/r2/P6A/WAVE-20260930T2330Z-act1r2-p6a.md` (the maker's report)
and scored in `turn-2026-09-30/act1/r2/SCORE-2026-09-30-round-2-cross-arm.md#L8-16`.

**OBSERVED.** Three sets of rules went to the same AI, with the same setting and tasks
(`turn-2026-09-30/act1/r2/P6A/sealed/conditions/`):

- **Named (GROUNDED).** Nine lines framed as "the originating author's own lines" (`GROUNDED.md#L3`). The set
  marks seven as his words, cleaned for reading, and two as a summary of his point, not a quote
  (`GROUNDED.md#L4-5`, `#L10-18`). Five of the seven are in his signed canon, word for word or nearly
  (`imports/pub-new/canon/principles/CANON.md#L25-27`, `#L45`, `#L47`). Two, "Walk toward the weak point…" and
  "…your résumé is our résumé", are in none of the 25 files signed by his key (checked for this correction).
  That does not show they are not his. It shows they do not locate in a declared source.
- **Specific, no name (SPECIFIC-UNATTRIBUTED).** The same rules and reasons, with no quotes, no "I", no author.
- **General (GENERIC).** The first test's nine general lines.

Rule 1 in all three:

| set | rule 1 |
|---|---|
| Named | "What can't be substantiated is only data." (with a note that the words are his) |
| Specific, no name | "Treat anything that cannot be substantiated as data only: something to test, never a settled basis for action." |
| General | "Prefer verified information." |

**OBSERVED.** The five tasks came from the first test (`negative-control.md#L52-61`). They are set at a
free-software nonprofit. One asks: a package's README says "GPL"; should it go into the Free Software Directory?
Each answer had to be 80 to 140 words (`00-shared-preamble.md#L5-10`). That makes 15 answers.

**OBSERVED.** The shared setup lists five ways this run differs from the first test
(`00-shared-preamble.md#L36-49`). The main ones: the middle set is new; one word limit covers all (the first
test had none, and its two sets ran about 92 and 39 words on average); and all three sets get the same short note
for task 5. Also, as the run's brief asked, one scoring mark was dropped: RC2, "claims traceable/attributed"
(`turn-2026-09-30/bundles/briefs-r2/WAVE-20260930T2330Z-act1r2-p6a-brief.md#L39-40`).

**JUDGED [MINE].** RC2 gives a point for naming the source. That is the very thing being tested, so it would hand
the named set a free win. Falsifier: a reading of RC2 under which an unnamed answer could earn it just as easily.

## How we kept it honest

**A called shot.** A called shot means writing down what you expect before you try, then comparing. The
predictions went into `sealed/PREREG.md` before any answer existed (`PREREG.md#L26-35`). In plain words:

1. The name would add nothing: no-name would match or beat named.
2. Specific would beat general on most tasks.
3. Named would still beat general, but by less than the first test's +0.68.
4. A simple word-match test could guess the set of most answers, well above chance.

**A seal.** A seal is a file's fingerprint (a sha256 hash), recorded before anyone could see what it predicts.
The predictions, the rule sets and the answer key were sealed. Checked today: all six files print `OK` under
`sha256sum -c`.

**Blind grading.** The 15 answers were renamed R01 to R15 in a mixed order, and the key was kept from the
graders. Two AI graders from the writer's family but of other sizes, Claude Sonnet and Claude Haiku, got only the
answers and a scoring sheet (`turn-2026-09-30/act1/r2/P6A/grader-packet.md`). Each worked in a fresh session and
said so on line 1 of its file. The sheet said not to rank answers against each other, or guess how they were
written (`grader-packet.md#L74-79`).

**A prove-red.** A prove-red plants a fault on purpose to show a check can catch it. The blind check finds 0 set
names, 0 author names and 0 headers in the answers; its prove-red plants each and catches each. The scorer's
prove-red shows a fake "no effect" case fails, a real effect holds, and a missing mark stops the run instead of
counting as 0. Both print `OK`. Both use their author's own plants, and Act II found such proofs overstate: a
second reader's faults were caught once in 55 across six pairs (R3S-001, as corrected by ERR-001). No second reader's plants against
these two checks are on record yet.

## What the graders found

Each grader gave 87 yes-or-no marks, 29 for each set. The marks ask things like "names who checks" or "keeps
disagreement explicit" (`grader-packet.md#L30-46`). A set's score is the share of marks it earned.

**OBSERVED** (`sh bin/score3.sh key.tsv <marks file>`, run on both graders' files):

| | Sonnet: behaviour | Sonnet: clarity | Haiku: behaviour | Haiku: clarity |
|---|---|---|---|---|
| Named | 1.00 | 1.00 | 1.00 | 1.00 |
| Specific, no name | 1.00 | 1.00 | 1.00 | 1.00 |
| General | 0.71 | 0.80 | 0.78 | 1.00 |

- **The name.** Named against no-name: 0 tasks favour the name, 5 ties, under both graders. By the kit's own
  rule, the name part of C1 **fails**, whether the rule says "and" or "or".
- **Being specific.** No-name against general, on behaviour: +0.29 for Sonnet (better on 4 of 5 tasks) and
  +0.22 for Haiku (3 of 5). On clarity, Sonnet shows +0.20 and Haiku a tie.
- **Where it fell.** Every mark either grader withheld was on a general answer. The named and no-name answers
  earned all 58 of their marks from both graders. Of the 11 marks withheld in all, 5 were "names who checks".
- **Agreement.** The two graders gave the same mark on 82 of 87 (run by this writer: a join of the two files).
  All 5 differences are on general answers.

**OBSERVED.** The called shot: predictions 1 to 3 held (named beat general by +0.29 and +0.22, far less than
+0.68). Prediction 4 held only in part. The word-match test guessed 7 of 15 sets. That beats the 5 you would
expect by chance, but it is not "most" (`turn-2026-09-30/act1/r2/P6A/WAVE-20260930T2330Z-act1r2-p6a.md#L13`).

**JUDGED [MINE].** In this test, specific rules did the work and the name did not. The first test's large gap
looks mostly like a gap between sharp rules and vague ones. Part of it may be length: its general answers ran
about 39 words, which leaves little room to say who checks. Falsifier: a larger blind test in which named rules
beat the same rules without the name.

## Where we failed to prove it

1. **The ceiling.** OBSERVED: named and no-name both scored 1.00 under both graders. A perfect score leaves no
   room to show a gap. JUDGED [DOMAIN]: a tie at the top cannot rule out a small edge for the name. So one reader
   in this project calls C1 "not shown", not "refuted"
   (`turn-2026-09-30/act1/r4/S-doubt/WAVE-20260930T2330Z-act1r4-swot-doubt.md#L11`). Another says it "fails by
   the kit's own rule" (`turn-2026-09-30/act1/r4/S-reward/WAVE-20260930T2330Z-act1r4-swot-reward.md#L155`). We
   keep both. Falsifier: a harder scoring sheet on which the specific sets score below 1.00 and still tie.
2. **The writer was not blind.** OBSERVED: one AI wrote all 15 answers after reading the claim, the scoring sheet
   and the first test (`PREREG.md#L37-40`; maker's report `#L129-139`). JUDGED [PLATFORM]: the maker had no way
   to start a fresh helper, and a writer who knows the hoped-for result can lean toward it without meaning to.
   Falsifier: fresh AI sessions, each given only the setup, one rule set and one task, giving the same pattern.
3. **Only five tasks, one answer each.** OBSERVED: n = 5 (SCORE `#L14-15`). JUDGED [DOMAIN]: five is too few to
   show a small effect or rule it out. Falsifier: dozens of tasks, chosen by someone other than the author, with
   several answers each.
4. **One family of models.** OBSERVED: the writer and both graders are Claude models (SCORE `#L14-15`). JUDGED
   [DOMAIN]: models from one family may share blind spots. Falsifier: a human grader, or a model from another
   vendor, giving the same result.
5. **One grader may be soft.** OBSERVED: in another blind test that day, Haiku missed both planted wrong items;
   Sonnet caught both (SCORE `#L20`). Here Haiku gave general answers full clarity marks, and its notes compare
   answers ("R09/R10 both explicitly name") though the sheet said not to
   (`turn-2026-09-30/act1/r4/S-doubt/scratch/p6/haiku.csv#L91`). JUDGED [MINE]: this can shrink the
   specific-versus-general gap, but not the finding on names: Sonnet, the stricter grader, also found 0 of 5.
   Falsifier: a strict outside grader whose specific-versus-general gap is no larger than Haiku's.
6. **The named answers can be spotted.** OBSERVED: the word-match test picked out 4 of 5 named answers (maker's
   report `#L13`). Sonnet noted "stock-sounding self-descriptions" in three answers
   (`turn-2026-09-30/act1/r4/S-doubt/scratch/p6/sonnet.csv#L101`); all three are named ones. JUDGED [MINE]: a
   grader who spots a set could lean for or against it. Falsifier: a re-grade, quoted lines reworded, that
   matches this one.
7. **"And" or "or".** OBSERVED: the kit says C1 fails if the plain version matches on behaviour **and** clarity.
   The first report and its scorer say **or** (maker's report `#L86-99`). Under Haiku and the "or" reading, two
   more steps fail because clarity tied: specific against general, and even the first test's own contrast, named
   against general. Under Sonnet, both hold on either reading. JUDGED: which reading governs is the keeper's call.
   It is a fork, not a claim, so it needs no falsifier. The finding on names holds under both.
8. **Whose name.** OBSERVED: the named set credits one real person (`GROUNDED.md#L3`). JUDGED [MINE]: this tests
   his name, not naming in general. Falsifier: a fourth set that credits the same lines to a made-up author. The
   harness takes it with two small edits (maker's report `#L169-179`).

## What would settle it

- Fresh AI sessions write the answers, each seeing one rule set and one task, several answers per cell.
- Dozens of tasks, picked by someone who did not write the rules.
- A scoring sheet with room at the top.
- Graders from outside the family, including people, since "clearer" is a claim about human readers.
- The fourth, made-up-author set, and the "and" or "or" reading fixed in advance.

The sealed harness already exists. JUDGED [MINE]: a small outside group could rerun it without much
work, given access to AI models. Falsifier: an outside team that tries and cannot run it from these files alone.

## What it changes in practice

These readings are for a free-software maintainer, a lab, or a small shop writing rules for an AI helper. Each
is JUDGED [MINE] and rests on the small test above.

**Write rules concretely, in the host's own terms.** The host is the project or group the AI works in. "Ensure
quality" gives a model little to do. "Name who checks it, and have a second reviewer re-run the scan on the same
release" gives it a job. In this test, that kind of rule was the whole gain. Use your project's own names for
things: your review list, your release step, your license files.

**Keep attribution for provenance.** Provenance is the record of where a rule came from. The name still matters,
but for people, not for model output. It tells a reader whose rule this is, since when, and where it was first
said, so someone can check it, argue with it, or change it with consent. In this shop, the file an AI loads at
the start is called a door. It is built from parts: small rule pieces that each carry an owner, a start date and
a source (`turn-2026-09-30/act2/PLAID.md#L13`, `#L23`). If a project has a canon (a signed statement of its
keeper's values), the rules can point to it. The name goes in the record beside the rule, not in its voice.

**Do not overread this.** The test does not show that names hurt. It says only that, here, the name added nothing
we could measure. Falsifier for this section: the larger test above, finding that the name adds a real edge.

## How to check this yourself

You need a POSIX shell, `awk`, `sha256sum` and `python3`. Paths are relative to the project home, the top folder
of the project.

Check the seals and rerun the proofs:

```sh
cd turn-2026-09-30/act1/r2/P6A
sha256sum -c key.tsv.sha256
(cd sealed && sha256sum -c PREREG.sha256)
sh bin/blindcheck.sh check responses
sh bin/blindcheck.sh --prove-red responses
sh bin/score3.sh --prove-red
```

Score both graders' marks. The graders worked on a copy of the packet kept outside the work tree. Their files were
copied back byte for byte into `act1/r4/S-doubt/scratch/p6/` (this writer checked with `cmp`):

```sh
sh bin/score3.sh key.tsv ../../r4/S-doubt/scratch/p6/sonnet.csv
sh bin/score3.sh key.tsv ../../r4/S-doubt/scratch/p6/haiku.csv
```

Rerun the first test's numbers:

```sh
cd imports/t1/negative-control
python3 score.py blind-scores.csv
```

The files, in `turn-2026-09-30/act1/r2/P6A/` unless shown:

- `sealed/PREREG.md` — the called shot.
- `sealed/conditions/` — the three rule sets and the shared setup.
- `responses/R01.txt` to `R15.txt` — the 15 answers.
- `grader-packet.md` — exactly what the graders saw.
- `key.tsv` and `key.tsv.sha256` — which answer came from which set.
- `bin/` — the scorer, the blind check and the shuffle.
- `turn-2026-09-30/act1/r4/S-doubt/scratch/p6/` — the graders' marks and notes.
- `imports/t1/negative-control/` — the first test, its scores and its scorer.

What would make you doubt us: a seal that does not match, a blind check that finds a set name, or a score that
differs from the table above.

## Words used here

- **Called shot.** Write down what you expect before you try, then compare.
- **Canon.** The keeper's signed statement of his values.
- **Door / part.** A rule file an AI loads at the start, built from small rule pieces ("parts").
- **Floor.** The smallest set of things that must always hold.
- **Instrument.** The AI assistant, as the shop calls it.
- **NOT CHECKED.** The honest third answer when a check could not look: neither a pass nor a fail.
- **Prove-red.** Planting a fault on purpose to show the check catches it.
- **Seal.** A file's fingerprint (sha256), recorded before anyone could see what it predicts.

## Reading level, measured

**OBSERVED.** The aim was school grade 9 or below. From the project home,
`sh turn-2026-09-30/act1/r3/R4/reading-gauge/reading-gauge.sh` on this file, as corrected, prints 3123 words, 295
sentences and a Flesch-Kincaid grade of 4.3. The tool's Python twin, `reading_gauge.py`, prints the same line, and
so does a third reader written in Perl for this check (`turn-2026-09-30/act2/shelf-check/fk-second.pl`). The first
draft read 4.3 (2687 words, 261 sentences).

**JUDGED [MINE].** Read that number with care. The formula counts only sentence length and syllables, so it does
not see hard words like "provenance". It ends a sentence at each heading and list item, which pulls the grade
down, and it skips paths in code marks. When it cannot measure, it prints NOT CHECKED rather than guess.
Falsifier: a plain-language reader who finds this paper harder than grade 9.

---

*© 2026 Corwin Brust — this work is licensed CC BY 4.0; please retain attribution to Corwin Brust. Developed and tested with the help of Bryant Frankford and B.K. Graphics (bkgraphics.com), with thanks.*
*(The house credit line, carried verbatim from `operating-model-BASE.md` 1.0.51 L313-315.)*
