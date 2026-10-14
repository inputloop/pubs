# LENS 2026-09-27 — the edrx boards, the deeper round (forks B1, B2, B3, B5)

*Completes `h/LENS-2026-08-30-edrx-mathforward-boards.md` (its "backs", `:254-292`). That file is not
edited. B4 (his own outsider standing) is his and is left alone.*

---

## The keeper's hypothesis, verbatim, then the ask and the method

**The hypothesis.** The thesis the boards test, in his words as the base LENS pinned them:
*"ten thousand governances do not compose into a governance … governance exists only where someone
pinned a boundary"* (`h/LENS-2026-08-30-thesis-formal-back.md:46-47`), and *"the unit of design must be
the TRANSITION, not the component … govern the moves between them"* (`:57`). When he ruled on B3 he
added: *"messy floors are lies absent temporal subjectivity"* (`h/LENS-2026-08-30-edrx-mathforward-boards.md:260`).

**The ask**, 2026-09-27: *"In regard the various places where we have written that we await my
approval, for example deeper rounds of analysis, please proceed."* (`q/2026-09-27-execute-brief/PROMPT.md:11`).

**What is already settled.** The boards file records rulings on four of the five forks, landed the same
day it was written (`LENS-2026-08-30…:256-266`): **B1 → RECOVER, B3 → ACCEPT, B4 → PACKAGING, B5 →
BOLDER, B2 → OPEN.** So this round does not reopen his rulings. For each ruled fork it asks three
things: what new evidence says about the ruling, what the ruling now obliges us to do, and what would
show the ruling needs revisiting. B2 is still open, so it gets a full analysis and a recommendation.

**Method**, per fork, in the boards' own shape: **SENSE · CANON · PROBE (Observed) · READING (Judged) ·
STATUS**, then the strongest case for and against, a recommendation, and a falsifier.

**Where the paper is.** The published paper is *Motive Inversion — governance does not compose*, at
`pub/papers/motive-inversion/README.org` on his `<H>:` drive (`onward-readiness/review-2026-09-26-onward/PUB-DESIGN-POINTS.md:99-100`;
`MEMORY.md:2941`). It is **not in this corpus**. What I know of its text comes from the eight design
points that review quotes from it (`PUB-DESIGN-POINTS.md:102-110`). This file therefore lands in `h/`
beside the boards LENS, not in the paper's home.

**Care.** Everything about edrx (Eduardo Ochs) comes from his published, public work, as in the
original. There is no chat content and no modelling of him as a person. The bank's open limit on how he
may be written about is honoured (`evidence/question-bank-iTNH.tsv:512`, Q410). He is credited in the
paper (`h/MODEL-2026-09-26-chat-ideation-layers.md:104`), and every idea of his used here is cited to
his own work.

---

## Currency pulled this pass (so this LENS stands on its own)

- **WCAG 2.2** adds nine success criteria. Three are justified in W3C's own words by cognitive
  disability: 3.3.7 Redundant Entry (A) — *"Some people with cognitive disabilities have difficulty
  remembering what they entered before"*; and 3.3.8 / 3.3.9 Accessible Authentication (AA / AAA) —
  *"Some people with cognitive disabilities cannot solve puzzles, memorize a username and password, or
  retype one-time passcodes."* W3C, "What's New in WCAG 2.2",
  <https://www.w3.org/WAI/standards-guidelines/wcag/new-in-22/>.
- **The COGA note** (W3C, *Making Content Usable for People with Cognitive and Learning Disabilities*,
  <https://www.w3.org/TR/coga-usable/>) is a Working Group Note: *"Following this guidance is not
  required for conformance to WCAG."* It exists for barriers *"that could not be included in the
  normative WCAG 2.x specification."*
- **WCAG 3.0** is a Working Draft dated 10 September 2026 (<https://www.w3.org/TR/wcag-3.0/>). It
  evaluates with *"requirements and assertions"*. An assertion is a recorded claim about process, for
  example that usability testing with disabled users was done. It carries a cognitive guideline,
  *"Avoid exclusionary cognitive tasks."*
- **Reid.** The work the boards cite at SSRN 4262991 is **"The Curb-Cut Effect and the Perils of
  Accessibility without Disability"** (Blake E. Reid, in *Feminist Cyberlaw*, University of California
  Press, 2024; <https://luminosoa.org/chapters/e/10.1525/luminos.190.i>). **"Internet Architecture and
  Disability"** is a different Reid paper (Indiana Law Journal 95(2); SSRN 3338589). The boards attach
  the second title to the first link (`LENS-2026-08-30…:104`). This is a citation fix to carry. Reid's
  thesis, p. 107: *"The Effect's repeated invocation over the past several decades has resulted in
  erasure, to varying extents, of disabled people from innovation and disability law and policy."*
  p. 108 names the mechanism: *"unjustly relegating the interests of disabled people to the
  often-narrow bounds of this convergence."*
- **Bourbaki.** The boards quote *"no discussion, no image, no context"* from a CNRS article
  (`LENS-2026-08-30…:206`). My fetch of that page did not find the phrase. I have not verified it; it
  may be elsewhere, or the fetch may have missed it. The same page does say the group *"decided to
  adopt an axiomatic presentation for their treatise, clearly formulating the basic rules"*
  (<https://news.cnrs.fr/articles/bourbaki-and-the-foundations-of-modern-mathematics>). The style was a
  deliberate choice they stated openly. B5 depends on this.
- **The compose toy, solved exactly.** `h/EXPERIMENT-2026-09-27-compose-closed-form.awk` is new and lands
  beside this file. It is written in awk, a second language separate from the Python it checks. Its
  hypothesis was written into its header before running. Receipt (`awk -f …`, gawk 5.2.1 and mawk agree):

  ```
  reach pairs with no overlap: 2 of 16  -> P(reach survives) = 0.8750
  k=5  motives  P(agree)=0.2000  P(compose)=0.1750  expected in N=20000: 3500   <- the toy as run
  k=4  motives  P(agree)=0.2500  P(compose)=0.2188  expected in N=20000: 4375   (house number, chosen)
  k=9  motives  P(agree)=0.1111  P(compose)=0.0972  expected in N=20000: 1944   (house number, chosen)
  k=17 motives  P(agree)=0.0588  P(compose)=0.0515  expected in N=20000: 1029   (house number, chosen)
  recorded run: 3491 composed; exact expectation 3500; |diff| = 9.0 = 0.17 standard deviations
  ```
  sha256 of the awk file: `0a00a9a151d2a72a…`. The original Python still reproduces its recorded
  receipt (`python3 h/EXPERIMENT-2026-08-30-compose.py`, sha256 `0acf01e8b89737c8…`, 3491 / 3997 / 506).
  The motive counts 4, 9 and 17 are the house set, chosen as stand-ins. They are not measurements.

---

## Fork B1 — signage: does it recover the meaning a testable surface sheds, or only relocate it? *(ruled RECOVER)*

**SENSE.** WCAG kept its testable layer crisp by shedding cognitive-accessibility content into
non-normative guidance. Does that content come back?

**CANON (his ruling, as the boards record it, not his verbatim).** *"Signage recovers meaning; shed signals recombine while away and return
enriched"* — a round-trip, not a one-way loss (`LENS-2026-08-30…:257-258`).

**PROBE (Observed).** Both things are happening at once. *Recovery:* WCAG 2.2 moved three
cognitive-motivated needs into normative, testable criteria (above). *Relocation:* the COGA note still
exists for what *"could not be included in the normative"* standard. *A third route:* the WCAG 3 draft
adds **assertions**, which carry what cannot be tested as content in the form of a recorded, attributable
claim about process.

**READING (Judged).** Recovery is real, partial and slow, and it returns in a changed form. Some meaning
comes back as a new testable criterion. Some comes back as an attested assertion, a claim that now
carries *who* made it. That second route fits his "return enriched" closely: the meaning returns with a
signer attached. What has not yet returned stays as signage, and there a person remains load-bearing.
That is the thesis's P0 (*"Governance-at-the-seam is actuated by a human reading TENSION"*,
`LENS-2026-08-30-thesis-formal-back.md:25-26`), so it does not contradict the ruling.

**Strongest case for RECOVER.** The direction of travel is observed and dated. 2.0 left cognitive needs
out, 2.2 brought three in, and 3.0 adds a new instrument (assertions) for the rest. That is the
"way-station" reading the boards' STATUS said would confirm (`LENS-2026-08-30…:84-85`).

**Strongest case for RELOCATE.** What came back may be only what was crisp all along. Puzzles,
passwords and re-typed entries are easy to test. Plain language and cognitive load are still in the
note. The strongest version, 3.3.9 Enhanced, sits at AAA, a level few conform to. On this reading
"recovery" is selection: the testable part returns, and the blur stays where it was.

**Recommendation.** Keep RECOVER. When the paper states it, say how: *signage recovers over time, in
part, by two routes (a new testable criterion, or an attested assertion); what has not yet returned is
carried as signage, and a person stays load-bearing there.* This joins B1 to P0 instead of setting them
against each other. [DOMAIN] WCAG 3 is a draft, so the assertion route is not yet normative.

**Falsifier.** WCAG 3 reaches Recommendation with every cognitive requirement informative only, neither
testable nor backed by an assertion. Or assertions are dropped from the final text. Either would mean
the return is not happening, and the ruling would need revisiting.

---

## Fork B2 — absorb the curb-cut warning into the möbius, or cite it beside the floor? *(OPEN — his to rule)*

**SENSE.** The möbius floor as the boards state it: *"choose where you spend (private effort), never
gate who benefits (public bridge); one surface, no privileged side"* (`LENS-2026-08-30…:92-93`). Reid
shows that when spillover to the majority becomes the reason for access, the people access was for get
erased. Does the floor need to say so itself?

**PROBE (Observed).** Reid's mechanism is *relegation to "the often-narrow bounds of this
convergence"* (p. 108). Disabled people's interests get served only where they coincide with everyone
else's.

**READING (Judged). This is the deeper finding.** The floor's two working clauses **do not forbid
Reid's failure.** No one is *gated* from any benefit. The harm happens inside the *first* clause, the
freedom to choose where to spend. Spending is steered toward the convergence, and the needs outside it
simply never get funded. Only the topology line ("no privileged side") catches it, and a topology line
cannot be checked the way a clause about acts can. So "cite beside" leaves a system Reid shows to be
harmful passing the floor's checkable clauses. That makes absorbing the warning load-bearing, not
decoration.

**Strongest case against absorbing (cite beside).** The wording the boards proposed was *"and never let
who-benefits become the reason"* (`:276`). That is a clause about **motive**, and the thesis itself holds
that motive is exactly what does not show at the base (P1/P2). A floor clause nobody can check is
signage with no tumbler. The boards' own Board 1 makes the point with the Plain Writing Act, which was
*"mandated … with **no** testable criterion … hence unenforceable"* (`:71-73`). Keeping the floor to
observable acts, and citing Reid beside it, keeps the floor honest.

**The option that answers both.** Absorb the warning in an **observable** form. Record the reason
instead of policing the motive:

> *Choose where you spend; never gate who benefits; **and record whose need each spend answers** — when
> the only recorded answer is who else benefits, the floor has turned.*

This is checkable: a record either names the people whose need the spend answers, or it does not. It is
the same move WCAG 3 makes with assertions. It also matches his own ring rule for the org case, where
the org *"needs to show how the wires are working"* (`q/2026-09-27-execute-brief/PROMPT.md:19`).

**Recommendation.** Absorb, in the observable form (option A in decisions.json). [MINE] The möbius
itself lives in `facts/the-mobius-sketch-org-person-and-no-bias-to-controls`, which is not in this
snapshot. I have not read its current wording, and his fact may already carry something like this clause.

**Falsifier.** A spend with a recorded need-holder that still produced Reid's harm. If that happens,
recording is ceremony and does not protect the floor. Or a spillover-justified spend with no recorded
need-holder that served the core group *better*. Either one sends the warning back to "cite beside".

---

## Fork B3 — governance composes exactly on the agreement-locus *(ruled ACCEPT)*

**SENSE.** The toy said governance composes exactly where the motives agree at the shared seam and the
reach survives. He accepted this: the locus is not empty, and it fills *over time* as people bring
tension into agreement (`LENS-2026-08-30…:259-261`).

**PROBE (Observed).**
1. The identity *governance-composed = motives-agree − reach-tears* holds **by construction**.
   `gov_compose()` tests motive first and reach second (`h/EXPERIMENT-2026-08-30-compose.py:37-41`), so
   no draw could ever break it.
2. The rates are **fixed by the toy's parameters**. P(agree) = 1/5 because five motives are drawn
   uniformly (`:45`, `:51-54`). P(compose) = 1/5 × 14/16 = 0.175 because 2 of the 16 reach pairs are
   disjoint (`:46`). The recorded 3491 is 0.17 standard deviations from the exact 3500. With 4, 9 or 17
   motives (chosen stand-ins) the same toy would "measure" 0.219, 0.097 or 0.051.
3. The toy is **atemporal**. Every draw is independent, and nobody tensions anything. It cannot speak to
   "over time".
4. The number has travelled as a measurement. `q/universes/microscope-2026-09-17-four-under-one-lens.md:356-357`:
   *"measured in that experiment at **0.175 as an atemporal snapshot**"*. His ruling on measures:
   *"each measure must be backed SEMANTICALLY -- it must be INFORMATION, not purely volumetric"*
   (`evidence/question-bank-iTNH.tsv:657`, Q184 RULED). What 0.175 actually carries is the toy's motive
   count.

**READING (Judged).** The refinement stands. As a **definition** it is tight: a governance glues across a
seam when its sections agree on the overlap and the reach survives. That is the ordinary gluing
condition, and it turns a slogan into a condition you can check at each seam. What the toy gives it is
a **drawing**, not **evidence**. The claim his ruling actually makes, that the locus is non-empty at
real seams and fills over time, has not been tested anywhere I can find.

**Strongest case for (as ruled).** It is the deck's own bet, *"transitions COMPOSE where components'
governances do not"* (`decks/seam-thesis.deck.md:68`). It has already travelled into another published
paper as its T6, *"governance composes only where 'a person reading tension' places the pin"*
(`PUB-DESIGN-POINTS.md:92`). And the paper's own design points already carry the mechanism: *"the pin
must be re-placed at every seam"* (MI1) and a person as the actuator (MI2) (`:104-105`).

**Strongest case against.** As a definition it is close to a tautology: governance composes where the
governances agree. A reader may fairly ask what it predicts. A second tension: the paper's **title**,
*"governance does not compose"*, now states the special case (an empty locus) as if it were the rule.

**Recommendation.** Keep ACCEPT. Relabel the experiment as an **illustration of the definition**, not a
measurement, and stop citing 0.175 as a measured rate. [DOMAIN] The microscope file that does so was
written by another session, so this is a note for it, not an edit. The real test of "fills over time"
has to be run on real seams: take recorded two-party disagreements in the tree and count how many later
reached a ruling both parties hold. At least one seam in the tree has a recorded agreement of this kind:
the two-party governance draft signed by Corwin and Bryant over one digest (per the project
instructions; that file is not in this snapshot and was not re-verified here). Whether to change the
paper's title or add a line is his decision (decisions.json, D3).

**Falsifier.** A real seam where both parties recorded agreement and the composed governance still
failed. That would mean agreement is not sufficient and the definition is missing a term. Or: across a
real stretch of the tree, no recorded disagreement ever reaches a shared ruling. That would mean "fills
over time" is not borne out.

---

## Fork B5 — collapse the two mechanisms into one adversary *(ruled BOLDER)*

**SENSE.** Board 5 found that the adversary splits in two. Mathematics and reproducibility *hide*
structure; KPIs and benchmarks make a *narrow proxy* explicit. His ruling, as the boards record it: try the bolder unification,
*"The one adversary is an unrecorded election (two faces: omission vs substitution)"*
(`LENS-2026-08-30…:264-265`). That ruling makes the attempt owed work. Here it is.

**PROBE (Observed): the unification against the boards' own rows.**

| row (`LENS-2026-08-30…:205-209`) | was the election recorded? | did exclusion persist? |
|---|---|---|
| Mathematics (Bourbaki) | **Yes.** CNRS: they *"decided to adopt an axiomatic presentation … clearly formulating the basic rules"* | yes, per edrx's missing-diagrams charge |
| Business (KPI/OKR) | **Yes.** A KPI is a written-down choice of what counts | yes (Goodhart, Muller) |
| Engineering (reproducibility) | **No.** *"unable to tell what the authors did"* | yes |
| Gov / social science (legibility) | Partly. The indicator is written down; the local knowledge it erases is not | yes |
| Humanities | Recorded, in its own vocabulary | only where the vocabulary acts as a gate |

**READING (Judged).** **"Unrecorded" fails on the two cleanest rows.** Bourbaki's election and a KPI's
election are both on the record, and the exclusion persists anyway. What the five rows share is
narrower and sharper. **The election may be recorded, but not where, or in a form, that the people it
leaves out can reach and contest.** "Unrecorded" is the special case where the record does not exist.
The refined unification:

> ***The one adversary is an election about what counts that the people it leaves out cannot reach to
> contest.*** *Omission hides the election; substitution buries it in a proxy; both put it out of reach.*

This version does not replace his ruling; it carries it out. It also ties the thesis-of-theses back to
Board 1 (access is the precondition for *testing*; here, for *contesting*) and to B2 (the absorbed
clause is exactly "put the election where the excluded can reach it"). And it absorbs the humanities
case the way his ruling said it should: theory vocabulary is a recorded election that outsiders cannot
reach.

**Strongest case against (the safer "two rhyming mechanisms").** An adversary this general may be
unfalsifiable. Every orthodoxy leaves someone unable to contest something. Board 5's devastator, the
case where *"the explicit/story-first move itself becomes the excluding orthodoxy"* (`:228-229`), would
simply be absorbed as one more unreachable election, and a thesis that absorbs its own devastator by
definition cannot lose. "Two rhyming mechanisms" claims less, and what it claims is what the evidence
shows directly.

**The falsifier that lets the bold version lose.** Take a field where elections are recorded, reachable
**and** open to outside contest by design, and check whether outsiders are still excluded to the same
degree. Free software is that field. There the source is the record, and the four freedoms make it
reachable and changeable (<https://www.gnu.org/philosophy/free-sw.html>). If outsider exclusion in
free-software projects matches that in closed ones, reachability is not the lever, and the unification
fails *at home*. That test is concrete, it can go against us, and it matters to his mission whichever
way it comes out.

**Recommendation.** Carry out the ruling in the refined form: unreachable, not unrecorded. Keep "two
rhyming mechanisms" as the named fallback in the paper. Choosing the exact thesis-of-theses sentence is
his (decisions.json, D2).

---

## B4 — left alone

Ruled PACKAGING (`LENS-2026-08-30…:262-263`). It concerns his own standing, and it stays his.

---

## What this round changes

| fork | his ruling | the deeper round finds | what it asks of him |
|---|---|---|---|
| B1 | RECOVER | recovery is observed, partial, and comes by two routes (a testable criterion, or an attested assertion) | nothing new; wording offered for the paper |
| B2 | open | the floor's checkable clauses do not forbid Reid's failure; absorb it as "record whose need a spend answers" | **rule B2** (D1) |
| B3 | ACCEPT | the toy illustrates and does not measure; 0.175 echoes a parameter; "over time" is untested | **the paper's title / one line** (D3) |
| B5 | BOLDER | "unrecorded" fails on Bourbaki and KPIs; "unreachable to those it leaves out" holds, with a falsifier that can lose at home | **pick the thesis-of-theses sentence** (D2) |
| — | — | two citation defects in the boards (Reid title; an unverified CNRS quote) | carried in D3 |

## Falsifiers for this round as a whole

- If the paper on his disk already states the refinement in its body, or already carries a corrected
  Reid citation, D3 shrinks to nothing. I could not read the paper.
- If the CNRS quote is on that page after all, the Bourbaki citation defect is withdrawn. B5 does not
  depend on it: the "decided to adopt" line is enough.

---

LENS · the edrx boards, deeper round · 2026-09-27
a  my view: his rulings survive new evidence, and each one comes back sharper — B1 by two routes, B3 as a definition that still owes a real test, B5 as "unreachable" rather than "unrecorded"; B2 should be absorbed in a form someone can check. / b  the view I ascribe Corwin: he asked for the deeper round and wants it to move the paper, not to re-argue what he already ruled. / c  their pull on mine: it kept me from reopening RECOVER, ACCEPT and BOLDER and turned the round toward what those rulings now oblige. / d  my pull on theirs: it asks him to let one published number (0.175) stop being called a measurement, and to let one word in his B5 ruling change.
persona / inverse: a careful outside mathematician, reading as edrx's published method would (draw the missing diagram, find the smallest model), says "the toy is a picture of your definition; now show me a real seam" / the inverse, a reader who distrusts all formalisation, finds something new: the strongest results this round came from ordinary records (a W3C changelog, a book chapter, a published manifesto), not from the toy, so the paper can lean less on the model and more on those.
principles reframe: 1. Universalism: the B2 clause keeps the floor from serving only the people whose needs happen to match the majority's. 2. The four freedoms are the B5 test case: if reachable, changeable elections do not reduce exclusion, the thesis has to give way, and saying so in advance is what makes it worth holding.

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.
