# DECISION 2026-09-27 — the question bank, cleared in bulk

*For Corwin. Form: DECISION (`c/wf`: "What was decided, by applying stated theory, and why"). Nothing below
is decided. The bank's own header says "a bank entry can only be resolved by him"
(`evidence/question-bank-iTNH.tsv:12`). So every "decision" here is a **proposal**: I apply the rules you
have already stated, and you close the rows with a word. The SPA carries each proposal as a card with
three buttons (close as proposed / close with exceptions / hold) and a comment box.*

## What was decided, by applying stated theory, and why

**Proposed:** eleven short sentences from you would close **195** of the **379** open bank questions and
re-issue **10** that were hidden. After that, **132** questions are really yours. **24** of them hold up
work, **24** are about your own notation and fit one worksheet sitting, and **80** can wait. The other
**42** are work the instrument can do without asking you. They are ranked in `bank-worklist.md`.

**The theory applied, in your words:**

- On 08-03 you said about the language: *"Seams are the opening for C4 claude. Stop pinning them down for the
  language whatever you have to pin for you."* (`C4.md:8-9`)
- On 09-23 you said there are to be **"no signing asks without a named reader."** (`MEMORY.md:2746`, in
  the list headed "His corrections, applied:" at `:2742`)
- On 08-01 you said: *"gen0.manifest might want to be called MANIFEST once generated (and just GEN0 as
  installed)"* (`decks/resolution.deck.md:146`). From that the shop wrote "There is no gen1 to cut."
  (`:163`)
- The bank holds "ASKS ADDRESSED TO CORWIN" (`evidence/question-bank-iTNH.tsv:11`). A row that asks
  nothing is not a bank entry by the bank's own definition.
- On the ledger's colliding numbers you said: *"Names (plus dates if we need to use them, find is good with
  dates) is a much stronger play."* (`evidence/question-bank-iTNH.tsv:611`)

**Why bulk.** The bank grew faster than any one person can answer. Its own opening says so: "ANSWERING is
the scarce resource" (`evidence/question-bank-iTNH.tsv:7`). One sentence per group spends the least of it.

---

## (a) The counts, in plain words

*Observed.* Four readers reconciled the bank against the later writing and verified every quote before
writing it down. Readers A and B covered the bank (`writing/execute-brief/tracks/bankA-reconciled.tsv`,
`writing/execute-brief/tracks/bankB-reconciled.tsv`). The bank's "latest state per question" cut shows **369** still-open
questions: 184 from Q02 to Q246, and 185 from Q248 to Q527. Reader B found **9** more that were hidden
because two sessions gave the same number to different questions on 08-29. I found **1** more today (see
(e) item 2). That makes **379**.

After the spot-check corrections below, the 379 fall like this:

| where the answer is | questions |
|---|---:|
| only you can answer | 144 |
| your own words elsewhere already answer it | 83 (16 of them through the 08-03 "stop pinning" rule) |
| later shop writing answers it, and nothing shows you objecting | 73 |
| doing the work answers it, and no ruling is needed | 46 |
| overtaken: the thing was removed, renamed or superseded | 23 |
| unclear: mostly reports that asked nothing | 10 |

In plain words: **about 6 in 10 need no fresh thinking from you, only your word to close them.** Grouped by
the rule that answers them, they come down to eleven sentences.

| what happens | questions |
|---|---:|
| closed by eleven sentences from you (section b) | 195 |
| hidden questions re-issued under new names (b, item 10) | 10 |
| work the instrument does without you (f, and `bank-worklist.md`) | 42 |
| yours, and blocking work (c) | 24 questions (28 ids) |
| yours, about your own notation, one worksheet sitting (d) | 24 |
| yours, not blocking; they can ride the worksheet lane later (Appendix E) | 80 |

The formal writing adds **46** forks that only you can decide. `writing/execute-brief/tracks/forks-summary.md` groups them into
**9** clusters, and they appear as nine cluster decisions in section (g) and in `decisions.json`. It also
lists **62** items of work owed or waiting on approval, which your 09-27 prompt now releases ("please
proceed"). Those are in `bank-worklist.md`.

## Spot-check first: how far to trust the answered rows

*Observed.* The readers marked 159 rows as answered, either by your words or by the writing. I drew
**17** of them at random, with the seed printed: `random.seed(20260927); random.sample(pool,17)` over
those 159 rows sorted by half and number. For each one I opened the cited `path:line` and asked two
things: is the quote there, and does it really answer the question?

| result | rows | which |
|---|---:|---|
| quote on the cited line | 17 of 17 | all |
| clean: quote present, answers the question, credited to the right voice | 10 | Q12 Q48 Q68 Q75 Q155 Q242 Q244 Q289 Q326 Q435 |
| wrong: does not answer the question | 1 | **Q222** (your "LENDING is the pattern" is about lending letters' names to maps, not about whether the nine take facets) |
| overstated: partly answers, or credits you with the writing's reading | 4 | **Q49** (the essay's reading, not your words) · **Q148** (answered, but by a different line: the essay's slope verdict plus your 09-26 answer) · **Q430** (confirms step 1 of your three-step publishing order only) · **Q421** (defines a verifiable claim; where claims are registered is still open) |
| procedural: your rule says how to handle it, not what it means | 2 | **Q62**, **Q114** (the 08-03 "stop pinning" rows) |

**Error rate, stated honestly.** 1 of 17 was outright wrong, about 6%. With only 17 in the sample, the
plausible range for the whole pool is roughly 1% to 27% (a Wilson 95% interval). 10 of 17 were fully clean,
59%, with a range of roughly 36% to 78%. Read that as: **about one answered row in three may need a caveat,
and about one in sixteen is simply wrong.** That is why bulk rulings 7 and 8 below let you hold single ids,
and why the 08-03 rows get their own sentence instead of passing as "answered by him".

**Corrections applied** (recorded in `done.json`; the reader files in `writing/execute-brief/tracks/` are left untouched):
Q222 moves to yours (worksheet). Q49 moves from answered-by-you to answered-by-writing. Q148 gets its right
evidence (`magic-number-theory/ESSAY-2026-09-26-magic-number-theory.md:341`, the slope with "no plateau",
plus your answer at `:982`, "you are entirely correct on all three counts, these are antipatterns"), so it
closes as report the raw ratio and set no threshold. Q430 moves to yours and rides fork cluster 1. Q421
moves to work (propose a home for verifiable claims). The 16 rows under the 08-03 rule are relabelled
"covered by your rule, pending your yes".

---

## (b) The bulk rulings

Each ruling has five parts: the sentence you would say, the rows it closes, the evidence (your words where
they are yours), the risk if it is wrong, and the falsifier. The bank status each row would take uses the
bank's own words (`:14`): ANSWERED, STALE (overtaken), or WITHDRAWN (the instrument answered it itself).
The full row lists, each with its question and the line that answers it, are in the appendices.

### B1 · The 08-03 rule covers the July grammar asks: withdraw them  [HIS]

- **You would say:** "Yes: my 08-03 rule, stop pinning the language, covers the July grammar and wording
  asks. Withdraw them. The instrument keeps its own working reading in C4.md."
- **Closes 16 (WITHDRAWN):** Q21 Q23 Q31 Q39 Q40 Q41 Q51 Q53 Q54 Q61 Q62 Q89 Q94 Q113 Q114 Q128.
- **Evidence:** your words at `C4.md:8-9` (quoted above). The instrument's own line before them is
  "**So: I pin here, for me. The language's seams stay open.**" (`C4.md:7`). Q51 leans on it by way of
  your Q203 ruling, "deliberately BOTH -- run-level AND operand-width. Things can and should carefully
  collide" (`evidence/question-bank-iTNH.tsv:659`).
- **Optional widening:** four of the worksheet cards also lean on this rule (Q83, Q88, Q120, Q213). Add
  "and those four too" if you want them gone as well.
- **Risk if wrong:** a tool gets built on the instrument's guessed reading of your grammar, and a stranger
  meets that guess as though it were C4. [DOMAIN]
- **Falsifier:** any of the 16 ids, or its phrase, is cited as the authority for a tool, test or spell's
  behaviour. Check on Avalon: `grep -rn 'Q21\b\|Q128\b' bin tests spells`, and so on. That is NOT
  CHECKED here, because the snapshot has no `bin/`.

### B2 · Signing asks with no named reader are withdrawn  [HIS]

- **You would say:** "Signing asks that name no reader are withdrawn. From now on a signature is proposed
  only with the reader named in the same breath."
- **Closes 7:** Q33 Q159 Q163 Q494 (WITHDRAWN) · Q154 (ANSWERED: the 11 deck signatures were already
  removed) · Q348 Q499 (ANSWERED: your rule *is* the answer to "how do we decide whether a file is worth
  signing").
- **Evidence:** "no signing asks without a named reader." (`MEMORY.md:2746`). "SIGNING IS MY BASELINE, NOT
  HIS NEED." (`d/door/24-his-signing-baseline.part:10`), with your words under it: *"the tools we build
  together are not absolutely required to convey every bit of capability to protect ecosystem that you
  possess inherently."* (`:16-18`). The 09-17 removal gate: "a signature stays only where something
  mechanical reads it" (`q/cleanup-2026-09-16/removed-2026-09-17.txt:3`).
- **Not included:** Q517 (whose key signed the chamber protocol). A reader does exist there, the signature
  gauge, so it stays in section (c). Q106 is a contradiction (see (e) item 7).
- **Risk if wrong:** a person who does rely on a signature, for example Bryant verifying a drop, loses it
  without anyone noticing. [DOMAIN]
- **Falsifier:** for any file these seven rows name, `asc-disposition.tsv` has `load_bearing=YES`, or a
  person says they check it. NOT CHECKED here: that file is not in the snapshot.

### B3 · There is no gen1  [HIS]

- **You would say:** "There is no gen1. Acceptance renames MANIFEST to GEN0 and the slot rotates. Close
  the gen1 questions."
- **Closes 5 (STALE):** Q02 Q07 Q09 Q109 Q119.
- **Evidence:** your 08-01 words at `decks/resolution.deck.md:146`. "**There is no gen1 to cut.**"
  (`:163`). gen0 was re-homed intact on 09-24: "**Landed in C4.** `gen0/` (62 files, two-reader MANIFEST"
  (`MEMORY.md:2785`).
- **Risk if wrong:** some live tool or spell still counts generations upward, and closing these rows hides
  that it does. [DOMAIN]
- **Falsifier:** `grep -rn gen1 bin spells` on Avalon finds a live use rather than history.

### B4 · Report-only rows leave the bank  [MINE]

- **You would say:** "Rows that report and ask nothing are closed as read. The findings stay where they
  were written."
- **Closes 17 (ANSWERED, "report, read"):** Q252 Q262 Q305 Q404 Q405 Q424 Q428 Q443 Q453 Q454 Q457 Q464
  Q465 Q469 Q481 Q485 Q509.
- **Evidence:** the bank holds "ASKS ADDRESSED TO CORWIN (what do you want / which way?)"
  (`evidence/question-bank-iTNH.tsv:11`). The house rule for notes: "An observation is never a demand"
  (`c/wf:1`, the NOTE row).
- **Risk if wrong:** a report hides a real decision. The likeliest case is Q404, "read before wave 2",
  where nothing shows whether wave 2 ran. [MINE]
- **Falsifier:** one of the 17 turns out to gate work. For Q404: a wave-2 record exists and it cites the
  two defects as still unread. Q469 also carries a hidden question, which B10 handles.

### B5 · Unfinished sentences are withdrawn  [HIS]

- **You would say:** "Withdraw my unfinished sentences. If one matters, I'll say it again."
- **Closes 5 (STALE):** Q15 Q22 Q81 Q101 Q116.
- **Evidence:** no later writing picks up any of them (reader A, rows Q15 Q81 Q101 Q116). The deck that
  holds Q101's sentence already says "**Unfinished, and left unfinished on purpose**"
  (`decks/certainty-and-adoption.deck.md:146`). Q22 has a reading the writing favours, that a first turn
  must satisfy every rule (`q/REWRITE-2026-07-31-corwin-metalanguage-and-bootstrap.md:94`). It goes with
  the others unless you keep it.
- **Risk if wrong:** a thought you meant to finish is lost. [HIS]
- **Falsifier:** you remember the missing word for any one of them.

### B6 · Tools that nothing calls are parked, not deleted  [HIS]

- **You would say:** "Tools nothing calls are parked. They keep their files, come off the list a new user
  sees, and the questions about them close as parked. Anyone un-parks one by using it."
- **Closes 5 (ANSWERED: parked):** Q276 (st4ge) · Q303 (vms) · Q308 (c4rp) · Q319 (c4gage) · Q320
  (ed1ge). It also settles the class: the 44 tools with no traceable role.
- **Evidence:** "44 with no traceable role (a question for him, never a proposal to delete)"
  (`model.md:41-42`). "A "no" is a question for you, never a proposal to delete."
  (`onward-readiness/review-2026-09-26-onward/C4-BROWN-MAP.md:29`).
- **Options:** keep as they are · **park (recommended)** · retire. Retire stays yours and is not proposed
  here.
- **Risk if wrong:** a tool you run by hand gets hidden from you. [HIS]
- **Falsifier:** your own records show you running one of them, which is the map's fifth test for
  load-bearing (`C4-BROWN-MAP.md:25-26`), or a caller turns up that the map missed.

### B7 · Rows your own words answer: close them with the cited line as the answer  [HIS]

- **You would say:** "Close the rows my own words answer, with the cited line as the answer. I'll name any
  I disagree with."
- **Closes 58 (ANSWERED):** see Appendix A, where each row shows its question and your line. By the
  readers' confidence, 12 are high, 37 medium and 9 low.
- **Evidence:** per row, in Appendix A. Only lines marked as yours count: a q/ prompt, a door part marked
  as your words, or a bank or MEMORY line that quotes you.
- **Options:** close all 58 · **close the 49 high and medium, and send the 9 low to the worksheet
  (recommended)** · hold.
- **Risk if wrong:** the spot-check found that about one answered row in three needs a caveat. The likely
  failure is the instrument's reading of your words being filed as your answer. [MINE]
- **Falsifier:** you read a cited line and say either that it is not yours or that it does not answer
  the question. Each such row goes back to the worksheet.

### B8 · Rows the writing answers: close them unless you object on this read  [MINE]

- **You would say:** "Rows the later writing settles close, unless I name the id on this read."
- **Closes 61 (ANSWERED):** see Appendix B. By confidence, 12 are high, 37 medium and 12 low.
- **Evidence:** per row, in Appendix B.
- **Options:** close all 61 unless named · **close the 49 high and medium, and send the 12 low to the
  worksheet (recommended)** · hold.
- **Risk if wrong:** the shop answers its own question and then treats the answer as agreed. That is the
  failure your co-election rule exists to stop. [DOMAIN]
- **Falsifier:** any id you name. "One read" means this page, once, with no time limit after it.

### B9 · Overtaken rows close as STALE  [MINE]

- **You would say:** "Close the overtaken rows as stale."
- **Closes 19:** see Appendix C. The files involved were removed, renamed or superseded.
- **Risk if wrong:** a row is only overtaken in wording, not in fact. [MINE]
- **Falsifier:** the thing named in the row still exists and still behaves as the question describes.

### B10 · The hidden questions: re-issue them, renumber nothing  [HIS]

*Observed.* On 08-29 parallel sessions gave the same number to different questions. The "latest state
per id" cut therefore shows the last row and hides the rest. Reader B's check:
`awk -F'\t' '$1=="Q469"' evidence/question-bank-iTNH.tsv` prints two different questions. I re-ran the
check over the whole bank (`work/eb` script, rows grouped by id) and found one more hidden question that
reader B missed: **Q471 row 610**, which asks whether to build "point five" from the captured characters.
It is hidden behind rows 616 and 668, which ask and answer a different question about graph shape. The
other four doubled ids in that batch (Q429, Q467 row 600, Q468 row 601, Q469 row 606) are either the same
question asked twice or were settled by a later ruling. **Q02 to Q246 have no hidden questions.**

**The 10 hidden questions:** Q450/fragments · Q451/corpus · Q452/gloss · Q453/gloss · Q454/vocabulary ·
Q467/fragments · Q470/m0ve · Q472/sessions · Q473/naming (first banked as Q469) · Q471/taxonomy (new today).

- **You would say:** "Re-issue the ten hidden questions as new bank rows through w0rk.sh. Put the name and
  date in the tag, leave the old rows exactly as they are, and never mint an id that already exists."
- **Who does it:** the instrument. It appends through `h/w0rk.sh`, as the house practice requires ("bank
  ONLY via h/w0rk.sh (never hand-compose a row)", `q/PROMPT-2026-08-29-reprompt-lens-drift-unit01-model.md:112`).
  **Nobody renumbers existing rows.** The house convention is "name+date supersedes numeric ids; leave a
  duplicate as evidence, never unilaterally renumber" (`q/retention/palace-concerns-shelf.md:87-89`).
  Changing the bank's id scheme as a whole is yours, and it is still open as Q472/sessions.
- **Options:**
  - **A. New Q numbers (Q528 onward), with the name and date in the tag column. Recommended for now.** The
    worksheet lane keys cards as `RULING Qnnn:`, so this works with the lane today and is fully reversible.
  - B. Name-and-date ids straight away, for example `m0ve-earns-cube 2026-08-29`. This is the strongest
    reading of your ledger call (`:611`) and of Q451, which reader B marks as answered by it. Its cost is
    that w0sh may not deal a card without a Q number. That is NOT CHECKED, because `bin/` and `h/` tools
    are not in the snapshot. If you close Q451 under B7, B becomes the rule, and the instrument teaches
    w0sh to deal names.
  - C. Leave them hidden.
- **Plus one guard (instrument work, no ruling):** `w0rk.sh` refuses to mint an id that already exists.
  Its falsifier is a planted duplicate that is refused.
- **Risk if wrong:** re-issuing under a new id breaks a reference somewhere that points at the old id.
  [DOMAIN]
- **Falsifier:** a tool or note cites one of the old ids *meaning the hidden question*. Grep each old id
  on Avalon before re-issuing.

### B11 · Persona fork lists wait until you ask for a persona  [HIS]

- **You would say:** "Persona forks wait until I ask for a persona."
- **Closes 2 (ANSWERED: waits on his instruction):** Q508 Q518.
- **Evidence:** "persona generation happens AT THE USER'S INSTRUCTION" and "Authoring a persona is his
  pen." (`d/door/34-his-persona-aware.part:22-25`).
- **Overlap:** Q518 is fork F089, in cluster 7 of section (g). Closing it here closes it there too.
- **Risk if wrong:** a persona mechanic that other people will meet stays unsettled. [DOMAIN]
- **Falsifier:** a persona is already being used by someone other than you with these forks unset.
  Brigidt's row (Q487) is kept apart in section (c) for that reason.

---

## (c) The 24 questions of yours that most hold up work

These merge reader A's top twelve with reader B's top twelve. They are ordered by what waits on them:
first other people and the way out of the lab, then the build, then words. ★ marks the option the writing
supports best. "Agreeing" lists the sources that point the same way. Each is also a card in
`decisions.json` (cluster "Question bank — blocking").

**1. Q233: should the two-file kit you can send anyone stay free of "it must be signed to be trusted"?**
The two-file kit works everywhere as it is. The only thing that would break it is someone adding a signing
requirement. ★ Make the freeze a standing rule · this time only · no freeze. *Agreeing:* "SIGNING IS MY
BASELINE, NOT HIS NEED." (`d/door/24-his-signing-baseline.part:10`); "no signing asks without a named
reader." (`MEMORY.md:2746`). *Blocks:* the signing-cost plan and the 09-17 kit prompts, which both list
it as waiting on you: "Q233 as the keeper's to answer"
(`q/cryptographic-signing-cost-accounting/INTEGRATION.md:85`). *Falsifier:* a named recipient needs a
signature in order to trust the kit.

**2. Q25 + Q236: who decides whether savane-forensics is released, and how does the opportunity checker
learn that it is embargoed?** ★ Decide it jointly with the FSF people who carry the consequences, and give
the checker an embargo list it reads · you decide alone · treat the checker's flag as advisory only.
*Agreeing:* "It is embargoed: Savannah internals, shared FSF/volunteer custody."
(`decks/why-bryant-waits.deck.md:151`); "C4 sees everything of his EXCEPT SAVANNAH"
(`d/door/20-his-scope-and-attestations.part:10`). *Blocks:* every run of the checker flags it again. This
is also contradiction 1 in (e). *Falsifier:* the bundled copy turns out to contain nothing specific to
Savannah (worklist item Q24), in which case "embargoed" covers publication only.

**3. Q463: should an access gate be a real file permission rather than a line in a text file?** ★ Tie each
declared gate to a real per-user permission · keep gates as text declarations · both, plus a gauge that
reports when the two disagree. The third option is the strongest loser: it proves where the first only
enforces. *Agreeing:* "per-user state homes on GIZA: open." (`model.md:113`); the per-user homes proposal
(`onward-readiness/review-2026-09-26-onward/PUB-DESIGN-POINTS.md:390`). *Blocks:* GIZA's per-user homes,
and with them the next turn. *Falsifier:* a user's gate cannot be expressed as a file permission on
GIZA's filesystem.

**4. Q517: whose EdDSA key signed the 08-08 chamber protocol file?** The signature gauge reads UNCHECKED
until someone names the key. ★ The sandbox signing key from the move to H:, with its public half added to
`governance/keys/` by your hand · another key, and the file is left UNCHECKED. *Agreeing:* model.md's list
for the turn to ON: "answer Q516/Q517;" (`model.md:794`). *Blocks:* a clean signature gauge before ON.
*Falsifier:* the public key you name does not verify the file.

**5. Q65: when the bash ghostwheel library and the plain-sh tools merge, which shell wins?** *Observed:* this
is nearly answered already. Your ruling produced c4fn's shape: "POSIX core plus bash shim, per your
ruling" (`evidence/question-bank-iTNH.tsv:285`). It landed as "POSIX CORE + BASH SHIM, underscore names
canonical" (`journal/LENS-2026-08-05-assembler-paper.md:20`). ★ The same shape for the merged library
(POSIX core, underscore names, dotted aliases only where bash is present) · bash throughout · POSIX only,
no aliases. *Blocks:* Q190, Q193 and Q205. *Falsifier:* a ghostwheel function cannot be written without a
feature bash has and POSIX sh lacks.

**6. Q378: is the gw manual documenting the weaker half?** ★ A sourced function library is the real
product, and gw(1) is a thin wrapper around it · the gw(1) program comes first. *Agreeing:* "**TOOLS
PROVE. GENERATIVE CODE DELIVERS.**" (`d/door/22-his-seam-tools-prove-claim.part:20`); model.md calls it
"a live open question, not a closed one." (`model.md:823`). *Falsifier:* a user who never sources the
library still needs gw(1) to do its whole job.

**7. Q190: your hand-written c4fn, or the generated one: which is the spec?** ★ Yours is the spec the
generator is tested against · the generator absorbs yours as a stub · keep both separate. *Agreeing:*
"TOOLS PROVE. GENERATIVE CODE DELIVERS." (as above). *Falsifier:* the generator's output differs from
yours in a way you prefer.

**8. Q205: the generated functions can only read. What does the writing?** ★ Generated write functions,
each behind a guard pair (bank Q400) · writing stays hand-run until C4 is switched on · both, by
run-level. *Agreeing:* your Q400 ruling: "currency tokens are something I thought about but I think the guard pairs are stronger" (`evidence/question-bank-iTNH.tsv:495`). *Falsifier:* a guard pair
cannot restore the value it started from on abort. Worklist Q191 builds exactly that test.

**9. Q206: are the six-level ghostwheel ladder and the five-level kit ladder different things?** ★
Different axes: rename the five "release ladder" and fix the paper that quotes them · keep both as a
deliberate overlap (your "deliberately BOTH", Q203) · merge them. *Observed:* "two ladders in one digit
space; "exactly one" does not hold across both." (`model.md:784`). Fork F104 (cluster 6) is the same
question. *Falsifier:* one digit means the same thing on both ladders at every level.

**10. Q311: the suit order across the two card projects.** card-game numbers the suits spade, club,
diamond, heart, which is not bridge order, and its code depends on that. A backup copy inside dungeon
swaps the pairs. ★ Pin card-game's order and correct dungeon's copy · switch both to bridge order · pass
suits by name across the boundary. *Agreeing:* "that ordering is load-bearing."
(`q/PROMPT-2026-08-04-card-game-queued-patches.md:131`). *Blocks:* Q316, Q317, and any shared card
vocabulary. *Falsifier:* a saved game or a sent card depends on dungeon's order.

**11. Q318: remote editing of your org files.** ★ Listen on the Tailscale address and refuse to start if
it is missing · fall back to this-machine-only · use an SSH tunnel. *Agreeing:* your "don't Columbo my way
back into feature paradox" (`q/TAG/feature-paradox.md:1`), which says reach should come from a design
record, not a patch. The org-vm design record (fork F099, cluster 9) says "tunnel now, Tailscale-bind
later, 0.0.0.0 never". The two agree if the tunnel comes first. *Falsifier:* Tailscale is down at boot
often enough that refusing to start costs you working time.

**12. Q507: should C4 get a memory "seat"?** ★ No seat: C4 keeps its file-based MEMORY.md · mint a seat ·
decide after the door returns. *Agreeing:* your signed project instructions call MEMORY.md "file-based on
purpose; a Cowork per-space memory is a one-reader silo this project must not depend on". That text is in
your project instructions, not in the corpus. *Falsifier:* a collaborator's session cannot reach MEMORY.md
but could reach a seat.

**13. Q172: can one typo flip a "cannot be switched off" guard?** ★ Split the safety-floor list into two
files, so the election tool cannot even name a safety guard · keep one file and add a check · leave it.
*Agreeing:* "a check may be a REFUSAL or a MEASUREMENT, never an ADMISSION"
(`evidence/question-bank-iTNH.tsv:650`). *Falsifier:* a planted typo in the one-file version is already
caught by an existing check.

**14. Q10: must every run-level be able to answer "what changed?"** Hard rule · ★ weaker form: a level
that cannot answer must say so · leave it as your stated lean. *Agreeing:* the deck stops short of the
hard rule (`decks/it-curiosities.deck.md:133`). *Falsifier:* a level that says "I cannot tell" still
misleads a user in practice.

**15. Q78 with Q77, Q80, Q90: the gf-01 guard questions.** All four hang on the open pmo #121 fork: is a
contained party still trusted? ★ Settle them together when #121 is decided · answer them one at a time
now. *Observed:* "#121 is still open" (`h/NOTE-2026-08-19-gf01-frame-fork.md:6`). *Falsifier:* one of the
four matters to a build before #121 is decided.

**16. Q487: a persona row for Brigidt.** She is credited as editor, but she has no row in the personas
list. ★ Ask her first, since a person model needs her own consent line · make the row · leave it.
*Agreeing:* the credit is settled ("Brigidt/Bridgit takes credit as editor (credited as K Smith)",
`MEMORY.md:3064`). The record spells her name more than one way, so her row should use her own spelling.
*Falsifier:* she has already said yes somewhere the snapshot does not hold.

**17. Q459: the machine-side word list.** You wrote: "For H I will look enmass closer to see if i want to
argue with any of your choices." (`evidence/question-bank-iTNH.tsv:594`). ★ Review the H list in one
sitting (the worksheet lane) · accept it as dealt. *Blocks:* registering the adopted corpus words under
your Q208 rule. *Falsifier:* nothing downstream reads the H/K assignment yet.

**18. Q444: rename the card kind "law"?** You said "law is a word that makes me uncomfortable."
(`evidence/question-bank-iTNH.tsv:563`). ★ Rename it to a softer word ("practice" or "elected") · keep
"law" · keep it and add a gloss. *Agreeing:* later practice already says "HOUSE PRACTICE (elected, not
laws)" (`q/PROMPT-2026-08-29-reprompt-lens-drift-unit01-model.md:109`). *Falsifier:* a card kind named
"law" carries a meaning the new word loses. 76 cards carry it.

**19. Q201: naming two maps in one register.** c4.t.t / c4.t.o · ★ c4.t.term / c4.t.org · another.
*Agreeing:* "The short coded names stay as aliases; nobody should have to learn them."
(`d/door/46-his-names-and-folders.part:11`). *Falsifier:* readable names collide in the generator.

**20. Q275: which map the A register uses by default.** A currently falls to whichever file sorts first. ★
Mint `a/a`, following your "LENDING is the pattern" · pin `a/rt` · pin `a/savannah`. *Falsifier:* `a/a`
would collide with an existing address.

**21. Q258: "the letter is the namespace".** A door part still says this, but the tool needed the letter
plus a lookup order. ★ Reword it to "the letter plus its lookup order" · keep it and add a footnote ·
leave it, since the door is down. *Blocks:* bank Q212's answer depends on it. *Falsifier:* no second map
by argument exists in any register.

**22. Q250: UNION appears twice in the U row.** Rename the GROUP-side UNION · rename the SCALAR-side UNION
· keep both as a deliberate seam. There is no ★ here. The bank-sweep lead says fence it ("Duplication of
fact: fence.", `h/NOTE-2026-08-29-bank-sweep.md:19`), but your seam rule warns against closing a real
seam. It is close, and it is yours. *Falsifier:* the two UNIONs are addressed identically by every tool,
which would make it one fact.

**23. Q55: is a token one register letter plus a three-letter operation (1+3=4)?** ★ Register plus
operation · the width is loose · leave it open until the build. *Observed:* the Round-7 notes call it
"his pin" (`journal/SWEEP-2026-07-31-unread-docs.md:34`). Q11, Q31 and Q128 lean on it.
*Falsifier:* a real operation needs four letters.

**24. Q220: are X, Y and Z the three rating dimensions (to you, to C4, to the world)?** Yes · ★ no: C4.md
already gives X, Y and Z other meanings · a deliberate overlap. *Observed:* "X ASSERTION-CONTEXT ... Y
CONSENT-DIMENSIONS" (`C4.md:170`). This is contradiction 2 in (e). *Falsifier:* no tool reads X, Y or Z
as rating ordinals.

---

## (d) The notation worksheet: 24 cards, one sitting in the w0sh lane

These are readings of words and symbols you coined. No later writing decodes any of them, so only you can.
They are dealt as cards in your worksheet lane: type `RULING Qnnn: …` or `SKIP Qnnn`. The first three might
be typos. Your 09-25 rule says to look a word up in your own registers first, so the instrument runs
`ty1ps` on those three before dealing them and puts what it finds on the card. At dial stop 17 the first
seventeen come in one sitting and the rest in a second.

| # | id | the question, in plain words |
|---:|---|---|
| 1 | Q362 | In "no delate across that register", is "delate" a typo for "delta", or a real term? |
| 2 | Q363 | Does "no withstanding usual own-data rules" mean "notwithstanding" (it holds despite those rules)? |
| 3 | Q520 | "transversal" or "traversal" for walking the word registry: across the registers, or along them? |
| 4 | Q337 | What do the register letters d, m and t stand for? |
| 5 | Q302 | b/d and p/q mirror each other only in some fonts. Do they count as mirrors? |
| 6 | Q300 | Even-length names are bindable and odd ones have an unwritten middle. Is that derivation right? |
| 7 | Q297 | Does the mirrored pair ROU3T/T3UOR promise that every route can be walked back? |
| 8 | Q296 | Is S1GL an app's own sigil (its address), or the character that introduces addresses in a stream? |
| 9 | Q375 | QU-RY: what fills the missing letter, and which U and Y contexts are valid? |
| 10 | Q399 | In your snacks example, what is the four-character register address, and how do its letters group? |
| 11 | Q364 | What range or notation does "a..m...M..A" mean in the introspectable tag? |
| 12 | Q365 | What are L1 and L2 for virtual-type stubs (pinned type vs derived display type)? |
| 13 | Q366 | Is "cub" a pinned small form of a chamber/cube cell, or should it fold into chamber/cube? |
| 14 | Q278 | In your sentence about C4_PMAPR and C4_MP5PR, which setting is the default and which overrides? |
| 15 | Q280 | What do "balanced op" and "vm context" mean in your rule about when a map may touch a list? |
| 16 | Q218 | You said C4 sits between K and H "like MVVM". Which MVVM role is each? (K is KEYBOARD, bank Q221.) |
| 17 | Q222 | The seventeen registers have four facets each. Do the nine system letters take facets too? (corrected today) |
| 18 | Q08 | When steps "march in pairs", is the pair a before-and-after state change? |
| 19 | Q83 | Is C4's query language the layer that feeds values into the registration stream at the "meta" moment? |
| 20 | Q88 | What is ASAM (four letters, reads and transforms from run-level 3 up), and at what level may it print? |
| 21 | Q120 | "Arranged a B across any two of the nine": is that the matched pair generalised to any two gates? |
| 22 | Q213 | Every TAG-column word says "under what regime is this held". Is TAG the coordination facet, by design? |
| 23 | Q05 | In the consent path form, is "C0" its own destination, or register C at position 0? |
| 24 | Q45 | Can you correct rows R21 to R25 of the parse worksheet, which could not be parsed? |

Cards 19 to 22 also lean on your 08-03 rule (B1). If you widen B1, they leave the worksheet.

---

## (e) Contradictions found, each with a proposed fix

*Observed* means I or a reader saw it at the line given. Each fix is a proposal.

1. **savane-forensics: embargoed, yet bundled.** "It is embargoed" (`decks/why-bryant-waits.deck.md:151`).
   But the skill sits among the "skills in the bundle"
   (`q/cryptographic-signing-cost-accounting/MEASURED.md:131-132`). Q235's premise, "not shared", is stale.
   *Fix:* decide (c) item 2. Meanwhile the instrument reads the bundled copy, without publishing anything,
   to say whether it holds anything specific to Savannah (worklist Q24). *Falsifier:* the vibrobeast dist
   is private to your own installs, so "embargoed" is already true.
2. **Hidden questions, including one reader B missed.** Q471 row 610 is hidden behind rows 616 and 668.
   *Fix:* B10.
3. **X, Y and Z mean two things.** Q220 and Q137 treat them as rating dimensions. `C4.md:170` gives them
   register meanings. *Fix:* (c) item 24, option "no". Then append a dated line to C4.md, the instrument's
   own file, pointing at the ruling.
4. **J: three statements about one letter.** "**J open** — and Corwin now thinks J may have moved to the
   seventeen." (`C4.md:171`, 08-03). "J is PROPERTY" (Q249, 08-06, `evidence/question-bank-iTNH.tsv:365`).
   "J = TAGS ... removed from the 9, built into the 17" (Q221, 08-30, `:694`). *Fix:* the latest dated
   statement (Q221) stands unless you say otherwise, and the instrument appends a dated pointer in C4.md.
   Fork F088 (cluster 6) asks the same question, so one answer closes both. *Falsifier:* Q221's "per
   facts/the-J…" source says something else. That file is not in the snapshot.
5. **Q01 is marked answered, but its leftover (Q55) is open.** *Fix:* append a note to Q01 that its width
   part lives on as Q55, which is (c) item 23.
6. **K "unbound" (Q218, 08-03) vs K = KEYBOARD (Q221, 08-30).** *Fix:* Q218's premise is stale. Its MVVM
   question is worksheet card 16.
7. **Run-levels: "exactly one" (`model.md:454`) vs two ladders in one digit space (`model.md:784`).** *Fix:*
   (c) item 9.
8. **"Signing belongs to a distributable" vs the signed gen0.manifest.** The review marks it
   "**CONTRADICTED**" (`onward-readiness/review-2026-09-26-onward/PUB-DESIGN-POINTS.md:228`). *Fix:* the gen0
   signature is history (B3), the rule holds from here on, and Q106 closes with that caveat printed beside
   it.
9. **Error rate vs noticing (Q47 vs Q168).** Q168 answers that the counts measure "NOTICING, not erring"
   (`evidence/question-bank-iTNH.tsv:649`). Q47 still proposes a failure *rate*. *Fix:* Q47 (Appendix E)
   is offered with Q168's reading marked as the lean.
10. **Q65 open, while its sibling Q260 is ruled** and the ruled shape has already landed (see (c) item 5).
    *Fix:* recommend the landed shape.
11. **Q412 is "open" yet blessed.** The 09-26 note records your blessing "taking your guesses as best
    available guesses" (`h/NOTE-2026-09-26-composite-context-formula.md:38`), and still says Q412 stays
    open. *Fix:* it closes under B7.
12. **Hyphens.** C4.md still says "**Words as directory names, not hyphen-joined filenames.**"
    (`C4.md:201`). The 09-18 naming balance and your 09-10 "preference, not rule" say otherwise. *Fix:*
    append a dated pointer at C4.md:201, which is the instrument's own file. Q256 already follows the later
    sources.
13. **"The letter is the namespace"** is still in the door part, while Q258 says it broke. *Fix:* (c) item
    21.
14. **"never edit a deck"** (`q/PROMPT-2026-08-29-reprompt-lens-drift-unit01-model.md:111`) vs three asks
    that need deck edits: Q327 (sweep every deck header), Q451/corpus (a card with two "backs:" fields), and
    Q169 (falsifier fields). *Fix:* no deck edits. Put new material in small sidecar files beside the decks
    (a falsifier file per card), and make the two-backs repair a new card that supersedes the old one.
    *Falsifier:* a tool reads only the deck file, so a sidecar is invisible to it.
15. **Draft status.** Q312 asks whether to bless a DRAFT review, but you said "our environment has no
    meaningful concept of *draft* yet" (`MEMORY.md:3109`). *Fix:* it closes under B9 (already MOOT).
16. **The bank's row widths.** 143 rows have 5 fields, 567 have 6, and 5 have 7
    (`awk -F'\t' '!/^#/ && NF{print NF}' … | sort | uniq -c`). Reader B's 568 counted the header line. Q473
    reported this at 120/472/5, and it has grown. *Fix:* worklist Q473, a generated normalized view that
    leaves the bank file untouched.
17. **Answered-by-you rows that are really the instrument's reading** (spot-check: Q49, Q222) **or a rule
    about handling** (the 08-03 rows). *Fix:* the corrections above, and B1 as its own sentence.
18. **R3 is built but still listed open.** `MEMORY.md:3187` lists "review forks R1-R4" as open, yet R3
    (NOTVISIBLE) is built (`MEMORY.md:3176`, per the forks reader). *Fix:* append a dated correction line
    to MEMORY, as worklist F043 does for its own case.
19. **Session close.** Your signed project instructions say "close the rotate way". Your 09-26 words are
    "there's no rotate in here" (`onward-readiness/review-2026-09-26-onward/SPELLS-CONSISTENCY.md:185-187`).
    *Fix:* fork cluster 9. It is your signed document, so you amend it and re-sign.
20. **Names I will not merge.** model.md spells a reader "Eric" (`model.md:776`, the genre question), and
    MEMORY spells a person "Erik" (`MEMORY.md:2481`). They may be two people. *Fix:* ask, never merge.

---

## (f) What the instrument can do without you

There are 46 bank rows marked "needs work". After the 4 that fold into other items, **42** remain, plus
the 4 hidden needs-work questions that B10 re-issues. Together with the forks reader's **62** items of
proceed or owed work, they make one ranked list in `bank-worklist.md`. Each item has an effort (S/M/L),
whether it needs Avalon, the risk to other people, and whether it is safe to do without asking.

In short:

- **Safe to start now, with no host:** the dissertation drafts (Example 2, §VIb, the §II sentence, the
  supervision card), the doubled-nine run and the second-reader pass on Dissertation 2, the guide's
  appendix and MODEL rung, the two RADs' S4 sections, the transport recipe card, the second-user consent
  shape (Q87), and a proposed home for verifiable claims (Q421).
- **Safe, on Avalon:** the fix to pb1ck's first-word verdict (F037), the enrolment MUSTs (F050), the Fork B
  sweep (hashed numbers only, approved by your 09-27 "please proceed"), the behavioural poison probe
  (Q216), the ne1ar and ds2mt printed ceilings (Q239, Q157), the trap test for guard pairs (Q191), the
  bare-call branch (Q219), the sha256 of both wire_mcp.py copies (Q516, touching neither), and the rest
  listed there.
- **Needs your hand or a word first** (a real blast radius, or a file that is yours): the org-c4 `make
  test` target (Q314: the Makefile is yours, so it goes on a one-step card); dungeon's suit copy (Q316,
  after Q311); reading savane-forensics (Q24: the result goes to you only, never published, because
  Savannah is shared custody).

---

## (g) The formal-writing forks, as nine cluster decisions

`writing/execute-brief/tracks/forks-summary.md` groups the 46 DECIDE rows into 9 clusters. Each cluster is one card in
`decisions.json`. Summaries, with the recommended option first:

1. **What leaves the lab, and to whom** (F007, F031, F077, F106, F034, F035, F038, F111, plus bank Q430).
   ★ Publish by default and share with people by name: the essay goes to pub/papers after pb1ck;
   Dissertation 2 goes to Bryant and Alfred marked provisional; the editor persona is introduced; Bryant is
   asked about the fresh-account test (plan A, you run it and he watches); "GIZA not up yet" counts as an
   answer; a/, Z/ and p/ go to GIZA only once it is up. *Agreeing:* "No reason to wait on publication
   moves." (`MEMORY.md:2932-2933`); "More publication on the shelf please." (`MEMORY.md:3008`).
2. **Other people's names, credit and privacy** (F012, F036, F052, F020, F117). ★ R1(b): drop the 17-hunk
   exemption so every nick is pseudonymized, and ship (a)'s one honest sentence in the meantime. Keep
   Bryant's persona hold until Bryant himself says yes. Ask the lab partner to be the second ethics
   reviewer. Flag-only on the garden-names privacy notes. *Agreeing:* "17 is not reached in a multi-user
   context without express consents." (`model.md:78`); "credit people, don't leave them out to protect
   them" (`MEMORY.md:2974`).
3. **Dissertation 1's audience and genre** (F019, F028). ★ The real evaluator is the FSF sysops/Savannah
   reader, reached through named friends first. §IV is grounded, not replaced, after a consent pass on any
   operational history. It is a practitioner essay rather than a thesis. The instrument drafts the reply to
   the outside reader for your pen and diffs the two Google Doc ids. *Agreeing:* passes 1 and 2
   (`h/REVIEW-2026-09-08-dissertation-pass-1.md:139`; `h/REVIEW-2026-09-14-dissertation-pass-2.md:213`).
4. **Keys and signatures** (F033, F049, F068, F116, F103, F102). ★ K1 now. No lab signature bears weight
   unless a named reader or tool reads it. The Z/ pair stays unsigned. The Makefile patch is applied by
   your hand from a one-step card. For git-hold-check, make an outward copy rather than rewriting history.
   GOVERNANCE.md's dangling pointer is noted in model.md only, because it is a two-party instrument.
   *Agreeing:* "One sentence from him settles it" (`onward-readiness/review-2026-09-26-onward/SPELLS-CONSISTENCY.md:218`);
   `MEMORY.md:2746`.
5. **Your words and your numbers** (F001, F059, F080, F082, F078). ★ Keep the thesis sentence verbatim,
   with the two glosses printed under it (Fork A option 1: "It changes nothing he said", essay `:940-941`).
   The 17% gets a stand-in line. The 9%/10% target and the 3 passes stay marked proposed. The three gauge
   definitions (F080, F082, F078) go to the worksheet as three cards, because they are readings of your
   words.
6. **Co-elected vocabulary and registers** (F087, F088, F086, F073, F065, F072, F047, F104, F093, F118). ★
   Deal all ten in the same worksheet sitting as section (d), with the writing's leans pre-marked. Strongest
   loser: delegate them provisionally, as you did the K side (Q461), with an H-side review by you.
7. **Persona and memory mechanics** (F089, F067, F095, F090, F091, F100). ★ These wait for your instruction
   (B11). The writing's defaults hold in the meantime: F9 stays −1, the Mentat index stays packed and is a
   catalogue of the union, and the books sit beside the kits. CORWIN's first mutation waits for your yes.
8. **Licences** (F039). ★ Each part keeps its own licence under TERMS v1: prose is CC BY 4.0, rendered
   instruction blocks are LGPL-3.0-or-later, and one notice line names both. Per-recipient variants stay
   yours. *Agreeing:* TERMS v1 names these defaults
   (`onward-readiness/review-2026-09-26-onward/SPELLS-CONSISTENCY.md:141`, "CC BY 4.0 writing,
   GPL-3.0-or-later code, LGPL linked/composed"). [MINE] This is a low-confidence reading.
9. **Operating instructions** (F040, F097, F099). ★ You amend your signed project instructions to say what
   close-out is now and re-sign them. c4-mcp.js stays a separate mouth until the MCP gap closes. The
   org-vm design record is accepted as written: tunnel now, Tailscale-bind later, 0.0.0.0 never. That
   agrees with (c) item 11.

---

## Two piles

**What I observed** (with its source): the counts in (a) come from `writing/execute-brief/tracks/bank*-reconciled.tsv`, parsed
with `csv.QUOTE_NONE`. Parsed the default way, the bankA file shows 181 rows, because a leading `"` in two
quotes swallows the line breaks. The true count is 184. The spot-check rows and lines are listed above and
in `done.json`. The hidden Q471 is at bank line 610. The bank widths come from the awk command in (e) item
16. Every quote in this file was re-opened at its line with `sed -n` or `grep -n` before I wrote it.

**What I judged:** the grouping into eleven sentences; which 24 questions block most; the ranking in the
worklist; the "recommended" marks where the readers had none (B6 park, B7/B8 split by confidence, B10
option A, fork clusters 5 to 9); and the licence reading. [MINE] All of these can be overridden, and none
of them blocks anything.

**Limits.** [PLATFORM] The snapshot has no `bin/`, most of `facts/`, CLAUDE.md, `Z/`, or
`asc-disposition.tsv`. Every falsifier that needs those says NOT CHECKED. A STILL-HIS row might be
answered in a file the snapshot lacks. The check for that: grep the full tree for the id and its key noun.
[MINE] The spot-check has 17 rows. The error range is wide, and it is printed.

---

## Appendix A · B7: the 58 rows your own words answer

Each row: the question, then the line that answers it. Name any id to hold it.

- **Q12** — Should the resume-pointer file (LABTAIL) be patched without looking first, or should Corwin paste its top first?  
  Answer: `MEMORY.md:118 + MEMORY.md:120`: "("splice a stale NOW instead of asking")" + "Do not hand-splice it: the automation owns that file."
- **Q19** — Is the real signal in a [[...]] message the second element (one valid C4 register or instruction and nothing else)?  
  Answer: `decks/c4-metalanguage.deck.md:31`: "**The signal is the CADR: a CONS tag, which for us may be exactly one valid C4 register or"
- **Q35** — A register token does not say which table it belongs to; should the authority go in the string, in a prefix, or should tokens never leave a context that names their …  
  Answer: `evidence/question-bank-iTNH.tsv:581`: "boundaries are DECLARED, not inferred."
- **Q44** — Can one letter be both a grammar letter and a register letter at once (Y looks like one)?  
  Answer: `evidence/question-bank-iTNH.tsv:366`: "LENDING is the pattern."
- **Q52** — If a user has a two-letter folder at the C4 root that looks like a register address, should C4 forbid it, detect and announce it, or something else?  
  Answer: `evidence/question-bank-iTNH.tsv:646 + evidence/question-bank-iTNH.tsv:687`: "collision used as OPPORTUNITY: celebrate the handy coincidence" + "the registers all really belong to the USER who installs C4"
- **Q64** — One naming family has J but no N, while the main table has N but no J: typo, local swap, or is the set of registers not fixed across contexts?  
  Answer: `evidence/question-bank-iTNH.tsv:364`: "Yup, it's a baseclass for taxonomy as an anchor subject"
- **Q67** — Is the key idea "abilities add up but governance does not, so design the hand-offs between parts rather than the parts"?  
  Answer: `h/LENS-2026-08-30-thesis-formal-back.md:57`: "H: *"the unit of design must be the TRANSITION, not the component … govern the moves between them."*"
- **Q69** — Should the gauge's baseline be where things actually stood on 2026-07-28 (the day the ledger opened), not an ideal?  
  Answer: `decks/shared-gauge.deck.md:170`: "His flat statement of it: **"Instrumentation should be based: in fact it always is."**"
- **Q74** — Should there be a "held card" marker: announce that something is being held back, without saying what, at the time?  
  Answer: `evidence/question-bank-iTNH.tsv:578`: "If AI users have something setup we defer, that should be obvious from the instructions that I make."
- **Q100** — Is an "ungapped universe" really a goal, given that deliberate and earned gaps should stay open?  
  Answer: `evidence/question-bank-iTNH.tsv:578`: "I cannot possibly count the number of things I have considered corrected and decided to hold off"
- **Q103** — Are the guessed folder-to-register bindings right (assets/=A, bin/=P, man/=H, journal/=N, theme/=L, dist/=P, =D)?  
  Answer: `C4.md:254 + d/door/46-his-names-and-folders.part:13`: "directory doctrine: nearly everything in bin/ belongs at c/" + "At install on Avalon they move into register folders"
- **Q105** — COPYING is missing; drop in the standard GPLv3, or does Corwin intend another licence for c4/?  
  Answer: `MEMORY.md:2977`: "clause (c); GPLv3+ in the standard "(at your option) any later version" words; LGPL for linked or"
- **Q107** — Where does the record made before signing live?  
  Answer: `q/2026-09-24-users-pick-ceremonies/PROMPT.md:8`: "track if you have started the build at the released version with a file named for the release and containing the start time"
- **Q112** — In "s->iQi<-s," is Q a count of dimensions, a name for the dimension set, or register Q?  
  Answer: `decks/resolution.deck.md:186`: "> *"Q is effectively a stand-in for some array of S/I pairs the set of which must ultimately"
- **Q122** — Should the two path-walking tools read the .gate files along a path (a shown crossing overrides the letter test; missing falls back to closed)?  
  Answer: `evidence/question-bank-iTNH.tsv:398`: "".gate build is pending turning to ON; STUB .gate ongoingly as target design fluctuates"
- **Q124** — Confirm that "the nine" are the system registers (V = volatile default preference, Q = query/question)?  
  Answer: `C4.md:161 + evidence/question-bank-iTNH.tsv:399`: "> *"the seventeen march carrying work, the nine hold values and force stops"*" + "the nine = b j k q u v x y z"
- **Q125** — J and U have no traceable meaning, K and X barely: fill them in or leave open?  
  Answer: `evidence/question-bank-iTNH.tsv:365`: "I want to leave U where it is"
- **Q131** — Should the volume tool count words and path dimensions (folder = word, filename = dimensions) rather than bytes?  
  Answer: `evidence/question-bank-iTNH.tsv:657`: "each measure must be backed SEMANTICALLY -- it must be INFORMATION, not purely volumetric"
- **Q134** — Confirm: a built-in type has gone all the way round (word, tool, data, gauge, metric, words about the gauge); a user type has only the word; promotion means closing that …  
  Answer: `evidence/question-bank-iTNH.tsv:428`: "in general words come to exist as soon as they are used within our shops growing load-bearing."
- **Q135** — "law" is used 47 times with no tool behind it: is the most-used unmeasured word the next tool to build, or is it just overused?  
  Answer: `evidence/question-bank-iTNH.tsv:428`: "in general words come to exist as soon as they are used within our shops growing load-bearing."
- **Q143** — Z is one of the nine but has no row of four words; its only definition ("a string space working on some named object") lives in a chat message. Write it down?  
  Answer: `d/door/16-fence-is-an-admission.part:14 + evidence/question-bank-iTNH.tsv:662`: "**`Z/` is where he keeps more sensitive material with, under, and for C4.**" + "Z/z is a COUNTED-or-SEALED access ledger"
- **Q144** — Which word should register C lead with (COMMAND, CAPABILITY, COMPILE, COLLECTION)?  
  Answer: `C4.md:253`: "**2026-08-25 — c/ for COMMAND; local reseed; the consing method.**"
- **Q145** — Is there a maximum size for a deck, or is that for the instrument to feel out?  
  Answer: `d/door/48-his-books-from-chapters.part:11`: "chapter is a file." A large formatted document -- a site, a manual, a spell, a book -- is never"
- **Q150** — The instrument named a tool and picked its run-level digit and four facets itself; are those readings right?  
  Answer: `evidence/question-bank-iTNH.tsv:659`: "deliberately BOTH -- run-level AND operand-width."
- **Q164** — Only one tool knows the "digest of nothing"; share one function or build a fourth tool?  
  Answer: `evidence/question-bank-iTNH.tsv:348`: "USE as shared guard, install during build"
- **Q176** — Is the YY pair the place for entitlement (what a user may reach), and does it hold consent records or point at them?  
  Answer: `C4.md:170 + evidence/question-bank-iTNH.tsv:365`: "Y CONSENT-DIMENSIONS" + "stored in Yz or X or Y"
- **Q182** — The word "ring" does several jobs in two decks; is splitting its meanings the next deck?  
  Answer: `evidence/question-bank-iTNH.tsv:723`: ""RING yes, it's a term, of course.""
- **Q196** — The Emacs build is re-fetched to /tmp every session (28 MB, ~8 s); persist it on his disk?  
  Answer: `d/door/32-his-ask-for-it.part:11`: "do not make me reprompt simply to say OK unless you can"
- **Q226** — Does the K (keyboard) / H (host) pair survive, and is its axis certain-vs-ambiguous authorship rather than human-vs-machine?  
  Answer: `evidence/question-bank-iTNH.tsv:658`: "register under H if defensible as a technology term or a very-general-use term of art, otherwise K."
- **Q228** — Is the assembled picture of "assert" right, and does ASSERT get a register or is it a dynamic riding several?  
  Answer: `C4.md:177`: "- **ASSERT = GUARD = GATEWAY = G.**"
- **Q238** — Should "each app can adopt and drop C4 on its own" be a hard requirement before anything goes to Bryant?  
  Answer: `evidence/question-bank-iTNH.tsv:359`: "No reason he should wait."
- **Q244** — "consent" has no register letter even though C4 is named for it; deliberate (it is what the whole table serves) or a gap?  
  Answer: `C4.md:170`: "Y CONSENT-DIMENSIONS"
- **Q260** — Which shell-portability plan wins for the function library (plain-POSIX core with bash-only dotted aliases, or others)?  
  Answer: `evidence/question-bank-iTNH.tsv:285 + journal/LENS-2026-08-05-assembler-paper.md:20`: "POSIX core plus bash shim, per your ruling." + "header now says POSIX CORE + BASH SHIM, underscore names canonical"
- **Q294** — Was using SHA1 (not SHA256) to name addresses under a/R/ deliberate?  
  Answer: `MEMORY.md:748`: "eight delimiters pinned by SHA1 (his"
- **Q307** — Do all 18 non-git projects need to become git repositories before migration, or only a real subset?  
  Answer: `MEMORY.md:2341 + model.md:120`: "git indifference · implicit support where nothing precludes" + "Commit c4 (last commit 2026-09-11; `spells/` is not tracked)"
- **Q313** — org-c4 deliberately listens only on this machine; should remote editing keep that and add reach another way, rather than undoing it?  
  Answer: `q/TAG/feature-paradox.md:1 + MEMORY.md:2536`: "don't Columbo my way back into feature paradox" + "is the correct safety choice and exactly why remote cannot reach it;"
- **Q256** — Should decks/ and facts/ filenames also move from hyphen-joined names to word directories?  
  Answer: `MEMORY.md:2316 + MEMORY.md:2570`: "house conventions are preference not rule, the SHA carries;" + "hyphenated words (accessible, read-aloud-able); the LL#LL form is minted at …"
- **Q279** — Is RING (the default set of signers) a real new type, and does it belong in G for GROUP?  
  Answer: `evidence/question-bank-iTNH.tsv:723`: ""RING yes, it's a term, of course.""
- **Q349** — Adopt Bryant's drop format (manifest, peek-verify-pull) as the shared mailbox format for both gardens?  
  Answer: `MEMORY.md:2736`: "the spells now say reach comes from the run records and the project instructions, and provenance is the"
- **Q356** — Make visual card styling part of the worksheet dealer, or keep hand-built per deal?  
  Answer: `evidence/question-bank-iTNH.tsv:518`: "RULING Q355: teach the register but keep a thin dealer; chips stay per-deal, labeled [Claude-suggested]"
- **Q368** — Where does the invent-computing/ bundle live: dist/, a new register letter, or stay put with a pointer?  
  Answer: `MEMORY.md:3184`: "BUNDLE: README, MANIFEST, Changes, CHECKSUMS (invent-computing shape)."
- **Q403** — Pin as canon: a value stored as its own file needs no cache, same as append-only?  
  Answer: `model.md:54`: "**The file system is the bank, on purpose.** His argument (REFORMAT §2): a database that holds its own"
- **Q412** — What does his routing shape '(H->K || XX)->Z' mean?  
  Answer: `h/NOTE-2026-09-26-composite-context-formula.md:38`: "blessing that, taking your guesses as best available guesses"
- **Q413** — The inbox-drop run-card left one judgement open: install unsigned files through the archive tool?  
  Answer: `model.md:62`: "is required only where the file being replaced is signed (his 2026-09-04 rule)."
- **Q423** — Is late binding (letting the user bind names at the last moment) mainly a freedom question rather than a speed question?  
  Answer: `h/LENS-2026-09-26-freedom-is-the-product.md:11`: "But user freedom is the product in the lens."
- **Q426** — If drift reflection is a beat of the loop (between guess and test), did the drift review understate itself?  
  Answer: `evidence/question-bank-iTNH.tsv:538`: "[DR] on the loop page is DRIFT REFLECTION."
- **Q434** — The project is spelled ccspt but C4 writes csspt in places; fix the spelling or tolerate it?  
  Answer: `MEMORY.md:3007`: "TYOPS ARRAY per WORD, searched Z/ → k/ → h/ (his information first)."
- **Q435** — Three signing methods are live (gpg, sha256 sidecars, ssh-keygen); must every report say which one it quotes?  
  Answer: `q/PROMPT-2026-09-04-as4ce0002-ccspt-experiment-seat.md:116`: "the tensions related to signing tend to play out in stagnation; when we make something worth signing we will refactor if we must to do it"
- **Q436** — Should the reserved-words list carry an alias column for known misspellings (ccspt|csspt)?  
  Answer: `MEMORY.md:3007`: "TYOPS ARRAY per WORD, searched Z/ → k/ → h/ (his information first)."
- **Q448** — Use the 1-2-4-9-17 dial stops for dealing cards, always showing depth?  
  Answer: `evidence/question-bank-iTNH.tsv:568`: "the 1,2.4,9,17 etc one was pretty good. The UI is better on this"
- **Q451** — The Qnnn numbering is a sequence he ruled against; give banked questions names plus dates instead?  
  Answer: `evidence/question-bank-iTNH.tsv:579 + evidence/question-bank-iTNH.tsv:611`: "is yet another invention in terms of being a way to batch up things that you have invented to talk about me with" + "Names (plus dates if …"
- **Q455** — Two sessions edited the same file at once and one edit silently vanished; how should shared files be written?  
  Answer: `MEMORY.md:3175`: ""there's no rotate in here. please write while I catch up.""
- **Q474** — Only 'drift' and 'lens' connect two C4 instances; everything built lives inside one. How do instances talk?  
  Answer: `model.md:45`: "the third actor is the egress, which is the solutio"
- **Q477** — A graph for a person should use that person's words; keep the stable relation machine-side and the wording person-side?  
  Answer: `h/NOTE-2026-09-26-composite-context-formula.md:39`: "considering the H/K dichotomy foremost during authoring seems"
- **Q479** — Use David (DD-B) as a second reader for the frameworks paper?  
  Answer: `MEMORY.md:3114`: "DD-B: publish; the friendship isn't secret, and he'll take"
- **Q490** — C4 must not become required infrastructure; prove it by a second persona provider that does not need a C4 tree?  
  Answer: `MEMORY.md:2782`: "and named the archive `Z/c4/NarrativeInstructionsets_2026`; the coming unit test is that skills alone"
- **Q515** — Is the signed hold list the lab-partner export embargo manifest he mentioned?  
  Answer: `MEMORY.md:2357`: "re-signs (he re-signed `h/git-hold.list` with my lines back"
- **Q519** — 'Mentat' has been a byline in his dungeon repo since June; what does the name mean for the memory skill?  
  Answer: `MEMORY.md:2477`: "**Mentat, narrowed by his ruling.**"


## Appendix B · B8: the 61 rows the later writing answers

- **Q16** — Does "champagne" mean "spend the next check where the record says unverified"?  
  Answer: `facts/README.md:18`: "spend the next verification where the gate-state says *unverified*, not on what's"
- **Q20** — Does the hyphen = machine / underscore = human naming rule apply only inside [[...]] messages, or to every name C4 uses?  
  Answer: `README.md:149`: "**A hyphen in a name is an avowal that a machine had a hand in it.**"
- **Q27** — Should the plain file c4/MEMORY.md be the official memory for this lab, above any app-based memory store?  
  Answer: `MEMORY.md:138`: "filed here, not in the Cowork silo"
- **Q30** — If something announces its own missing parts, it also announces a weakness; should "degrade honestly" limit what it discloses?  
  Answer: `decks/disclosure-practice.deck.md:134`: "**announce the CLASS of what is missing, not the specific capability that is gone.**"
- **Q42** — Should we start collecting numbers pinned to named registers, for comparing tools?  
  Answer: `evidence/question-bank-iTNH.tsv:432`: "s/ seeded with three real one-file-per-measured-value scalars"
- **Q43** — Are there faster-changing registers outside the main table of 17?  
  Answer: `evidence/question-bank-iTNH.tsv:399`: "the nine = b j k q u v x y z"
- **Q48** — The instrument's errors are counted by Corwin but his are not counted at all; should the shared number carry that caveat?  
  Answer: `evidence/question-bank-iTNH.tsv:649`: "counts measure NOTICING, not erring"
- **Q49** — The gauge keeps its first nine versions; is that nine the same as the other nines in C4, or unrelated?  
  Answer: `magic-number-theory/ESSAY-2026-09-26-magic-number-theory.md:13`: ""Proposed: magic numbers apply when we should count: applying them when counting is a byproduct is an"
- **Q56** — The five-tumbler lock: is it the order of values (C4.md) or the run-level ladder (steering notes), or are these two different locks with one name?  
  Answer: `model.md:454`: "**Run-levels 0..4 ARE the tumblers.**"
- **Q57** — Where is c4.sh (called "the real thing"), and should the new tools fold into it?  
  Answer: `decks/ghostwheel-idiom.deck.md:99 + d/door/46-his-names-and-folders.part:9`: "**`c4.sh` is 17 bytes and contains a typo**" + "Call tools by their readable names through the one entry point"
- **Q68** — The bet: if you govern A->B and B->C, is A->C governed too? If not, the thesis fails.  
  Answer: `h/LENS-2026-08-30-thesis-formal-back.md:59 + q/universes/microscope-2026-09-17-four-under-one-lens.md:357`: "the fix does not propagate, so it recurs at every seam." + "and when a person has tensioned the seam into motive-agreement"*, measured in …"
- **Q71** — Is it right that abilities combine because they carry no motive, governance doesn't because it does, and a hand-off is where two motives meet?  
  Answer: `h/LENS-2026-08-30-thesis-formal-back.md:42`: "C: capability is **motive-neutral** — it is exactly the part of a governed act that survives"
- **Q75** — Corwin described a third, SQL-like unnamed language that brokers between the other two; what is it?  
  Answer: `MEMORY.md:1556`: "default languages (ASSY · META/LISP · C4QL · composite org · FIFTH open as Q358),"
- **Q95** — Should the check for stale and orphaned material run automatically at the start of each session?  
  Answer: `MEMORY.md:412`: "orphans 20 = c4prime's own"
- **Q106** — In the five-letter operation order "clean start signa await finis," does signing after start mean a signature vouches for something running, not something sitting on a …  
  Answer: `onward-readiness/review-2026-09-26-onward/PUB-DESIGN-POINTS.md:228`: "signing belongs to a distributable"
- **Q111** — What is TC4?  
  Answer: `journal/ANALYSIS-2026-07-31-ai1-as-specimen.md:35`: "That is the transmissibility claim (TC4) tested outside the lab"
- **Q115** — In "vacation time (A/B driven by GAGE back to WEBSITE)", is A/B the A and B registers, or A/B testing?  
  Answer: (no line cited; A/B testing became real work later (h/MODEL-2026-09-19-variable-strength-ab-instrumentation.md), which favours the …)
- **Q146** — How does Corwin record accept/refuse on a card without a tool editing the deck?  
  Answer: `evidence/question-bank-iTNH.tsv:518`: "RULING Q355: teach the register but keep a thin dealer"
- **Q148** — The ratio of camped, coined and borrowed words slides smoothly with no natural break; report the raw ratio, or does Corwin set the boundary?  
  Answer: `magic-number-theory/ESSAY-2026-09-26-magic-number-theory.md:341 + magic-number-theory/ESSAY-2026-09-26-magic-number-theory.md:982`: "A monotonic slope with no plateau ... So 10 was picked from the middle of a" + "you are entirely correct on all three counts, these are …"
- **Q149** — What does a C4-coded name buy that a plain "c4" prefix does not?  
  Answer: `decks/ghostwheel-idiom.deck.md:42 + decks/word-load-bearing.deck.md:106`: "**This closes Q149 properly.**" + "**The prefix protects the word. The code makes the name data.**"
- **Q155** — For integrity-only sharing (the Bryant case), what is the actual artifact: a manifest beside the share, one checksum, or tool output, and does it travel with the files?  
  Answer: `MEMORY.md:3184`: "BUNDLE: README, MANIFEST, Changes, CHECKSUMS (invent-computing shape). sha256sum -c CHECKSUMS OK (47 files)"
- **Q167** — Are "the morality guard" in his instructions and the ethicsminions skill the same thing under two names, or two things?  
  Answer: `h/MODEL-2026-09-04-person-intrinsic.md:41`: "magic-word-reachable bundle that elects guards: Mentat, the minions, the morality guard,"
- **Q185** — About a quarter of cards are reachable only by typing their path; that "wormhole" came from a naming choice nobody revisited. Fix it?  
  Answer: `evidence/question-bank-iTNH.tsv:691`: "a wormhole row is instrument friction -- log, dont chase"
- **Q199** — Mentat is a memory persona here, and also names a cell-rendering system in his dungeon repo; one thing with two jobs, or two things sharing a word?  
  Answer: `MEMORY.md:2416`: "The name has meant *formalizer with"
- **Q229** — Which universe governs: A (K = keyboard, H = host) or B?  
  Answer: `h/NOTE-2026-08-29-bank-sweep.md:43`: "**Reading: A governs; B is a kept loser and is already correctly homed.**"
- **Q242** — The "path to glory" note said the vocabulary was least sendable; he says the words are what make people ask questions. Revise it, or keep it as superseded with this as …  
  Answer: `model.md:457`: "**Losses are KEPT, never discarded**"
- **Q246** — Taxonomy words and his explaining words share zero overlap; close as expected by design and keep the gauge (a rise would signal drift)?  
  Answer: `h/NOTE-2026-08-29-bank-sweep.md:70`: "**Reading: close as CONFIRMED-BY-DESIGN**"
- **Q295** — What alphabet and length make up a 'bindable address' in the four-character range?  
  Answer: `evidence/question-bank-iTNH.tsv:676 + onward-readiness/review-2026-09-26-onward/C4-BROWN-MAP.md:309`: "so the address alphabet is 36 (case-insensitive alphanumerics, RFC 1345), not 62" + "lists the bindable address space into `a/R/`"
- **Q304** — Should the build-time 'pivot' value be write-once by refusal (the tool refuses a second write) rather than by convention?  
  Answer: `h/LENS-2026-08-30-edrx-mathforward-boards.md:148`: "`sign↓/bless↑ over a write-once pivot` instance already in hand"
- **Q429** — Tools whose tests live inside the tool itself cannot be mutation-tested; should tests always sit in a separate file?  
  Answer: `q/PROMPT-2026-08-29-reprompt-lens-drift-unit01-model.md:109 + MEMORY.md:1991`: "HOUSE PRACTICE (elected, not laws): HIGH-GLOSS (survive sh h/gloss.sh); tests in a SEPARATE" + "h/knit-tests.sh SEPARATE per Q429."
- **Q472** — The m0ve axes table is really two tables (flat rows and graph rows); give it two shape descriptors?  
  Answer: `evidence/question-bank-iTNH.tsv:584`: "m0ve-axes.tsv is now a BUILD PRODUCT: 139 rows split into h/axes/"
- **Q484** — He named a drift: over-analysing a problem instead of writing it up for a reader; should that be measured?  
  Answer: `q/retention/palace/pins-prove.md:19`: "a family of cheap, standing ratios that turn a vibe into a number: **framework-mentions per"
- **Q495** — A published page cannot send anything back into the tree without someone retyping it; design the return path?  
  Answer: `evidence/question-bank-iTNH.tsv:643`: "artifact return path built 2026-08-29"
- **Q259** — Use underscores in shell function names so the library loads on plain POSIX shells?  
  Answer: `evidence/question-bank-iTNH.tsv:285 + journal/LENS-2026-08-05-assembler-paper.md:20`: "POSIX core plus bash shim, per your ruling." + "header now says POSIX CORE + BASH SHIM, underscore names canonical"
- **Q263** — His 2024 pipeline notes want a pipeline you can read as a drawing and run as a config; is that the next instrument to build?  
  Answer: `journal/LENS-2026-09-10-depiction-survey.md:54`: "turns the drawing into an **executing** POSIX"
- **Q264** — The POSIX-core-plus-bash-shim function library landed and runs on dash, bash and busybox; ratify the shape?  
  Answer: `journal/LENS-2026-08-05-assembler-paper.md:20`: "header now says POSIX CORE + BASH SHIM, underscore names canonical"
- **Q265** — Is 'relay' (column 3 of the R row) still a live word for him, since it is missing from his 2026 writing?  
  Answer: `MEMORY.md:232`: "Deployed relay outranks every document."
- **Q273** — Is 'depiction' the right name for the fourth thing (after naming, addressing, composition) that shows the shape of a pipeline?  
  Answer: `journal/LENS-2026-09-10-depiction-survey.md:3`: "Fork E.12 ruled (option b): depiction gets its own paper, split out of"
- **Q289** — Store drawing exits (edges) as one file per edge or as one edge table?  
  Answer: `evidence/question-bank-iTNH.tsv:678`: "kept the edges (g/edge.<name>, FROM DIRECTION ROLE TO)"
- **Q290** — Can a drawing actually run (become a working pipeline), and should that be proved before building a viewer?  
  Answer: `journal/LENS-2026-09-10-depiction-survey.md:54`: "turns the drawing into an **executing** POSIX"
- **Q301** — Reproducible hashes catch drift between honest parties; signatures catch strangers. Keep the two apart?  
  Answer: `decks/signing-attaches-at-the-door.deck.md:62`: "**material shared with a named collaborator who owes nobody a publication**"
- **Q309** — Should dungeon get a row in the project roster, and is the card/room vocabulary its own turn?  
  Answer: `MEMORY.md:2893`: "five real projects rostered from disk (dungeon-roguelike,"
- **Q324** — Is the org file (man/c4.org) the canonical manual, with Markdown a derived view?  
  Answer: `README.md:166`: "The manual — `man/c4.org` — is the guided walk; this file is only the doorstep."
- **Q325** — Should the README's first rung name tools (c4prime, fi1nd, the manual)?  
  Answer: `README.md:157`: "## Your first three commands"
- **Q326** — The four-freedoms numbering rested on a paraphrase because gnu.org would not fetch; confirm the text?  
  Answer: `journal/LENS-2026-09-09-assembler-repass.md:26`: "**all three now fetch"
- **Q345** — How many persona-taxonomy example pairs beyond the starter set (science/humanities x industry/art)?  
  Answer: `MEMORY.md:2300`: "6 domains × 4 tables × 6 rows, each trait ≥3 formal sources + 1–2 flair"
- **Q373** — What does the digit inside tool names (w0sh, do0r, se2am...) encode?  
  Answer: `onward-readiness/review-2026-09-26-onward/PUB-DESIGN-POINTS.md:48`: "The middle digit of a tool name says how far it reaches"
- **Q377** — 'Generative code' collides with pmo's ordinary 'Generated by'; is 'dropped' the right replacement?  
  Answer: `d/door/22-his-seam-tools-prove-claim.part:20`: "**TOOLS PROVE. GENERATIVE CODE DELIVERS.**"
- **Q383** — When a user changes what a word means, keep both meanings with dates rather than replace?  
  Answer: `MEMORY.md:2596`: "nothing collapses — a"
- **Q385** — Should a consent grant record exactly what it covers, so a change beyond it shows up as a difference?  
  Answer: `MEMORY.md:3048`: "version change is a gauge, not a gate."
- **Q393** — Plan the synthesis by shaping pairs of options instead of ranking winners?  
  Answer: `evidence/question-bank-iTNH.tsv:506`: "wave 1 complete -- 8 falsifiers, 0 parked, and the wave found more about the tree than about the options"
- **Q394** — Name the lab folder .c4lab, mark each mutant tree with a .MUTANT file, and refuse runs in the real tree if one appears?  
  Answer: `evidence/question-bank-iTNH.tsv:505`: "WHERE .c4lab-wave1/ ACT read these before wave 2."
- **Q407** — Guards keep checking the cheapest thing (e.g. only a trailing newline) instead of what they claim; name this class?  
  Answer: `MEMORY.md:3168`: "pb1ck verdict says 'CLEAN of what was checked -- NOT checked: ...' wh"
- **Q447** — m0ve is the Cube with the reality dial stuck at one end; add the dial?  
  Answer: `evidence/question-bank-iTNH.tsv:607`: "THE DIAL IS LIVE ON THE SHIPPED CORPUS NOW."
- **Q466** — The meme-generator claim fails only on output, so the design is right and the meme is the next thing to build?  
  Answer: `MEMORY.md:2758`: "cut to documents / memes / phonemes"
- **Q478** — What would fans of nine architecture frameworks scold C4 for, and which scoldings should change what we do?  
  Answer: `MEMORY.md:3116`: "Published: papers/nine-frameworks-four-point-lens (CLEAN, CC BY)."
- **Q482** — ISO 42010 got to the lens idea first ('every view needs a stakeholder and a concern'); how do they differ?  
  Answer: `MEMORY.md:3116`: "Published: papers/nine-frameworks-four-point-lens (CLEAN, CC BY)."
- **Q489** — In a values rotation, keep each verdict separate and unmerged, with his last and no summary privilege?  
  Answer: `evidence/question-bank-iTNH.tsv:559`: "VIBE@mutate2.beat1.optout1"
- **Q500** — Is edrx's thesis required to understand C4?  
  Answer: `MEMORY.md:3158`: "method origin = his seam thesis, not edrx"
- **Q501** — What shape and home should the guard-floor list have (table in evidence/ or prose in facts/)?  
  Answer: `model.md:471`: "## The guard floor (`guard-floor.tsv`)"
- **Q514** — Is the outward share a filtered branch, a share copy, or the repo itself with held files removed?  
  Answer: `model.md:798`: "held paths need his `git rm --cached` + `.gitignore` or an `sc3dm` outward copy"


## Appendix C · B9: the 19 overtaken rows

- **Q13** — Is the proposed log record format (timestamp, sequence, actor, type, level, text; big items stored as blob+hash) right?  
  Answer: (no line cited; c4log appears after 2026-07-31 only as a past design reference (decks/known-impossible.deck.md:66, …)
- **Q14** — Build the log tool's "where" command now, or settle the record format first?  
  Answer: (no line cited; same as Q13: no c4log build appears in later writing)
- **Q18** — Is the GIZA archive on drive H: the "attached backup" Corwin meant?  
  Answer: `MEMORY.md:149`: "copied byte-faithfully from the old-GIZA archive"
- **Q26** — Does a claude.ai project memory exist for the SAVANNAH project, and is it synced into the project cache?  
  Answer: `MEMORY.md:5`: "Memory in this"
- **Q29** — Should the ethics and skill-spotting helper passes ("minions") be run this session?  
  Answer: `MEMORY.md:2261`: "EM run (read-only): 2 NOTICEs"
- **Q36** — Should a c4/README be written as the first step a newcomer can take into the tree?  
  Answer: `README.md:1`: "# C4 — Collaborative Consent Continuity Controls"
- **Q37** — Should a manual page define the card fields, including what the verdict "CANDIDATE" means?  
  Answer: `c/wf:57 + onward-readiness/review-2026-09-26-onward/refs-core.txt:174`: "CANDIDATE until the keeper" + "man/deck-fields.md:card"
- **Q46** — Confirm four parse rules (first group length is the magic number, last token closes, resolve right then left, fail early) so a parser can be written?  
  Answer: `q/PROMPT-2026-08-29-reprompt-parallel.md:21`: "| `assy.sh` | the house tokenizer; round-trips 12 real tree files byte-exact | 14/14, 3 planted sabotages | 2 survivors |"
- **Q60** — c4.sh is not where it was said to be; is it in SAVANNAH, an archive, or gone?  
  Answer: `decks/ghostwheel-idiom.deck.md:99`: "**`c4.sh` is 17 bytes and contains a typo**"
- **Q63** — Was c4.sh ever committed, does it still exist on Avalon, and should it be committed?  
  Answer: `journal/FINDINGS-2026-07-31-c4fn-clone.md:16`: "`c4.sh` was NEVER in this repository"
- **Q72** — Did Corwin notice that guard gf-01 is already a case of the general "moral load flips across domains" law he named later?  
  Answer: (no line cited; an observation rather than a decision; the general law now ships as the fantasy-operational-boundary skill, and gf-01 …)
- **Q96** — Should the free-form "kind:" field on cards move onto register letters and facets?  
  Answer: `evidence/question-bank-iTNH.tsv:555`: "path carries the taxonomy"
- **Q98** — Should Corwin reread the orphaned guarded-visibility deck, where this whole line of work began?  
  Answer: (no line cited; guarded-visibility has since become an installed skill (vibrobeast:guarded-visibility); the reread ask is overtaken)
- **Q235** — The minions flagged savane-forensics as worth sharing but unshared, and four memory themes with no skill; act?  
  Answer: `q/cryptographic-signing-cost-accounting/MEASURED.md:132`: "`rolls`, `savane-forensics`, `shelf-check`, `skill-sign`, `verify-say`:"
- **Q257** — Should we stop choosing between the 17+9 and 19+7 letter arrangements, since no tool reads the difference?  
  Answer: `MEMORY.md:738 + h/ESSAY-2026-09-18-basename-taxonomy.md:124`: "Q249 RULED: J is PROPERTY, third persistence class" + "the arrangement is a dictionary question wearing an architecture question's clothes."
- **Q293** — Is the game the thing to send Bryant?  
  Answer: `MEMORY.md:2309`: "to-bryant/DRAFT-2026-09-10-foaf-explainer/c4-for-bryant.html"
- **Q312** — card-game's security review is marked DRAFT; bless it before or after the patches land?  
  Answer: `MEMORY.md:3109`: "His word: our environment has no meaningful concept of *draft* yet."
- **Q418** — Adopt the C2-prime cut as the standing gate for the ON turn?  
  Answer: `MEMORY.md:2750`: ""release candidate" = door CURRENT, every"
- **Q503** — The folder picker showed no path or purpose, so he picked a blank folder; how to fix?  
  Answer: `h/ENHANCE-2026-09-04-queue.md:25`: "or the picker was used) · memory `verify-mount-access-fresh-per-session` · bank Q503 ·"


## Appendix D · the rows under B1 to B6 and B11, with their questions


**B1 · covered by the 08-03 rule**

- **Q21** — What does a "bare" C4 root folder mean?
- **Q23** — Should "two tools in one turn may mix prose-with-markup and C4 assembly" be a fixed rule or stay a lean?
- **Q31** — Do C4 names run from most specific on the left to least specific on the right, so they can be shortened by cutting from the left?
- **Q39** — Is "A is for AWESOME" a fifth memory hook for the letter A, or just a passing phrase?
- **Q40** — Are C4..4C and OKC4..C4OK matching open/close markers (one for a draft envelope, one for an accepted one)?
- **Q41** — In the RESERVED example line, which piece is the real signal?
- **Q51** — Are upper/lower case, left/right position, and mirrored markers one way of showing direction, or three separate ones?
- **Q53** — Does "X at Y" (first = subject, second = context) hold for every pair, or only when the second part is a ground like TEST?
- **Q54** — Is "X at Y" the same direction idea as left=take/right=give and as letter case?
- **Q61** — If "find" is dropped from the four-letter operation set, is the "about five tokens each" symmetry broken, i.e. was that count a rule or just a description?
- **Q62** — In "decompose along the m->i<-t spaces," do m and t feed the index (i) from both sides?
- **Q89** — Is "output costs more than transformation" a law, or a coincidence of C4QL's levels?
- **Q94** — Does "second-char" mean the AI sits in second position relative to the real user?
- **Q113** — "-i..+i fixed dimensions referenced by name which may be integer": are the names integers, or do integer names become a dotted suffix on the path?
- **Q114** — Is "job-sharing" two keepers on one value, or one keeper serving two pivots?
- **Q128** — Is "INTO p AS ELCI" legal, mixing a four-letter and a two-letter operation in one statement?

**B2 · signing with no named reader**

- **Q33** — Should the imported ai1 model-ID document be signed (it asks for a separate signature over a content hash)?
- **Q154** — Should the 12 signed CANDIDATE decks stay signed, or was signing them a habit worth dropping?
- **Q159** — The deck page is rebuilt every run so it cannot hash itself; sign the output separately at publish time, or leave it?
- **Q163** — Before signing a whole set at once, ask whether any member could later become questionable; make that a release-runbook gate?
- **Q348** — Pin the stance: signatures are for maintainers and machines; users get receipts, quiet checks and one familiar gesture?
- **Q494** — A running-record pointer file has two auto-splices and a re-sign owed; fold both in a real close?
- **Q499** — How do we decide whether a file is worth signing, instead of arguing it again each time?

**B3 · no gen1**

- **Q02** — Is the first column of the "which cards go in generation 1" sorting table right, or were cards put in the wrong pile?
- **Q07** — Is signing a generation's list of files the same act as "minting a universe," or does a generation cut across several universes?
- **Q09** — Does the reworded "turn question" hold up, and is the guard design filled in correctly?
- **Q109** — The gen0 files were sealed three run-levels early; leave them as history?
- **Q119** — Confirm: MANIFEST (generated, candidate) becomes GEN0 (installed, last good) by a rename, and the number rotates instead of climbing?

**B4 · report-only**

- **Q252** — [report] 'noun table' was an invented label with no basis; the second question answers itself because c4init already invites renames.
- **Q262** — [report] His 2024 vocabulary and ours share only 3 of 123 words; the reconcile decision was tied to Q208.
- **Q305** — [report] A July tool and an August notation agree without anyone reconciling them.
- **Q404** — [report] Wave 1 found two defects in the instrument's own standing answers; read before wave 2.
- **Q405** — [report] Every wave-1 option failed the same way (prose far exceeds running code); is that one finding?
- **Q424** — [report] Making underscore the surface form is not a rival design; it removes the axis the question is about.
- **Q428** — [report] A mutation-testing harness (gloss) was built; suites were 50% effective, then improved.
- **Q443** — [report] The fragment tool was built: 435 cards into 2,173 one-word files, with a case-collision guard.
- **Q453** — [report] Pilot: the m0ve axes table became a generated output from small files; round trip verified.
- **Q454** — [report] The first round trip found the hand-written table was ragged, not the tool.
- **Q457** — [report] Separating taxonomy values into their own folder level prevented two name collisions ('what', 'who').
- **Q464** — [report] The lowest layer (single characters named by code point) was already built in a/CHARS.
- **Q465** — [report] Testing 'C4 is a meme generator': 10 of 11 parts present; the meme itself was missing.
- **Q469** — [report] Tests for the meme checker were built (15/15, two independent paths).
- **Q481** — [report] The nine-frameworks paper was drafted.
- **Q485** — [report] The deliverable for David (the lab paper, CC BY / GPL) was drafted.
- **Q509** — [report] A persona traits grid (144 traits, sourced) was built.

**B5 · unfinished sentences**

- **Q15** — Corwin's sentence broke off at "why the file would be un—": what was the missing word?
- **Q22** — His sentence "consider a first-turn system all every rule" is incomplete: did he mean a first turn must satisfy every rule?
- **Q81** — Was the gate function originally named "for", or was that a slip?
- **Q101** — His sentence stops at "cumulatively weighted toward stagnation but" — but what?
- **Q116** — In his long sentence about M, W, Z, Y and XX, what does "branded" mean mechanically?

**B6 · tools nothing calls**

- **Q303** — Is the five-character V?M?S pattern the same tier and rule as ix0xi, with M as the unwritten middle?
- **Q308** — Which project should the project-onboarding tool (c4rp) run on first: org-c4 (has a test oracle) or card-game (the one to show Bryant)?
- **Q276** — Is a 'stage' (a C4 build carrying its host's details) the right unit, and are count / read / sealed the right three reading levels?
- **Q319** — The gauge counts 143 ledger rows where a snapshot said 14; which rows should the number mean?
- **Q320** — The deck-link tool (ed1ge): are deck-to-deck edges the right grain, and is the coined name acceptable?

**B11 · persona forks**

- **Q508** — The persona program was misapplied twice and is now gauged; rule the four forks?
- **Q518** — The persona kits were planned; rule the forks (low-first entry, Hench/Mench name, watcher contract home, middle rungs)?

**B10 · the hidden questions (re-issue)**

- **Q451/corpus** — [shadowed by a later row with the same id] A deck card carries two 'backs:' fields, so the fragment tool merges them into one blob; merge into one field with two owners?
- **Q452/gloss** — [shadowed] The mutation tester can only break 'exit' refusals, so it cannot see refusals in sourced libraries that 'return'; extend it?
- **Q453/gloss** — [shadowed] Registering one tool with the mutation tester needs edits in two lists in one file; turn them into one small table he can edit?
- **Q454/vocabulary** — [shadowed] The claim gauge counts test wording ('the tool must refuse') as authority wording; split the two senses?
- **Q467/fragments** — [shadowed; id later RULED on a different question] Should the personas list become one folder per person (rows cannot hold sub-parts)?
- **Q470/m0ve** — [shadowed] His ink rule splits rows three ways; the 'definitional' rows went to pencil by default. Which should they be?
- **Q472/sessions** — [shadowed] The bank has the same id-collision problem the ledger had: Q467, Q468, Q469 each mean two questions. Fix the bank's ids?
- **Q473/naming** — [shadowed; was Q469] Does m0ve now earn the word 'cube', since it runs the same dial?
- **Q450/fragments** — [shadowed; id later RULED on the build-log gauge] The fragment tool cannot rebuild files byte-for-byte; stop claiming a round trip?
- **Q471/taxonomy** — [shadowed; found 2026-09-27] Build the number "point five" from the captured character set (a/CHARS + a/NUMERALS) so the ink level names the number, not just the word …


## Appendix E · the other 80 questions that are yours, not blocking

These can ride the worksheet lane in later sittings. Grouped by topic; where a reader marked a lean, it is shown after ★.


**registers & naming** (21)

- **Q34** — Is "mdl.bru.st" acceptable as the domain suffix for model IDs, or should it change? ★ park until model IDs are actually published (nothing later uses the suffix)
- **Q110** — Is the six-item root (README, COPYING, SIGNATURES, .c4, .gitignore, gen0.manifest) right, with the rule that a stranger reaches it without crossing any gate? ★ revisit at install using man/names-and-folders.md (gen0.manifest already moved into gen0/)
- **Q117** — Should three root files that belong to M (model.md, MEMORY.md, SESSION-MAP.md) move under m/? ★ decide at install, in man/names-and-folders.md
- **Q123** — COPYING and AUTHORS as "registered and filled, inert" files: does that want a read-only gate policy, or a separate inert marker? ★ decide with the real .gate at switch-on
- **Q136** — If a roll wipes user types, should it leave the usage count behind as a receipt? ★ yes, keep the count as a receipt
- **Q156** — Are the four corners named right: private tool, machinery, teaching word, central? ★ keep the four names
- **Q174** — Should names made only of register letters (like HAND) be a fourth naming class, "ASSEMBLY," exempt from the camping check? ★ yes, add ASSEMBLY with an explicit intent marker
- **Q183** — Most vocabulary use is in the instrument's commentary, not the claims; is a term that lives in commentary one we discuss rather than build with, and should … ★ add face/back counts as a column, unweighted
- **Q204** — Should an alias be stored as data (a row in register I), never as a definition or in the generated API? ★ ratify (aliases are data at I)
- **Q11** — Is "iTNH" the right register name for this question bank, or would he rather leave a slot blank (iT_H)? ★ keep iTNH (in use for two months; the file is named for it)
- **Q483** — Adopt the published term 'bounded context' (Domain-Driven Design) for what C4 calls a 'reservation'? ★ keep 'reservation' and add 'bounded context' as a mapped alias
- **Q248** — A word not yet ready for full status gets an empty placeholder of its own kind; may we apply that to the 13 words that have no home? ★ home the 13 in the word-path registry g/<word>/ built 09-24
- **Q336** — Pin 'marching pairs' as the name for paired step-by-step guards? ★ pin it as one instance of the two-point (two readers) shape
- **Q340** — Does the pair-corpus take 'the rich vein' as its proper name? (zero urgency)
- **Q359** — When word meanings get linked to the base table, should new scalar registrations be required to carry the link? ★ require the link for new ones, old stock grandfathered
- **Q360** — What label marks a card's kind as not-yet-law (a guessed tier)?
- **Q390** — Do the names 'retrace' (proposes a reversal) and 'amend' (additive record) work, and does amend need a register letter? ★ take both names, no new letter
- **Q392** — The word 'word' is still marked open while 28 facts rely on it; adopt it? ★ adopt 'word' as the fallback type
- **Q395** — Treat plurals as links in the word-affinity table, with a check that refuses a twisted (torsional) trigger at mint time? ★ build the mint-time check
- **Q398** — Is the plural map's job to resolve addresses (snack to SNACKS) rather than tidy vocabulary? ★ yes, a resolver lookup
- **Q427** — How do 'Called Shot' (the shippable name) and 'Diacritical Dynamics Analysis' (his lab name) relate: one method at two levels, or two scopes? ★ one method, two registers (shippable vs keeper's name)

**writing & forms** (17)

- **Q03** — Should the "accountability first" doctrine live on the safety floor list, in Corwin's personal principles file, or stay a card deck? ★ stay a CANDIDATE deck until installed by hand (per the Q137 two-tier ruling: law is …
- **Q28** — Should there be a "worst-case scenarios" card deck, one card per scenario, used to review each proposed approach for disclosure, consent, guard and proof? ★ drop it (no later writing asks for it; later work went to eclipse passes and lenses …
- **Q66** — The ghostwheel repo tags commits with register letters; should c4/ do the same? ★ leave optional (the door's attribution rule keeps who-did-what in logs, not prose)
- **Q86** — Is the Learning Center's list of tests right (turn scope, reachable-but-unvisited, pockets and return doors, count of held cards, the known-impossible set)? ★ keep the list but drop "held-card count" (he refused held things as a count, bank Q73)
- **Q99** — When a deck is promoted to a skill, must it leave a link back in the tree it left? ★ yes, required
- **Q151** — Feedback files: one new file per session kept forever, or one rolling file? ★ one file per session, named by date (keeps who-said-what-when; matches the later …
- **Q152** — Link every occurrence of a vocabulary word in card text, or only the first per card? ★ first per card
- **Q161** — Cards use 16 different verdict words that nobody can rank; collapse them into an ordered set, or is the variety meaningful? ★ keep the words, add an order column (seam: many senses, one relation)
- **Q171** — The deck page shows an empty "optional" prose box under every card, which invites prose he called secondary; hide it behind a keypress? ★ hide behind a keypress
- **Q178** — Three decks still need hand shaping; extend the schema again, or accept them as permanently hand-held? ★ accept as hand-held (kept-exception)
- **Q179** — Two files in decks/ are not named *.deck.md, so no tool sees them; rename, move, or leave out on purpose? ★ rename to be found
- **Q215** — The ledger gained an ORIGIN column (fault, asked, instrument, drift); should "asked" rows live there, in their own file, or nowhere? ★ in the ledger (it is a log)
- **Q272** — Is 'segmented' the right word for the nested Contexts ladder (universe > system > project > instance) in the assembler paper's registers section? ★ 'faceted taxonomy' (cold reader A)
- **Q327** — Update every deck header to point at the new deck-fields guide at once, or only as decks are touched? ★ neither: decks are not edited by the instrument; the guide points at decks instead
- **Q369** — For the i4 procedure, set the dial to necessity (collapses to zero) or presence (three-way tie)?
- **Q417** — At the next roll, do the A-only clauses ride under the name 'accounted-containment', or does the name change?
- **Q513** — Pair every git verb with a literate-programming twin to test his equivalence claim; who writes it and for which release? ★ the instrument drafts, he reviews, target the release after 0.8.50

**tools & tests** (14)

- **Q93** — Folder b/ now has two keep-rules (rebuildable-from-untouched, and keep check receipts); how does a regenerating tool know what to keep before it wipes? ★ a marker file per sticky item the sweeper reads
- **Q177** — An old unfold tree sits in the web-served folder w/; move it out, or is w/ its right home? ★ move it out of w/
- **Q188** — One server script defaults to port 8042, the web server tool picked 8404; unify, or keep separate because they serve different trees? ★ keep 8404 and say why in its help text
- **Q193** — His ghostwheel functions and generated functions both use c4.i.*; share the namespace, or give generated code its own? ★ generated code gets a sub-namespace
- **Q292** — Is the parser property 'knows what may come next' the discovery hook he meant for game work in Emacs? ★ yes, derive help from the grammar
- **Q335** — Which four programming languages govern: POSIX/Python/C-family/Elisp, or sh/py/js/c, or two sets for two jobs? ★ POSIX plus up to four, chosen per job (his 09-10 phrasing)
- **Q351** — Confirm the lifecycle: C4 takes over a host tool, tests it, leaves a stub at the old place; and rule per tool for three found in corwin/bin? ★ keep his host tools as peers, add a marker beside, no replace
- **Q358** — What is the fifth default language (after ASSY, META/LISP, C4QL, composite org)? ★ POSIX sh
- **Q367** — Confirm the dashboard refresh rule: reading does not re-render; a ruling, mint or rotate does. ★ confirm
- **Q372** — Should the status panel update over a real local connection, or is re-drawing it each turn enough? ★ re-draw each turn (works today)
- **Q379** — Is the theme controller simply the existing Cube applied to themes? ★ yes, same mechanic
- **Q414** — Which live feed should the bank board use now that the page could not call the workspace shell? ★ a page's live-data or database capability
- **Q419** — Add a reversed reflective read (grade the frame separately; look for risks between rows) as a standing eclipse stage?
- **Q502** — In the start-of-session brief, show the top four guards or another number, and where?

**consent & privacy** (7)

- **Q274** — For each watched path on Avalon, how much may C4 look: count only, read, or sealed (not even counted)? ★ keep the five conservative seeds as written
- **Q271** — In his published HTTP table, replacing a whole document needs authorization but changing one line needs approval; is that deliberate, and does it apply beyond … ★ deliberate and general (consent is per change, not per scope)
- **Q323** — For material reached by asking, record consent on each row, or keep it in one place (the read-scope receipts)? ★ one place, the read-scope receipts
- **Q381** — Knowledge-check gates turn into 'Simon Says' in a UI (they test recall, not understanding); pin that as a general rule? ★ pin it generally
- **Q410** — The eev author agreed to being observed, not modelled; settle that reach before any learning-centre work? ★ observation only, no model, quotes only by permission
- **Q491** — Add a 'no flattery' guard (from Brigidt's guard list) as a card with a test that can fail it? ★ mint as a card with a falsifier
- **Q527** — [private] Two remaining chat screen names may or may not be his; which are his?

**collaborators** (6)

- **Q91** — Cheapest fix: give the card-games "Part 2" disclosure to one person who hosts things and did not write it, and ask what they would change? ★ send it to Bryant with the next drop (he now receives drops)
- **Q225** — How should the far seat's signed corpus be brought in: cite only, land its fork ledger as a register, or fold everything in as signed assets? ★ land the fork ledger as a register
- **Q306** — Was 'the hard one' he mentioned the card-game seed?
- **Q406** — A peer read of an older personal-instructions file by Dee and Bryant was put on hold; is it still owed? ★ superseded by the signed CORWIN.md
- **Q409** — Take on eev's completion problem as a gift to its author (he uses fuzzy matching everywhere)? ★ yes, as his own user report
- **Q420** — Offer the intake checker to Bryant with the next drop, signed or plain? ★ plain with a hash list (the collaborator tier)

**hosts & transport** (5)

- **Q277** — Nothing tells a run which host it is on; should that be an environment variable, a file on the box, or derived and proven? ★ a file on the box, read by one resolver
- **Q315** — Record as a principle: keep two copies to prove arrival, one copy to prevent conflict, and never confuse the two? ★ record it as proposed
- **Q321** — Should HOST-MEMORY.md (pointers to material kept elsewhere on a machine) be one per host or one per tree? ★ one per host (the installing user's)
- **Q322** — Should HOST-MEMORY.md use the SEMAPHORES.md v1.0 spec now, or stay a plain list of links? ★ adopt the spec (Q232 is now answered by the file)
- **Q339** — Does a 'dev ode' ride a later GIZA turn? (zero urgency)

**builds & generations** (3)

- **Q133** — Is d/m/t in the wrong place? Moving it breaks a matched pair and a pinned path in the manifest, so it would need the manifest rotation, not a quiet move. ★ leave it (it is still used as the header file for m/t in later writing)
- **Q141** — When a deck passes the rebuild test and can be archived, where does it go, and does the gen0 manifest need rotating? ★ into the frag/ store (bank Q437 RULED) and leave gen0 alone
- **Q173** — The chain head (gen0.manifest) sits inside the tree it certifies, so it always checks green; should it live outside? ★ keep a copy of the head outside the tree (e.g. with his keys)

**signing & ceremony** (2)

- **Q165** — When a signature cannot be checked from this workspace (no keyring), should the claim name the workspace ("unverified from here, checkable there") instead of … ★ yes, name the seat in every unverifiable claim
- **Q415** — Does a ruling dealt through the worksheet lane count as a verification step that shows understanding?

**release & sharing** (2)

- **Q430** — His three-step publishing order: publish as much as possible before C4, then the same for Claude users, then bring C4 tooling to the desktop app. Is that right? (spot-check: moved here; rides fork cluster 1)
- **Q498** — Pages cannot write to his disk, so Claude stays in the return loop; is watch-then-parse enough, or does the bank need a real inbox? ★ watch-then-parse

**theory & doctrine** (1)

- **Q04** — Is "a universe can be minted exactly when you can prove the way back (the return door)" the right reading? ★ yes: mint and proven return are one obligation (model.md defines mint as write+level …

**gauges & measures** (1)

- **Q47** — Should the error rate be counted as failures divided by "moments where failing was possible"? ★ failures per juncture

**persona** (1)

- **Q488** — Add a 'holds' column to the personas list pointing at each person's own stated values? ★ add a pointer column

---

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.

```
LENS · the question bank, cleared in bulk · 2026-09-27
a  my view: most of the bank is already answered by rules he stated; the scarce thing is his attention, so group it and show every line / b  the view I ascribe Corwin: show me best options, let me comment freely, spare me ceremony; he suspects the writing already answers much of the bank
c  their pull on mine: "never propose closing, pend close to him" kept every closure a proposal with a hold button and a named id / d  my pull on theirs: grouping may lead him to close rows he would have answered differently one at a time; the spot-check rate is printed so he can weigh that
persona: a stranger installing C4 says "I only care that the answers are written where I can read them" — the pack serves that, each close carries its line
inverse: a collaborator whose words or work sit in the bank (Bryant, Brigidt, the FSF volunteers) finds what the stranger missed: a bulk close can settle something about them without them; so rows touching other people (Q25/Q236, Q487, Q311, Q517) were kept out of every bulk sentence
principles reframe: 1. universalism: every closure shows its evidence so anyone, not only the keeper, can check it. 2. the four freedoms: park rather than delete (the freedom to run and study stays), and copyleft stays on instructions others will run. 3. the free-software movement: Savannah material is decided with the FSF people who carry it. 4. the community: hidden questions are re-issued, never renumbered, so history stays evidence.
```
