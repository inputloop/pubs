# RAD 2026-09-27 — The combined bias model

## S1 · Proposal summary

**How do we build one combined model from CORWIN.md and BRYANT.md, so a stranger can elect "our" biases instead of picking one of us?**

**The plan is his, and decided.** In his words, 2026-09-27 (`q/2026-09-27-execute-brief/PROMPT.md:22`): "Yes, we
absolutely do plan to republish BRYANT.md along with CORWIN.md and make a new combined model that others could
use in place of picking his or mine to use for their own on-ward turn (taking ghostwheel.org and customizing it
to make it their own in their shop without/before making a personal model of their own, effectively electing our
combined \"bias models\" for the build vs picking or making one)." This paper is only about *how*.

**Plain words used below.**
- *Bias model* (his term): a written file of one person's preferences, reasons and do-this rules that an AI
  loads so it leans the way that person leans. CORWIN.md and BRYANT.md are bias models.
- *Aspect*: one of the twelve headings both files are built on (six "hard": memory, tool-building,
  optimization, introspection, critique, ethical baseline; six "squishy": self, honesty, diligence,
  thoughtfulness, tempo, soul).
- *Switch*: a named choice between two settings that a person can flip, each setting quoting its author.
- *Ring*: the set of people a rule reaches: one operator, a team, or an org that serves outsiders
  (`writing/rings/PAPER-2026-09-27-every-rule-carries-its-ring.md:106`).
- *Overlay*: a whole personal model loaded on top of a thin shared base.
- *Claims check*: a small script that fails when a file still claims something its sources no longer support
  (`writing/what-a-member-keeps/ESSAY-2026-09-27-what-a-member-keeps.md:311-340`).

**The four options on the same rows.** Counts come from the dry run in S2 (on the seat copies; see the
version warning below the table).

| | **A · Union with provenance** | **B · Agreed floor + switches** | **C · Layered: thin core + overlays** | **D · A fresh starter model** |
|---|---|---|---|---|
| What it is | All twelve aspects, each showing Corwin's reading and Bryant's reading side by side, each quoted and cited. The user elects per aspect. | Where the two agree, that is the default ("the floor"). Where they differ, a named switch with both settings in the author's own words. Where only one has spoken, an offer marked whose it is. Both originals republished beside it. | A short core made only of what both share; each person's whole model is an optional layer on top. | New plain text written for strangers, in one voice, citing both files as sources. (The pair model `BRYANT_CORWIN_C4.md` already exists in this shape; S2.) |
| What a stranger gets on day one | A 12-row, two-column table and two long files behind it. Nothing is set until they choose. | One page that works as-is: the floor on, every switch showing both settings and neither imposed until the two authors set a default. | A core that does little on its own (2 strict / 6 generous agreed aspects), then a choice of overlay. | One page that works as-is, in one voice. |
| How much they must read | Every row, both sides: the aspect sections alone are 560 + 333 words (counted: `sed -n 42,102p CORWIN.md \| wc -w`; `sed -n 27,58p BRYANT.md \| wc -w`), and the rows point into 5,110 + 811 words of whole files. | The page. The originals only if they want the "why". | The core, then a whole overlay (5,110 or 811+ words) to get any lean at all. | The page. |
| How disagreement is shown | On every row, whether they differ or not. | Only where they differ, as a switch, both sides quoted. | Hidden: it lives inside the overlays and shows only if you compare them. | Smoothed into one voice unless the writer keeps it on purpose. |
| Fidelity to each author | Highest: their own words, uncut. | High: their own words, cut to the do-this clause, each line cited to file:line. | Full inside each overlay; the core is nobody's voice. | Lowest: a third voice speaking about both. |
| Consent burden on Bryant | Highest: every aspect of his, quoted beside Corwin's, needs his yes. | Medium: one yes on the switch list (his lines as quoted) and on the floor he is named in. | Lowest if his cleared r2 model is the overlay unchanged; one yes on the core. | Low to read, but high in kind: he is named as a source of a voice that is not his. |
| Maintenance when either model changes | Re-quote every row; the drift gauge counts stale rows. | The same gauge, only over the floor and switch lines; a changed source line turns its row STALE, never silently rewritten. | Overlays update themselves (they are the originals); only the core needs re-checking. | Nothing flags when a source changes; it drifts silently unless someone re-derives it. |
| Plugs into GHOSTWHEEL.org and the onward turn | As the "contributing persona" (`GHOSTWHEEL.org:27-28`), but the onward turn's twelve-item ASPECTS list (`spells/onward-turn/chapters/07-persona-closing.md:3`) gets two items per aspect. | As the contributing persona; its twelve rows map one-to-one onto the ASPECTS list; switch positions become part of the build's stated terms. | The core fills few ASPECTS rows; the overlay the stranger picks fills the rest. | As the contributing persona; fills the ASPECTS list in one voice. |
| What the two-readers evidence predicts | Reasons double, decisions unchanged; every reason traceable. | Switches change the *reasons* an AI gives, traceably, and not its decisions; so they are honest as "reasons you elect", not as outcome dials. | The core behaves like a cold run (little to move); an overlay behaves like one person, i.e. picking. | A voice with no person behind it; the run where sessions had to invent Bryant was the least stable view. |
| Falsifier | Strangers given A set most rows the same way: the choice was ceremony. | A blind reader cannot tell answers under switch setting 1 from setting 2 on a live question even by their reasons: the switches carry nothing. | Strangers who load C's core alone produce answers a blind reader separates from cold runs: the core carries more than it looks. | Both authors, shown D's page blind, each pick it as "sounds like us" over B's page. |
| **Evidence verdict** | Kept: best on fidelity, worst on day one. | **Supported** (S2), *after* the dry run is redone on Bryant's own v3.0.1-public. | Loses: it re-creates picking, which the plan exists to avoid. | **Strongest loser**, kept at full strength in S2. |

**Version warning, before anything is built.** There are three BRYANT.md files, and the dry run could read only
two. The June seed (`modelthisbook/BRYANT.md`, v0.2) is blank on all twelve aspects. The seat copy
(`book/BRYANT.md`, v1.0) calls itself "Corwin's treatment, but evidence-grounded and Bryant's to own"
(`book/BRYANT.md:3`, markup dropped). Bryant's own latest, **BRYANT.md v3.0.1-public**, arrived in his r2 drop and
is "cleared for publication by either maker, on Bryant's word of 2026-09-26"
(`spells/ingest/runs/2026-09-26-bryant.md:27`; `model.md:83`). It is not in this snapshot. The combined model
should be built on the version Bryant wrote, so the dry run below is a rehearsal of the method, not the
alignment to publish.

---

## S2 · Contextual analysis

### Superior context: what outranks the choice of option (keepers named)

These hold whichever option wins. Each names its keeper, the person whose word moves it.

1. **Consent and credit. Keepers: Bryant for his lines, Corwin for his, both for the joint file.**
   - Bryant's seat model is "Bryant's to own" and "Family-excluded by guard" (`book/BRYANT.md:3`). It tells him
     to "rename it, refill it, throw it out" (`book/BRYANT.md:17`).
   - Corwin's own consent rule: "A user must deliberately show consent to publish anything that could cast them
     in a questionable light" (`book/CORWIN.md:515-517`, markup dropped).
   - The hold: "Still held: Bryant's persona model (the consent rule)" (`MEMORY.md:3079`). Lifting it is his:
     "the hold on Bryant's persona model (MEMORY 2026-09-25) is his to lift" (`model.md:91-92`). The same
     question is fork F036 in `writing/execute-brief/tracks/forks-inventory.tsv:37`.
   - r2's clearance covers the package as sent: "anything not in this table is not cleared"
     (`spells/ingest/runs/2026-09-26-bryant.md:29`). **Judged:** a combined model that cuts, quotes and
     rearranges his lines is a new work. The licence (CC BY 4.0) allows derivatives with credit; the house
     consent rule is stricter than the licence. So Bryant's yes is needed on the combined file itself, not
     only on his model. Hence the draft note at the end.
   - "Authoring a persona is his pen" (`d/door/34-his-persona-aware.part:25`). This RAD mints no model; the
     dry run is an alignment of existing text.

2. **No merged brain. Keeper: Corwin (it is his model's rule), with Bryant.** CORWIN.md: "a FEDERATION of
   consented single-player models ... never a merged brain", and "blend the work, keep the voices distinct"
   (`book/CORWIN.md:353-356`, markup dropped). The same file leaves open "does a co-authored book want a
   co-authored persona model ... The deepest seam" (`book/CORWIN.md:425-426`). **Judged:** today's plan answers
   that seam "yes". An option that blends the two voices into one reopens the rule it answers; an option that
   keeps each line in its author's words honours it.

3. **The version question. Keeper: Bryant.** MEMORY: "Bryant may send a new BRYANT.md to be considered
   with/before the turn to ON (his note; wait for it)" (`MEMORY.md:3157`). **Observed:** it came. r2 carries
   "BRYANT.md v3.0.1-public, cleared for publication by either maker" (`model.md:90-91`). The persona shelf still
   serves the June seed ("The `bryant` model it serves is the June seed (5647 bytes)", `model.md:89-90`).
   **Judged:** there is nothing left to wait for, only a question to ask him: is v3.0.1-public the one he wants
   as his side?

4. **Where it plugs in. Keeper: Corwin.** GHOSTWHEEL.org says every build carries "*The contributing persona* --
   the character sheet(s) of whoever speaks for the build; persona ships separately, from the persona shelf"
   (`GHOSTWHEEL.org:27-28`). The onward turn closes with "ASPECTS — the twelve from the instrument's sheet"
   (`spells/onward-turn/chapters/07-persona-closing.md:3`). **Observed:** the onward-turn spell stays home as the
   lab's control arm: "the difference in wording between the two spells is the variable"
   (`spells/onward-turn/SPELL.md:110-111`), and the build-turn spell that lab partners get has no persona step
   (`grep -n -i 'persona\|aspect' spells/build-turn/SPELL.md` finds nothing). **Judged [HIS]:** a stranger's
   "own on-ward turn" needs a persona step in whatever spell they receive; putting the combined model into only
   one of the two spells adds a second difference to the control experiment.

5. **Rings. Keeper: whoever elects the model.** A rule written for one operator binds only that operator
   elsewhere; "Undeclared never widens" (`writing/rings/PAPER-2026-09-27-every-rule-carries-its-ring.md:191`).
   An org, which performs for outsiders, must show every wire that departs from the manual (same paper, §2).
   **Judged:** each author's do-this clauses are, by origin, one-operator wires. A stranger who elects them makes
   them their own. An org that elects them must publish which switch positions it runs.

6. **The persona fence. Keeper: the house (a candidate deck, blessed in chat 2026-07-28).** "Every archetype
   PUBLISHES how it is put on and taken off" (`decks/disclosed-non-heritability.deck.md:15-16`). Any option must
   say how a stranger wears it and takes it off.

### The dry run on real text (Observed)

**What was aligned.** Both seat models are built on the same twelve aspects. Verified by
`python3 dry-run/align.py book/CORWIN.md book/BRYANT.md modelthisbook/BRYANT.md dry-run/align.tsv`: 12 found in
CORWIN.md (lines 50-98), 12 in seat BRYANT.md v1.0 (lines 29-58), 12 blank template prompts in the v0.2 seed
(lines 39-52). Output: `dry-run/RUN-2026-09-27.txt`. All 40 quotes below were found verbatim (after joining
wrapped lines and dropping `*`, `**` and backticks) and none is over 20 words. A second reader in another
language (`dry-run/second-reader.sh`, POSIX sh + grep) found 35 of 40 by their first four words and named the
5 whose first words wrap across a line (`dry-run/SECOND-READER-2026-09-27.txt`).

**Two readings of each aspect.**
- *Strict* reads the file's own status. If Bryant's cell is marked "his to fill" or "his to claim", the aspect
  is ONE-SIDED, because only Corwin's side has spoken in its owner's voice.
- *Content* asks what the two lines would say if Bryant claimed his cells exactly as written. This is an upper
  bound, and a generous one (see the shared-hand caution below).

| # | Aspect | Corwin (`book/CORWIN.md`) | Bryant (`book/BRYANT.md` v1.0) | Strict | Content |
|---|---|---|---|---|---|
| H1 | Memory | "treat memory as load-bearing and portable" (:51) | "thin (his to fill)" (:29); "keep state legible and in-band" (:30) | ONE-SIDED | AGREE |
| H2 | Tool-building | "Tiny tools, scripted together, first." (:300); "name it and forge a tool/skill for the commons, not just for now" (:55-56) | "build the smallest thing that opens and works; everything in one file until proven otherwise." (:33-34) | DIFFER | DIFFER |
| H3 | Optimization | "spend depth where it changes the answer, stop where it doesn't." (:61-62) | "ship the runnable path now; gold-plate later." (:36) | DIFFER | DIFFER |
| H4 | Introspection | "let the second voice argue back; surface your own uncertainty and" (:65) | "name the shortcut you took and what you'd check with a governance voice." (:39-40) | AGREE | AGREE |
| H5 | Critique | "run a critic pass (multiple lenses) → apply a PASS / HOLD / REJECT gate" (:69-70) | "Two questions only: does it run? and can a stranger verify it?" (:41-42) | DIFFER | DIFFER |
| H6 | Ethical baseline | "these are non-negotiable; halt and raise before proceeding." (:74) | "never skip the safety pass; the door is the gate." (:46) | AGREE | AGREE |
| S1 | Self | "integrate; ask what this unites with and who it lets in." (:79-80) | "a builder/shipper with a civic vocation" (:49); "His to claim." (:50) | ONE-SIDED | DIFFER |
| S2 | Honesty | "cite sources; mark grounded vs. aspirational; never flatter." (:83) | "says plainly what a thing does. Evidence; his to claim." (:51-53) | ONE-SIDED | AGREE |
| S3 | Diligence | "resist starting a sixth fork — finish the fifth." (:88-89) | "ships single-file to done. Evidence; his to claim." (:53) | ONE-SIDED | AGREE |
| S4 | Thoughtfulness | "offer the contrasting view; be charitable; address the person, not the persona." (:93-94) | "designs for the stranger and the next person" (:54) | ONE-SIDED | DIFFER |
| S5 | Tempo | "protect the creative space; route urgency to the ledger; don't corner too fast." (:96-97) | "ship, then iterate." (:57) | ONE-SIDED | DIFFER |
| S6 | Soul | "show "with you," never claim it" (:100) | "shown not claimed; his to fill." (:58) | ONE-SIDED | AGREE |

**Counts, twelve aspects.**
- **Strict: AGREE 2 · DIFFER 3 · ONE-SIDED 7.**
- **Content (generous): AGREE 6 · DIFFER 6 · ONE-SIDED 0.**
- Against the v0.2 seed, all twelve are ONE-SIDED (blank). The seed also says, of the template: "do NOT copy
  Corwin's answers — they are his." (`modelthisbook/BRYANT.md:36`).

**Beyond the twelve** (same run, rows X1-X6):

| Row | Corwin | Bryant v1.0 | Reading |
|---|---|---|---|
| Through-line | "what could it unite with, and who does it let in?" (:39-40) | "does it open and work for someone who isn't us, today, in one file?" (:24-25) | DIFFER |
| Values | "the FSF four freedoms" (:159-160) | "software & user freedom" (:67) | AGREE |
| Naming | "invite and honor the names others choose; never flatten their vocabulary into yours." (:130-131) | "Don't normalize his terms; his region, his lexicon." (:71-72) | AGREE |
| Privacy | "family off-limits" (:73) | "family is the line" (:5) | AGREE |
| Federation | "never a merged brain." (:354) | "The federation rule holds: consented single-player model" (:82-83) | AGREE |
| A combined persona? | "does a co-authored book want a co-authored persona model" (:425-426) | silent; "this elevation deliberately stops at the door of his interior" (:82) | ONE-SIDED |

### What the dry run means (Judged)

1. **Seven of twelve of Bryant's cells are not his yet.** The squishy hexad in v1.0 is "evidence-suggested,
   his to claim". Any option that fills a combined model from those cells writes Bryant's interior for him,
   which the file itself forbids ("no invented interior", `book/BRYANT.md:5`). On v1.0, the honest combined
   floor is the **six** rows that are AGREE in the strict reading or outside the twelve (H4, H6; values,
   naming, privacy, federation). The rest waits for Bryant's own words. [HIS]
2. **The agreement is inflated by a shared hand.** The same template writer made both files, on Corwin's side.
   "shown not claimed" appears in Bryant's S6 cell, and "shown, not claimed" in Corwin's file. Read the content count (6 agree) as a ceiling, not a finding.
   [MINE] *Falsifier:* redone on Bryant's own v3.0.1-public, the content AGREE count stays at 6 or rises; then
   the shared hand did not manufacture the agreement.
3. **The differences are real, and several are differences of scope, not opposition.** Corwin's critic pass is
   for "substantial work" (`book/CORWIN.md:69`); Bryant's two questions are for everything. Corwin's own seam
   list already says "one audited tool beats the daemon-zoo" when seams are the risk (`book/CORWIN.md:319-320`),
   which is Bryant's one-file instinct in Corwin's words. So a switch can often offer "both, in order" as one
   of its settings. That is still the authors' call, not mine. [MINE]
4. **The through-line difference is the gift.** "what could it unite with, and who does it let in?" against
   "does it open and work for someone who isn't us, today, in one file?" A stranger's shop needs both
   questions. A combined model that keeps both as named voices gives the stranger something neither file gives
   alone.

### The two-readers evidence, applied (Judged, from Observed)

The doubled-nine experiment found: "The persona changed the *reasons* given, not the *decision*"
(`writing/two-readers/EXPERIMENT-2026-09-27-doubled-nine.md:31`), and the view with the least evidence was the
least stable: "Every run *invented* a Bryant, and each one invented a different Bryant" (same file, :164-166).
It also found that "The readable ninth model is what made the delta readable" (:170).

- **So the combined model's value is readable reasons, not better decisions.** Options that keep each reason
  traceable to a named author's line (A, B) deliver that. D's single voice cannot say whose reason a reason is.
- **Anything about Bryant that Bryant did not write will be the unstable part.** That argues for using only his
  own claimed lines (v3.0.1-public) and for leaving unclaimed cells empty and labelled.
- **Switches should not be sold as outcome controls.** Label them "which reasons you want your AI to reach
  for". *Falsifier:* a rerun kit (the same `arms/` method, four sessions per setting) shows one switch moving
  the decision 4 to 0 while reruns within a setting agree.

### Each option at its strongest, and where it breaks

**A · Union with provenance.** *Strongest case:* nothing is lost or reworded; every aspect shows both authors in
their own words; it is the purest form of "blend the work, keep the voices distinct". *Where it breaks:* the
plan says "in place of picking his or mine"; A asks the stranger to pick twelve times. On v1.0 it would also
print seven Bryant cells that are not yet his. *Falsifier:* strangers handed A leave most rows on a default
they made up; the per-aspect choice was ceremony.

**B · Agreed floor + switches.** *Strongest case:* it is the only option where a stranger can take the combined
model and go on day one, *and* every disagreement stays visible and electable in its author's words. It is the
ring paper's mechanism (default per ring plus a named switch, `writing/rings/PAPER-2026-09-27-every-rule-carries-its-ring.md` §3-4)
applied to people's biases. It matches a banked stance that the order of voices "chooses which bias, it never
removes one" (`evidence/question-bank-iTNH.tsv:635`, Q489, still open) and his ruled choice of "a toggle that
keeps the method and drops the person" as the fairer control (`evidence/question-bank-iTNH.tsv:559`, Q441,
ruled; that was an experiment design, so this is agreement by analogy). *Where it breaks:* someone chooses
which rows are "agreed", and that someone is not neutral; a floor chosen by Corwin's side about Bryant is
exactly the risk in point 1. The fix is that Bryant signs off on the floor, not only on his own lines.
*Falsifier:* the two authors, shown the floor, disagree with two or more of its rows.

**C · Layered.** *Strongest case:* lowest consent cost (his cleared model rides unchanged), and it cannot
misquote anyone because it barely quotes. *Where it breaks:* on the strict count the core has two aspects to
stand on. Everything with a lean lives in an overlay, and loading an overlay is picking his or mine, the exact
thing the plan replaces. *Falsifier:* the core alone moves answers as much as an overlay.

**D · A fresh starter (the strongest loser).** *At its strongest:* it already exists in a tested form. The pair
model `BRYANT_CORWIN_C4.md` "describes itself as 'a captured model of the system the three of us make together'"
(`magic-number-theory/ESSAY-2026-09-26-magic-number-theory.md:452`, quoting the file), and was "Forged via:
debugger pass + two torture rounds (Corwin-vs-Bryant, then meaner) + an ethicsminions final pass"
(`q/build-shapes-2026-09-17/SURVEY.md:370-371`, quoting its line 3). As a reader, it produced the line that
made that essay put its commands in an appendix: "if a stranger cannot replay P1 and P2 from the tree root and
get 4 and 39, the essay is prose, not proof" (`magic-number-theory/ESSAY-2026-09-26-magic-number-theory.md:460-461`, where the essay prints it "lightly trimmed").
It models **forces** (unite, ship, consent), not **persons**, so it sidesteps the merged-brain rule: it is a
model of the collaboration, not a fusion of two people. A stranger gets a short, working voice with no picking
at all. *Where it breaks:* it speaks for both in a third voice, so no line can be traced back to who holds it;
when either author changes, nothing flags it; and it is kept "off the public persona shelf"
(`writing/execute-brief/tracks/forks-inventory.tsv:8`). It is not in this snapshot, so I could not align it. *Falsifier:* both
authors, shown D's page and B's page blind, each pick D as "sounds like us".

**The honest hybrid, named so it is not smuggled in.** B's floor could be *introduced* in BCC4's three-force
voice (one short paragraph: unite, ship, consent), with every row beneath still in each author's own words. That
keeps D's day-one readability and B's traceability. It is a variant of B, and it needs BCC4's text, which I
could not read.

### Where the sources agree (the recommendation)

**B, built on Bryant's own v3.0.1-public, with Bryant signing off on the floor.** Five sources point the same
way:
- the plan asks for something to elect "in place of picking" (`q/2026-09-27-execute-brief/PROMPT.md:22`), which rules
  out C and strains A;
- CORWIN.md keeps "the voices distinct" (`book/CORWIN.md:355-356`), which strains D;
- the two-readers run found that reasons, not decisions, are what a persona moves, and that the uncited Bryant
  was the unstable one (`writing/two-readers/EXPERIMENT-2026-09-27-doubled-nine.md:31`, `:164-166`), which favours
  cited lines;
- the rings paper's default-plus-switch is already the house mechanism for advice in tension
  (`writing/rings/PAPER-2026-09-27-every-rule-carries-its-ring.md` §3);
- the claims check gives B a drift gauge that A shares and D lacks
  (`writing/what-a-member-keeps/ESSAY-2026-09-27-what-a-member-keeps.md:334`: "Removal is never the fault.
  **LYING is the only fault.**").

*Falsifier for the recommendation:* on v3.0.1-public, the strict dry run finds fewer than two rows the two
agree on. Then there is no floor to build, and A (both, side by side) or D (a third voice) is the honest form.

### Concerns (tagged; each with a falsifier)

- **[MINE] I could not read three files that matter:** BRYANT.md v3.0.1-public and BRYANT-INFLUENCER.md (r2,
  `from-bryant/2026-09-26-r2/`), and `modelthisbook/BRYANT_CORWIN_C4.md`. None is in this snapshot. Every count
  above is on v1.0. *Falsifier:* the dry run on v3.0.1-public gives the same shape (a small agreed floor, a real
  set of differences); then this RAD stands as written. Re-run: `python3 dry-run/align.py book/CORWIN.md
  <path to v3>/BRYANT.md dry-run/align.tsv` after replacing the B rows with v3's own lines; the script reports
  any aspect it cannot find instead of guessing.
- **[HIS] Bryant may not want his side to use the twelve aspects at all.** v1.0 invites him to "rename it,
  refill it, throw it out". If v3 drops the template, the one-to-one alignment is gone. *Falsifier:* v3 carries
  the twelve headings (the script lists what it finds).
- **[HIS] The control arm.** Adding the combined model to one spell and not the other changes the experiment
  in `spells/onward-turn/SPELL.md:107-113`. *Falsifier:* he rules that the experiment has ended, or that both
  spells gain the same persona step.
- **[DOMAIN] Persona text moves reasons more than decisions.** Advertising switches as changing outcomes would
  over-claim. *Falsifier:* see the two-readers application above.
- **[PLATFORM] One model family.** The alignment, the scripts and the two-readers evidence are all Claude's.
  *Falsifier:* Bryant (or a non-Claude model) reads the alignment table and classifies the rows the same way.
- **[MINE] Biography creeping in.** Bryant's v1.0 S1 names civic and party roles (`book/BRYANT.md:49-50`); CORWIN.md
  names family (`book/CORWIN.md:137`). A bias model for strangers needs neither. *Falsifier:* a row that only
  makes sense with a biographical fact attached; then the architecture's "bias, not biography" rule is too
  strict.

---

## S3 · Architecture (for B)

**1. Bias, not biography.** The combined file carries do-this clauses, values and guards, each quoted from its
author. It carries no portrait: no family, no civic or party roles, no private companion files, nothing from
chat logs. This follows both files' own privacy lines (table row X4) and the house fence that persona clusters
stay elective (`decks/disclosed-non-heritability.deck.md:15-19`).

**2. The file, top to bottom.**
1. *Front matter:* name (theirs to choose); version; the exact sources, each with its sha256 (CORWIN.md version,
   BRYANT.md v3.0.1-public); licence; authors and credit line; a `ring` line (below); status.
2. *Put on / take off* (the persona fence): "Load this file as your assistant's persona to lean the way Corwin
   and Bryant lean together. Delete it, or flip any switch, and nothing else in the build depends on it." Plain,
   three sentences.
3. *The floor:* rows both authors hold, each row one line from each, cited file:line. On v1.0 that is H4, H6,
   values, naming, privacy, federation. Bryant confirms the floor as a whole.
4. *The switches:* rows where they differ. Each switch has a name the two authors choose, setting 1 (one author's
   line), setting 2 (the other's), optionally setting 3 ("both, in this order", only if both agree it is fair),
   and a default. **Until the two authors set a default, the switch shows both settings and runs neither as a
   rule** (the ring paper's "undeclared never widens", applied). Illustration only, from v1.0, to be redone on
   v3:
   > **Critique** · *Bryant:* "Two questions only: does it run? and can a stranger verify it?" ·
   > *Corwin:* "run a critic pass (multiple lenses) → apply a PASS / HOLD / REJECT gate" (for substantial work) ·
   > default: not set.
5. *One-sided offers:* rows only one author has spoken to, labelled "Corwin's" or "Bryant's", offered, never
   promoted to the floor.
6. *Sources table:* every quoted line with file, line and sha256. One run writes this table and the check from
   one measurement (double entry in the junctures sense, so nobody has to remember the second side).

**3. The drift gauge.** `dry-run/align.py` grows into the check. For each quoted line it prints SUPPORTED (still
in the source, verbatim), STALE (the source changed and the line is gone) or WITHDRAWN (the combined file now
says that row is withdrawn). It prints counts and never a threshold. A STALE row is never rewritten by a tool:
its author re-quotes it or withdraws it. Written in Python; its second reader is POSIX sh, per his rule that
coverage uses a second language.

**4. A stranger's changed copy.** A shop that edits the combined model has made its own model. The check then
says so: the copy stops calling itself "Corwin and Bryant's combined model" and says "derived from" it. This is
the member-keeps inverse: "a fork also needs the claims check, to stop claiming the old group's election"
(`writing/what-a-member-keeps/ESSAY-2026-09-27-what-a-member-keeps.md:551`).

**5. Rings.** The file's `ring` line reads `one,team,org`, with one rule for org use: an org that elects it
publishes its switch positions in its Terms of Service, as GHOSTWHEEL.org already requires of filters ("each
content, propriety or data filter listed", `GHOSTWHEEL.org:38`). One operator and teams may keep their
positions private.

**6. Where it lives and how it plugs in.**
- On the persona shelf beside both originals (`GHOSTWHEEL.org:28` names `<H>:/pub/persona/`), republished
  together, as the plan says.
- GHOSTWHEEL.org's "contributing persona" item names it as the default when a shop has no persona of its own,
  and says how to replace it: "Every default here -- licensing included -- is a preference" (`GHOSTWHEEL.org:49`).
- In the onward turn's persona closing, its twelve rows are the ASPECTS list; a switch left unset lists both.
- **Name collision to settle:** `BRYANT_CORWIN_C4.md` already exists off-shelf. The new file either replaces it,
  absorbs its three-force introduction (the hybrid), or takes a different name. Their call.

**7. Licence and signing.** Persona sheets are writing, and writing takes CC BY 4.0 under TERMS v1
(`GHOSTWHEEL.org:58-59`); Bryant's r2 package is also CC BY 4.0 text, "Copyright (C) 2026 Bryant Frankford and
Corwin Brust" (`spells/ingest/runs/2026-09-26-bryant.md:25-26`). TERMS clause (c), which lets Corwin's writing be
reused without credit, covers only Corwin's lines; "Other people's work keeps its own terms"
(`GHOSTWHEEL.org:83`). So credit is kept at every line, which is also CORWIN.md's own rule: "Credit at the idea,
not just the masthead" (`book/CORWIN.md:370`). Signing is at ON and is Corwin's pen; a strangers' file that others
rely on is a "door", not a "drawer", so it earns signatures. Proposed: both authors sign one digest (Bryant's key
is still an open item, fork F033 K6).

**8. Order of work.**
1. Corwin: lift the hold for v3.0.1-public, or restate it (F036).
2. Bring the shelf's `bryant` up to v3.0.1-public (the "mutation owed", `model.md:91`).
3. Redo the dry run on v3 (one command; S2 concerns).
4. Send Bryant the note below; agree the floor and switch names together.
5. Draft the combined file (at his instruction; persona authoring is his pen).
6. At ON: republish CORWIN.md, BRYANT.md and the combined file together; sign.

---

## S4 · Normalized findings

*Written only after the ruling.*

---

## Draft note to Bryant (for Corwin to edit)

*Plain text, no em-dashes (the drop rule for anything to Bryant, `onward-readiness/review-2026-09-26-onward/SPELLS-CONSISTENCY.md:231`).*

> Hi Bryant,
>
> A proposal, and I want your say before anything moves.
>
> We plan to republish your BRYANT.md next to my CORWIN.md, and to add a third file: a combined model that
> someone can load when they take ghostwheel.org into their own shop and don't have a model of their own yet.
> Instead of choosing yours or mine, they'd get both of us at once.
>
> How I'd like to build it:
>
> 1. Where we agree, that becomes the default, with a line from each of us, quoted exactly.
> 2. Where we differ, it becomes a switch with two settings, yours in your words and mine in mine. Nobody's
>    view gets averaged away. We pick the switch names and defaults together.
> 3. Where only one of us has said something, it is offered and labelled as that person's, never presented as
>    both.
> 4. No biography, no family, nothing private: only how we work and what we value.
>
> Three questions for you:
>
> - Is BRYANT.md v3.0.1-public, from your r2 package, the version you want as your side? If a newer one is
>   coming, I'll wait for it.
> - Are you OK with your lines being quoted and arranged this way, with credit on every line, under CC BY 4.0
>   like the rest of the package?
> - Do you want to review the agreed defaults before anything is published? I'd like you to.
>
> A first pass on the June file we drafted for you found a handful of places we clearly agree (owning up to our own shortcuts,
> safety always on, user freedom, letting people name their own things) and some real differences worth
> keeping (one file vs. many small tools; two questions vs. a full critique pass; ship-then-iterate vs.
> slow down). I'll redo that on your current version so it is your words, not our guesses.
>
> No rush on this side of ON. Say no and it doesn't happen.
>
> Corwin

---

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.

```
LENS · the combined bias model RAD · 2026-09-27
a  my view: B is right, but only on Bryant's own words; on the June seat file most of his side is ours, and a floor built on it would be Corwin's side agreeing with itself.
b  the view I ascribe Corwin: the plan is decided and should not wait on more process; show how, make the consent ask small and warm, keep both voices.
c  their pull on mine: made me drop A's "pick per aspect" as the lead, because his sentence says "in place of picking".
d  my pull on theirs: asks him to accept that Bryant signs off on the floor, not only on his own lines, and that switches promise reasons, not outcomes.
persona / inverse: Bryant (as his seat file frames him) asks "does it open and work for a stranger today, in one file?" / the inverse, a stranger who elected it and then disagrees, finds something new: the model needs a way to say "derived from" once they change it, or they carry a claim about two people they no longer match.
principles reframe: 1. Everyone is equal before the file: each author's words stand unaveraged, and the stranger is not made to choose a person to follow. 2. The four freedoms apply to biases too: a stranger can read why the AI leans, change a switch, share their copy, and the licence and the "derived from" rule keep that honest for the community that receives it.
```
