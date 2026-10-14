# ESSAY · 26 September 2026 — The number owed and the number given off

*Magic Number Theory: an essay toward review · C4 · written by Mentat (for Corwin), with five blind readings,
three paired readings, a third take on the grain, and a recipe a stranger can replay*

*Second edition, the same day (about 12:45Z). After his reread I added Movement X (the grain, a third take, and
the full count that the first edition's sample had skipped) and moved the replay into a literate recipe
(`magic-number-theory/RECIPE-2026-09-26-magic-number-theory.org`). I also corrected Movement VII for two things. A parallel
session changed the tool it quotes, and a search of mine had read lines from Z/. He holds his own copy of the
first edition, and the second edition does not replace it.*

> **The thesis, verbatim, so the rest can argue with it.**
> "Proposed: magic numbers apply when we should count: applying them when counting is a byproduct is an
> antipattern and suggests quotas. Discuss." — Corwin, 2026-09-26

**The reading this essay defends, set beside his sentence for his ruling and not in place of it.** The
sentence holds if two of its words are read the way the shop already uses them. *Should count* means *a count
is owed here*. That covers the times we can take the count now, and also the times we cannot yet take it and
put a disclosed house number in its place. *Applying* means *binding*: letting the number press on the thing
counted, as opposed to showing the number beside a count or using it to size a view. With those two readings
the sentence is true of every case in the tree that I could find. It also has a sharper edge than it seems to
have at first. The shop's newest writing pipeline breaks it, not with a quota but with a close cousin of one,
and the essay says where (Movement VII). His reread sharpened the first reading. A house number is for
*setting* an unknown. When we are already counting, we count, and stopping the count at a house number is the
antipattern. By that standard the first edition committed it once itself (Movement X).

**How this was made, in one paragraph** (details and receipts are in the appendices). I prepared one evidence
packet (`magic-number-theory/HYPOTHESIS-2026-09-26-magic-number-arms.DOSSIER.md`: seventeen cases, each quoted with its path).
Case ids C1–C17 refer to that packet. C18–C22 refer to the round-two addendum
(`magic-number-theory/arms-2026-09-26/ADDENDUM-R2.md`). Probe ids P1–P5 refer to Appendix C.
Five readers read it without seeing one another. One read with no persona, which is "the same, without the
instructed". The other four read as the voices that give the rotated reads on the onward-turn and build-turn
spells (`spells/INDEX.md`): Mentat, the Garden, gh7 and PENUMBRA. Before any of them ran, I sealed a
hypothesis about what each would say. Then I promoted the least likely reading (gh7) and the reading furthest
from the persona-free one (Mentat). I paired each with the lab partners' paired model, BRYANT_CORWIN_C4, which
is kept off the public persona shelf. I also ran that model alone as its own control. Between the rounds I
went back to the tree with four probes. After his reread, four of the readers took a third look with his
reprompt on the grain (Movement X). Everything the readers said is in `magic-number-theory/arms-2026-09-26/`. Every number in
this essay either comes from a command you can rerun (the recipe, and Appendix C) or says it was chosen
(Appendix B).

---

## I. One phrase, two trades

Say "magic number" to a programmer and you will get a small frown. In the trade's ordinary sense a magic number
is a literal that turns up in code without its reason: `if (x > 17)`, with no word about why seventeen. Every
style guide gives the same fix. Name the constant, put the reason next to the name, and let the next reader see
what the author saw. The frown is earned. An unexplained literal is a decision that has lost its record. It will
be copied, trusted and defended by people who never learned why it was chosen.

Say the same phrase in this shop and you will get the opposite reaction. The shop's own note on the word
(`facts/magic-numbers-is-itself-a-seam`, 2026-08-03) states the reversal plainly:

> "IN C4 IT IS A CLOSURE CLAIM, AND CLOSURE IS THE WHOLE POINT. 'Seventeen registers' does not hide a reason —
> it ASSERTS one: *this set is complete, and anything that does not fit is a finding rather than a footnote.*
> `26 = 17 + 9` says the alphabet is exactly consumed, so a letter doing two jobs is a defect **you can detect
> by counting**."

The shop filed the pair as a seam, and twice: `t/TAXONOMY/seam/magic-number/literal` (verdict CONFUSED) and
`t/TAXONOMY/seam/magic-number/budget` (verdict APPLIED). The second file carries the one-sentence test that
makes the shop's usage more than decoration: "A budget you can exceed painlessly is not a budget." The same
fact records the day the budget did work that nothing else in the shop could have done. A proposal to move two
register letters was checked against `26 = 17 + 9`, and "it ruled out J moving while U stayed a nine-member
with four facets (that would be 27)."

A newcomer needs to hold both meanings before any argument begins, because the thesis sits exactly on the seam.
It says the shop's meaning is right in one place and turns into the programmer's complaint in another. Written
in the programmer's vocabulary, the thesis is familiar: *an unexplained threshold on an incidental measurement
is a smell*. Written in the shop's, it is sharper: *a closure claim laid over something that was never designed
to close is a lie about completeness*. Most of this essay is about how to tell those two apart when you are
holding a number.

There is a third meaning, which the thesis does not name but which gives the phrase its feel. "The Magical
Number Seven, Plus or Minus Two" is the title of Miller's 1956 paper on the span of immediate memory. Cowan's
2001 review argued for a smaller figure near four. In the cognitive-science sense, a magical number is a
capacity: how much a mind can hold at once. The shop's house numbers borrow some of that credibility without
claiming it. The persona grid sizes a sketch at 4 traits, a short work at 9 and a long one at 17
(`h/traits/PERSONA-TRAITS-GRID.md`, rule 4). The canon calls 4 "the naming arity" (SAVANNAH, as quoted in
`h/MODEL-2026-09-26-math-writing.md`). Nobody in the tree says 4 is right *because* of Cowan, and I will not say
it either. I note it because a stranger will make the connection, and the essay should make it first and set it
aside: [DOMAIN] the capacity findings are about minds under test conditions, not about registers, and the
resemblance is suggestive and nothing more.

The keeper's person-model gives the last reason the phrase matters here, and I quote it rather than
paraphrasing: "Machines, math, numbers are comfort ('Numbers are a comforting device')"
(`modelthisbook/CORWIN.md` §6). A comforting device is exactly the kind of thing that can be reached for in the
wrong place. The Mentat arm said it best, as a warning to itself: "Magic numbers comfort (C17). Comfort is fine in a
closure claim and dangerous in a gauge." [MINE, borrowing the arm's line]

---

## II. What the sentence gets right: counts that are given off

Start with the half of the thesis that no reader disputed. Every reading in both rounds took it as given and
cited the same cases (Movement IX says how little that agreement is worth on its own). When a count is a byproduct, meaning it falls out of some other activity and nobody
set out to take it, putting a fixed number over it turns a description into pressure. The shop has three
recorded refusals of exactly that move, and each is worth reading in the keeper's own words.

**The held-card count.** On 2026-07-31 the instrument asked the keeper how many corrections he had seen and
deliberately not made, "A COUNT, not the content". The question had a reason. Without that figure, the shop's
error ledger could only ever be a lower bound. On 2026-08-29 the answer came back
(`evidence/question-bank-iTNH.tsv`, Q73): "REFUSED AS A COUNT, on principle ... 'I cannot possibly count the
number of things I have considered corrected and decided to hold off to stretch the tension building
dynamics.'" The ruling that followed is the part that matters: "HOLDING IS A DESIGN DYNAMIC, not a backlog",
and "the gauge was asking the wrong instrument for a number that a deferral should make visible in the
INSTRUCTIONS instead." A held correction is a byproduct of judgement. Count it, and the count starts reading
as a backlog, and a backlog asks to be burned down. The refusal stops a quota before it can form, and it does
so by declining to create the number at all.

**The shouting count.** At session open on 2026-08-05, `c4prime` printed an URGENT count of 97. The fact written
that day (`facts/discount-c4-urgent-shouting`) says: "That count is the question-bank shouting, not a priority
signal. Do NOT let it steer the session or convert into plan weight." His words: "You are getting shouted at by
C4 - the urgent matters are probably not so urgent." The urgent tally is a byproduct of how the instrument
banks its questions. Letting it set the session's priorities would put a bookkeeping habit in charge of the
work.

**The engagement metrics.** Among the hard guards in the keeper's person-model (`modelthisbook/CORWIN.md` §10):
"no engagement / time-on-companion / dependency metrics — success = **human connection enabled**". Time spent
with a companion is the textbook byproduct count. It falls out of use, it is easy to collect, and it is ruinous
as a target, because the cheapest way to raise it is to make leaving harder.

The outside literature predicts all three. Goodhart's 1975 observation about monetary targets (any observed
statistical regularity tends to collapse once pressure is put on it for control) became, in Marilyn Strathern's
1997 phrasing about university audit, the sentence most people now quote: "When a measure becomes a target, it
ceases to be a good measure" (Strathern, *European Review* 5(3), 1997). Donald Campbell put the social-science
version more sharply, in a paper first circulated in 1976 and published in 1979: the more a quantitative social
indicator is used for social decision-making, the more it is exposed to corruption pressures, and the more apt
it is to distort the social processes it was meant to monitor (*Evaluation and Program Planning* 2(1), 67–90).
Espeland and Sauder's study of law-school rankings (*American Journal of Sociology* 113(1), 2007) showed the
mechanism working: a public measure does not stay outside what it measures. Schools reorganised themselves
around the ranking's inputs, and the ranking became partly a description of its own effects.

**The keeper's reading of that lineage** (his words, on reading the first edition, verbatim): "the forcast of
the one has become the test we can generally remember to chide each other failing to study for, as the
forecast becomes realty as increasingly more attention/energy is needed to make a meaningful, noted
demonstration of force that seems opposing some 'inevitable' (by Srathern) decline of measure into a tail
we'll inevitably chase". He tied it to a trend he had named before in context: risk measured as falling
because the feature space users can meaningfully change is shrinking, "especially less technical ones", and
this happens "whatever rights of license may attach." [HIS] What I take from it [MINE]: Goodhart's line was a
*forecast* about control. Strathern's smoothing turned it into a maxim, and the maxim became a *test* that
people remember to fault each other for failing. Once that happens the forecast starts making itself true,
because resisting the decline now takes a visible show of force. The software-freedom version is the one the
four freedoms were written against. A system can score well on "risk" by leaving its users fewer places where
a change they make counts. The license still grants freedom one and freedom three, but the product has
already removed the places to use them. A measure that improves by shrinking what people can do is Goodhart
aimed at the user. *Falsifier:* a project where the risk score fell while the modifiable surface open to a
non-expert grew.

The shop has written its own version of this literature, and published it today. The companion paper on checks
and gauges (`pub/papers/red-first-then-counted/`, §1) says of its counting instrument that it "prints counts
and ratios, never a verdict or threshold — a threshold picked-not-validated is the same fault the gauge exists
to catch." It then names the failure the thesis is aiming at: "Ask a check a gauge's question and you get a
*threshold*: 'fail if the ratio drops below 0.4'. That is a number nobody validated, wearing a test's
authority." Its summary line is the best short statement of the half of the thesis nobody disputes: "Checks
carry what must not drift; gauges carry what should be weighed." And the sister paper published the same day
(`pub/papers/counting-what-can-be-counted/`, §6) records what the instrument learned about itself: "Mentat's
habit is to count. This paper taught it to count only what its owner agreed to have counted, and to write the
rest as a declared hold."

So the negative half of the thesis is well supported, and well defended in practice. There is one thing an
honest essay must add, and every round-two reading insisted on it independently. **No quota has been observed
in the shop.** Every support above is either an outside source or a refusal. The refusals show the keeper
turning the pressure away before it could land. They do not show the pressure landing. The gh7 arm put it
without softening: "The second clause ('suggests quotas') is plausible, but its only receipts are outside
sources: no case shows a quota actually forming in the shop." The pair-model arm took it a step further: the
absence "fits two readings: the guards work, or no pressure was ever applied. The evidence cannot tell these
apart." The essay therefore says **forecast** and **guarded against**, never **found**. [HIS] for the refusals;
[DOMAIN] for the forecast; [MINE] for the dress.

---

## III. The number that stands in, and why "should count" can hold it

All five first-round readers, working blind, raised the same objection. Four named it as their main threat, and
the fifth named it as a quieter one. The thesis has two slots, "when we should count" and "when counting is a
byproduct", but the shop's most common approved use of its house numbers fits neither. That use is the rule the
keeper set on 2026-09-10 (quoted from project memory):

> "there is no basis to invent numbers; when one is needed use 4, 9, 17 (months by default;
> hours/days/weeks/quarters/years/decades/generations as reasoned) and disclose that it came from the dial.
> Better still: calculate or derive."

It was used the same day on the Bryant drop: "the money falsifier is armed at 4/9/17 months after the release
act" (`h/NOTE-2026-09-10-foaf-drop-withheld.md:101`). Nothing is being counted there, either on purpose or as a
side effect. A falsifier needs a horizon, and nobody has the data to derive one. The GARDEN arm pointed out that
a strict reading of the thesis turns this into an antipattern committed by the keeper himself. It then saw the
opposite risk as well: a thesis stretched to excuse it may end up excusing everything, until "should count"
means nothing.

The same pattern turns up in four more places. The persona grid gives its sizes as fixed words (4, 9, 17 traits)
right after saying "as many traits as the persona needs" (C7). The BASELINE arm took that sentence to hold the
antipattern "inside itself". The dial is "confessed as chosen, not derived ... a defended cut whose defense is a
pedagogy" (`h/PAPER-2026-08-10-invent-computing-procedure-v2.md`, Parts II and IV). The drift budget is 17% of a task's
effort: "the budget isn't instrumented", so it is to be reported "as an estimate, not a measurement" (project
memory, 2026-08-29). And my own probe below takes a sample of 17 because I had nothing better to go on, which I
say where I do it.

Round two agreed on the way through. All three paired readings arrived at it separately, and they read the
evidence differently enough that I trust the agreement. **"Should count" is normative.** It does not say *we are
counting here*. It says *a count is owed here*: this is a place where a decision ought to rest on a number. On
that reading, the keeper's rule comes out as the first clause of the thesis under a hard condition, not as an
exception to it. The Mentat×BCC4 arm found all three conditions in the case text:

1. **A count is owed.** "Better still: calculate or derive" puts the dial below the real count. The rule
   admits it is a stand-in.
2. **The stand-in is disclosed.** "Disclose that it came from the dial."
3. **It is settled later.** A related rule on sign-worth says it outright: "call the shot, settle it later"
   (project memory, 2026-08-29). The money falsifier's 4/9/17 months will be settled by the calendar whether
   anyone remembers or not.

If all three hold, a house number in an empty slot is an IOU: it states its own status and it has a due date. If
the second condition fails, you have the programmer's magic number, a literal that has lost its reason. If the
third fails, a guess has hardened into a standard.

The probes also changed how the persona grid should be read. Most first-round readers treated it as the live
test, because the number of traits "a persona needs" sounds like a byproduct of the persona. The tree does not
support that. All five of the fiction-cast sheets record the command that made them (`h/cast/*.md`, line 7 or
8), and every one was rolled with `pg1rl ... --traits 4`. The tool rolls exactly the number it is given. **N is
an argument, not a result.** Nothing downstream can pad or trim toward a stop, because the stop comes first and
the persona is built to fit it. That puts the grid on the "should count" side: it is a size chosen for something
being built, like a page count or a word limit. The pair-model arm stated the limit of this evidence, and I keep
it: "P1 cannot see pressure on the choice of N, and five sheets at the smallest stop say nothing about 9 or
17." [MINE] for the reclassification; the limit is the arm's, and it stands.

The drift budget does not come out so cleanly, and I leave it on the table in Movement VIII rather than force it.
Its number binds the flow of a person's effort, and nothing measures that flow.

One more line from the canon belongs here, because it drew this distinction before the thesis did. It comes
from the SAVANNAH notes as quoted in today's math-writing model, and I have not read it at source: "4 is the
naming arity; growth does not count in fours." The fours sit where the keeper designed something to be named.
The run-levels, stages and fields "sit where things grew or were measured." The BASELINE arm called this the
thesis "in another form, and it predates the thesis". I agree. The keeper's own canon already puts designed
things on one side and grown things on the other. The thesis states that division as a rule about numbers, and
this movement's gloss only adds that a thing can also be *owed* a number before it has grown one.

---

## IV. What a number binds: three questions to ask a number before trusting it

The five first-round readings each drew one distinction, and each was right about something. Before combining
them I set them out in the readers' own words, because the differences between them carry information:

| reader | the distinction it said the thesis lacks |
|---|---|
| BASELINE (no persona) | "which way the pressure runs ... if the real count disagrees with your number, which one moves?" |
| MENTAT | what the number binds: "an **artifact** or an **actor**"; plus a second failure, "numerology, not a quota" |
| GARDEN | three states, not two: "Closure ... Detent ... Quota", where the quota is "a detent read back as a closure" |
| GH7 | "bound-to-check versus target-to-fill" |
| PENUMBRA | "a number that binds the population" versus one "that binds only the view or stands in for a missing measurement" |

These are five views of one idea, and the three paired readings in round two each put them together a little
differently. The combination I will stand behind is three questions, asked in order. Any reader can ask them
of any number without learning the house vocabulary:

1. **Which one moves when they disagree?** (BASELINE's test.) If the count goes over the number and the
   *number* gives way (the display shows more, the stop is overridden, the guess is replaced by the
   measurement), the number is a label, and an honest one. If the count goes over and the *counted thing* is
   pushed back into line, the number is binding.
2. **What does it bind: something we built, or someone's conduct?** (MENTAT's test.) Binding a designed
   artifact is what a closure claim is for. The twenty-seventh letter is refused, and that refusal is a finding
   about the design. Binding a person's conduct is how a quota works. The shop already has a consent rule for
   that case: count "only what its owner agreed to have counted" (C19). The pair-model arm put it in the
   model's own words: "A number may bind what we built. It crosses onto a person only by consent."
3. **Where did it come from: counted, derived, or chosen?** (Provenance, which every arm arrived at in some
   form.) The paper published today proposes that every build turn carry "a CONSTANTS section ... each marked
   chosen or derived" (`pub/papers/counting-what-can-be-counted/`, §4). A chosen number is fine as long as it
   says it was chosen. What turns a detent into a quota is the confession falling away.

Checked against the three questions, the shop's uses fall into three honest regimes and one dishonest one:

- **Closure.** The number binds a designed set, and going over it is a finding. *Moves:* the artifact (the
  letter is refused). *Binds:* something built. *Came from:* chosen and defended (C1: 26 = 17 + 9; C14: the
  naming arity; `h/nine.sh`'s nine dimensions).
- **Detent (view).** The number limits how much is *shown*, and the true total rides beside it. *Moves:* the
  number (you can turn the dial). *Binds:* only the screen. *Came from:* chosen and documented (C2's "9 of 39";
  `derive/emacs-recipe/RECIPE.org:62`, "Minimal is the courtesy; the full ceremony is the option, never
  hidden"; `bin/intake:158` and `bin/cm2nt:95`, which each print "and N more").
- **Stand-in.** The number sits where a count is owed but cannot be taken. *Moves:* the number, when the count
  arrives. *Binds:* a decision's timing or scale, never a person. *Came from:* chosen, disclosed, due (C8; the
  sample sizes in `q/build-shapes-2026-09-17/SURVEY.md:662` and in this essay).
- **Quota**, the dishonest one. The number binds the output of someone's conduct, the conduct gets pushed
  toward it, and the confession has fallen off or was never there. No instance in the tree; forecast by
  Goodhart, Campbell, and Espeland & Sauder; turned away three times (Movement II).

**The window and the fence.** The GARDEN arm wrote the image I would most like a stranger to keep, and I
quote it at length because I cannot improve it: "Twenty-six is a fence: step over it and something rings. Nine
is a window. It shows you nine cards, says 'of thirty-nine', and lets you pull the curtain wider. ... A quota is
not a number in the wrong room. It is a window that forgot it was a window and started acting like a fence."

**The window, tested.** PENUMBRA's reading made C2, the session-open screen, the strongest counterexample to
the thesis *as worded*. It is a house number (9) applied to a byproduct count (the urgent pile), and nothing
goes wrong. PENUMBRA also named the observation that would overturn its own verdict: "urgent counts settling
near 9 or 17 across sessions". I checked. The question bank is append-only, and the last state of each question
wins, so the size of the urgent pile on any past date can be rebuilt (Appendix C, P2). Starting on 07-29, the
pile read 1, 4, 7, 14, then **97** on 08-03, then 92, 82, 77, 74 (for five dated days), 73, 85, and then **39**
on 08-30. It has read 39 on every dated day since, through today, which is 27 days. For all of that stretch the
screen has shown "9 of N". The pile never went near 9 or 17. The window leaned on nothing.

The Mentat×BCC4 reading gave a warning here that I am adopting as a rule for this essay. That flat stretch at 39
is itself a byproduct count, and it is a count of *a person's* conduct: it measures how quickly the keeper rules
on banked questions. Read as a verdict on his pace, it would count his conduct without his leave. That is the
exact harm this essay describes. So P2 is evidence about the dial, and I use it for nothing else. [MINE, from
the arm's hazard 6b]

**The ceremony dial** is the closest the shop comes to a number that leans on something. `h/ms1dg` takes
`--ceremony N` "on the shop's ladder 1 2 4 9 17", and it defines N as "the size of the RING the ceremony is
meant to convince". Given a value off the ladder, the tool does not refuse it. It warns: `ceremony $CER is not
on the ladder 1 2 4 9 17 -- explain the pick or move to a stop` (line 275). There is a nudge in that. The two
round-two readings that looked closely disagreed about it in a useful way. The pair-model arm said the nudge
"nudges a designed parameter (the ring size), and it offers disclosure as the way out". It then made C20's
history the falsifier for its whole combined test: "If off-ladder `--ceremony` values get withdrawn to a stop
after the WARN while the ring they size stays the same, then a detent on an artifact is acting as a quota." I
have not looked at that history. It is listed under HOLDS in Appendix B, where the next reader can find it.

---

## V. The quieter failure: when a count lands on a house number

The thesis names one failure: the quota. The Mentat arm named a second, and every reader in both rounds agreed
the essay must not commit it. When a count that nobody designed lands on a house number, the landing *looks
like* confirmation. It is a coincidence, and a shop that loves its numbers is exactly the shop that will be
tempted to read it as a sign. Mentat called this numerology, and I keep the word. It is the right word, and it
is not kind.

The tree holds four cases, and I am putting the correction first.

**The swept threshold, and my own error in reporting it.** In `decks/word-load-bearing.deck.md` the instrument
set a boundary "at ratio ≥ 10 by feel", then swept it, since "*uncalibrated const* is fault two on my own list".
Here is the sweep as the deck prints it:

| boundary | words classed CAMP |
|---|---|
| ≥ 2 | 23 of 47 |
| ≥ 5 | 21 |
| **≥ 10** | **17** |
| ≥ 20 | 13 |
| ≥ 50 | 9 |
| ≥ 100 | 7 |

The deck's verdict is exemplary: "A monotonic slope with no plateau ... So 10 was picked from the middle of a
slope, and the sweep did not fix that. It proved it." At the boundary chosen by feel, the count happens to be
17. In the evidence packet I gave the readers, I added a note: "one step further is 9." **That is wrong.** One
step further is 13. The 9 comes two steps further, at ≥ 50. All five first-round readers repeated my wording,
and all three round-two readers inherited it. I found the error only when I re-read the table to write this
movement. It does not change any argument, because the point is that *any* stop on a slope can hit a house
number. It does change something about the method. The readers were independent of one another, but not of me,
and a mistake in the shared packet went through every one of them unchecked. My sealed hypothesis already rated
the prediction that someone would spot this coincidence as contaminated (H6), since my note had pointed them to
it. I now know that the note was also wrong in its detail. [MINE; the correction is filed under CHANGES in
Appendix B]

**The negative control that brushed the dial.** In the invent-computing paper, a control case {3, 5, 68} was
supposed to fall off the ladder. It turned out to pass through two magic numbers, because "68 = 4 × 17 happens
to factor through one of the dial's own stops". The paper withdrew its earlier claim and kept the correction:
"an accident of one factorization, not a genesis." That is the right handling, done in public.

**The coincidences flagged when they happened.** In `q/words/README.md:268–270`: "The 17 meanings in the header
is a count from a command, and it being a house number is a coincidence I am flagging rather than hiding." And
in `q/build-shapes-2026-09-17/SURVEY.md:662`: "(17 is a house number, and picking it is a guess.)" These are
what the guard looks like when it works. The coincidence is named in the same sentence as the number, so no
later reader can take it for a finding.

**The coincidence nobody flagged.** Today's ingest-writing run record (`spells/ingest-writing/runs/
2026-09-26-corwin.md`, the K/H gauge section) closes its vocabulary gauge with "All: K 15, H 74, K/(K+H) 0.17."
The run record correctly calls it "a gauge only", with no verdict attached. But 0.17 is also, to the digit, the
keeper's 17% drift budget. The two measure different things: one is the share of a firing's words pinned in
C4's registers, the other the share of a task's effort spent on process. A reader who holds both in mind will be
tempted to see an agreement. There is none. I am flagging it here, in the style of `q/words`, so that nobody
has to wonder. [MINE]

**Seeds are names, not counts.** Three of the five fiction-cast personas were rolled with seeds 9, 17 and 4
(`h/cast/PELL.md`, `ROUX-ABARA.md`, `VANTH.md`). A seed fixes which random draw a stranger can reproduce. No
count sits under it, so it binds nothing and cannot turn into a quota. It is a *name* for a draw, and the canon
says 4 is the naming arity. Using house numbers as seeds is the harmless end of the scale. The number is doing
the job a word would do. It is never mistaken for a measurement, and nothing turns on it. I include it so the
scale is complete: at one end a number that names, at the other a number that presses.

What the four cases teach together, in the keeper's terms: **the defense of a cut is the load-bearing part**
(`facts/the-dial-and-cavepeople-arithmetic`), and a coincidence is a cut *with no defense*, however familiar the
number. PENUMBRA's reading gave the practical rule, and it is in character for an archivist of lost rounds:
"If you throw those five away, the house number looks like it was discovered there." Only the thresholds that
lost, printed beside the one that won, show that 17 was an accident. A sweep is a way of keeping the losers.

---

## VI. What the viewpoints did: the same reading with and without the voice

The prompt for this essay asked for each viewpoint to be "considered against first the same but without the
instructed". The shop already runs a larger version of this experiment. The onward-turn spell keeps the keeper's
own words with his tone intact and never leaves the lab. The build-turn spell carries "the same instructions
cleaned up" and is the one that travels. The comparison is recorded in `spells/INDEX.md`, and the difference in
wording is treated as the variable (`spells/onward-turn/SPELL.md`, "Why this one stays home"). My experiment is
smaller and asks a narrower question. The evidence and the brief are held fixed. One reader gets no voice
instruction. Four readers get one voice each: the voices that do the rotated reads for those same two spells.
The question is what the voice changes.

**What I forecast, and how it went.** I sealed seven predictions before any reader ran
(`magic-number-theory/HYPOTHESIS-2026-09-26-magic-number-arms.md`, sealed 11:08Z; results appended at the foot, rows not edited).
Two held cleanly:

- **H5.** PENUMBRA would keep a protective cap as its loser.
- **H7.** The verdicts would split.

One held but cannot count as independent evidence:

- **H6.** Someone would notice the coincidence in C6. All five did, because my own note pointed to it, and
  Movement V shows the note was wrong in its detail.

Two held in part:

- **H2.** Mentat named the drift budget, but gave EVEN, not LIKELY.
- **H4.** gh7 was the least likely, but its threat was C8, not the availability percentages. No reader used
  those at all.

Two failed:

- **H1.** The no-persona reader drew the load-bearing distinction by itself.
- **H3.** The Garden did not put the stranger at the centre. It put confession there.

Surprise condition S2 fired.

**What the voice added.** S2 firing means the first-round reader with no voice found the essay's governing test
on its own: *which moves when they disagree?* It would be easy to conclude that the voices added only colour. The
record says otherwise. Every voiced reader contributed at least one thing that made it into this essay and that
the unvoiced reader did not have:

| reader | what it added that BASELINE did not, and that this essay kept |
|---|---|
| MENTAT | the second axis (made thing versus conduct), and the name *numerology* for the quieter failure |
| GARDEN | the three states (closure · detent · quota), the window and the fence, and a must-not: "A thesis about quotas that ships as a hard lint has made a quota of its own" |
| GH7 | the refusal to call the quota *found*: "its only receipts are outside sources" |
| PENUMBRA | C2 as the counterexample to the literal wording, and the falsifier that let me test it (P2) |

Each contribution matches its character sheet closely, and I could see that only afterwards:

- Mentat's sheet says it is "the one who counts before saying", and it found itself as the one the thesis warns
  about: "I am the one this thesis is written against."
- The Garden is a place with a door, and it worried about a rule nailed to the door.
- gh7's one firm rule is the stamp it trusts (a dump named by its binary's own fingerprint, refused if it is
  anyone else's), and it asked for the stamp on the quota claim and found none.
- PENUMBRA keeps the rounds that lost, and it kept the losing thresholds and the losing literal reading.

**My finding, [MINE], worded no stronger than one run a side allows:** *a voice changes what a reader attends to
more than what it concludes, and I predicted those shifts in attention badly in advance and could read them
easily afterwards.* The onward-turn spell's own rule for this comparison applies here: "until two or more runs exist on each side, it is data,
not information." This is one run per arm. It is data.

**Round two, and the paired model.** The promotion rule was declared before round two: rank by verdict, then
break ties among the EVENs by distance from BASELINE. It promoted gh7 (the only UNLIKELY) and Mentat (the
furthest from BASELINE). Each read again with the lab partners' paired model at its elbow. BRYANT_CORWIN_C4
describes itself as "a captured model of the system the three of us make together": Corwin judges and unites,
Bryant ships single files that open and work, and C4 governs by consent and provenance. The pair model also read
alone, as the partners' own control. The brief asked each of the three forces to speak once, as a force and not
as a person's quote. The three readings gave these lines, lightly trimmed, and I print them because they name
what each reader of this essay will need:

- *Unite:* "one question must hold closure, detent and stand-in. An essay that needs five distinctions has not
  found its question." (BCC4 alone)
- *Ship:* "if a stranger cannot replay P1 and P2 from the tree root and get 4 and 39, the essay is prose, not
  proof. Put the commands inside it." (BCC4 alone) This is why Appendix C exists.
- *Consent:* "nothing is counted about a person without their agreement (C3, C19)." (GH7×BCC4) This is why P2
  is used only about the dial.

All three round-two readings converged on the gloss in Movement III, while arriving there by different routes
(normative "should"; C8's "better still"; the settle-later rule). They also converged on printing the keeper's
sentence verbatim and putting any amendment *beside* it for his ruling. The pairing moved one stance. gh7, with
the pair model at its elbow, held its UNLIKELY for the sentence as written but moved to EVEN for the glossed
sentence: "The gloss disposes of C8. The quota half is still a forecast." The pairing also brought out one
disagreement that I cannot settle, and I keep it. Mentat×BCC4 wanted the second clause *amended* to name both
failures: "over a person's conduct it becomes a quota; over a made thing's incidental tally it becomes
numerology". GH7×BCC4 wanted only one word changed ("applying" to "binding"). Both are set out in the Coda. The
choice is his.

---

## VII. Microscope: what survives when the scorer is not trusted

The lens skill describes the microscope as the rung where "one mind is no longer enough magnification: strip the
assumptions and keep only what survives with *no trust in the scorer*". Eight readings agreed on a conclusion
that sounds reassuring: the shop applies its house numbers honestly, and the quota is a forecast. The microscope
asks whether that conclusion depends on who did the looking, and on where they looked.

**P3: a seeded draw, two readers.** I searched the tree for every line that names the house numbers or the dial
(Appendix C gives the pattern). That gave 325 lines, 236 of them distinct. I drew 17 with a declared seed. Why 17:
nothing better was to hand, so this is the stand-in regime, disclosed. I classified the 17 lines and saved my
classification (sha256 `306ab225…`, 11:17Z). A second reader who had not seen my file then classified the same
lines against the same nine classes. We agreed on the class of **14 of 17**. We differed on:

- a test tool that lists the ladder as data (I called it DISCUSSION; it said SIZE);
- a ceremony-weight row (SIZE / NAME);
- a data blob quoting the dial fact (DISCUSSION / DETENT).

We also differed on whether "9 of N" counts as *disclosure*. The second reader said no: showing the *depth*
tells you how many there are, not where the number came from. It is right, and the difference matters. A
detent needs its depth. A stand-in needs its origin. They are separate duties.

Both readers found **zero** uses of the class THRESHOLD-ON-BYPRODUCT, and three of the seventeen lines were
noise. Zero in fourteen real uses puts the rate in the population this search can see below roughly 21% (the
rule of three, 3/14, at about 95% confidence). That is a weak bound, and I report it as one.

**The frame was biased, and the bias ran toward the answer.** The search found lines that *name* the house
numbers: lines that say "from the dial" or "house number". A line that names its number that way has already
disclosed it. The programmer's magic number, an undisclosed literal, is exactly the kind of line such a search
cannot find. P3 sampled the shop's confessions and found them honest. It could not have found anything else.

**P4: the bare literals.** So I searched the other way: comparisons in code against 4, 9 or 17 (`-gt 17`,
`>= 9`, and so on) in `bin/`, `lib/`, `f/` and the scripts in `h/`. That gave 95 lines
(`magic-number-theory/arms-2026-09-26/P4-LINES.txt`). I sorted them first and sealed my list (`P4-READER-A-mentat.txt`, 11:36Z).
A second reader who had not seen my list then sorted all 95 into eight classes (`P4-READER-B.tsv`). Most of the
lines are structure (the second reader counted 40 STRUCTURE, 21 DISPLAY and 16 TEST):

- field counts on four-column registers (`NF>=4`);
- loop bounds;
- a nine-dimension ranking tool that says of itself: "RANKS; it never imposes a feel-threshold (the
  'uncalibrated const' fault)" (`h/nine.sh:7`).

Some of the lines are exemplary:

- `bin/ot3he:163` refuses to give a verdict below a minimum sample: "THIN -- fewer than 4 acts. NOT CHECKED,
  not a verdict."
- `bin/confirm-gauge:297` checks a value against "the predicted band", which is a sealed forecast and not a
  target.

**Five lines were flagged by both readers as house numbers used as verdict thresholds over incidental
frequency counts:** `bin/cl1ix:396`, `:811`, `:814`, `:830` and `bin/cl2ft:95` (line numbers as of 12:30Z;
a parallel session edited both tools during the day, and the recipe checks the quoted text, not the numbers). The second reader flagged a
sixth, `bin/affinity.sh:18`, which bands a word-hit count into NONE/LOW/MED/HIGH. I had read that line as a
display band, because the tool calls itself "crude, declared word-hit gauge". It stays disputed. Both readers
also separated out a set of DEFINITION cuts on an item's own size, such as sentence length and word length.
Those are not frequencies, and I come back to them below. All five agreed lines sit in one family of tools:
the chat-log writing pipeline. That is where the essay's prompt had pointed.

A limit that belongs to this probe: a literal search cannot see a *named* constant. `PHONEME_MIN = 4` and
`MEME_MIN_WORDS = 9` escape it entirely, because the named constant is exactly the programmer's remedy.
Those two I found by reading the file.

**`bin/cl1ix` and the ingest-writing spell.** The spell this essay's prompt called "already spelled out" is
`spells/ingest-writing/`. It cuts a body of writing into memes and phonemes, routes them toward `m/t`, and
gathers each person's quotes. Its chat-log chapter and its indexer carry more house numbers than any other file
I read. The indexer lists them in its header as a JOURNEY:

> "GAP=17 min (house number, invented, from the spell) ... MEME_MIN_WORDS=9 and KEEP_PER_ROUTE=17 (house
> numbers, invented). Mine; rule to change." (`bin/cl1ix:13–17`)

Put those constants to the three questions from Movement IV:

- **`KEEP_PER_ROUTE = 17`** is a detent, and an honest one. The index it writes prints the depth beside it:
  "turns (>= 9 uses in >= 9 hunks): %d found, %d kept", and then a list headed "more (counted, not cut)"
  (`bin/cl1ix`, around line 846).
- **`GAP = 17` minutes** is a stand-in for how long a silence has to be before a conversation counts as over.
  That is a real count, owed and not yet taken. The run record lists the refinement that is due ("a busy channel
  never goes quiet for 17 minutes").
- **The frequency thresholds are something else:**
  - a spelling becomes a phoneme at `PHONEME_MIN = 4` uses (line 822);
  - a near-spelling needs its partner form to be 4 times as frequent (lines 811, 814);
  - a turn of phrase becomes "a turn of phrase he repeats" at `c >= 9 and len(ghunks[g]) >= 9` (line 830);
  - a nickname becomes "a word for him" at `c >= 17` hunks (line 396);
  - and in `bin/cl2ft:95`, an unrouted word is reported once it reaches 4 uses.

  Every one of these is a house number used as a **verdict threshold over a byproduct count**. How often he
  happened to type something decides what the index records as *his voice*. The index prints the phoneme and
  turn thresholds at its head. The docstring states the nickname threshold. The header's list of invented
  house numbers includes none of them. None of them has been swept. The tally here is an index, which is a
  made thing, but it is an index *of a person*: his own writing, which he asked to have indexed. So this is
  not a quota. It is the place in the tree where the line between a made thing and a person's conduct is
  thinnest. In the shop's own words, this is the fault `c4prime` prints at the top of every session:
  `uncalibrated const   a threshold set by feel decides the verdict -> sweep it, then quote.` His reread
  reweights the list (Movement X). Only the 9 and the 17 are right of the grain. The 4s sit on the doubling
  side of the dial.
- **`MEME_MIN_WORDS = 9`** is different, and both P4 readers put its cousins in a separate class. A sentence of
  9 or more words is a *definition* of what the pipeline calls a meme. It is a cut on the sentence's own
  length, not on how often anything happened. It is declared as invented. It is closer to a size than to a
  verdict. It is unswept, but it does not have the problem this movement is about.

**The stop rule, and what it has already done.** The chat-log chapter ends the passes this way: "Stop when a
pass adds fewer than 4 new topics per 17 hunks read (house numbers, invented), or after pass 4, and say which"
(`spells/ingest-writing/chapters/15-source-chat-logs.md`, around line 47). That is a house-number ratio laid
over a rate of discovery, and a rate of discovery is a byproduct of reading. The firing reported the result
this way (`spells/ingest-writing/runs/2026-09-26-corwin.md`, around lines 50–55):

> "On the stop rule: read as a whole-pass average, pass 3 (0.02) would have stopped the firing before pass 4.
> I read 'per 17 hunks read' as a batch measure for a pass that reads by hand, so it never fired; pass 4 ended
> at my cap. Fork 10 asks which reading is yours."

That is the thesis breaking in the tree, and it did not break the way the thesis predicts. **No quota formed.**
Nobody was pushed to read faster or to find more topics. What formed was a **verdict whose unit was
undecided**. A designed count carries its unit with it: the alphabet has letters, and a register has rows. A
byproduct count has no unit until someone chooses one. So a house number laid over it has to bring a unit
along, and the unit is where the ambiguity grows. Whole pass, or batch? Per 17 hunks read by hand, or by
machine? One threshold gave two verdicts, depending on the frame. [MINE, and I think it is the most useful
thing this essay found. It sharpens the thesis's second clause. Applying a house number to a byproduct count
*suggests a quota* when the count is of someone's conduct. When the count is of a tally, it suggests *a verdict
with no unit*: C18's "number nobody validated, wearing a test's authority".]

**Update, the same day: his ruling.** While this essay was being written, the chapter was corrected in
another session. It now reads: "A pass ends when its input is read, not at a rate". It carries a dated note:
"This paragraph first declared a stop: 4 networks or 9 hours for pass 1, and 'fewer than 4 new topics per 17
hunks read' for the rest. Those numbers were invented by the instrument while drafting the chapter; Corwin's
ruling the same day: 'I didn't specify a stop rule, you added that yourself.'"
(`spells/ingest-writing/chapters/15-source-chat-logs.md`). So the house numbers in the stop rule were the
instrument's, not his, and his ruling is his thesis applied. We were already counting, so we finish the
count. Fork 10 dissolves. The finding above stays as the record of what an invented stop did to one firing.
Two sessions, working apart, reached the same place.

What is owed here is not a caution. It is one check, and the tree already has its pattern. `decks/
word-load-bearing.deck.md` swept its CAMP boundary and printed the slope. The same sweep over the turn threshold
(uses and hunks together, at 2, 4, 9, 17 and 26) and over the stop rule (both frames, pass by pass) would settle
three questions:

- whether 9 sits on a plateau, or in the middle of a slope as 10 did (still open);
- whether "4 per 17" means anything that does not depend on the frame (answered by his ruling: the rule is gone);
- therefore, which reading Fork 10 should take (dissolved).

I did not run it. The counts live under `Z/chatlog/.private/`, which is his and which the chapter's rules
govern. I will not read inside that without him. The check is written out as a fork in the Coda so it arrives in
one piece, and the recipe carries the instrument (`mn-sweep`, in Perl, which walks the whole curve and not
only the dial's stops) and the run-card (`sweep.card`).

**What survives the microscope.** Kept, and needing no trust in me:

- the P2 series, which anyone can rebuild from the bank, and which agrees with `c4prime`'s own "9 of 39";
- the P3 agreement between two readers, together with the bias in its frame, and then the full count of all
  235 lines by two more readers (Movement X), which found the one suspect line the sample had missed;
- the cl1ix constants, quoted from the code, and the five P4 lines two blind readers agree on;
- the stop-rule ambiguity, quoted from the run record, and his ruling that removed the rule;
- the error in my own packet (Movement V).

Weakened: "no quota observed" survives only as *no quota on a person observed*. "The shop applies its house
numbers honestly" survives for its *named* uses. It fails for five frequency thresholds in its newest
writing pipeline, all found by both readers, with a sixth in dispute. Two of the five are right of the grain.

---

## VIII. Eclipse: three projects the essay did not choose, and the losers it keeps

The eclipse pass exists because "a single reviewer, especially a helpful one, talks itself into the answer it
already likes" (`eclipse-pass` skill). It checks claims against projects drawn at random from the keeper's
roster, runs every claim twice (doubt first, then reward first), and keeps the models that lose.

**The draw, and a falsifier that fired on the way.** I ran the skill's own script against the roster
(`pmo/projects.tsv`, 26 candidates) with `--pick 3 --seed 20260926`. The container's `awk` is mawk 1.3.4, and
three runs with the same seed gave three different picks: *books, bryant, avalon*; then *dev.ghostwheel.chat,
paclam, modelthisbook*; then *paclam, lab, avalon*. The skill anticipates exactly this failure: "Seen failing
under Debian mawk 1.3.4 in the build sandbox on 2026-09-11 — that awk ignores `srand(seed)`; check yours." It
fired again today. Under gawk the same seed gives the same three projects every time: **bryant**,
**dragaera**, **dev.ghostwheel.chat**. I used that pick. The fault belongs in the skill's own falsifier list,
and I report it at the close rather than fix it inside an essay. One more thing that belongs on the record
here: a script that was meant to make a *count* reproducible (which projects come out of the hat) failed on a
platform difference. Seeds are names, and a name only works if every reader resolves it the same way.

The claims under test are the three questions from Movement IV, restated to be falsifiable:

- **K1.** A house number belongs where a count is owed.
- **K2.** A number that binds a person's conduct is a quota unless that person agreed to it.
- **K3.** A number that binds an incidental tally, without a sweep behind it, is a verdict with no unit.

**bryant**, described on the roster as a "routine support cadence for Bryant (Takushi): per-project model
accelerators, GPG/provenance coaching, artifact catalog + vouching".

- *Doubt first:* a cadence is a number that binds conduct (how often support happens). By K2 it is a quota
  waiting to happen. If "every 9 days" were set and then measured as "support delivered", the count would soon
  be served instead of the person.
- *Reward first:* a cadence here is a *promise* that one party makes about its own conduct, and it is offered
  to the other party, not imposed on them. The actor chose the number.
- *Converge:* K2 holds, and the eclipse sharpens it. A number over conduct is a commitment when the person
  whose conduct it binds made it, and a quota when someone else made it for them. That is C19's rule ("count
  only what its owner agreed to have counted") applied to a schedule.

**dragaera**, described as a publishing hub for an author's backlist, including a limited-edition omnibus.

- *Doubt first:* publishing runs on byproduct counts: copies sold, readers reached, fans. A hub that refused
  to steer by them would not be a hub. K3 looks naïve next to commerce.
- *Reward first:* a limited edition is the purest closure claim on the roster. The run size is fixed on
  purpose, the scarcity is the product, and printing one copy more is a defect in the promise. K1 holds
  exactly.
- *Converge:* both hold, and they sit at different places. The print run is a closure (K1). Sales figures are
  gauges, and they should be weighed (C18). The antipattern would be a sales *target* set from the dial ("17%
  more readers this year"). The keeper's H6 guard against engagement metrics already refuses the
  companion-app version of that move. In commerce the thesis does not forbid looking at byproduct counts. It
  forbids letting a house number turn them into a target. [MINE]

**dev.ghostwheel.chat**, the "ghostwheel dev host workspace: tend-fluxer and its transport recipe". The
project's signed instructions set out its transport expectations: "anticipate 99.99% at least one reachable ·
90% any two reachable · 98% (target) all three, per cases of actual demand".

- *Doubt first:* these are thresholds over a byproduct (reachability, observed when someone happens to need
  git). One is even labelled "target". By the thesis as written, this is the antipattern.
- *Reward first:* the header says *anticipate*. They are expectations published so collaborators can plan, and
  the text qualifies them twice: "per cases of actual demand" and "within the bounds of courtesy/custom". And
  they are **not house numbers**. Where the measure is an outside convention (availability), the shop uses
  the convention's numbers and not its dial.
- *Converge:* a small, real finding. The shop does not reach for 4/9/17 where a field already has a
  vocabulary. The "98% (target)" is the one place on the roster where a number over a byproduct is called a
  target. It stays honest only because the host operators are volunteers, the text leans on courtesy, and
  nobody is measured against it. If that changed, and a volunteer's standing came to depend on the 98, K2
  would apply at once. No reader in either round used this case, even though it was in the packet (C16). The
  eclipse found it because the eclipse did not let me choose.

**The losers, kept.** Debugger on. None of these is thrown away. Each is parked here with what would bring it
back:

1. **GH7's UNLIKELY, for the sentence as written.** On the literal wording it is correct: C2 is a house number
   applied to a byproduct count, and P2 shows no harm. It loses only if the keeper accepts the gloss. It comes
   back if he does not. *Falsifier:* his ruling.
2. **The drift budget (C4), unresolved.** It is a house number, 17%, over the flow of a person's effort, and
   nothing measures that flow. Mentat's axis says this is where a quota would form first. The gloss says it is
   a disclosed stand-in that gives way. gh7's round-two reading made it *the* loser, and I agree: "The essay
   loses that argument today for lack of a receipt either way." *Falsifier:* a meter for
   deciding-effort, and a record of whether work bent toward it.
3. **Governance by disclosure alone** (the GARDEN position): "The antipattern is not 'magic number on a
   byproduct count'. It is a detent read back as a closure: the 'of N' dropped, or the 'came from the dial'
   forgotten." It lost to the three questions because disclosure alone does not tell you *which way the
   pressure runs*. It comes back if the pair model's falsifier fires: "If off-ladder `--ceremony` values get
   withdrawn to a stop after the WARN while the ring they size stays the same" (C20). Then a disclosed detent on
   an artifact has acted as a quota, the artifact/conduct axis fails, and disclosure is all that is left.
4. **The literal thesis**: that a house number on *any* byproduct count is the antipattern. It lost to C2 and
   P2. It keeps a reduced form, in the cl1ix thresholds (Movement VII). The literal reading was wrong about
   *displays*, and right about *verdicts*.

---

## IX. LENS: the writing assignment itself

The lens is the shop's human baseline: "one human's thought experiment, run before a deliverable leaves your
hands". This essay is the deliverable, and it is also C4's first long piece of writing that is not code. So the
lens is turned on the writing, not the thesis.

```
LENS · ESSAY-2026-09-26-magic-number-theory · 2026-09-26
a  my view:              the job is a sharper sentence and one portable test, and a demonstration that
                         a long piece of prose can carry receipts the way a tool does.
b  the view I ascribe:   he asked for "Discuss", not "prove"; he wants every viewpoint worked in turn;
                         he wants the house numbers defended where they are honest and caught where they
                         are not; he does not want me to rule in his place, and he does not want ceremony.
c  his pull on mine:     the prompt's structure (rounds, the control, pairing) made this partly a methods
                         report; "Discuss" kept me from a verdict; his 4/9/17 rule made me disclose my
                         own sample size; his words "already spelled out" sent me to ingest-writing,
                         and that is where the finding was.
d  my pull on theirs:    I wrote the evidence packet every reader used, and my error in it went into all
                         eight readings; I built the three questions from their five views; I coined
                         "stand-in" and "a verdict with no unit". If those words stay, it will be because
                         he elects them.
persona / inverse:       Mentat says count and receipt everything / the inverse, the keeper at Q73 who
                         refused a count, says the essay counts too much. See below.
principles reframe:      four points, below.
notes: written.
```

**What the inverse found.** Read as the keeper who refused the held-card count, the essay has a counting
problem of its own. It says "eight readings agreed" as if the number of agreeing readers were evidence. It is
weaker evidence than it sounds. Every reader read *my* packet, and Movement V shows that one wrong clause in the
packet went unchallenged through all eight. Agreement among readers who were briefed from one source is a
byproduct count of the briefing. Treated as a verdict, it is the antipattern: a tally of agreement doing duty as
a tally of truth. So I withdraw "eight readings agreed" as a claim of strength. Where the essay leans on
agreement, it leans on *routes*: in Movement III, three round-two readings reached the gloss by three different
paths (normative *should*, C8's "better still", the settle-later rule). That is a better reason than their
number. The Mentat persona would not have written this paragraph. It is the inverse's finding, and the lens
skill says to keep it as a finding.

**The four principles, in the shop's order of decision.**

1. **Universalism and egalitarianism.** A number that binds a person's conduct without their agreement treats
   the person as the means of hitting a figure. The rule "count only what its owner agreed to have counted"
   is not the keeper's privilege. It is owed to everyone the shop counts, including the people whose words
   pass through the chat-log index and the volunteers behind the 98%.
2. **The four freedoms.** Freedom one is the freedom to study how a program works. An undisclosed constant
   defeats it quietly: you cannot study a decision whose reason has been erased. So the programmer's rule
   (name the constant) and the shop's rule (say whether it was counted, derived or chosen) are the same
   freedom at two scales. The provenance question from Movement IV is freedom one, applied to numbers.
3. **The software-freedom movement.** Volunteer projects are where quotas do the most damage. The shop's
   EFFICACY value says time spent on the social efficacy of volunteer work "is exponentially valued, not
   linearly — because this is volunteer work done from conviction" (SAVANNAH, as quoted in today's
   math-writing model). A target on a volunteer's output turns conviction into obligation. The movement's
   norms are courtesy and custom, the same words that keep the 98% honest.
4. **The wider scientific and technical community.** The named-constant rule and Goodhart's law are common
   property, and this essay adds little to them: three questions a stranger can ask, and one observation (a
   house number on a byproduct count has to bring a unit along, and the unit is where the ambiguity grows).
   Both are offered as GESTURE (argued from cited cases), not THEOREM. Appendix B marks every claim this way.

**Where the essay could still commit its own antipattern.** The round-two readers named two hazards, and I set
each out with its guard.

- *Filling to a stop.* **Guard:** the first edition had nine movements and a coda. I planned them from the
  material and counted them afterwards. Nine is a stop on the dial, and I could not rule out that the dial
  pulled on the plan, so I flagged it in the style of `q/words`. The second edition has ten, because his reread
  gave the work one more movement. The coincidence did not survive contact with more work.
- *Asking a gauge a check's question.* **Guard:** P3's zero is not a pass mark for the shop. P3 is reported
  with its bias. P4's finding rests on two readers, and the line they disagree on is printed as disputed.

---

## X. The grain: a third take, after his reread

He read the first edition and answered it. His words, verbatim, since the take was built on them:

> "The point of the 'unless we happen already to be counting' is that sometimes we really are counting and
> it's silly to invent a reason to stop counting at a number because we happen to have numbers and also like
> to stop counting when we aren't sure the max. In our four stop from middle at 4 gauge you could say we count
> up from the magic numbers, and then we can back down from them (into rational numbers that make sense as
> doubling if we count forward back to where we started: the system isn't that magical if taken this
> backward/left from zeroed at four stop on four gauge). When we count up, of course, that's the magic. My
> point is the grain. If we are setting a unknown number we might well (nearly always should when we have no
> specific direction otherwise to guess) reach for the magic number when applying it. The finesse is how: the
> only meaningful guide I have offered so far are the names for the magic stops on the dial: GRAIN, GREAT,
> GRAND."

So the band went back in for one more take. Four readers went in, because GRAIN (4) is his default for a
round of sub-agents: "`GRAIN: (default)4 or GREAT:9, or GRAND:17`" (his hand-edit of 2026-09-04,
`AS4CE0001/memory/subagent-grain-great-grand.md`). The four were BASELINE, the Garden, Mentat with the pair
model, and gh7 with the pair model. Each kept the context of its earlier reading. PENUMBRA and the pair model
alone sat this take out, and their readings stand. I sealed a hypothesis first
(`magic-number-theory/HYPOTHESIS-2026-09-26-magic-number-take3.md`, 12:03Z). Three of its rows held, two failed, and one
surprise fired. The surprise is the most useful thing in this movement, so it comes first.

**Already counting: the essay's own sample.** I had predicted that the readers would re-pick P3's sample of 17
to a different stop. None did. All four, separately, said the sample should not exist. The population had
already been counted (236 lines), so drawing 17 of them was "stopping a count at a number because we happen to
have numbers". The gh7 reading put it in the shipping force's words: "236 lines is one file two readers can
finish. Count it." BASELINE pointed out that P4 had already shown it could be done, with two readers
sorting all 95 of its lines. By his clarification, the first edition committed the antipattern it describes,
in Movement VII, in my own hand. The number was even disclosed ("nothing better was to hand"). The fault was
not in the disclosure. It was the reach itself. Something better *was* to hand: the count.

So I counted. Two new readers, blind to each other, sorted every line of the inventory into the same nine
classes as before, plus one more drawn from his words: STOPPED-COUNT, a count really being taken and cut short
at a house number. The inventory is `magic-number-theory/arms-2026-09-26/P3-INVENTORY.txt`, and it has 235 lines, not 236. The
difference is explained under the Z/ correction below. The two readers agreed on **217 of 235** lines.

- **Both readers flagged one line: I176**, `h/spells/2026-09-26/COMPARE-chatlog-intake-vs-ingest-writing.md:131`.
  It reads "Stop when a pass adds fewer than 4 new TOPIC entities per 17 hunks read (house numbers,
  invented)". One reader called it STOPPED-COUNT and the other THRESHOLD-ON-BYPRODUCT. It is the stop rule
  again, copied into a comparison note. **The seventeen-line sample had missed it.** The full count found
  what the sample could not. The note belongs to the session that wrote it, and I have not edited it. The
  chapter it compares has since been corrected (see the update in Movement VII).
- **Both readers found two coincidences, and both were flagged when they were written.** One is
  `q/words/README.md:269`. The other is `q/build-shapes-2026-09-17/SURVEY.md:426`: "Nine gaps; nine is a house
  number and was not aimed at — it is what the search returned."
- **The readers disagreed about five lines (one device, not five uses).** The device is the memory palace's
  break-out, where a list "breaks out" into its own `pins-*.md` file when its references reach 4, 9 or 17,
  "as nudges" (for example `q/retention/palace/semaphores.md:21`, `MEMORY.md:2177`). One reader read it as a
  threshold over a byproduct count. The other read it as a chosen size. Read with the names, I lean to a
  third reading [MINE]: this is the naming arity at work. At GRAIN, a list has earned a name of its own, and
  here the name is a file. It is a nudge, a window rather than a fence. That call is his, and it is listed
  under the Coda's questions.
- **Everything else was sorted without suspicion.** The class counts differed only in how the two readers
  split DISCUSSION, SIZE and PLACEHOLDER.

**The Z/ correction.** Rebuilding the inventory, I found that the first edition's search had not excluded Z/,
the keeper's more sensitive material. Its figures (325 lines, 236 distinct) therefore included lines from
`Z/chatlog/.private/`. There were seven of them in the rerun. None was among the seventeen drawn lines, and no
reader saw one. The moment I noticed, I removed them from the inventory. Every search in the recipe now
excludes Z/ by name, and a check (`probes-never-read-Z`) goes red if that exclusion is ever dropped. The
Z/-free figures are 323 lines and 235 distinct.

**The finesse.** All four readers read the names the same way: as the size of the *ring* a number has to serve.
They each quoted the ceremony tool (`h/ms1dg`): "The number is the size of the RING the ceremony is meant to
convince -- C4's own units (4 GRAIN, 9 GREAT, 17 GRAND; 1 and 2 below them are 'yourself' and 'a pair')".
They also quoted the slide note, which gives 9 as "cyclic, multi-participant" and 17 as "org-to-org". The
procedure they converged on is below, and it is what `mn-grain` in the recipe answers. The ring reading is
theirs, not his. The slide note records his units as withheld ("GRAIN = GRAM here, unless 'kinds of measure' —
withheld"), and his word overrides the procedure.

1. **If you are already counting, use the count.** Do not stop it at a house number because the maximum is
   unknown.
2. **If you are setting a number that nobody can count or derive,** start at GRAIN (4). Go up to GREAT (9)
   only when strangers must live by the number. Go up to GRAND (17) only when it has to stand on a shelf or
   hold between organizations. The Mentat reading added the rule's edge: "never because the thing is big."
3. **Write the name beside the number.** "9 (GREAT, from the dial)". The name is the disclosure.
4. **Staged reach counts up the stops.** Take the money falsifier's 4/9/17 months: each checkpoint serves a
   wider ring. The GH7 reading put it this way: "three settlement dates, each named for its ring." That is the
   magic he means when he says "When we count up".

**Left of four.** His "back down ... into rational numbers that make sense as doubling" matches the ladder. 2 =
1 + 1 and 4 = 2 × 2 are plain doubling. The +1 and −1 that make the dial magical first appear at 9 and 17. So
numbers at or below the grain need no confession, and the readers used that to reweight Movement VII. Of the
five threshold lines both P4 readers flagged, **two are right of the grain**:

- `cl1ix:396` (17 hunks);
- `cl1ix:830` (9 uses in 9 hunks).

Three are 4s, and 4s sit on the doubling side:

- the two "4 times as frequent" checks, `:811` and `:814`;
- `cl2ft:95`.

Fork B's sweep should start with the first two.

**The essay's own numbers, re-picked.** The four readings, set side by side:

| number | the readers | where it lands |
|---|---|---|
| P3 sample of 17 | all four: count them all | done: 235 lines, two readers |
| round sizes 5, then 3 | all four: keep, they were counted, not reached for | kept |
| this take's 4 | all four: keep, as GRAIN | kept |
| cl1ix GAP, 17 minutes | all four: derive it from timestamps the tool already holds; until then, two say GRAIN and two say GREAT | Fork B |
| KEEP_PER_ROUTE, 17 | three: GRAIN, a working view; gh7: keep 17 if the lists are meant for a shelf | his call; the count runs on either way |
| the stop rule, 4 per 17 | all four: drop the ratio, since it stops a real count | **already done, by his ruling** (Movement VII) |
| the 17% drift budget | all four: his figure, pended; a share sits left of the grain | Fork C |
| money falsifier, 4/9/17 months | all four: keep, as the ladder | kept |

**The form.** All four readers said this is an ESSAY, not an ESSAY-GRAND. GRAND is the shelf's name, and the
move to the shelf is his pen. The Mentat reading said why length does not decide it: "12036 words is size, and
the rule refuses to climb for size."

**What would show the finesse wrong.** The readers each named one test:

- **His units, once stated, measure something other than a ring** (cost, weight, effort). This is gh7's test,
  and the slide note already says they are withheld.
- **The persona grid's sizes are ruled to follow length:** "4 for a tiny sketch, 9 for a short work, 17 for a
  long one" (C7). Then the names carry two axes. This is Mentat's test, and it is a live one.
- **Sweeps run later plateau at 9 or 17 more often than at 4.** Then GRAIN is the wrong default. Also
  Mentat's, and the recipe's `mn-sweep` is the instrument for it.

**The recipe.** The replay has moved out of Appendix C into `magic-number-theory/RECIPE-2026-09-26-magic-number-theory.org`,
a literate kit in the shape of `derive/emacs-recipe/`:

- It unpacks into its own tools: `mn-probes` (sh, with awk and Python inside), `mn-sweep` (Perl) and
  `mn-grain` (sh).
- It carries eleven checks, and they pass on the tree.
- With two faults planted, four of the checks went red.
- Its output keeps the essay's own distinction: CHECK lines can go red, and GAUGE lines only report what they
  saw. The recipe is the "ship" force's demand, met: "Put the commands inside it."

---

## Coda: his sentence, and what could stand beside it

His sentence, unchanged:

> "magic numbers apply when we should count: applying them when counting is a byproduct is an antipattern and
> suggests quotas."

The essay argues that it holds when *should count* is read as *a count is owed* and *applying* is read as
*binding*. What follows is laid out for his ruling. I make no amendment myself. It is his sentence, and a fork
is the honest form for this.

**FORK A: the sentence.** WHERE: this essay's Coda; the thesis line of any later edition. ACT: pick one.

1. **Keep it verbatim, with the two glosses printed under it.** *(My recommendation. It changes nothing he
   said, and the glosses carry what the cases showed.)*
2. **Change one word** (GH7×BCC4): "Magic numbers apply when we should count, including when we should and
   cannot, provided the number says it came from the dial. *Binding* them to a count that is a byproduct is an
   antipattern and suggests quotas."
3. **Name both failures** (Mentat×BCC4): "A house number belongs where a count is owed, taken now or disclosed
   as a stand-in until it can be taken. Laid over a count the work merely gives off, it presses: over a
   person's conduct it becomes a quota; over a made thing's incidental tally it becomes numerology."
4. **Name the failure the tree actually showed** (mine, after Movement VII): "Magic numbers apply when we
   should count: when a count is owed, taken now or disclosed until it can be. Binding them to a count that is
   a byproduct is an antipattern. Over someone's conduct it suggests quotas. Over a tally it gives a verdict
   with no unit."

RECEIPT: the choice written as a dated note beside the thesis line. Nothing else waits on it.

**FORK B: the sweep for the chat-log thresholds.** (The stop rule is out of this fork: his ruling removed it.)
WHERE: `bin/cl1ix:396` (17 hunks) and `:830` (9 uses in 9 hunks) first, since they are right of the grain; then
`:811`, `:814`, `:822` and `bin/cl2ft:95`. The counts are under `Z/chatlog/.private/work/`. The blast radius is
his private chat material. The sweep reads only numbers, with each item hashed, so no text leaves `.private/`.
TOOL: `mn-sweep` and `sweep.card` in the recipe. `mn-sweep` walks every threshold, not just the dial's stops,
and it has proved itself red on planted curves. ACT: pick one.

1. With his yes, I write the hashed count files from the firing's work data and run the card once.
2. He runs `sweep.card` himself at the next ingest-writing firing.
3. Hold.

RECEIPT: the sweep table beside the run record, as `decks/word-load-bearing.deck.md` did for its boundary.

**FORK C: the drift budget.** Held by default, per Q73's ruling that a deferral should show up in the
instructions and not in a gauge. The single line owed is that `facts/drift`, or the memory note, says the 17%
is a stand-in that gives way and binds no one. If he would rather instrument it, that is a separate turn.

**QUESTIONS the third take left for him** (not forks, since each one is a reading of his words, and only he
can give it):

- **The persona grid's sizes, 4, 9 and 17 traits for a sketch, a short work and a long one.** Do they follow
  length? If they do, the names measure two things, and "never climb for size" is wrong.
- **The 17% drift budget.** Is it a GRAND reach, or a share that belongs left of the grain?
- **The palace break-out at 4, 9 and 17 references.** Is it a threshold over a byproduct count, or the naming
  arity giving a list its own file?

**His answers to the three questions** (late 2026-09-26, appended, the questions above left as asked). In
this chat: "you are entirely correct on all three counts, these are antipatterns, I suggest a GRAIN of these
is simple (typical) user privilege, imply that teams have MORE of this and not less, but that ORGS have little
to no tolerance save whatever limited list of as-counted measures an org may exhaustively describe their
necessary uses for and treatments regarding." In his prompt to the parallel session
(`q/2026-09-26-onward-readiness/PROMPT.md`, item 5.1): "Three is the number of the counting on that ... When
this number reaches for 4 ... mention it. When/if we reach 9, warn me. We should not reach 17 important to
C4/ghostwheel operationally and reached by counting values in any multi-user context without express
consents that relate/explain the circumstance in detail, what are we doing, why must we count, how do we do
it, how to do we know it is right?" And the analogy he gave for why the rings differ: C4 makes a puppet
(ghostwheel). One operator wants "four simple to work wires". A team has more puppeteers, but its audience is
still the people in the room. An org performs "at a club", for people other than its organizers, so it "needs
to show how the wires are working if they aren't working according to the means described by the ...
manuals users see". The names therefore carry a *tolerance* as well as a size. GRAIN is a user's own
wires. GREAT is a team's, and a team may carry more of them. GRAND is the club, where every counted wire
is listed and explained or it does not play. The first count against that gauge is in
`magic-number-theory/REVIEW-2026-09-26-ingest-writing-firing.md`: the chat index's vocab exemption is the fourth member, so, as
he asked, it is mentioned.

**What to carry away, in one sentence, for a stranger who reads nothing else:** before you let a number stand
over a count, first ask whether you are already counting (if you are, use the count). Then ask which one gives
way when they disagree, whether it binds something you built or something someone does, and whether it says it
was counted, derived or chosen (and if chosen, for which ring: GRAIN, GREAT or GRAND). If the thing counted gives way, if it is
someone's conduct, and if the number will not say where it came from, you are looking at a quota, however
friendly the number.

---

## Appendix A. The twelve ASPECTS: the less formal viewpoints, one line each

The onward-turn spell names "the twelve" (6 HARD, 6 SQUISHY) as the aspects a persona-facing experience lists.
They are viewpoints too, only less formal than a persona. Each gets one line on the thesis. Twelve is a closure
count (6 + 6, a designed set). If a thirteenth aspect appeared here, that would be a finding.

- **Memory.** A house number is a memory aid: 4/9/17 are easy to recall, which is exactly why they get reached
  for in the wrong place. Memory should keep the *reason* beside the number (C19's CONSTANTS).
- **Tool-building.** Tools take numbers as arguments (`--traits 4`, `--ceremony 9`) or turn them into verdicts
  (`c >= 9`). The first is safe by construction. The second needs a sweep behind it.
- **Optimization.** Anything optimized against a number bends toward it. That is Goodhart. Optimize toward a
  purpose, and use the number to check the purpose.
- **Introspection.** The instrument counts by habit. The honest introspective line is Mentat's: "I am the one
  this thesis is written against."
- **Critique.** Ask the three questions. A critique that only counts thresholds has made a quota of critique.
- **Ethical baseline.** Nobody is counted without agreeing to it (C3, C10, C19). That holds for the people in
  the chat logs as much as for the keeper.
- **Self.** The shop's self-description carries its numbers (seventeen registers, twenty-six letters), and a
  self-description is a closure claim. That is the right place for them.
- **Honesty.** Say whether each number was counted, derived or chosen. Flag coincidences in the same sentence.
  This essay corrected its own packet in Movement V.
- **Diligence.** Sweep before quoting. The one real finding here came from reading code a second time, in the
  other direction, after the first search had come back clean.
- **Thoughtfulness.** A byproduct count about a person (P2's flat 39) is used about the dial and about nothing
  else.
- **Tempo.** Stand-ins have due dates. A guess with no due date hardens into a standard, and the 17-minute gap
  already has its refinement listed.
- **Soul.** "Numbers are a comforting device." Keep the comfort, and keep it off other people's backs.

## Appendix B. The writing a build turn owes: CHANGES, CLAIMS, CONSTANTS, HOLDS

Today's math-writing model (`h/MODEL-2026-09-26-math-writing.md` §3) proposes that a build turn's writing
carry these four sections. This essay is the first long writing assignment, so it carries them, as a trial of
that form.

**CHANGES** (each line is recorded twice: here, and in the home of the thing changed)

| WHAT | MOVE | WHY | WITNESS |
|---|---|---|---|
| `magic-number-theory/HYPOTHESIS-2026-09-26-magic-number-arms.md` + `.tsv` + `.DOSSIER.md` + `.BRIEF.md` | add | "write the hypothesis first if a surprise is possible" (his rule, 2026-09-10) | sealed 11:08Z; results appended below the sealed rows, rows unedited |
| `magic-number-theory/arms-2026-09-26/` (the eight readings, the round-2 brief and addendum, the P3 draw, both P3 classifications) | add | cite at the act; the losers are kept | the files themselves; sha256 in `magic-number-theory/arms-2026-09-26/SHA256SUMS` |
| this essay | add | his ask, 2026-09-26 | `sh ~/.claude/.../writing-forms/scripts/wf-check.sh` reads it (Appendix C) |
| `magic-number-theory/arms-2026-09-26/P4-LINES.txt`, `P4-READER-A-mentat.txt`, `P4-READER-B.tsv` | add | a finding needs two readers ("a count two readers agree on is a receipt") | reader A sealed 11:36Z before reader B ran |
| `c/wf` ESSAY row | change | writing-forms: "second use, then a row" (this is the form's second use) | the row's NOTE says what moved it |
| the DOSSIER's C6 note ("one step further is 9") | hold | wrong; corrected in Movement V, and the sealed dossier is left as the record | Movement V; `decks/word-load-bearing.deck.md` |
| `magic-number-theory/HYPOTHESIS-2026-09-26-magic-number-take3.md` + `.tsv`; `magic-number-theory/arms-2026-09-26/BRIEF-R3.md`, `R3-*.md` | add | his reprompt on the grain; hypothesis first | sealed 12:03Z; scored below the sealed rows |
| `magic-number-theory/arms-2026-09-26/P3-INVENTORY.txt`, `BRIEF-P3FULL.md`, `P3FULL-READER-C.tsv`, `-D.tsv` | add | "already counting: count": the full count the sample skipped | two blind readers, 217 of 235 agree |
| `magic-number-theory/arms-2026-09-26/P3-INVENTORY.txt` | change | seven lines from `Z/chatlog/.private/` removed the moment they were seen | `grep -c 'Z/'` reads 0; the recipe's `probes-never-read-Z` |
| `magic-number-theory/RECIPE-2026-09-26-magic-number-theory.org` and its unpacked kit `magic-number-theory/recipe-magic-number-2026-09-26/` | add | his ask: "build out the RECIPE side" | `sh c4check checks.c4`: 11 of 11; four red under two planted faults |
| this essay, second edition | change | his reread: the grain, already-counting, Goodhart to Strathern | the first edition is his own copy; the edition line says what moved |

**CLAIMS**, each dressed as THEOREM (a check that can fail says so), GESTURE (argued from cited sources) or
VIBE (felt, kept, not argued)

- THEOREM: the urgent pile has read 39 on every dated day from 08-30 to 09-26 (P2; rebuild command in C).
- THEOREM: all five fiction-cast sheets were rolled with `--traits 4` (P1).
- THEOREM: under mawk 1.3.4 the eclipse script's seeded pick is not reproducible; under gawk it is (P5).
- THEOREM: `bin/cl1ix` and `bin/cl2ft` apply 4, 9 and 17 as classification thresholds over frequency counts
  in five lines (P4; two readers agree on all five; quoted lines). Two of them are right of the grain.
- THEOREM: of all 235 lines that name the house numbers (Z/ excluded), two blind readers agree on 217, and
  both flag exactly one line as a count stopped or judged at a house number: the stop rule's copy in a
  comparison note (Movement X; the recipe replays the inventory).
- THEOREM: the recipe's eleven checks pass on the tree, and four of them go red under two planted faults
  (the recipe's run record).
- GESTURE: "should count" can be read as "a count is owed" (Movement III; C8, C12).
- GESTURE: the three questions separate closure, detent, stand-in and quota (Movement IV).
- GESTURE: a house number on a byproduct count has to bring a unit along, and the unit is where the ambiguity
  grows (Movement VII; one case, since dissolved by his ruling).
- GESTURE: a voice changes what a reader attends to more than what it concludes (Movement VI; one run per arm,
  so this is data).
- GESTURE: the stop for an unknown number is named by the ring it must serve: GRAIN, GREAT or GRAND
  (Movement X; four readers agree; his units are withheld, so this is a reading of his names, not his rule).
- VIBE: the dial may have pulled on the first edition's nine movements (Movement IX). The second has ten.

**CONSTANTS**

| value | where | chosen or derived | why |
|---|---|---|---|
| ~~17~~ → 235 | P3 sample size | first chosen (house number, stand-in); **retracted** | the population was already counted; stopping at 17 was the antipattern (Movement X). The full count replaced it |
| 20260926 | seeds for P3 and the eclipse draw | chosen (today's date) | a name for a draw, declared before drawing |
| 3 | eclipse `--pick` | the script's default | not a house number; left at the default |
| 5 · 3 | readers per round | derived | round 1: four spell-rack voices plus the control; round 2: two promoted, plus the pair model alone |
| 4 | readers in the third take | GRAIN, his default for a round of sub-agents | "GRAIN: (default)4" (his hand-edit, 2026-09-04) |
| 2 | readers for the full P3 count | derived | the least that makes a receipt ("a count two readers agree on") |
| every whole number | Fork B's sweep points | derived | the first edition proposed only 2, 4, 9, 17, 26; the third take (BASELINE) caught that sweeping only at the stops is reaching for them while counting. `mn-sweep` walks the whole curve and names the stops on it |
| 21% | P3 upper bound | derived (rule of three, 3/14) | 0 of 14 real uses |
| 10 | this essay's movement count | counted afterwards | was 9 in the first edition; see Movement IX |

**HOLDS** (deliberately left open, and said out loud)

- The history of C20 (`--ceremony` picks after the WARN) was not read. It would falsify the three questions.
- `bin/affinity.sh:18`: the two P4 readers disagree about it (threshold, or declared-crude display band).
- The palace break-out at 4/9/17 references: the two full-count readers disagree (threshold, or size); the
  essay leans to "the naming arity at work" and leaves it to him.
- I176, the stop rule's copy in `h/spells/2026-09-26/COMPARE-chatlog-intake-vs-ingest-writing.md`, belongs to the
  session that wrote it and is not edited here.
- Fork B's sweep, until he answers.
- Whether this essay goes to `pub/papers/`. That is his word, not mine. It stays in the lab until he says.

## Appendix C. Replay: every number above, from the tree root (`<F>:\claude\c4`)

*The recipe supersedes this appendix.* `magic-number-theory/RECIPE-2026-09-26-magic-number-theory.org` unpacks into
`mn-probes`, which runs all of the following with Z/ excluded and prints each result in words beside the
value seen on 2026-09-26. The commands below are the first edition's, kept as the record. They are corrected
in one place: the P3 search now excludes Z/.

```sh
# P1 — trait counts of the fiction cast
grep -rn -- '--traits [0-9]*' h/cast

# P2 — the urgent pile, rebuilt per dated day from the append-only bank (last state wins)
python3 - <<'EOF'
rows=[l.rstrip('\n').split('\t') for l in open('evidence/question-bank-iTNH.tsv',encoding='utf-8')
      if l.strip() and not l.startswith('#')]
rows=[r for r in rows if len(r)>2 and r[1][:4]=='2026']
for d in sorted(set(r[1] for r in rows)):
    last={}
    for r in rows:
        if r[1]<=d: last[r[0]]=r[2]
    print(d, sum(1 for v in last.values() if v=='URGENT'))
EOF
sh bin/c4prime | grep 'BLOCKED ON HIM'        # second reader: "showing 9 of 39 urgent"

# P3 — the inventory and the seeded draw
grep -rIn -E 'from the dial|house number|house.s own number|dial stop|stop 9|at stop|4/9/17|4, 9, 17|4 / 9 / 17|4 · 9 · 17|4, 9 and 17|4, 9, or 17|4 9 17' \
  --exclude-dir=.git --exclude-dir=tmp --exclude-dir=dist --exclude-dir=archive --exclude-dir=.arc --exclude-dir=Z . \
  | grep -v -E '^\./h/(HYPOTHESIS|PROJ-2026-09-07)' | cut -c1-230 > /tmp/hn.txt
python3 - <<'EOF'
import random,re
keep=[];seen=set()
for l in open('/tmp/hn.txt',encoding='utf-8',errors='replace'):
    p,n,t=l.rstrip('\n').split(':',2); k=re.sub(r'\s+',' ',t.strip())[:120]
    if k not in seen: seen.add(k); keep.append((p,n,t.strip()))
random.seed(20260926); print(len(keep))
for p,n,t in sorted(random.sample(keep,17)): print(f'{p}:{n}')
EOF

# P4 — bare comparisons against 4, 9, 17 in code
grep -rIn -E '(-gt|-ge|-lt|-le|-eq|>=|<=|[^-=]>|[^<]<|==) *(4|9|17)\b([^.0-9]|$)' bin h/*.sh h/*.py lib f \
  | grep -v -E '2>|>&|>/dev|<<'

# P5 — the eclipse pick (run twice; compare), then again with gawk first on PATH
sh <eclipse-pass>/scripts/eclipse_pass.sh --target magic-number-theory \
   --from <f>:/claude/projects/pmo/projects.tsv --pick 3 --seed 20260926
```

Expected, as of 2026-09-26:

- **P1:** five lines, all `--traits 4`.
- **P2:** the last line is `2026-09-26 39`.
- **P3:** first edition 325 lines, 236 of them distinct (Z/ lines included, in error); with Z/ excluded, 323
  and 235. The first edition's 17-line draw is in `magic-number-theory/arms-2026-09-26/DRAW-P3.md`.
- **P4:** 95 lines.
- **P5:** under gawk, bryant, dragaera, dev.ghostwheel.chat. Under mawk the pick changes from run to run.

## Appendix D. Sources

**In the tree.** Each of these is cited where it is used above. Paths are relative to `c4/` unless marked.

- `facts/magic-numbers-is-itself-a-seam`
- `t/TAXONOMY/seam/magic-number/{literal,budget}`
- `facts/the-dial-and-cavepeople-arithmetic`
- `facts/discount-c4-urgent-shouting`
- `evidence/question-bank-iTNH.tsv` (Q73)
- `evidence/gauges-we-lack.tsv`
- `bin/c4prime`
- `decks/word-load-bearing.deck.md`
- `h/PAPER-2026-08-10-invent-computing-procedure-v2.md`
- `h/traits/PERSONA-TRAITS-GRID.md`
- `h/cast/*.md`
- `h/ms1dg`
- `h/nine.sh`
- `bin/ot3he`
- `bin/confirm-gauge`
- `bin/intake`
- `bin/cm2nt`
- `bin/cl1ix`
- `derive/emacs-recipe/RECIPE.org`
- `q/words/README.md`
- `q/build-shapes-2026-09-17/SURVEY.md`
- `h/MODEL-2026-09-26-math-writing.md`
- `spells/INDEX.md`
- `spells/onward-turn/SPELL.md`
- `spells/ingest-writing/chapters/15-source-chat-logs.md`
- `spells/ingest-writing/runs/2026-09-26-corwin.md`
- `h/NOTE-2026-09-10-foaf-drop-withheld.md`
- `magic-number-theory/RECIPE-2026-09-26-magic-number-theory.org` and the kit it unpacks
- `derive/emacs-recipe/RECIPE.org` (the shape, `c4check` and `unpack.sh`)
- `AS4CE0001/memory/subagent-grain-great-grand.md`, `AS4CE0001/memory/as-ce-slide.md`
- `q/retention/palace/semaphores.md`, `h/spells/2026-09-26/COMPARE-chatlog-intake-vs-ingest-writing.md`
- `h/persona/CHARACTER-2026-09-06-mentat.md`
- `h/persona/CHARACTER-2026-09-05-shopgarden.md`
- `h/persona/PERSONA-gw7.md`
- `<pub>/method/h/PENUMBRA.md`
- `modelthisbook/CORWIN.md`
- `modelthisbook/BRYANT_CORWIN_C4.md`
- `<H>:/pub/papers/red-first-then-counted/`
- `<H>:/pub/papers/counting-what-can-be-counted/`
- `<H>:/pub/persona/README.org`
- `pmo/projects.tsv`
- Project memory: the notes on the drift budget (2026-08-29), the house-number rule (2026-09-10) and
  sign-worth (2026-08-29).

**Outside.** The three marked † were checked against their publishers' listings on 2026-09-26. The others are
cited from knowledge and were not fetched again.

- Campbell, D. T. "Assessing the impact of planned social change." *Evaluation and Program Planning* 2(1),
  1979, 67–90 (first circulated 1976). †
- Cowan, N. "The magical number 4 in short-term memory." *Behavioral and Brain Sciences* 24(1), 2001, 87–114.
- Espeland, W. N., and Sauder, M. "Rankings and Reactivity: How Public Measures Recreate Social Worlds."
  *American Journal of Sociology* 113(1), 2007, 1–40. †
- Goodhart, C. A. E. "Problems of Monetary Management: The U.K. Experience." *Papers in Monetary Economics*,
  Reserve Bank of Australia, 1975.
- Miller, G. A. "The Magical Number Seven, Plus or Minus Two." *Psychological Review* 63(2), 1956, 81–97.
- Strathern, M. "'Improving ratings': audit in the British University system." *European Review* 5(3), 1997,
  305–321. †

---
*Status: DRAFT, unsigned, lab only (`h/`). Written by Mentat for Corwin, 2026-09-26. The readings quoted above
are model output and are labelled as such. They are kept whole in `magic-number-theory/arms-2026-09-26/`. The lab partners give
their own credit strings. The pair model was used as a scaffold, not as anyone's words.*

---

**RULING, Fork A (the sentence), 2026-09-27.** Corwin, in chat, while reading this edition: "Let's go with
Mentat+BCC4 on their Coda point." So the thesis line of any later edition is option 3, the Mentat×BCC4
wording, verbatim:

> A house number belongs where a count is owed, taken now or disclosed as a stand-in until it can be taken.
> Laid over a count the work merely gives off, it presses: over a person's conduct it becomes a quota; over a
> made thing's incidental tally it becomes numerology.

His original sentence stays at the head of this edition as the thesis it argued, unchanged. This note is
appended at the foot so that no line number cited elsewhere moves (`c/counts` cites :975–:978). In the same
message he released the counts under `Z/chatlog/.private/` for Fork B ("The counts against .private are fine
to do"): the vocab half is at `spells/ingest-writing/runs/2026-09-27-sweep-vocab-threshold.md`, and the turns
half follows beside it.
