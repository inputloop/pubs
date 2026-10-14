[MINE] form COMPARE, name-only; nearest registered form RAD

# COMPARE 2026-09-27 — The combined model: B against D, on real text

## S1 · The question, and the short answer

**Would a stranger be better served by B (agreed floor plus switches) or by D (one fresh voice), once both are tried on the same real lines?**

You chose D and asked to see it beside B: "I suspect D is best but I'd like to compare to B. The weakness of D is the strength to someone who doesn't care to think especially of the two of us as individuals, in one way that's sad but in another it's the more normal developer/user relationship." (your worksheet answer, relayed verbatim in this writer's brief, 2026-09-27).

| | **B · Agreed floor + switches** | **D · Fresh starter, one voice** | **Hybrid · D with receipts** (S5) |
|---|---|---|---|
| Specimens where it read better for a stranger | 1 of 4 (Tempo) | 3 of 4 (Memory, Tool-building, Honesty) | 4 of 4, by construction |
| Where it failed on real text | Memory: it prints a disagreement the two files do not have | Tempo: its one voice contradicts Bryant's word "only" | Tempo still needs a switch, stated in plain words |
| Traceability | every line | per paragraph, if footnoted | every sentence |
| Drift when a source changes | flagged by the check | silent | flagged by the check |

**Short answer (judged):** the specimens support a hybrid: D as the text a stranger loads, every sentence footnoted to the lines it rests on, and a switch only where the two of you really set different defaults. It honours your lean to D and keeps B's two strengths (tracing and drift). Falsifiers in S6.

**Sources, all read in full.** "BRYANT.md" below means Bryant's own v3.0.1-public, at `from-bryant/2026-09-26-r2/unpacked/bryant-v3-publication-2026-09-26-r2/BRYANT.md` (not the v1.0 seat copy the RAD's dry run used). Also `AS4CE0001/book/CORWIN.md` (v1.3), `modelthisbook/BRYANT_CORWIN_C4.md` (the pair model, "BCC4" below), and `writing/combined-model/RAD-2026-09-27-combined-bias-model.md` ("the RAD"). Every quote from these files was re-found at its cited lines by `compare-check/check.sh` (POSIX sh): 36 of 36 OK, none over 20 words.

**Observed: both files are AI-drafted and owner-held.** "Bryant owns every line and holds correction rights." (BRYANT.md:3); CORWIN.md was "built from his own prose, poems, lyrics" (CORWIN.md:15). So B's "own words" are *owned* words; the verbatim sayings are fewer (in BRYANT.md, the `//` lines and his motto). This narrows B's fidelity lead; it does not erase it.

---

## S2 · What each option is (re-read from the RAD, fairly)

**B.** Where the two of you agree, that line is the default ("the floor"). Where you differ, a named switch shows each setting quoted in its author's words, and no default runs until you both set one (RAD:31, :296-299).

**D, at its strongest.** New plain text written for strangers in one voice, citing both files as sources (RAD:31). It models the collaboration's forces, not two persons, so a stranger gets a short working page with no people to choose between: the ordinary relationship a user has with a tool whose makers appear in the credits, which is your point.

---

## S3 · Specimens: the same aspect, both ways

**How I chose.** The three aspects whose do-this clauses would most change what an AI does on the same task, plus the cleanest agreement ([MINE]; falsifier in Concerns). Biography is left out of both renders, per the RAD's "bias, not biography" rule (RAD:283-286). Every sentence I wrote is marked [DRAFT, Mentat]; quoted text is theirs.

### Specimen 1 · Tool-building (differ)

**B, as the combined file would print it.**

> **Floor.** [DRAFT, Mentat] Build for people after you. · *Corwin:* "name it and forge a tool/skill for the commons, not just for now." (CORWIN.md:55-56) · *Bryant:* "make it survive your absence." (BRYANT.md:84)
>
> **Switch: shape of a tool.** [DRAFT, Mentat: switch name]
> - *One file (Bryant):* "One file that runs by double-click, carries its own decoder, and outlives its maker." (BRYANT.md:80-81)
> - *Small tools, composed (Corwin):* "Tiny tools, scripted together, first." (CORWIN.md:300)
> - *Default:* not set.

**D, one voice.**

> [DRAFT, Mentat] Build for the people who come after you, not only for today's task. While you work, prefer small readable tools you can combine. When you hand something over, hand over one file that runs on its own, explains itself, and keeps working without you. When a pattern keeps coming back, make it a tool others can reuse.[^1]

[^1]: CORWIN.md:55-56, :300, :322-323; BRYANT.md:80-84.

**BCC4 already did this:** "unify only what crossing a trust boundary demands; ship everything else standalone." (BCC4:35-36) and "The ship-line (Bryant was right): decide by trust surface, not by tidiness." (BCC4:45). **What a stranger-facing D changes:** BCC4 gives verdicts on people ("Corwin's unify-instinct, left alone, grand-unifies a PDF calculator onto an sshfs mesh.", BCC4:33-34) and names particular apps; a stranger needs the rule without either. It also predates Bryant's own side: v3 is the "First version filled by Bryant's side." (BRYANT.md:230).

**What the specimen shows (judged).** D bridges by *when* (compose while working, one file at hand-over); BCC4 bridged by *trust surface*. Two writers, two bridges: in D, the writer picks. This one has a footing in Corwin's file ("granularity follows the deployment unit.", CORWIN.md:322-323), but not yet in Bryant's. **Slight edge D, if Bryant accepts the bridge.**

### Specimen 2 · Tempo (differ)

**B.**

> **Floor.** [DRAFT, Mentat] Hurry never gets past a gate. · *Corwin:* "A "hurry up" signal is a serious caution" (CORWIN.md:519-520) · *Bryant:* "gates hold against his own hurry." (BRYANT.md:110-111)
>
> **Switch: default pace.** [DRAFT, Mentat: switch name]
> - *Fast and small (Bryant):* "Fast and small, each version with a note" (BRYANT.md:160) · "Slow down only at gates." (BRYANT.md:162)
> - *Protect the space (Corwin):* "protect the creative space; route urgency to the ledger; don't corner too fast." (CORWIN.md:96-97). [DRAFT, Mentat: gloss] "The ledger" is his task list: write the urgent thing down rather than act on it at once.
> - *Default:* not set.

**D.**

> [DRAFT, Mentat] Work in small steps, and say what each step changed. Treat pressure to hurry as a warning: it never gets you past a safety or consent check. While an idea is still forming, don't force it to a finish; write down what feels urgent and come back to it.[^2]

[^2]: BRYANT.md:110-111, :160-163; CORWIN.md:95-97, :519-520.

**BCC4:** silent on pace (`grep -n -i 'tempo\|pace\|hurry\|fast\|slow'` finds only its own "burn rate here is slow on purpose", BCC4:7, about the model, not the work). A stranger-facing D would need new text here.

**What the specimen shows (judged).** This is where D breaks. Bryant's line says slow down *only* at gates. D's last sentence adds a second slow-down (forming ideas) that "only" rules out. Corwin's "Two-speed ideation" (CORWIN.md:95) is the nearest source for it, so the paragraph quietly takes Corwin's side. No single voice can hold "only at gates" and "protect the creative space" as one default; it can only choose, or name both. **B wins this row.** A lean as strong as "Build faster. Love harder. Deliver anyway." (BRYANT.md:165) should reach a stranger as a choice.

### Specimen 3 · Memory (differs in words; judged to agree in practice)

**B, as a word-level alignment would set it.**

> **Floor.** [DRAFT, Mentat] Memory is part of the work. · *Corwin:* "treat memory as load-bearing and portable" (CORWIN.md:51) · *Bryant:* "Memory is a build artifact" (BRYANT.md:70)
>
> **Switch: when a note changes.** [DRAFT, Mentat: switch name]
> - *Bryant:* "mint a new version, never edit in place" (BRYANT.md:73-74)
> - *Corwin:* "never write-once, never locked to one representation." (CORWIN.md:51-52)
> - *Default:* not set.

**D.**

> [DRAFT, Mentat] Treat memory as part of the work: write the fact down before you build on it. When something changes, keep the old version and add a new one rather than overwriting. The format notes are kept in may change; what they said must not be lost. Tidy copies and summaries freely, but never delete the record itself.[^3]

[^3]: CORWIN.md:5, :51-52, :108-109; BRYANT.md:70-74.

**BCC4:** no memory rule; it lists "the memory store" only as a source (BCC4:201).

**What the specimen shows (judged).** "Never write-once" against "never edit in place" looks like a fight. It is not: Corwin's file practises Bryant's rule on itself ("Latest always at /CORWIN.md; archives one-based", CORWIN.md:5). His clause is against freezing a *format*; Bryant's is against overwriting *history*. B, built mechanically, prints a false switch; avoiding it takes a person moving the row to the floor, which is the same judging D does. **D wins this row.** [MINE] my reading. Falsifier: either of you says the two clauses do pull opposite ways.

### Specimen 4 · Honesty (agree)

**B.**

> **Floor.** *Corwin:* "cite sources; mark grounded vs. aspirational; never flatter." (CORWIN.md:83) · *Bryant:* "Label what is known: read-verified, build-verified, live-verified." (BRYANT.md:134-135) · "say "I cannot" and "that parked" early; decline the victory lap; disclose what the machine built." (BRYANT.md:137-138)
>
> **Switch:** none.

**D.**

> [DRAFT, Mentat] Say how you know what you claim: whether you read it, built it, saw it running, or only hope it is so. Cite your sources. Say "I can't" and "this is on hold" early. Skip the victory lap, say plainly what a machine built, and never flatter.[^4]

[^4]: CORWIN.md:82-83; BRYANT.md:134-138.

**BCC4 already did this,** as a verdict on C4 rather than an instruction to an AI: "Treat C4's transparency as aspirational-but-named, not shipped" (BCC4:83), under its guard "substantiate or it's merely data" (CORWIN.md:82, carried at BCC4:6).

**What the specimen shows (judged).** B hands the stranger's AI two labelling schemes (grounded / aspirational; read / build / live-verified). D merges them into one four-step ladder that is better than either alone. **D wins this row.** One cost: D turned Bryant's "that parked" into "this is on hold", and his file's guard says "Bryant names his own terms" (BRYANT.md:7). [HIS] (keeper: Bryant). Falsifier: he says plain words are fine in a file meant for strangers.

### What the four rows add up to

| Specimen | Kind | Better for a stranger | Why |
|---|---|---|---|
| Tool-building | real difference, bridgeable | D, narrowly | reads as one method; the bridge needs Bryant's yes |
| Tempo | real difference in default | **B** | D's one voice breaks Bryant's "only" |
| Memory | difference in words only | **D** | B prints a disagreement that isn't there |
| Honesty | agreement | **D** | D merges two schemes into one |

---

## S4 · Day one for a stranger, and what the two of you keep or lose

Counted on the four specimens above (words in the render blocks, quotes and citations included): **B 277, D 236.** Times three for twelve aspects, about 830 against 710; that scaling is a stand-in, not a measurement.

| | **B** | **D** |
|---|---|---|
| Words to read before it works | the page, about a sixth longer than D's (count above) | the page |
| Choices before it works | none required; an unset switch shows both settings and runs neither | none |
| What they read | your names on every setting | one voice; your names in footnotes |
| What they cannot see | why you differ (that lives in the originals) | where the writer bridged or dropped something (Tempo's "only", Tool-building's bridge) |
| If they disagree with a line | flip the switch or strike the row | edit the paragraph; the copy becomes theirs, "derived from" (RAD:315-318) |
| Attribution for you two | per line, at the idea (CORWIN.md:370) | per paragraph footnote; lost per sentence unless receipted |
| Bryant withdraws a line or the whole model | mechanical: his quotes come out; floor rows he was in become Corwin's one-sided offers | a person must rewrite every paragraph citing him |
| Either model changes | the check marks the quote STALE (RAD:309-312) | nothing flags it (RAD:37) |
| Bryant's consent ask | yes to his quoted lines and to the floor | yes to a voice that speaks for him; one page, harder to check line by line |
| **Your "sad but normal" point** | the stranger meets two people and elects between their named reasons, closer to choosing a mentor | the stranger meets a tool whose makers are in the credits: the ordinary developer/user relationship. Lost: you two, as people, recede. Kept: the stranger's attention stays on their own shop, which is what the plan is for |

**Judged.** Your point cuts deeper than style. The two-readers experiment found "The persona changed the *reasons* given, not the *decision*" (`writing/two-readers/EXPERIMENT-2026-09-27-doubled-nine.md:31`). *Whose* reason it was matters mostly to you two (credit, withdrawal, drift). The stranger needs the reason; you two need the name. The hybrid serves that split.

---

## S5 · A hybrid: the specimens support one

**D with receipts.** [DRAFT, Mentat]
1. **The loaded text is D:** one plain voice, one paragraph per aspect, no names in the body.
2. **Every sentence carries a footnote** to the lines it rests on. `compare-check/check.sh` already re-finds such quotes; grown into the RAD's drift gauge (RAD:309-313), it marks a D sentence STALE when its source changes, which removes D's worst failure ("drifts silently", RAD:37).
3. **A switch lives inside D's voice only where the defaults truly differ.** Tempo would read: [DRAFT, Mentat] "This model has two settings for pace. *Fast and small:* ship in small steps and slow down only at safety and consent checks. *Protect the space:* give forming ideas room and write urgent things down for later. Its makers have not set a default; choose one." The names stay in the footnotes.
4. **B's floor-and-switch table ships as an appendix**, the "why" page for anyone who wants the two of you as individuals. Both originals are republished beside it, as the plan says.

**Why the specimens support it.** It keeps D's three wins and B's one (Tempo) without choosing between them. It inverts the hybrid the RAD named (B's floor introduced in BCC4's voice, RAD:232-235): the specimens put the voice on top and the quotes underneath.

**The losing option, at its strongest: pure B.** Every sentence a stranger reads is a line one of you owns, so there is no bridge for Bryant to reject and no "only" to lose. Consent is the simplest: he checks his quotes, not a voice. If Bryant's answer to the note is "quote me, don't paraphrase me", B is right and the hybrid is wrong.

---

## S6 · Recommendation

**The hybrid, D with receipts.** It is D, as you leaned, with B's tracing and drift check moved underneath it. A stranger reads one voice (your "normal developer/user relationship"). You two keep attribution, withdrawal and drift at sentence level.

**Falsifiers (any one shows it wrong).**
1. **The authors' read.** Shown the four D paragraphs with footnotes, either of you says one misstates him, especially Memory's reconciliation or Tool-building's bridge. Then D's voice is over-reconciling, and B is the honest form.
2. **Switch count on v3.** Redone on all twelve aspects of Bryant's v3, more than 4 need an in-voice switch like Tempo (4 is a house-number stand-in, chosen, not measured). Then the "one voice" is mostly switches, and B says it more plainly.
3. **The receipts test.** Change one cited line in a scratch copy of BRYANT.md. The check must flag the D sentence resting on it. If a D sentence rests on no quotable line, so that nothing can flag it, the receipts are theatre for that sentence and it must be cut or quoted.

**Order of work:** only the RAD's step 5 (RAD:348) changes, to draft the hybrid instead of B. The note to Bryant gains one question: [DRAFT, Mentat] "Are you OK with a plain-voice summary of your lines, each sentence footnoted to your file, or do you want only direct quotes?"

---

## Concerns (tagged; each with a falsifier)

- **[MINE] Choice of specimens.** Picked by reading, not count; Optimization or Thoughtfulness were candidates. *Falsifier:* a second reader picks a different three and the tally flips to B.
- **[DOMAIN] "Own words" are owned words** (S1). B's fidelity lead is smaller than the RAD's table implies. *Falsifier:* either of you says the do-this clauses are phrasing you would sign as your own.
- **[HIS] Merged brain.** CORWIN.md says "blend the work, keep the voices distinct." (CORWIN.md:355-356). The hybrid keeps the voices distinct in the footnotes, not in the text. Whether that honours the rule is your ruling. *Falsifier:* you rule that footnotes are enough.
- **[PLATFORM] Same model family.** Claude wrote the D paragraphs and will load them; the voice may lean to Claude's defaults. *Falsifier:* Bryant, or a non-Claude reader, says they sound like the two of you.
- **[MINE] Landing collision.** This folder's `decisions.json` and `done.json` share names with the RAD round's files in `writing/combined-model/`; the id here (`combined-model-D9`) does not collide, the files do. *Falsifier:* the lander merges arrays rather than copying files.

---

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.

```
LENS · the combined model, B against D · 2026-09-27
a  my view: on real text D reads better three times in four, and B is needed once (Tempo); so load D, footnote every sentence, and switch only where defaults truly differ.
b  the view I ascribe Corwin: D is right for strangers, and the loss of the two makers as individuals is acceptable, even normal; he wants to see it, not be told.
c  their pull on mine: moved me off the RAD's pure-B lead; his "normal developer/user relationship" made me ask who needs the names (the makers) and who needs the reasons (the stranger).
d  my pull on theirs: asks him to accept that D is only safe with sentence-level receipts, and that Tempo stays a switch however smooth the prose could be made.
persona / inverse: Bryant, as his file speaks ("Slow down only at gates."), would check whether the one voice kept his "only" / the inverse, a stranger who never heard of either of you, finds something new: the footnotes are what let them trust a page with no person behind it, so the receipts serve them too, not only the authors.
principles reframe: 1. Equal standing: neither maker's lean is smuggled in as the neutral default; where they differ, the stranger is told and chooses. 2. The four freedoms reach the persona file: a stranger can read why it leans (footnotes), change it (switches, paragraphs), and share a derived copy that says so, which keeps the community honest about whose biases it runs.
```

---

**Your answer (edit here, or in the brief; card combined-model-D9 is not in the worksheet file, which was made before this comparison):**

RULING combined-model-D9: 
NOTE: 
