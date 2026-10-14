# Every rule carries its ring

*What did we prove, and where did we fail to prove it: that most of the shop's advice-in-tension is one
ring's rule read as every ring's rule, and that one small mechanism would let C4 show each person only the
rules written for the ring they are in.*

## What the paper is

- **Edition.** First edition, 2026-09-27.
- **Minted by.** Mentat (Claude, Opus 5.5), in the writing round that feeds his execute-brief SPA.
- **At whose ask.** Corwin's prompt of 2026-09-27: "We have given ourselves great advice but between getting
  lost in ceremony and sheer volume we have often failed to follow it: more confusingly, as advices piles it
  can have -or appear having- mutually contradictory suggestions. In C4 context those can be our foremost
  opportunities in the given context: our mission is to create user freedom where feasible with our work."
  (`q/2026-09-27-execute-brief/PROMPT.md:13`, the round's copy of his prompt.)
- **Status.** DRAFT, unsigned.
- **What it supersedes.** No earlier edition exists. It is the first written argument for
  `decks/must-versus-journey.deck.md` (CANDIDATE since 2026-08-01, `:32`, `:61`, `:97`), and it narrows,
  without editing, the meta-pattern in the reader's `writing/execute-brief/tracks/tensions-summary.md` (the round's tension track).
- **Note on voice.** The voice is mine. His words are always in quotation marks, with a path and line, and
  each one was checked with `grep -n`. The two blind readers in Part 7 are separate headless Claude sessions.
  They saw only the quoted rule pairs and the ring labels. Everything under a **Judged** heading is my
  reading. Everything under **Observed** carries the command or path that shows it.

Files beside this paper (`writing/rings/`): `door-rings.tsv` (the dry-run ring for each door part),
`ring-dry-run.sh` (the replayable check), `RUN-2026-09-27.txt` (its output), `SHA256SUMS`, `blind/` (the
pre-registered key, both prompts, both readers' raw answers, the score) and `tools/` (the Python used to
re-verify the quotes and score the readers; its paths are the round workspace's, not your c4 tree's).

---

## 1. Re-verifying the reader's tensions

### Observed

Method: `tools/verify.py` loads each quoted side from `writing/execute-brief/tracks/tensions.tsv`, normalises whitespace, `*` and
backticks, finds the quote in the named file, and prints the four lines on either side so it can be read
in context. I re-checked all 14 SCOPE rows (Part 7 uses them) and all 7 REAL rows, which covers the top 9.

- **Every quote was found at the line the reader gave**, in all 15 rows I ran (T01–T11, T13, T14, T16,
  T21). There is one small difference: T05's side A reads `"undeclared reads as MUST" forces everything
  named` at `model.md:432`. The source puts the phrase in quotation marks and the reader's cell drops them.
- **Counts that differ from the reader's:** `ls d/door/*.part | wc -l` gives **41** parts, not 43. The four
  `.tsv` files beside them bring the folder to 45. `ls h | sed 's/-.*//' | sort | uniq -c` gives 25 LENS and
  4 ESSAY, not 23 and 3. It gives 19 PAPER and 2 DISS, as the reader said. These are small, and the
  snapshot may simply have moved on since the reader counted.
- `grep -lE 'Corrected|Restructured|Retired|corrected' d/door/*.part` gives parts 18, 20, 22 and 40, as the
  reader said (T21).
- `grep -n -w ring model.md` gives nothing. The ring model is absent from the governing file, as the
  onward review already noted (`onward-readiness/review-2026-09-26-onward/PUB-DESIGN-POINTS.md:180`, UP5).

### Judged: where I agree and where I do not

| Row | Reader | Me | Why, from re-reading both sides in context |
|---|---|---|---|
| T01 stop vs ask | SCOPE | SCOPE, and partly superseded | Side A is a MINE part from 2026-08-03 (`14-what-corwin-wants.part:5`). Side B is his, from 2026-09-16 (`32-his-ask-for-it.part:5`), and it narrows A: stop only for "a blast radius affecting other people". That is a ring test: are others outside the room exposed? |
| T02 tag vs no tags | SCOPE | SCOPE | Agree. The door parts already carry `owner HIS/MINE` as a header field, which is the "sidecar" that `36-his-attribution.part:12-13` asks for ("belongs in logs … not in the prose"). |
| T03 specific vs sensitive | SCOPE | SCOPE, weaker than it looks | Side B comes from a sentence that *overrides* caution: "Notwithstanding … your good judgement not to repeat things that might be sensitive" (`q/TAG/whistle-while-you-work.md:3-6`). It names the caution without instructing it. |
| T04 numbers | SCOPE | SCOPE, and the model case | His 2026-09-26 ruling is a ring rule in so many words (Part 2). |
| T05 undeclared = MUST | SCOPE | SCOPE, with a sharper history | The deck that coined the idea named it as the **failure**: "An undeclared check gets treated as MUST by whoever finds it — which is how a preference hardens into a requirement nobody chose" (`decks/must-versus-journey.deck.md:92-94`). By 2026-08-10 it had become a **rule**: "Silence reads as MUST, so silence is a claim" (`q/PROMPT-2026-08-10-synthesis-kickoff.md:92`). It works as a nag on the builder. It harms as a default on a user. |
| T06 signing | SCOPE | SCOPE, already reconciled | `analysis/ceremony/PAPER-2026-09-24-users-pick-ceremonies.md:115-118`. |
| T07 reach for C4 vs binds nothing | SCOPE | **PLACE, not ring, and already built** | The two sides render into different files today: part 14 has scope `global,project`, part 70 has scope `project`, and `door render --scope` picks between them (`MEMORY.md:2621`). |
| T08 two test paths vs queens | REAL | REAL, **not a ring tension** | Both sides are his, and both concern one tool (`archive-markdown.sh`) called by one operator. Side A asks for proof. Side B asks for small, deferential tools: "each program is a simple peer of the realm" (`q/2026-09-26-onward-readiness/PROMPT.md:23`). No ring separates them, so it needs his ruling (Part 5). |
| T09 build loop | SCOPE | **PLACE / election, already rendered apart** | `63-shop-build-loop-0922.part` has scope `c4`. `63-project-build-loop.part` has scope `project`. |
| T10 signed files | REAL | REAL, but **the quoted pair agrees** | "do not overwrite without flagging" (`MEMORY.md:96`) and "edit tell him; he re-signs" (`model.md:358-360`) both allow the edit and both require telling. The live conflict is on the telling side: "tell him" versus signing silence ("default is silence", `model.md:754`). `model.md:783`, contradiction 3, holds exactly that open. |
| T11 asking cheap vs pressure | REAL | REAL; the reconciliation is already written, and the door lags | `model.md:746`: "Before adding a row, ask whose hand it needs; if mine, it is not his pressure". Part 14, which I own, still says only "asking is cheap". |
| T13 drift figures | REAL | REAL, and **half superseded** | His 2026-09-26 ruling lists "the 17% drift budget" among three quota-shaped numbers "owned as antipatterns" (`model.md:73-74`). The standing order "actually SPEND it — under-spend is the failure mode" (`28-his-drift-baseline.part:11`) predates that ruling. |
| T14 `h/` scratch vs papers | REAL | REAL (practice lags the rule); **direction already his** | "put them where I can see them please" (`MEMORY.md:3188`). Files are already moving out of `h/` by subject. |
| T16 BUDGET figure vs count coerces | REAL | REAL; **mine to fix** | Part 02 has owner MINE. The fix is a HOLD state that is never counted down. |
| T21 lead with topic vs parts narrate corrections | REAL | REAL; **his own rule already settles it** | His top block covers even text only Claude reads: "even when the materials faces only Claude I suspect it is not an especially performant approach" (`00-keeper-top-block.part:21`). History belongs in a RESUME beside the part. |

**Disagreements, in one line each.** T07 and T09 turn on place, not ring, and the existing `scope` field
already separates them. T08 is real, but no ring can resolve it. T10's quoted pair does not conflict; the
conflict is about "tell him". And the meta-pattern is narrower than the summary says (Part 7): the ring
settles which side governs **in an org**. Inside one operator's folder or a team's, most pairs do not
conflict at all, and something other than ring decides.

---

## 2. The ring model, in his words

**One operator, a team, an org.** His puppet analogy (2026-09-26, quoted in
`magic-number-theory/REVIEW-2026-09-26-ingest-writing-firing.md:147-152`; in full at
`q/2026-09-27-execute-brief/PROMPT.md:19`):

> "consider that C4 is like a tool for making a puppet (ghostwheel) that might have multiple operators. If
> there's one operator it makes perfect sense that the user will want four simple to work wires, compared to
> the hard to rewire by other means balancing and pressure mechanics. If we have a team we have more
> puppeters but the audience isn't implicitly more people than are in the room. When we think in org context
> that changes because an org is implicitly what a team isn't: consider going to our club vs performing at a
> club: the latter exists to provide a surface to people other than the organizers. That group needs to show
> how the wires are working if they aren't working according to the means described by the version of the
> C4/ghostwheel manuals users see while using the system, it's apps, etc."

**How much rigid wiring each ring tolerates.** From the same night
(`magic-number-theory/ESSAY-2026-09-26-magic-number-theory.md:982-984`): "I suggest a GRAIN of these is
simple (typical) user privilege, imply that teams have MORE of this and not less, but that ORGS have little
to no tolerance save whatever limited list of as-counted measures an org may exhaustively describe their
necessary uses for and treatments regarding."

**The test that sorts a rule into a ring.** This is the must-versus-journey deck's test, from 2026-08-01,
which he seeded and I wrote: "Ask: who is harmed if this is wrong, and are they in the room?"
(`decks/must-versus-journey.deck.md:49`). The deck goes on: "**the audience decides, and the audience is
either in the room or is not.**" (`:89-90`).

**Plainly.** A ring is the set of people a rule's wires reach.

- **One operator.** The owner of the puppet, pulling their own few wires. Their rules are preferences, and
  preferences are their privilege.
- **A team.** Several operators in one room, whose audience is still the people in that room. A team may
  carry *more* private wiring than one person, because everyone affected is present to object.
- **An org.** A group that performs for people outside the room. It has almost no tolerance for hidden
  wiring. Every wire that departs from the manual users read must be shown.

Two features of his model are easy to miss:

1. **The rings are not simply "outer is stricter".** Teams tolerate more than one person, and orgs tolerate
   least.
2. **The ceremony paper's concentric rings are the same idea cut by agreement rather than audience.** R0 is
   keeper plus lab, R1 is lab and Bryant's garden, R2 is more collaborators, and R3 is group publication
   (`analysis/ceremony/PAPER-2026-09-24-users-pick-ceremonies.md:45-46`). The rule is that "the outer never
   inherits the inner's requirement" (`:116-117`). The two schemes line up roughly as R0 = one, R1–R2 =
   team, and R3 = org. In his phrase, "going to our club" is a team and "performing at a club" is an org.

---

## 3. Twenty-five tensions as a default per ring plus a switch

Plain words only. "Same everywhere" means ring does not decide that row, and the switch sits on another
axis, which the last column names. Rows marked **his** need his ruling (Part 5). Rows marked **built**
already have a working mechanism.

| # | The two pieces of advice | One operator | Team | Org | The switch a person can flip | What really decides |
|---|---|---|---|---|---|---|
| T01 | Stop for his key · ask and carry on | Ask and keep going; stop only for your own key or another person's consent | Same; also stop before touching a partner's work without them | Stop whenever people outside the room could be hurt; name who | A stop list each person or org edits | Who is exposed |
| T02 | Tag whose rule it is · add no tags | Tags in rule files and logs, none in prose | Same (partners argue with rules) | No tags in anything users read; provenance in a side file | Credit style per user: none, Assisted-by, persona, org name | Who reads it |
| T03 | Be specific · skip sensitive detail | Specific about your own things | Other people's facts only with their consent | Pseudonyms unless the named person agreed | A privacy default per ring; nobody loosens someone else's | Whose fact it is |
| T04 | No number without a gauge · use 4/9/17 | A few chosen numbers are your privilege, if labelled "chosen" | More are tolerated | Only the counts the org lists and explains | How many counted wires each ring allows; bucket sizes you set | Ring (his ruling) |
| T05 | Undeclared means MUST · default-off | An undeclared tool nags its builder to declare it | Same | An undeclared rule is off, and shown as an offer | Each rule's default, shown on the first screen | Builder or adopter |
| T06 | Sign at the door · signing can't be table stakes | Sign only what a named reader relies on | What members wrote down together | Releases signed; users never required to sign | Ceremony table per ring; unsigned is the honest default | Who relies on it |
| T07 | Reach for C4 first · C4 binds nothing here | In the C4 shop, reach for C4 | — | — | **built**: `door render --scope` | Place |
| T08 | Two test paths · ant farm of queens | Same everywhere | | | Where the guards sit: beside the tool, in it, or advisory | **his** |
| T09 | No parts optional · choosing is optional | His shop chose it, so it binds there | Anyone else chooses | Anyone else chooses | **built**: separate shop and paste-in parts | Who elected it |
| T10 | Don't overwrite signed files silently · a signature doesn't freeze | Edit; queue a re-sign row | Co-signed files: never edit alone | Re-sign before it ships | A re-sign policy per file, set by its signers | **his** (what "tell him" means) |
| T11 | Asking is cheap · every open question is pressure | Same everywhere: bank only what needs the other person's hand | | | Question bucket size; a "hold" that is not counted | Whose hand it needs |
| T12 | Never edit another session's note · correct in place, dated | Correct in place once the writer is parked | Append-only while several people write | Append-only | Writer state per file: live, parked, settled | Writer state (and team) |
| T13 | Spend the drift budget · three different figures | His own wire: one figure, shown as how full a bucket is | Never travels as a quota | Never travels as a quota | Bucket size; "spend it" as an opt-in nudge | **his** |
| T14 | `h/` is scratch · papers live in `h/` | Scratch while only the maker reads it; move it the moment it is meant for a reader | Same | Same | A landing map per user (form → home folder) | Who the reader is |
| T15 | Append, never curate · deletes are better | Same everywhere: keep what records a choice, delete debris with a receipt | | | Retention class per folder | Kind of file |
| T16 | A budget blocker prints its figure · a count can coerce | Same everywhere: owner-set budgets may show numbers; deliberate holds are never counted down | | | HOLD as a state of its own | Whose count it is |
| T17 | Crisp turns · whistle while you work | Same everywhere: talk at the bench, keep the record crisp | | | Chattiness dial per person | Record or talk |
| T18 | More files are fine · findability is the measure | Same everywhere | | | Few big or many small files, per person | Building or graded |
| T19 | Two readers · two readers | Not a tension: three senses of "reader" | | | Name which sense | Misreading |
| T20 | No session closing · a formal close | Sessions are the assistant's bookkeeping | Same | Never show users a "close" | Fold-as-you-go or rotate | User or assistant |
| T21 | Lead with the topic · parts that narrate corrections | Same everywhere: current rule first, history in a RESUME beside it | | | With-history view for whoever asks | His rule already settles it |
| T22 | Two attestations · three | Superseded: three | | | — | — |
| T23 | Say so when a yes comes fast · don't make him type OK | Slow down agreement on what bears weight, never permission | Same | Load-bearing decisions reviewed | A weight tag per decision | Weight |
| T24 | Declare guesses · be brave | Not a tension: declaring is what makes the brave guess safe | | | — | Misreading |
| T25 | A seam in a name is the feature · refuse a both-ends disagreement | Not a tension: many senses in a word, one answer to a fact | | | — | Misreading |

---

## 4. The mechanism: one header line, and what it renders

### Observed: what the door already has

Every door part begins with a tab-separated header ending at `---`, with `id owner scope form since title
source` (`head -9 d/door/*.part`). Three parts already carry an optional extra field: `pin top`
(`00-keeper-top-block.part:5`), `generate` (`08-skills-router.part:8`) and `mirror`
(`63-project-build-loop.part:8`). `scope` takes the values `global`, `c4`, `project` and `pointer`, and
records **where** a part is installed. `door render --scope … --for DIR` already pulls a domain's own
`.door/*.part` and honours `override all` and `drop <id>` (`MEMORY.md:2621-2623`). No part records **whom**
it binds.

### The proposal (minimal)

1. **One optional header line per part:** `ring  one | team | org | wiring`, or a comma list such as
   `one,team,org`. It sits beside `owner` and `scope`. It is metadata and never goes into prose, which is
   what part 36 asks for.
2. **One more ring-like value for the floor:** a clause that protects someone absent (third-party consent,
   entrusted systems, a refused fetch) is cut into its own part tagged `floor`. A floor part renders in every
   ring. The floor has to pass the deck's test: someone not in the room is exposed if the rule is wrong.
3. **What renders.** A door rendered for ring R carries in full the parts tagged R, plus floor parts, plus
   wiring by place as today. Every other part appears as a **one-line offer**: its title, "written for ring
   X; electable here", and its id. So nothing disappears; it moves from rule to offer. Electing an offer
   uses the same mechanism as `drop`: an `elect <id>` line in the domain's `.door/`.
4. **A part tagged `one` binds only the operator it was written for.** All 24 dry-run parts tagged `one`
   were written for Corwin. 20 of them name him outright ("Corwin", "his", "him", "he"). The other four
   are his or the shop's hand-back, drift and question-bank habits: 02, 28 (in his "my capacity"), 44 and
   52. On someone else's install they are offers, a sample of one operator's four wires.
5. **Undeclared never widens.** A part with no `ring` renders as `one`, so it stays where it was written,
   and the check exits 1 to nag the builder. This keeps "undeclared reads as MUST" for the builder's gauge,
   as a forcing function, and drops it from the reader's door. That is the deck's own warning applied to
   the deck's own rule.
6. **`pin` beats `ring` inside his estate.** His top block must "remain at the top in each copy"
   (`00-keeper-top-block.part:12`). Outside his estate his pin does not reach, by his own part 36: "C4's own
   best practice does not govern what someone else does with their computer" (`36-his-attribution.part:16`).

### The stranger-replayable check

Run from `writing/rings/`. The default door path finds `../../d/door`:

```
sh ring-dry-run.sh check        # OK 41 parts … ; exits 1 naming any UNDECLARED, BAD-RING, NO-EVIDENCE
sh ring-dry-run.sh count        # how many parts each ring sees in full / as offers
sh ring-dry-run.sh plan org     # the org door, part by part
sh ring-dry-run.sh suspects     # floor-shaped words in a part with no floor split
sh ring-dry-run.sh --prove-red  # removes a row, falsifies an evidence phrase, invents a ring: 3 RED, then GREEN
```

The check does not trust my classification. For every part it looks for my evidence phrase, verbatim, with
`grep -F`. **On its first run it went red on my own table:** the phrase I had given for part 16 spans a line
break in the source. The check refused it, and I fixed the phrase. `RUN-2026-09-27.txt` holds the green
run, and `SHA256SUMS` pins the script and the sidecar.

### Dry run: all 41 parts, by ring (Judged, with the evidence the check verifies)

Test applied: who is harmed if this rule is wrong, and are they in the room?

| Part | Owner | Place (`scope`) | Ring | Evidence, verbatim from the part | Floor clause to split out |
|---|---|---|---|---|---|
| 00 keeper-top-block | HIS | global,c4,project,pointer | one | "projects under my original authorship" | — (pinned) |
| 02 deferral-carries-blocker | MINE | global | one | "Anything named as not-done in a handback" | — |
| 04 governing-pointer | MINE | pointer | wiring | "nothing in C4 binds this project" | — |
| 08 skills-router | MINE | global,c4 | wiring | "generated at render time" | — |
| 10 first-move | MINE | global,c4 | one | "My repeat faults with the check for each" | — |
| 12 which-context | MINE | global | org | "A work-project session does not mount" | — |
| 14 what-corwin-wants | MINE | global,project | one | "When a turn reaches something wanting his key" | suspect: "consent" |
| 16 fence-is-an-admission | MINE | global,project | one | "he is nearly always fine seeing his own" | — |
| 18 standing-rules-whose | MINE | global | one | "a rule of mine wearing his voice" | — |
| 20 his-scope-and-attestations | HIS | global | one | "C4 sees everything of his EXCEPT SAVANNAH" | "No wrong with entrusted systems and authority" |
| 22 his-seam-tools-prove-claim | HIS | global | team | "TOOLS PROVE. GENERATIVE CODE DELIVERS." | — |
| 24 his-signing-baseline | HIS | global | one | "SIGNING IS MY BASELINE, NOT HIS NEED." | — |
| 26 his-alignment-accelerates | HIS | global | one | "when his yes arrives fast on something load-bearing" | — |
| 28 his-drift-baseline | HIS | global | one | "is Claude's to self-direct" | "drift never touches entrusted systems" |
| 30 his-declare-guesses | HIS | global,project | one | "A guess named at the start is a proposal." | — |
| 32 his-ask-for-it | HIS | global,project | one | "do not make me reprompt simply to say OK" | suspect: "blast radius", "other people" |
| 34 his-persona-aware | HIS | global | one | "Authoring a persona is his pen." | — |
| 36 his-attribution | HIS | global,c4,project | one,team,org | "Attribution is the user's call, always" | — |
| 38 his-versioning | HIS | global,c4,project | team | "x is 0 until C4 is ON" | — |
| 40 mine-dispositions | MINE | global | one | "Here, I keep ordinary care about what persists" | — |
| 42 savannah-special | HIS | global | org | "SAVANNAH is specical" (heading only; the body is empty) | — |
| 44 cost-footnote | HIS | global,c4 | one | "The very last thing in a hand-back is a short list" | — |
| 46 his-names-and-folders | HIS | c4 | team | "nobody should have to learn them" | — |
| 48 his-books-from-chapters | HIS | global,c4 | team | "a site, a manual, a spell, a book" | — |
| 49 his-land-files-here | HIS | global,c4 | one | "LAND FILES ON HIS COMPUTER" | — |
| 50 shop-door-intro | MINE | c4 | wiring | "The door points; it does not gate." | — |
| 52 shop-bank-lane | MINE | c4 | one | "Questions live in ONE place, the bank" | — |
| 54 shop-records | MINE | c4 | team | "Claude verifies, never signs." | — |
| 56 shop-naming | HIS | c4 | team | "accessible, read-aloud-able" | — |
| 58 shop-stop-and-talk | HIS | c4,project | team | "a signing or ceremony gate that blocks joint work" | — |
| 60 shop-mounts-authoritative | HIS | c4 | one | "A folder Corwin connects mid-session" | — |
| 62 shop-build-loop | HIS | c4 | one | "his own, written down once" | — |
| 63 project-build-loop | HIS | project | one,team,org | "Choosing it is optional" | — |
| 63 shop-build-loop-0922 | HIS | c4 | one | "no parts are optional" | — |
| 64 shop-dates-are-facts | HIS | c4 | team | "DATES ARE FACTS BEFORE THEY ARE STAMPS" | — |
| 66 shop-backed-before-absent | MINE | c4 | one | "this shop reported the open essay shelf empty" | — |
| 68 shop-hand-back-gate | HIS | c4,project | org | "runnable by a PERSON READING IT" | — |
| 70 project-c4-is-a-tool-here | MINE | project | wiring | "binds nothing in this project" | — |
| 72 project-express-lifts | MINE | project | one | "He performs the lift." | — |
| 74 project-standing-rules | MINE | project | one | "Anything wanting Corwin's key, consent, or judgement" | "Third-party person-facts need consent before they persist." |
| 76 project-repeat-faults | MINE | project | one | "I can verify, so I propose verifying." | — |

**Counts** (`sh ring-dry-run.sh count`, in `RUN-2026-09-27.txt`):

| Door rendered for | Parts in full | As one-line offers | In full, once the 3 floor clauses are split out |
|---|---|---|---|
| One operator: Corwin, his own door | 26 | 11 | 29 |
| One operator: someone else's own install | 2 | 35 | 5 |
| Team | 10 | 27 | 13 |
| Org | 5 (one of them an empty heading) | 32 | 8 |

Wiring (4 parts) renders by place in every case. `suspects` names 2 more parts (14 and 32) whose
floor-shaped clause should be looked at before they are frozen as `one`.

**Place against ring** (`sh ring-dry-run.sh crosstab`). Parts tagged `project` render into *any* project,
and **8 of them were written for Corwin's own ring**: 00, 14, 16, 30, 32, 72, 74, 76. That route is how an
inner ring's rules reach an outer seat. The onward review named it in the abstract (UP5): "the door render
is the path by which an inner ring's rules reach an outer seat". The dry run names the eight parts. One
concrete case: `74-project-standing-rules.part:24-25`, "Anything wanting Corwin's key, consent, or
judgement: stop and hand him a run-card", lands in every project's `model.md`, including projects where
there is no "him".

---

## 5. The seven real tensions: which need his ruling, and which the mechanism dissolves

| Row | Does the ring mechanism dissolve it? | What is left | Whose move |
|---|---|---|---|
| T08 two test paths vs queens | **No.** One operator, one tool, both his rules | Where rigour lives: beside the tool (harness, a second implementation) or inside it | **His ruling** (decision `rings-D4`) |
| T10 signed files | **Partly.** Co-signed files (team) are never edited alone, and releases (org) are re-signed before shipping | What "tell him" means for his own drawer: a queue row, or a word each time (`model.md:783`, contradiction 3) | **His ruling** (`rings-D5`) |
| T13 drift budget | **Partly.** As his own wire it is a GRAIN he may keep, and the ring tag stops it travelling as a quota | Which figure, and whether "SPEND it" stands after his 09-26 antipattern ruling | **His ruling** (`rings-D6`) |
| T11 asking vs pressure | No; it is not a ring tension | Part 14 (MINE) lags `model.md:746` | Mine: replacement text below |
| T14 `h/` scratch | Partly: the reader decides where a file lives | Moving the files; `model.md:748` could add "until meant for a reader" | Owed work; direction already his (`MEMORY.md:3188`) |
| T16 BUDGET vs HOLD | No | Part 02 (MINE) needs a HOLD state | Mine: replacement text below |
| T21 corrections in parts | No. His rule already says current-first, even for text only Claude reads | Move the history in parts 18, 20, 22 and 40 into a RESUME beside them | Owed work, under his top block's own licence ("We can always make RESUME.md", `00-keeper-top-block.part:21`) |

**Replacement text drafted for the two MINE parts.** These are not installed; the corpus I read is a
read-only snapshot. [MINE]: proceed. His door is edited through `d/door`, and a re-render follows.

- Part 14, the "Ask" line: *"Ask. Unanswered questions are banked, so asking is never lost — but it is only
  cheap for the asker. Before banking, ask whose hand the answer needs; if it is mine, it is not his
  pressure (`model.md:746`)."*
- Part 02: *"Deferral carries its blocker: [BLOCKED: why], [KEEPER: what], [BUDGET: N] or [TOOL: what]; a
  BUDGET blocker prints the remaining figure of a budget its owner set. A HOLD someone chose on purpose is
  stated in words — [HOLD: whose, why] — and never counted down."*

---

## 6. The kept loser: the strongest case against ring-tagging

**Stated at its strongest.** Ring-tagging moves a rule's authority from its text to a label that someone
other than its author writes. And the ring in force is chosen by whoever installs. So the two people least
bound by the rules, the tagger and the installer, decide what binds everyone else. Four consequences follow:

1. **Manufactured provenance.** I tagged 41 parts, 24 of them his. This shop has twice caught me turning
   my own reading into his rule: "roles, not names" (`40-mine-dispositions.part:11-15`) and the `Z/ a/ p/`
   fence (`20-his-scope-and-attestations.part:11-15`). A ring label on a HIS part, written by me, is the
   same fault waiting in a header.
2. **Self-declared rings let an org hide wires.** Nothing stops an org installing as `one`. It then sees
   the fewest binding rules and none of the club's duty to "show how the wires are working". His puppet
   rule depends on the org admitting it is an org.
3. **It multiplies the rules.** Each rule now reads differently in each ring, so the same assistant
   behaves differently from one folder to the next.
4. **For most pairs, ring is the wrong axis.** Both blind readers said so, independently (Part 7):
   "Most pairs apply to different things, not different people" (reader 1, `blind/READER-1-plain.txt`).

**Where it wins.**

- On every HIS part, until he confirms the tag. That is why the recommendation is a sidecar trial, not
  header edits (decision `rings-D1`).
- Against a careless or hostile org, where ring tags give no protection at all. Only the floor does, so the
  floor must be small and real, and `suspects` exists to stop protective clauses being stranded in an inner
  ring.
- On T12, T15, T17, T18, T20 and T23, where the axis that decides is the kind of file, the writer's state,
  the phase or the weight. A ring tag there would be false precision.

**Where it loses.** It loses on the rows that carry the most freedom: T01, T03, T04 and T05, which the
blind readers sorted by ring. It also loses on the leak: 8 parts written for one man now render into
anyone's project. Leaving rings unwritten does not keep rules neutral. It lets them travel at full
strength.

---

## 7. Falsifiers, and the blind reading I actually ran

### The reader's falsifier, run

> "give the 14 SCOPE rows to a second reader with only the ring labels. If that reader cannot say which side
> applies in a given folder, the rule has no ring and "scope" was the wrong judgement." (`writing/execute-brief/tracks/tensions-summary.md:97-98`)

**Observed.**

- **Setup.** Before any reader ran, I wrote the key and the scoring rule to `blind/KEY-preregistered.md`
  (mtime 03:11, against 03:12 for the answers). Then two headless sessions ran from an empty folder with
  file, shell and web tools disallowed: `claude -p … --disallowedTools "Bash Read …"`.
- **What they saw.** All 14 SCOPE rows (more than the 9 asked for). Each was two verbatim quotes and nothing
  else, plus plain definitions of the three rings and three folders: F1, one person's lab; F2, a lab shared
  with partners; F3, an org's desktop-support deployment.
- **Order control.** Reader 2 saw every pair in swapped order.
- **Scoring.** A row "has a ring" if a reader's answers differ across the three folders and the reader names
  a ring for each side.

| Row | Key F1/F2/F3 | Reader 1 | Reader 2 (mapped back) | Has a ring? r1/r2 | What the readers said decides |
|---|---|---|---|---|---|
| T01 | B/B/A | BOTH/A/A | BOTH/A/A | yes/yes | whether a real key or consent is needed, or just an OK |
| T02 | A/A/B | B/A/A | BOTH/A/A | yes/yes | whether the text carries a rule's authority |
| T03 | A/BOTH/B | A/CANT/B | A/CANT/B | yes/yes | whether the detail concerns people outside the room |
| T04 | B/B/A | BOTH/BOTH/A | BOTH/BOTH/A | yes/yes | whether the number is a chosen setting or a measured claim |
| T05 | A/A/B | A/CANT/B | A/CANT/B | yes/yes | whether CLAUDE.md is in force |
| T06 | B/BOTH/A | BOTH ×3 | BOTH ×3 | no/no | whether a named reader relies on the signature |
| T07 | A/A/B | BOTH/BOTH/CANT | BOTH/BOTH/CANT | no/no | whether C4 is deployed there |
| T09 | A/B/B | BOTH ×3 | BOTH ×3 | no/no | — |
| T12 | BOTH ×3 | B/A/A | BOTH/A/CANT | yes/yes | who wrote the note |
| T15 | BOTH ×3 | BOTH/CANT/A | CANT/CANT/A | yes/no | record or scratch |
| T17 | BOTH ×3 | BOTH ×3 | BOTH ×3 | no/no | — |
| T18 | BOTH ×3 | CANT ×3 | BOTH/BOTH/CANT | no/no | whether files are indexed where he looks |
| T20 | BOTH ×3 | BOTH/BOTH/A | BOTH/BOTH/A | yes/yes | whether users see the close |
| T23 | BOTH ×3 | BOTH/BOTH/A | BOTH/BOTH/A | yes/yes | whether the item is load-bearing |

**Judged.**

- **The falsifier fires for 5 of 14 rows** (T06, T07, T09, T17, T18). Neither reader could make the answer
  vary by ring. So by the reader's own test, those five "had no ring". For T07 and T09 that matches Part 1:
  they turn on place, and the door already separates them. T06 came back BOTH everywhere; the readers saw no
  conflict once "a named reader relies" is read. That fits the ceremony paper having already reconciled it.
- **8 rows had a ring for both readers**: T01, T02, T03, T04, T05, T12, T20 and T23. My hypothesis H1 held
  for 4 of its 5 rows (T01, T03, T04, T05) and failed on T06.
- **My narrowing (H2) held for only 3 of 6 rows.** T17 and T18 came back flat for both readers, and T15 for
  one. T12, T20 and T23 varied by ring for both. On T12 I concede a team component: "another session's note"
  is another operator's note. On T20 and T23 the variation is only "org takes the stricter side", and both
  readers still named a non-ring axis as what decides.
- **The readers agreed with each other far more than with my key.** On 10 of 14 rows their three folder
  answers were identical. My key was wrong in shape. I expected the inner rings to *pick* the looser rule.
  Both readers said the inner rings keep **both** rules, and only the org drops the looser one (T01, T04,
  T20, T23). That fits his words better than my key did: "ORGS have little to no tolerance".
- **Limits.** [PLATFORM] The blind readers are the same model family as me, so they are blind to context,
  not independent of my habits. The folder descriptions name their ring, which may lead. The quotes are
  fragments with shop words ("run-card", "MUST") that the readers had to guess at. *Falsifier for this
  whole section:* a human reader, for example Bryant, given `blind/PROMPT-plain.txt`, sorts T17 and T18 by
  ring, or cannot sort T01, T03, T04 and T05.

### Other falsifiers

- **Of the mechanism.** After tagging, `sh ring-dry-run.sh plan org` shows as FULL any part whose evidence
  names Corwin, or a part that tells a stranger to route "him" to a run-card. (Today: none. The 8 `project`
  parts written for his ring show as OFFER.)
- **Of "undeclared never widens".** A protective clause sits undeclared, so it never reaches an org, and an
  absent person is harmed because it did not. That is the case the old MUST default existed for. The guard
  is `suspects`. *Its falsifier:* a protective clause that the regex misses (it matches consent,
  third-party, entrusted, other people and blast radius).
- **Of "place is a separate axis".** A part whose right ring changes when it is installed somewhere else
  while its audience stays the same.
- **Of the whole thesis ("the biggest freedom opportunity is one mechanism").** After a trial, a person on a
  non-Corwin install still meets a rule written for Corwin as binding, or reports that the offers index hid
  a rule they needed.

---

## Cases

1. **The chat index's vocab exemption (T04, org side).** `cl1ix` leaves a screen name in clear once it has
   been used as an ordinary word in 17 or more hunks (`model.md:75-77`). The review applied the puppet
   analogy to it and found the one wire the audience feels. The people in the logs "are not operators. They
   are in the logs, not in the room" (`magic-number-theory/REVIEW-2026-09-26-ingest-writing-firing.md:159`).
   The same threshold on his own phonemes is his four wires. On other people's names it is a club wire and
   must be shown. Same number, two rings, two verdicts.
2. **The 80 undeclared tools (T05).** The brief for this round quotes `c4prime`: "UNDECLARED: 80 tool(s) do
   not say MUST or JOURNEY. undeclared reads as MUST." I did not re-run `c4prime`; it is not in the
   snapshot. On 2026-09-18 the pile stood at 68 (`MEMORY.md:2603`). Read literally, the tree's own rule
   makes 80 tools into requirements nobody chose. That is the exact mechanism the deck warned of: "Journey
   items quietly promoting themselves to Must because nobody wrote down which they were"
   (`decks/must-versus-journey.deck.md:103-104`).
3. **The portable paste-in (T09, done right).** `63-project-build-loop.part:12-13`: "Choosing it is
   optional; once chosen for a task, every step is required." It is the only non-wiring part besides part 36
   written for all three rings, and it says so in its first line. It shows what a ring-aware rule looks like
   with no tag at all.
4. **A stranger's project `model.md` (the leak).** Today a stranger rendering the `project` door receives
   parts 14, 16, 30, 32, 72, 74 and 76, which address "Corwin" or "him" by name, plus his pinned top block.
   Under the proposal they receive 2 parts in full (5 once the floor is split out) and 35 offers.

## Findings

1. **The quotes hold.** All 15 re-checked rows are found where the reader said. Two small count
   differences: 41 door parts, not 43; 25 LENS, not 23.
2. **The ring is real but narrower than claimed.** Blind readers found a ring in 8 of 14 SCOPE rows. For
   most of those, the ring decides only what an **org** must do. Inside one operator's folder or a team's,
   the two pieces of advice mostly do not conflict.
3. **Place is a second axis, and it is already built.** T07 and T09 are settled by the existing `scope`
   field. The ring would be a second optional header line, alongside the `pin`, `generate` and `mirror`
   lines that already exist.
4. **The door is mostly one man's four wires.** 24 of 41 parts are written for Corwin's own ring, 8 for a
   team, 3 for an org, 2 for all three, and 4 are wiring. **8 parts written for his ring travel into every
   project.**
5. **The floor is tiny and currently buried.** Three protective clauses sit inside `one` parts (20, 28,
   74), and the gauge flags two more (14, 32).
6. **"Undeclared reads as MUST" was born as a warning and became a rule.** The mechanism splits it:
   undeclared nags the builder, and never widens a rule for a reader.
7. **Of the 7 REAL tensions, 3 need his ruling** (T08, T10, T13), 2 are mine to fix (T11, T16), and 2 are
   owed work under rules he already gave (T14, T21).

## What it failed to prove

- **That the tags are right.** 24 of my 41 ring labels sit on his parts, and they are my reading until he
  confirms them. The check proves only that each evidence phrase exists, not that the ring follows from it.
- **That ring is the biggest opportunity by count.** It is not. Six SCOPE rows turn on other axes. It may
  be the biggest by freedom value, since it covers most of the reader's "high" rows, but freedom value was
  the reader's judgement and remains mine.
- **Independence.** Both blind readers are Claude sessions. No human has sorted the rows.
- **That orgs will declare themselves honestly.** Nothing here enforces it.
- **That the render works.** No `door render --ring` was built or run. `bin/door` is not in the snapshot.
  The dry run is a sidecar reading, not a rendering.

---

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.

```
LENS · every rule carries its ring · 2026-09-27
a  my view: a ring tag is worth a sidecar trial, because 8 of his own rules already leak into strangers' projects; it is not the one mechanism for all 25.
b  the view I ascribe Corwin: he wants fewer, clearer rules that free users; he will distrust a new header that I fill in on his behalf.
c  their pull on mine: his "ORGS have little to no tolerance" moved my key's shape: inner rings keep both rules, the org drops the looser.
d  my pull on theirs: I narrowed the reader's meta-pattern and named the leak by part number; that may read as more certain than two same-family readers allow.
persona / inverse: the IT shop lead says "show me which of these bind my users, and nothing else" / the inverse (a solo tinkerer) finds something new: the offers index is a catalogue of one man's wires, and that is a gift, not a hiding place.
principles reframe: 1. universalism: a rule should bind only people who were in the room when it was written, or who elect it. 2. four freedoms: an offer you can read, change and elect is freedom 1 applied to instructions, and a hidden or inherited rule is not. 3. free software: the floor stays small and public so an org cannot hide wires behind a ring. 4. community: tags on his words wait for his yes.
```
