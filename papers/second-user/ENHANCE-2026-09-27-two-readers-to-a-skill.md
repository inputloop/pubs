---
# ENHANCE — 2026-09-27 — two readers, taken to the skill gate by hand (fork F032)
Citations style: every row names its receipts (file:line · command and output · bank or fork id) and
passes the skilltank gate by hand: (1) does it ship what memory cannot, meaning a runnable script or
resource, or a self-triggering description? (2) is the need recurring? (3) is it one capability, and is
it NEW, ENHANCE of a named skill, LEAVE-AS-MEMORY, or HOLD?
The question riding each row: **did F032's formulation, "Headed toward a skill from the reflection family
(LENS · MICROSCOPE · BUBBLE CHAMBER) via skilltank, not written as one directly" (`MEMORY.md:2562-2563`),
warrant this row?** (W = yes, the row follows from that line; — = it came from elsewhere.)
Scan receipt: `python3 skilltank/scripts/scan_candidates.py --memory facts --skills <vibrobeast
0.8.55 skills> --drop-generic --top 12` → 10 notes · 59 skills · 76 themes. The top rows were
'actually', 'status', 'carry' and 'honest'. By skilltank's own falsifier (*"A ranking whose top five you
would not carry to the gate is a failed scan"*, `skilltank/SKILL.md:197-199`), this was a failed scan.
The theory's own note, `facts/two-readers-at-most`, is not in this snapshot. So the gate below was run by
hand, as the brief asked. `--selftest`: pass=11 fail=0.
SkillTank stops at a recommendation. Authoring goes to skill-creator, then the desk (CLAUD_QA_HOLD), then
the keeper signs and installs. Nothing here is authored, installed or signed.
---

# What the theory is, and what today changed

**The theory, in one paragraph** (`h/DISS-2026-09-17-two-readers.md`, PROVISIONAL · UNBLESSED). An actor
has at most two readers: its idea of itself and its idea of one other. In practice it reads only its own
construal of that other. When two parties are in the room, four views are the least that keeps bias
visible: me, party A, party B, and where A and B meet. That meeting point is named, so the seam cannot
hide the bias (§V, L192-224). Run the four views twice, once cold and once with a persona loaded (the
*doubled-nine*), and the difference is claimed to be *"a map of exactly where that persona's bias was
load-bearing"* (L237-238).

**What today's experiment found** (`writing/two-readers/EXPERIMENT-2026-09-27-doubled-nine.md`, blind,
preregistered, two runs of eight sessions):
- *"The persona changed the *reasons* given, not the *decision*."* (`:31`)
- On the live question, *"Of the 16 cold/persona pairs, 8 differ on the option. So do 4 of the 6 cold/cold
  pairs and 4 of the 6 persona/persona pairs."* (`:124-125`). With one pass per arm, a "persona effect" on
  the decision would have been rerun noise in half the pairs.
- *"Every run *invented* a Bryant, and each one invented a different Bryant."* (`:164-165`). A view of a
  person built with no words from that person is the least stable view.
- The readable persona is what let a reader trace each difference to a line (`:170-173`).

**What that does to the skill question.** The paper's own "fruiting body" is the four-view persona pass
(L241). That pass is half-confirmed. What travels best is not the paper's claim but the correction the
experiment forced: **a single pass shows reasons, and only reruns show whether a decision is stable.**
That correction bears on two skills already installed, and one of them has a script that hides it.

---

## The queue (ranked by receipts, never by fun)

**Q1 · ENHANCE `lens`** — W

*Ask.* Three additions, one capability. That capability is reflection before a hand-back, which is what
LENS owns.
(a) **Name the second four.** LENS's four views are mine, the one I ascribe the other party, their pull on
mine, and my pull on theirs (`lens/SKILL.md:17-23`). The paper's four are me, party A, party B, and where
they meet. These are two different fours with one name. The review of the paper called that a seam to
name, not merge (`writing/two-readers/REVIEW-2026-09-27-two-readers-second-reader.md:252-256`).
(b) **The persona pass shows reasons, not decisions.** LENS step 2 already treats what the inverse finds
as *"a finding, not a mood"* (`lens/SKILL.md:27-28`). The experiment supports that use and warns against
the next step: reading one persona/cold difference as proof the persona would *decide* differently.
(c) **`lens.py` erases reruns.** A reading's identity is *"(subject_sha, model, view): re-adding replaces"*
(`lens/scripts/lens.py:120`), and `converge` groups readings by model (`:273`). Run the probe
(`writing/second-user/lens-rerun-probe.sh`). One model read A, then B, and a second model read B. The
script kept 2 of the 3 rows, logged `action=replace`, and printed `[CONVERGE ] (a) my own view`
(`lens-rerun-probe-RUN-2026-09-27.txt`). With one label per rerun, the same readings print `[DIVERGE ]`.
So the tool reports agreement in exactly the case the experiment showed to be a coin toss.

*Receipts.*
- The fork itself: `MEMORY.md:2560-2563`; `writing/execute-brief/tracks/forks-inventory.tsv:33` (F032).
- The paper asks for this home: *"an **enhanced skill of the reflection family** … whose fruiting body is
  the four-views persona pass"* (`h/DISS-2026-09-17-two-readers.md:407-409`).
- The experiment lines above.
- Recurrence of LENS: `grep -c '^LENS ·'` finds a LENS block in all 12 writings of today's round
  (`writing/*/`), and every one is a single pass.
- Recurrence of the two-party shape: today's combined-model RAD weighs CORWIN.md against BRYANT.md aspect
  by aspect, and its row on the two-readers evidence predicts *"Switches change the *reasons* an AI gives,
  traceably, and not its decisions"* (`writing/combined-model/RAD-2026-09-27-combined-bias-model.md:39`).
  The execute-brief LENS names the same shape as *"the two-readers paper's four views made public: me,
  other A, other B, and where they meet"* (`writing/execute-brief/LENS-2026-09-27-written-against-open.md:411-412`).
- The code defect: the probe run above. `lens.py` sha256 is `8ae75e34…bcb4`.

*Gate.*
1. It ships what memory cannot: a self-triggering description already exists, and the script change in
   (c) is a runnable payload ✓.
2. It recurs: every hand-back runs LENS, and the two-party case came up twice today ✓.
3. It is one capability, reflection before hand-back, and the two-party form is view (b) split into
   three lines. That makes it an **ENHANCE of `lens`**, not a sibling. A new skill beside LENS would put
   two "four views" into two files, which is the seam made worse.

*The exact text for skill-creator.* Insert as a new section after "The four steps", before "Where it sits
in the family":

> ## Two parties in the room, and when the answer is a choice
>
> **The second four.** When the hand-back weighs two people's views, say Bryant's and Corwin's, view (b)
> is not one line but three: your construal of party A, your construal of party B, and where those two
> meet, named. This is the four-view shape from `h/DISS-2026-09-17-two-readers.md` §V (me · A · B · the
> seam). It is a *different* four from step 1's (a)–(d). Keep the two apart by name and never merge them.
> All three lines are your construction, not the people. A line about someone you have no words from
> will read confidently and will not repeat if you run it again. In the 2026-09-27 experiment, the view
> of the party with no quoted words was the least stable in both runs. Put their own words in before you
> lean on that line, or mark it *invented*.
>
> **A persona shows reasons, not decisions.** Wearing a persona (a CORWIN.md-like file) changes which
> reasons you give, and each change traces to a line of the persona. On its first test it did not change
> which option was chosen any more than a plain rerun did. So when the hand-back is a choice between
> options, run the pass more than once before reading any difference as the persona's. The spread between
> runs of the same pass is the noise floor, and only a difference beyond it is news. The test used four
> runs per arm; that is a chosen stand-in from the house set, not a measured minimum. Until reruns agree,
> say the persona *cited* a reason, not that its bias was *load-bearing*.

And, in "The script, when there are several readers", after its first sentence:

> Reruns count. `lens.py` treats a reading as (subject, model, view), and a second reading by the same
> model replaces the first, so a model that disagreed with itself looks like one settled reading. Until
> the script keeps a run number and prints each model's own spread beside the cross-model verdict, give
> every rerun its own label (`sonnet-5#1`, `sonnet-5#2`), and read CONVERGE only when each model also
> agreed with itself. `writing/second-user/lens-rerun-probe.sh` shows the difference.

For the script, the ask to skill-creator is to add a `run` field to the reading's identity, and a
`SPLIT-WITHIN` verdict when one model's reruns disagree. The selftest should then prove that verdict can
fire, which the probe's case 1 already sets up. One clause could also be added to the description's
trigger list: *"weigh two people's views"*.

*Falsifier.* The enhancement is wrong if LENS users, given the second-four paragraph, blend the two fours
in practice. A written LENS block that labels "party A / party B / seam" as (a)/(b)/(c) would show that.
Then a separate skill is the clearer home, which is option C of decision D1. For (b): a rerun of the
experiment kit on another model family in which the persona moves the *decision* beyond the rerun floor.
Then "reasons, not decisions" is a fact about one model family, and the paragraph must say so.

**Q2 · ENHANCE `eclipse-pass` — one sentence, a one-way reference to Q1** — —

*Ask.* Move 3 runs one doubt-first pass and one reward-first pass, and treats where they *"converge"* as
*"the stable result"*, with divergence meaning *"an unstable claim"* (`eclipse-pass/SKILL.md:82-86`). That
is one pass per arm. On the live question, the experiment's same-arm reruns disagreed on the decision in 4
of 6 pairs in each arm. By that evidence, a single doubt/reward pair cannot tell an unstable *claim* from
an unstable *head*. [MINE] This carries a finding about cold/persona arms over to doubt/reward arms. The
mechanism is the same (one pass per arm), but the arms are not.

*Receipts.* `eclipse-pass/SKILL.md:82-86` and `:178-179` (the skill's falsifier already refuses a verdict
with only one bias filled; this extends the same logic one step). Experiment `:124-125`. Recurrence:
`grep -c -i eclipse MEMORY.md` → 25; `decks/eclipse-passes.deck.md` carries 9 cards; "doubt-first" appears
on 37 lines across the corpus (`grep -rn -i 'doubt-first' --include=*.md corpus | wc -l`).

*Gate.*
1. It ships what memory cannot: one sentence inside a self-triggering skill ✓.
2. It recurs: eclipse is the shop's standing critique ritual ✓.
3. It is one capability, and a *reference* rather than a merge. Eclipse and LENS are "sometimes needed
   together", which is skilltank's rule for one-way reference (`skilltank/SKILL.md:115-118`) →
   **ENHANCE `eclipse-pass`**, pointing at Q1's paragraph.

*The exact text.* Append to move 3:

> Before reading a divergence as an unstable claim, run the diverging bias once more on the same claim.
> If a bias disagrees with itself, the instability is in the reading, not yet in the claim. See `lens`,
> "A persona shows reasons, not decisions".

*Falsifier.* Take a past eclipse target and run its doubt-first pass twice, cold. If the per-claim verdicts
agree both times on every claim, the rerun noise that showed up on a naming decision does not reach
eclipse's claim-by-claim verdicts. The sentence is then unneeded, and this row should be dropped.

**Q3 · HOLD — the doubled-nine kit as its own skill, or as a LENS mode** — W

The kit (seeded draw, context packet rule, cold and persona arms, blind split judge, word-overlap measure,
post-hoc ranks) is runnable today (`writing/two-readers/arms/`). But it has run **once**: two runs in one
day, by one author, on one topic cluster, one model family. Gate 2 (recurring) fails until a second
experiment wants it. Two are in sight:
- Alfred's cross-family rerun (`two-readers-D3`, option B).
- A test of the combined model's switches, whose own table predicts "reasons, not decisions"
  (`writing/combined-model/RAD-…md:39`).
→ **HOLD**, the reading room, not a penalty box. Promote on the second use.

This narrows `two-readers-D5` option A, which folds *"an optional doubled-nine mode that carries the
kit"* into LENS now. LENS's portability clause says *"This file is the whole instrument"*
(`lens/SKILL.md:87`). A heavy kit riding inside it works against that until the kit has earned its
keep twice.
*Falsifier:* a second experiment in the next build turn reuses `arms/` unchanged. Then the HOLD was only
a delay and D5-A was right.

**Q4 · LEAVE-AS-MEMORY — the theory itself** — W

The thesis (two readers at most; the single-reader floor; *"A reflection is not a witness"*; the maker can
be honest in the dark and the user cannot check it there) is prose. Its payoff is how a person thinks,
not a procedure a skill can trigger. It lives in `facts/two-readers-at-most` (absent from this snapshot)
and in the dissertation. Skill text should not quote the paper's L171-172 (*"The method has been proved."*)
or L237-239 until the corrections in `two-readers-D1` land. Both lines overclaim, per the second-reader
review §C.
*Falsifier:* a recurring *procedure* found in the theory that neither Q1 nor Q2 carries.

**No NEW.** The gate finds no capability here that an installed skill does not already own. A rainbow with
no missing colour needs no paint (`skilltank/SKILL.md:157-159`).

---

## Did the formulation warrant it

**Yes.** F032 said *"via skilltank, not written as one directly"* (`MEMORY.md:2562-2563`). Had a skill been
written straight from the 2026-09-17 paper, its core step would have been the doubled-nine, read as *"a map
of exactly where that persona's bias was load-bearing"*. Ten days later that is the one claim the
experiment did not support. Holding the paper at the gate let the experiment change *what* the
enhancement says before anyone authored it. The formulation's second half also held: the home it named, the reflection family, is
where the gate by hand lands, in LENS, with a one-way reference from eclipse. *Falsifier:* skill-creator, handed Q1's text, finds it needs a rewrite of LENS's step 1
rather than an added section. Then the formulation pointed at the right family and the wrong depth.

## What routes where

| item | to | state |
|---|---|---|
| Q1 paragraphs + `lens.py` run field and SPLIT-WITHIN verdict | skill-creator → CLAUD_QA_HOLD → keeper | recommended |
| Q2 one sentence | skill-creator, in the same pass as Q1 | recommended |
| Q3 the doubled-nine kit | HOLD in `writing/two-readers/arms/` | reading room |
| Q4 the theory | Mentat / `facts/`: already held there | no action |
| The paper's four overclaims | `two-readers-D1` (his) | before any skill quotes the paper |
| The choice between these and D5 as written | `second-user-D5` in this folder's `decisions.json` | his to bless; not his-only |

## Reproduce

```sh
# from the folder that holds  and writing/; SK = the vibrobeast skills directory
grep -n 'Headed toward a skill' MEMORY.md                      # 2562
grep -n 're-adding replaces' "$SK/lens/scripts/lens.py"              # 120
grep -n 'models = {r\["model"\]' "$SK/lens/scripts/lens.py"          # 273
grep -n 'converge\* is the stable result' "$SK/eclipse-pass/SKILL.md" # 84
sh writing/second-user/lens-rerun-probe.sh "$SK/lens/scripts/lens.py" # case 1 CONVERGE, case 2 DIVERGE
grep -n 'reasons\* given, not the \*decision' writing/two-readers/EXPERIMENT-2026-09-27-doubled-nine.md
python3 "$SK/skilltank/scripts/scan_candidates.py" --memory facts --skills "$SK" --drop-generic --top 12
```

The probe exits 0 and only reports. The lines to compare are the two `(a) my own view` verdicts.

---

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.

```
LENS · two readers to a skill, gate by hand · 2026-09-27
a  my view: ENHANCE lens (the second four, reasons-not-decisions, reruns kept in lens.py); one sentence into eclipse; HOLD the kit; the theory stays prose.
b  the view I ascribe Corwin: prove over defend; a skill ships a runnable thing or it stays a note; don't mint a sibling when an elder can carry it.
c  their pull on mine: made me look for a runnable payload rather than stop at a paragraph, which is how the lens.py rerun erasure turned up.
d  my pull on theirs: asks him to accept a smaller fruit than the paper promised: the rerun floor, not the exact map of bias.
persona / inverse: the maker says the enhancement keeps one reader honest about its own noise / the inverse says the tool that measures agreement between readers was itself the corridor of mirrors, since it quietly kept only the last reflection.
principles reframe: 1. Anyone reading a LENS verdict deserves to know whether the reader agreed with itself; hiding a split is hiding a fact from the person who acts on it. 2. The fix is a plain stdlib change to a GPL script anyone can read and rerun, and a probe a stranger can replay, which is freedom 1 applied to the instrument itself.
```
