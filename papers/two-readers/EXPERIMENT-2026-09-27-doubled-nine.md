# EXPERIMENT 2026-09-27 — the doubled-nine, run

**What this is.** The one claim `h/DISS-2026-09-17-two-readers.md` says it could not ground, now run
as closely as its text allows. Owed as fork F029 (`writing/execute-brief/tracks/forks-inventory.tsv:30`, "run one
doubled-nine on an unrehearsed question and diff"). Everything this file reports is in
`writing/two-readers/arms/` — prompts, packets, the persona, every raw arm output, the judge, the
measure script and its output.

**Plain words for the terms.** A *persona* is a written bundle of someone's preferences, biases and
reasons. The paper's *four-view pass* is: my view of me, my view of party one, my view of party two,
and my view of where those two meet (the *intersection*, or *seam*). A *doubled-nine* is that pass run
twice — once *cold* (no persona) and once with a persona *loaded* — so eight views, plus the persona
itself as the ninth thing in the room. The paper says the difference between the two passes shows you
where the persona's bias did the work.

---

## The question and the result

**The claim under test** (DISS L237-238): *"The delta between the cold pass and the persona-loaded pass
is a map of exactly where that persona's bias was load-bearing."* The paper's own bar for grounding it
(L485-486): *"one real doubled-nine, on an unrehearsed question, with the delta shown to land where the
persona actually differs."*

**Result, in one paragraph.** Two runs, eight blind sessions each, on two questions nobody chose. By the
rule I wrote down before running, both runs read **PARTLY grounded**. In my reading the claim splits
in two. **The half that says the persona shows up where it is: partly grounded.** In the second run the
difference sat on the "me" and "Corwin" views and not on the "Bryant" view, as predicted, and the
persona's own reasons appeared in every persona run and in no cold run. **The half that says the
difference maps where the bias was *load-bearing*: not grounded, and the run found evidence against
the one-pair version.** The persona changed the *reasons* given, not the *decision*. The decision
changed just as often between two cold runs as between a cold and a persona run. With one pass per arm,
as the paper describes it, half of all cold/persona pairs would have shown a "persona effect" on the
decision that was only rerun noise. A blind reader, given all eight answers, could not tell the two
conditions apart in either run.

---

## What was run (observed)

**Question drawn at random, no redraw.** `python3 arms/draw.py writing/execute-brief/tracks/bank-latest-open.tsv` → `seed=20260927
pool=369 index=122` → **Q149** (2026-08-02): what does a C4-coded name (like `ds2mt`) buy that the `c4`
prefix does not? The seed is today's date as a number, which is a fact, not a chosen value.

**Arms.** Four COLD runs (the method plus a context packet) and four PERSONA runs (the persona, then the
same method and packet). Four per arm is the house stand-in, chosen and not measured. It is the smallest
count that gives each arm six pairs to measure rerun noise. Each run was its own headless session:
`claude -p … --tools "" --strict-mcp-config --setting-sources "" --no-session-persistence`, in an empty
directory, with no tools and no view of any other run. The model reported was `claude-sonnet-5`
(Claude Code 2.1.283). Receipts are in `arms/[CP][1-4].json`. List cost for all 18 sessions,
summed from those files, was $1.62.

**The two parties** in every run were Corwin and Bryant, as in the paper's worked example (DISS
L210-217). The packet described them in one line each and said nothing else about them.

**The ninth model.** `modelthisbook/CORWIN.md` is not in this snapshot of the tree. I built the stand-in
by a rule that did not look at the question: the writers' brief's paragraph on his decision order and
mission, plus `PREFERENCES.md` whole (887 words, his named program, with its dated reasons). Credit
form: **CORWIN (for Corwin)**. File: `arms/persona-CORWIN.md`.

**Preregistered.** `arms/PREREG.md` (five predictions, a reading rule and the measure script) was
hashed at 2026-09-27T08:11:39Z, before any run. `sha256sum -c arms/prereg.sha256` passes.

**A blind judge.** A ninth session got all eight answers, shuffled by seed and labelled A–H, and was
told only that they came from two conditions of four. It was asked to split them. The chance of hitting
the exact split by luck is 1 in 35.

**Run 2, added after run 1.** Q149 turned out to be settled by its own packet: a deck line says *"This
closes Q149 properly"* (`decks/ghostwheel-idiom.deck.md:42`), and a later ruling puts it into practice
(`d/door/46-his-names-and-folders.part:9-11`). All eight runs said so. A persona has nothing to move
when the evidence decides the question. So I wrote a second preregistration, `arms/run2/PREREG-run2.md`
(hashed 08:17:12Z, after seeing run 1 but before running run 2). It draws only from questions that both
reconciled reader tracks mark as still his, i.e. a live fork. `python3 arms/run2/draw2.py
writing/execute-brief/tracks/bankA-reconciled.tsv writing/execute-brief/tracks/bankB-reconciled.tsv` → `seed=20260927 pool=140 index=61` →
**Q258** (URGENT): should "the register letter is the namespace" become "the letter plus the lookup
order is the namespace"? The options were A reword, B keep and footnote, C leave as is. I removed the
reader track's recommendation mark from the options. Nothing else changed.

---

## What was measured (observed)

**Distance** means the share of content words two answers do *not* share, block by block (Jaccard
distance, from `arms/measure.py`, written before the runs). *Excess* means the average cold-vs-persona
distance minus the average distance inside each arm. A positive excess means the persona made answers
differ more than rerunning did. *Rank* is post hoc (`arms/posthoc-views.py`, written after the numbers
were seen). It says where the true cold/persona split falls among all 35 ways of splitting eight
answers into two groups of four, with 1 the biggest difference. An effect that is really the persona's
should rank near 1.

| block | run 1 (Q149) excess | rank of 35 | run 2 (Q258) excess | rank of 35 |
|---|---|---|---|---|
| VIEW 1 me | +0.004 | 11 | **+0.030** | **2** |
| VIEW 2 Bryant | +0.005 | 12 | −0.007 | 28 |
| VIEW 3 Corwin | +0.016 | 7 | **+0.025** | **4** |
| VIEW 4 intersection | −0.009 | 29 | +0.001 | 15 |
| ANSWER | +0.010 | 8 | −0.026 | 30 |
| all blocks | +0.005 | 12 | +0.005 | 9 |

**Which words each arm reached for.** The figures are mean hits per answer, COLD → PERSONA, using
keyword lists fixed in `measure.py` before the runs. The persona's own themes are T1 finding files, T2
defaults and aliases, T3 plain words and access, T4 freedom and T6 don't foreclose. T5 (mechanical,
stranger-checkable) and T7 (preference, intention, voice) had no prediction.

| trait | run 1 | run 2 |
|---|---|---|
| T1 findability | 0.25 → 0 | 0 → 0.75 |
| T2 default/alias | 6.25 → 5.25 | 0.5 → 3.0 |
| T3 plain/access | 2.5 → 4.0 | 0.5 → 3.0 |
| T4 freedom | 0.5 → 0 | 0 → 0 |
| T5 mechanical | 0 → 2.0 | **0 → 4.75** (no other split of the 35 separates as well) |
| T6 no-foreclose | 0 → 0 | 0.25 → 1.5 |
| T7 pref/voice | **0 → 1.25** (no other split separates as well) | 0.25 → 1.0 |

**Citations of the persona's source (post hoc).** I set this pattern after reading run-2 P1:
`grep -c -i 'PREFERENCES\|Emacs\|more files\|mechanical accountab\|stranger'`. Run 1 gave COLD 0 0 0 0
and PERSONA 4 0 0 0. Run 2 gave COLD 0 0 0 0 and PERSONA 6 3 4 2.

**The decisions.**
- Run 1. All eight gave the same core answer: the coded name is an address or table position. On
  whether to rename the other 24 tools, COLD said no, partly, no, no and PERSONA said no four times.
  All eight said the question is no longer open.
- Run 2. On the option, COLD chose **B, A, A, B** and PERSONA chose **B, A, B, A**. No run chose C.
  Of the 16 cold/persona pairs, 8 differ on the option. So do 4 of the 6 cold/cold pairs and 4 of the
  6 persona/persona pairs. On whether the question is still open, COLD said yes four times and PERSONA
  said no, no, yes, yes.

**The judge.**
- Run 1. It split {P2, C2, P1, C4} from {P3, C1, C3, P4}: two of each condition on each side. The
  difference it called most systematic was how each answer built *Bryant*: held "at genuine epistemic arm's
  length" or collapsed into "an enthusiastic echo of Self" (`arms/J1.txt`). That difference cuts across the conditions.
- Run 2. It split {P2, C2, C3, P4} from {P3, P1, C1, C4}, again two and two. This is exactly the
  **A-choosers versus the B-choosers** (`arms/run2/J1.txt`, key in `arms/run2/judge-key.json`).
- A two-and-two mix is the most common chance outcome (18 of the 35 splits).

**Scorecard against the preregistration.**

| prediction | run 1 | run 2 |
|---|---|---|
| P1 a delta exists (cross > within) | holds on the letter (4 of 5 blocks positive); size ordinary, rank 12/35 | holds on the letter (3 of 5); rank 9/35 |
| P2 lands on me or Corwin, least on Bryant | **fails** (Bryant +0.005 ≥ me +0.004) | **holds** (+0.030, +0.025 against −0.007) |
| P3 the persona's traits rise | **fails** (1 of 5) | **holds** (4 of 5) |
| P4 the answer moves the persona's way | holds trivially (no run said "rename") | holds only as a tie (B: 2 cold, 2 persona) |
| P5 a blind judge sees the split | **fails** | **fails** |
| rule | PARTLY | PARTLY |

---

## Where the delta lands (judged)

1. **On the reasons, not the decision.** Run-2 P1 chose B *"because"* of *"Corwin's accretive/
   non-consolidation practice"* (`arms/run2/P1.txt`). Run-2 C1 also chose B, because the door file
   carrying the sentence is dormant and Corwin *"would be reluctant to rewrite while dormant"*
   (`arms/run2/C1.txt`). Same decision, different reasons. The persona supplied a rationale and did not
   change the choice. [MINE] *Falsifier:* a question where the persona arms pick a different option
   from the cold arms 4 to 0, or 3 to 1, while the cold arms agree among themselves.
2. **On the me and Corwin views, where the persona sits.** This held in run 2, and only as an ordering
   (ranks 2 and 4 of 35, post hoc). It did not hold in run 1, where the evidence left nothing to move.
   With 35 splits the best possible rank means about 1 chance in 35. Five blocks tested twice is ten
   tries, so a rank-2 result is suggestive, not proof. [MINE] *Falsifier:* rerun with more sessions per
   arm; if VIEW 1's rank falls toward the middle, the ordering was luck.
3. **The noisiest view is the one with the least evidence: Bryant.** The packet said only *"Corwin's
   co-author and lab partner on C4."* The Bryant view had the highest cold/cold distance in both runs
   (0.875 and 0.911), and it was where the run-1 judge found the most systematic difference. Every run
   *invented* a Bryant, and each one invented a different Bryant. That supports the paper's floor in
   §III: the other is the reader's own construction. It is also a caution. A four-view pass about a real
   person, run with no words from that person, produces confident text about him that does not repeat
   across runs. [MINE] *Falsifier:* give the packet three sentences Bryant actually wrote; if the Bryant
   view's rerun distance does not drop below the other views', the noise is not about evidence.
4. **The readable ninth model is what made the delta readable.** Every persona-only word and citation
   (T5, T7, PREFERENCES, Emacs) traces to a line in `persona-CORWIN.md`. You can read *why* a persona
   answer said what it said because the persona is a text you can open. This is the paper's §V governor
   gloss (L244-248), and it held.

## Is the claim grounded?

**Partly, and in a narrower form than the paper states.** Here is what the runs support: *loading a
readable persona changes which reasons an actor gives, and those changes can be traced to the persona's
lines. On a live question they cluster on the views the persona touches.* Here is what they do not
support: *"a map of exactly where that persona's bias was load-bearing"*. On neither question did the
persona carry the decision. On the live question, the decision was a coin toss inside each arm. That
is invisible to a single pass and to a single cold/persona pair.

**The finding the paper did not predict.** Its §IV says rerunning the same reader from a different
seed adds nothing: *"Your model of the other, run a second time from a slightly different seed, is still
\*your\* model"* (L159-160). That is true of the reruns as witnesses to what is right. It is false of them
as witnesses to how much the answer moves. Here the reruns were the only thing that showed the decision
was unstable, and a doubled-nine cannot be read without that noise floor. This partly triggers the
paper's own falsifier 5. I carry it into the review.

## What this test cannot show (limits)

- **One model family throughout.** The arms, the judge and I are all Claude-family models. The arms
  were `claude-sonnet-5` and I am `claude-opus-5-5`. Agreement across these is not a second reader in
  the paper's sense. [PLATFORM] *Falsifier:* the kit rerun on a model from another family gives the
  same pattern, or a different one.
- **Two questions, both about naming and registers.** Both were drawn by seed, so this is a
  coincidence, but it is still one topic. [MINE] *Falsifier:* a third draw from another cluster.
- **A stand-in, not CORWIN.md.** The real persona file may carry sharper opinions about naming than
  PREFERENCES does. [HIS] *Falsifier:* the same kit with `modelthisbook/CORWIN.md` loaded.
- **Shared contamination.** The platform injected the attached-project instructions into every run,
  cold and persona alike. `arms/isolation-check.txt` has the probes. Cold run-2 C1 quotes a sentence
  from them, and misquotes it. The injection is the same in both arms, so it cannot create the delta,
  but it makes "cold" warmer than the paper means and would shrink a real persona effect. [PLATFORM]
- **The same author set the test.** I wrote the packets, the persona rule, the predictions and the word
  lists. The arms and the judge were blind; the design was not. [MINE]
- **Crude instruments.** Word-overlap distance and keyword counts detect vocabulary, not stance. The
  judge is the only stance-level reader, and it is also one model. [MINE]
- **"Contain" is untested.** The paper says bias you can locate you can contain (L238-239). Nothing
  here tried containing anything.
- **How the persona was loaded.** I loaded it as the actor's own self. The losing reading is below.

## The losing reading, at its strongest

*"The delta did land where the persona differs. Every theme the persona carries appears in persona
answers and never in cold ones, and each one traces to a line of the persona. That is the map. The
decision did not move because on these questions the persona's bias was not load-bearing, and an empty
map is a correct map. The paper never said the persona must change the decision."* This is a fair
reading of §V, and on run 2's reasons it is true. It fails in one place. With one pass per arm, which
is what the paper describes, you cannot tell an empty map from a noisy one. Run 2 would have shown a
decision "moved by the persona" in half of all possible pairs. Hence the correction: say *cited* where
the paper says *load-bearing*, and require repeated passes per arm.

A second losing reading is about *loading*. The ninth model could be meant as something held in view
(a fifth view: "what would this persona say") rather than worn as the self. Held that way, it would
likely move VIEW 3 and leave VIEW 1 alone. I did not run that arm. It is the cheapest next test.

## By-products for the bank (his to rule; I do not close questions)

- **Q149**: all 8 runs read it as answered. So does the reconciled reader track
  (`writing/execute-brief/tracks/bankA-reconciled.tsv`, row Q149, "ANSWERED-BY-WRITING", citing
  `decks/ghostwheel-idiom.deck.md:42`). The close is his.
- **Q258**: a live tie. Eight runs split A 4, B 4, and none chose C. The persona did not tip it.

## Reproduce

```sh
# from the folder holding writing/execute-brief/tracks/ (the reader-track TSVs); ARMS = this work's arms/ folder
(cd "$ARMS" && sha256sum -c prereg.sha256) && (cd "$ARMS/run2" && sha256sum -c prereg-run2.sha256)
python3 "$ARMS/draw.py" writing/execute-brief/tracks/bank-latest-open.tsv
python3 "$ARMS/run2/draw2.py" writing/execute-brief/tracks/bankA-reconciled.tsv writing/execute-brief/tracks/bankB-reconciled.tsv
python3 "$ARMS/measure.py" "$ARMS" ; python3 "$ARMS/measure.py" "$ARMS/run2"
python3 "$ARMS/posthoc.py" "$ARMS" ; python3 "$ARMS/posthoc-views.py" "$ARMS/run2"
```

New sessions will give new words. The test is whether the *pattern* repeats, not the bytes.

---

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.

```
LENS · the doubled-nine experiment · 2026-09-27
a  my view: the apparatus runs and is useful, but only with reruns per arm; one pass per arm reads noise as persona.
b  the view I ascribe Corwin: prove it with a substrate and a test that could fail; a readable persona is the point, not a flourish.
c  their pull on mine: made me add a second run on a live fork rather than report a settled question's null as if it meant something.
d  my pull on theirs: asks him to accept "cited, not load-bearing" as the honest wording of a claim written in his voice.
persona / inverse: the governor says the readable persona made the delta legible, so the freedom gloss earned its place / the inverse says a black box rerun sixteen times told us more about the decision than reading any source did.
principles reframe: 1. Everyone who runs this kit can see what moved an answer, because the persona is text; that is the freedom to study, applied to bias. 2. The kit is small, plain-script and portable, so a lab partner on another model family can rerun it and disagree, which is the community's test.
```
