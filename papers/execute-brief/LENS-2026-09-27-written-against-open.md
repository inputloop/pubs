# LENS 2026-09-27 — the writing, held against what is still open

*Form: LENS (`c/wf:4`, "Does his hypothesis bear out when looked at through one deliberately chosen way
of seeing"). The way of seeing chosen here: **agreement across kinds of source**. A conclusion counts as a
candidate for "the correct answer" only when at least three different kinds of source hold it: his own
words, the older shop writing, today's new works, and outside prior art that today's works cite.*

## The keeper's hypotheses, verbatim

All from his prompt of 2026-09-27 (`q/2026-09-27-execute-brief/PROMPT.md`, the round's copy).

- **H1** (line 5): "I suspect comparting our written work to our open questions (cross comparing
  answers/conclusions from especially the more formal writing work with our questions from those same
  pieces or those you banked and that still show as open)."
  *The sentence stops there. The brief for this round completes it as "will show many questions already
  answered by the writing". That completion is a reading, not his words, and it is the one tested below.*
- **H2** (line 7): "The writing programs have shown to have the most traction of any work so for."
- **H3** (line 7): "It makes me think many of the ideas we have worked with deserve some backing
  "viewpoint writing", just like nearly each discreet ideation deserves the viewpoint models requisitioned
  by the spells for the turn to the ON position."
- **H4** (line 13): "We have given ourselves great advice but between getting lost in ceremony and sheer
  volume we have often failed to follow it: more confusingly, as advices piles it can have -or appear
  having- mutually contradictory suggestions.  In C4 context those can be our foremost opportunities in the
  given context: our mission is to create user freedom where feasible with our work."
- **H5** (line 13): "I find the conclusions from here self-evident, which unite the C4/ghostwheel work with
  our example, in concern via the social (ingress) and technical (egress) risk (mitigation) spaces, and in
  practice though the practices of double entry book and bold, resume-forward guess-work, aside a few other
  technical and procedural feats of dextarity."
- **His mid-turn addition** (line 22): "Yes, we absolutely do plan to republish BRYANT.md along with
  CORWIN.md and make a new combined model that others could use in place of picking his or mine to use for
  their own on-ward turn (taking ghostwheel.org and customizing it to make it their own in their shop
  without/before making a personal model of their own, effectively electing our combined \"bias models\"
  for the build vs picking or making one)."

## The ask

"Use LENS to compare existing writings to each other and un-written about things [...] looking for
agreement from several sources that shows the correct answer." (line 9)

## The method

- **What I read, not redid.** The four reader tracks in `writing/execute-brief/tracks/` (bank halves A and B reconciled against
  the writing; the forks inventory of the formal writing; tensions and unwritten ideas); today's six works
  in `writing/` (ai-diligence-sysops, two-readers, elected-image, rings, what-a-member-keeps,
  execute-brief); the older formal writing in the snapshot (`h/PAPER-*`, `h/LENS-*`, `h/DISS-*`,
  `analysis/`, `magic-number-theory/`, `onward-readiness/`); and the two persona files that sit in the
  round's second snapshot (`modelthisbook/CORWIN.md`, `BRYANT.md`, and the `AS4CE0001/book/`
  copies).
- **What I ran.** Three probes a stranger can replay: an evidence-kind count over the reconciled bank
  (Board H1), `lens-traction-probe.sh` beside this file (Board H2; its output is
  `lens-traction-RUN-2026-09-27.txt`), and a coverage grep of the twelve unwritten ideas across today's
  works (Board H3). The commands are printed where the numbers are used.
- **How independent today's works are.** They were written in parallel, each blind to the others: only
  what-a-member-keeps names its siblings, and only to say "I did not read them"
  (`writing/what-a-member-keeps/ESSAY-2026-09-27-what-a-member-keeps.md:541`). But they share one model
  family, one brief and one set of reader tracks. So I count them as **one kind of source**, and where two
  of them repeat a number from the same track, that is an echo, not agreement.
- **Two piles.** Every board keeps OBSERVED (with its command or path) apart from JUDGED. Concerns carry
  [HIS] [DOMAIN] [SKILL] [PLATFORM] [MINE] and a falsifier.

---

## Board H1 — "our written work" against "our open questions"

**SENSE.** If the writing already settles a question, the question should close with a pointer, not a
fresh ruling. His sentence singles out "especially the more formal writing work".

**CANON.** The two bank readers (`writing/execute-brief/tracks/bankA-summary.md`, `writing/execute-brief/tracks/bankB-summary.md`); the bulk
decision and its spot-check (`writing/execute-brief/DECISION-2026-09-27-bank-in-bulk.md:72-101`); the
forks inventory of the formal writing (`writing/execute-brief/tracks/forks-summary.md`).

**PROBE** (replayable). Which kind of file does each "answered" row cite as its evidence?

```sh
cd tracks; cat bankA-reconciled.tsv <(tail -n +2 bankB-reconciled.tsv) | awk -F'\t' 'NR>1 && $5 ~ /ANSWERED/ {
  p=$6; sub(/:.*/,"",p); k="other";
  if (p ~ /(^|\/)(PAPER|DISS|ESSAY|LENS|GUIDE|REVIEW)-/ || p ~ /^(analysis|magic-number-theory|onward-readiness)\//) k="formal";
  else if (p ~ /^(MEMORY\.md|model\.md|C4\.md)$/ || p ~ /^evidence\//) k="running record";
  else if (p ~ /^decks\//) k="deck"; else if (p ~ /^d\/door/) k="door"; else if (p ~ /^q\//) k="his prompts";
  c[k]++} END {for (x in c) print c[x], x}'
```

**OBSERVED.**

| what the answered row cites first | rows (of 159) |
|---|---:|
| the running record: MEMORY.md, model.md, C4.md, the bank itself | 110 |
| formal writing (PAPER, DISS, ESSAY, LENS, REVIEW, analysis/ and the like) | 13 |
| decks | 9 |
| his prompts in q/ | 8 |
| door parts | 7 |
| other notes, journals, spells, facts | 7 |
| other or none | 5 |

- Counting formal writing **anywhere** in a row's evidence, not just first: 19 of 159 answered rows
  (12%). Across all 379 open questions that is 5%.
- The spot-check of 17 answered rows found 1 wrong (about 6%) and 6 that need a caveat (4 overstated,
  2 procedural) (`DECISION…:87-89`). Two of the 17 rested on formal writing: Q49 overstated (it credits him
  with an essay's reading), Q326 clean. Two is too few to say anything about formal writing's error rate.
- The other direction. The formal writing carries **124** forks of its own; later writing settled **12**
  and events overtook **4** (`writing/execute-brief/tracks/forks-summary.md:13-17`). Today's works discharged **8** more
  (F021-F025, F027, F029, F030, per the sibling `done.json` files) and raised **31** new decisions marked
  his alone (8 + 4 + 7 + 6 + 6 across ai-diligence-sysops, elected-image, rings, two-readers,
  what-a-member-keeps), several of which repeat asks already in the brief (see the disagreements table).

**READING (a real case).** Q148, the magic-number slope. The reader first credited it to the wrong line;
the spot-check moved it to the essay's slope verdict plus his 09-26 answer
(`magic-number-theory/ESSAY-2026-09-26-magic-number-theory.md:341` and `:982`). The formal essay did the
work, and his ruling closed it. That pairing, an argument plus a ruling on record, is what a clean answer
looks like, and it is rare: most rows close on the ruling alone.

**STATUS.** Instrumented for this snapshot (the awk above), with the snapshot's gaps: `facts/` is mostly
missing, as are `CLAUDE.md` and the `m/` registers (`writing/execute-brief/tracks/bankB-summary.md`, "Could be wrong about").

**Verdict (JUDGED).** **Holds for the writing taken broadly; weak for the formal writing he singled out.**
About 6 in 10 open questions need no fresh thinking from him (`DECISION…:55`), but the thing that answers
them is the running record of his rulings, not the papers. The formal writing asks roughly ten questions
for every one it settles. [MINE] *Falsifier:* rerun the probe over the full tree on Avalon; if formal
writing becomes the first cite for more rows than the running record, the verdict flips. A second
falsifier: the readers may have cited MEMORY because it records the ruling even where a paper had argued
the point first. Re-reading the 110 record-cited rows for an earlier paper that argues the same answer
would show it.

---

## Board H2 — "the most traction of any work"

**SENSE.** Traction can mean four different things: (a) the shop keeps coming back to a work (other
files name it); (b) he keeps coming back to it (his prompts name it); (c) people outside engage with it;
(d) he is pleased with what it produced. His sentence beside H2 speaks to (d): "I could imagine giving up
on building C4/ghostwheel and yet being pleased, simply because of the outcomes in writing projects"
(line 7). That is his valuation. It is his to hold and not mine to count.

**CANON.** The tension reader's "bite count" (`writing/execute-brief/tracks/tensions-summary.md:15`); the onward review's
per-tool reference counts (`onward-readiness/review-2026-09-26-onward/refcounts.tsv`); the note that the
first dissertation "now has an outside reader" with "eight comments" (`model.md:776`) and the comments
registry it names, `evidence/comments.tsv`, which is not in the snapshot.

**PROBE** (replayable): `sh lens-traction-probe.sh CORPUS_DIR`. For every work of four kinds it counts
how many other files name it, and how many of those are his prompts (`q/PROMPT-*`, `q/*/PROMPT*.md`,
`q/*.txt`, `q/TAG/*`; 100 files). The script's header states exactly what name is searched for each kind.

**OBSERVED** (`lens-traction-RUN-2026-09-27.txt`).

| kind of work | how many | median number of other files naming it | named by at least one of his prompts |
|---|---:|---:|---:|
| formal writing | 69 | 3 | 2 (3%); 4 (6%) by short name |
| decks | 85 | 3 | 15 (18%); 22 (26%) by short name |
| spells | 12 | 7 | 0; 2 (17%) by short name |
| tools (coded names) | 103 | 8 | 55 (53%) |

- A looser count, by kind-word rather than name, over the same 100 prompt files: "essay / paper /
  dissertation / thesis" appears in 18, "writing" in 28, "deck" in 14, "spell" in 15, "tool" in 47.
- Age does not explain it. The 30 formal works dated August or early September are named by **none** of
  his prompts, although 35 prompt files are dated September.

**What the count can show:** where the shop's and his own written attention went, inside the tree.
**What it cannot show:** readers outside the tree (the Google Doc comments are not in it); whether a
mention was praise, a correction or a complaint; his satisfaction. And "his prompts" include some
instrument-written session seeds, which inflates the tool count a little. [MINE]

**READING.** The first dissertation, `h/DISS-2026-09-08-ai-diligence-sysops.md`. Six files name it; none
of his prompts do by filename. Yet it is the one work in the tree with recorded outside comments
(`model.md:776`), and his prompt today calls those comments "a pretty meaningful but of thinking just
with those comments already shared" (line 7). So the probe is blind to exactly the traction he names. The
counter-case: Bryant, the lab's most active outside party, engaged this month through skills and tools as
well as through writing: "His offer 2.3 run here: his three damaged skills reached us through the 09-17
import" and "His 2.2 (the sw1ng repro)" (`model.md:84-86`).

**STATUS.** In-tree traction: instrumented today. Outside traction: absent in the snapshot; the registry
exists on the host.

**Verdict (JUDGED).** **Not shown by anything I could count, and the in-tree count points the other
way:** tools draw his prompts' attention most, formal writing least. The outside evidence is one case each
way, which cannot rank anything. His valuation (d) stands as his. [HIS]

*Concern [MINE]:* two of today's documents already use H2 as a ranking weight: "The writing programme (the
work with the most traction)" (`writing/execute-brief/bank-worklist.md:28`) and "the traction of the
writing programme" (`writing/execute-brief/tracks/forks-summary.md:23`). *Falsifier:* count `evidence/comments.tsv` rows, and
Bryant's, Alfred's and Bridget's contributions, per kind of work. If writing leads that count, the weight
is earned and my concern is wrong.

---

## Board H3 — ideas that deserve "backing viewpoint writing"

**SENSE.** An idea cited in many places and argued in none carries load without footing.

**CANON.** `writing/execute-brief/tracks/unwritten.tsv`: twelve ideas the reader found cited but never argued in a PAPER, DISS,
ESSAY, LENS, GUIDE or `analysis/` file.

**PROBE** (replayable): for each idea, `grep -ciE '<its pattern>'` over each of today's works (patterns
as in `unwritten.tsv`, column 4), then a read of the matching sections to tell argument from mention.

**OBSERVED, then the status now.**

| idea (plain words) | argued today in | status now |
|---|---|---|
| U01 ghostwheel as a field-support system image | elected-image I-III | argued |
| U02 peers electing their system | what-a-member-keeps I-III; elected-image III | argued |
| U03 the puppet and its operators | rings §2; elected-image III | argued |
| U04 degrade honestly | what-a-member-keeps V | argued |
| U05 users keeping each other honest about quiet changes | what-a-member-keeps VI | argued |
| U06 social ingress against technical egress | elected-image IV | argued |
| U07 must versus journey | rings (it calls itself the deck's "first written argument", `:17-18`) | argued |
| U09 double-entry books as a practice | elected-image V; what-a-member-keeps V-VI | argued |
| U08 patterns the user did not act on | what-a-member-keeps VII, kept small on purpose | partly |
| U11 resume-forward | elected-image V (finds "no RESUME files") | partly |
| U10 "Account Checks First, Disclosure Always" | cited in what-a-member-keeps' coda only | **still unwritten** |
| U12 certainty and adoption | no hits in any of today's works | **still unwritten** |

**READING.** What did backing writing buy? In every case I checked, it **changed** the idea it backed:

- elected-image shrank "the first tool in human history" to a narrower claim that survived its search
  (`writing/elected-image/ESSAY-2026-09-27-the-elected-image.md:495`, E7 "not shown as worded");
- rings narrowed the reader's "one ring's rule read as every ring's rule": blind readers found no ring in
  5 of 14 rows (`writing/rings/PAPER-2026-09-27-every-rule-carries-its-ring.md:383`);
- what-a-member-keeps found four places where no source agrees (how a group of more than two decides,
  quiet security fixes, sanctions, who owns co-elected words);
- the doubled-nine grounded only half of the two-readers claim
  (`writing/two-readers/EXPERIMENT-2026-09-27-doubled-nine.md:31`).

**STATUS.** Coverage instrumented (the grep); value gestured (four readings, one reader: me).

**Verdict (JUDGED).** **Borne out, with a price.** Eight of twelve ideas now have a backing piece, and
each piece corrected the idea it backed, which is what backing writing is for: the idea gets a chance to
fail. The price is his attention: today's writing raised 31 decisions marked his alone and discharged 8.
Two ideas are still unwritten (U10, U12). Under his "Where we find work that we have noted to complete but
it isn't done, let's do it" (line 11), they are owed work, not a decision. [MINE] *Falsifier:* if the
pieces for U10 and U12 come back purely confirming, with nothing narrowed, then "deserve" weakens to
"would be nice".

---

## Board H4 — contradictions as the foremost freedom opportunities

**SENSE.** Where two pieces of advice pull apart, someone is being told to do two things. If the pull is
really about *who* the advice is for, the resolution is a switch the user holds.

**CANON.** `writing/execute-brief/tracks/tensions.tsv` (25 tensions: 14 turn on scope, 7 are real, 3 are misreadings, 1 is
superseded, `writing/execute-brief/tracks/tensions-summary.md:25`); the bank readers' contradiction lists (8 in half A, 7 in
half B); the rings paper's blind sorting.

**PROBE** (replayable): the rings paper's blind reading. Two sessions with no tools saw only the quoted
rule pairs and plain definitions of three places (one person's lab, a lab shared with partners, an org's
desktop-support deployment), and said which rule applies where. Prompt and raw answers:
`writing/rings/blind/`. A human can be given the same prompt.

**OBSERVED.**
- Of the 14 scope rows, 8 varied by ring for both readers; 5 varied for neither
  (`writing/rings/PAPER…:383-392`). Where they varied, it was mostly the org that drops the looser rule;
  inside one person's lab or a team's, both rules stood.
- The rows that did sort by ring (T01 stop or ask, T03 specific or sensitive, T04 house numbers, T05
  "undeclared reads as MUST") are the ones the tension reader rated highest for freedom. The rings paper
  also found "8 parts written for his ring travel into every project" (`:453`), found only because the
  pairs were sorted.
- Of the 7 real tensions, 3 need his ruling, 2 are the instrument's own text to fix, 2 are owed work under
  rules he already gave (`:459-461`).
- The bank's 15 contradictions: I read 3 as bearing on what someone else may do (the savane-forensics
  embargo, who must sign, hyphens as house preference or rule). The rest are bookkeeping: a letter's
  meaning, reused ids, uneven row widths. [MINE, a judgement]
- A new case, not in the tension track. His own top block says both "be brave in guessing, brave in
  writing, bold in asserting our learnings *somewhere*" and, of errors, "For the lab errors are facinating
  and useful: for the reader of our works in the abstract overmuch focus is beyond distracting"
  (`d/door/00-keeper-top-block.part:21`). Against the shop's "prove it, don't defend it", that reads as a
  contradiction. His own sentence resolves it by audience: bold in the lab, substantiated for the reader.

**READING.** T04, house numbers. The advice pulled three ways (no numbers without a gauge; invent from 4,
9 and 17; magic numbers become quotas). Sorted by ring, it became his ruling: "a GRAIN of these is simple
(typical) user privilege, imply that teams have MORE of this and not less, but that ORGS have little to no
tolerance" (`magic-number-theory/ESSAY-2026-09-26-magic-number-theory.md:982-984`). That is a
contradiction turned into a freedom a single user holds.

**STATUS.** Partly instrumented: the blind sort was run once, by readers from my own model family.

**Verdict (JUDGED).** **Partly borne out.** Most apparent contradictions are about scope. Where the scope
is ring, resolving the pull yields a concrete freedom (a user's own wires; rules that stop leaking into
strangers' projects), and those are the high-freedom rows. By count, though, most contradictions are
bookkeeping or need a plain ruling. "Foremost" holds by freedom value, which is a judgement, and fails by
count (the rings paper says so of itself, `:466`). *Falsifier:* a human reader, Bryant for instance, given
`writing/rings/blind/PROMPT-plain.txt`, cannot sort T01, T03, T04 and T05 by ring.

---

## Board H5 — the elected image unites the work, "self-evident"

**SENSE.** One picture (a group's ghostwheel as the system image its members support each other on)
should explain the ingress and egress split and the two practices, without strain.

**CANON.** The elected-image essay's own scorecard, E1-E8 (`writing/elected-image/ESSAY…:489-496`).

**PROBE.** Hold each of that essay's verdicts against the other works written blind to it today.

**OBSERVED, and what the cross-check changes.**

| his expectation (short) | essay's verdict | after cross-check | why |
|---|---|---|---|
| E1 ghostwheel as a system image for parity | partly | partly | unchanged |
| E2 support is bounded by users' freedoms | shown | shown | unchanged |
| E3 control and freedom fit together | shown, once "elected" is added | **partly** | the essay's evidence is the tension reader's falsifier; the rings paper ran that falsifier, and it fired for 5 of 14 rows |
| E4 ingress and egress unite the work | partly | partly | unchanged |
| E5 double-entry books | partly | partly, **strengthened** | what-a-member-keeps, blind to it, derived the same balance on its own (a claims check, and a balance struck where the image is published) |
| E6 bold, resume-forward guesswork | partly | partly | his top block is the rule; four door parts still lead with correction history (rings T21) |
| E7 "first tool in human history" | not shown as worded | not shown | unchanged; the narrow claim stands untested by a human |
| E8 "self-evident" | partly | partly | the shop's own writing did not find the unity before today |

Tally after cross-check: **shown 1, partly shown 6, not shown 1.**

**READING.** The double-entry case (E5). Two works written in parallel reached the same mechanism, a
balance that reports a difference and never blocks, from different outside sources (Certificate
Transparency and the xz backdoor in one; PLUGIN-PARITY and the junctures ledger in the other). That is
the strongest agreement found today. But the two point it in different directions; see disagreement X2.

**STATUS.** Gestured: argued, one case each. Nothing is instrumented yet: no trial balance for an image
exists, and ingress has no record of its own.

**Verdict (JUDGED).** **The unity is partly shown; "self-evident" is not.** It took an added word
("elected") and the ring model to see it, and the shop's own writing had not argued U01, U03, U06 or U09
before today. What falls short are practices (an ingress record, a balance for the image, RESUME files),
not ideas. *Falsifier:* a reader new to C4 who reaches the ring table from his paragraph alone, unaided
(the essay's own E8 test).

---

## Where several kinds of source agree: "the correct answer" candidates

Kinds: **His** = his words (q/ prompts, his prompt today, lines the record quotes as his, HIS door parts).
**Older** = shop writing before today. **Today** = today's works, counted once. **Outside** = prior art
today's works cite.

| # | conclusion | His | Older | Today | Outside | kinds |
|---|---|---|---|---|---|---:|
| R1 | A member keeps their copy, their work, their credit and their exit. A group may require only what its members wrote down and consented to, and the outer ring never inherits the inner ring's requirement. | "C4's own best practice does not govern what someone else does with their computer." (`d/door/36-his-attribution.part:16`); "that is proper" (`q/PROMPT-2026-07-31-corwin-metalanguage-and-bootstrap.md:34`); orgs "little to no tolerance" (magic-number essay `:983-984`) | "the outer never inherits the inner's" requirement (`analysis/ceremony/PAPER-2026-09-24-users-pick-ceremonies.md:116`); "later withdrawal wins", "no override exists" (`MEMORY.md:361-362`) | what-a-member-keeps III; elected-image III; rings §2 | GNU freedoms 1 and 3; Debian constitution §2.1.1; forking without permission; GDPR Art. 20; Hirschman; Ostrom | 4 |
| R2 | Disclose, don't gate, for anyone outside a consenting ring. A missing or undeclared thing nags its builder and never widens a rule for a reader. | "ACCOUNT CHECKS FIRST, DISCLOSURE ALWAYS." (`decks/accountability-first.deck.md:2`); "no filter may go unannounced" (`MEMORY.md:2974`) | "A missing part must be DISTINGUISHABLE FROM A PART THAT HAD NOTHING TO SAY" (`decks/degrade-honestly.deck.md:44-45`); the ceremony paper | rings D3; what-a-member-keeps' claims check; the bulk decision's Q10 "weaker form: disclose" | Debian Social Contract clause 3; Certificate Transparency; reproducible builds | 4 |
| R3 | A balance that reports a difference, never blocks, and can never be sorted by member. | "use your best double entry bookkeeping" (quoted as his, `q/junctures/README.md:12`) | the junctures ledger; PLUGIN-PARITY; degrade-honestly | what-a-member-keeps VI; elected-image D5 (reached blind) | xz backdoor; Certificate Transparency | 4, **split on direction (X2)** |
| R4 | Signatures and ceremony only where a named reader relies on them. | "no signing asks without a named reader" (`MEMORY.md:2746`) | the ceremony paper; the 09-17 signature removals | rings T06: both blind readers saw no conflict once "a named reader relies" was read; bulk decision B2 | none cited | 3 |
| R5 | A house number is a labelled, chosen default its owner may change; never a measurement, never a quota over other people; an org lists and explains each counted wire. | his 09-26 ruling (essay `:982-984`) and the puppet analogy | the magic-number essay; tension T04 | rings T04 and D6; bulk decision D37 and D40 | none cited | 3 |
| R6 | A model of a person needs that person's own words and consent; an invented other is unstable. | "credit people, don't leave them out to protect them" (`MEMORY.md:2974`) | BRYANT.md: "Bryant names his own terms" (`modelthisbook/BRYANT.md:6`); CORWIN.md §22, "Each co-author names their own" (`:359`) | the doubled-nine: the Bryant view was the least stable, because every run had to invent him; bulk decision D27, "ask her first" | none cited | 3 |
| R7 | Bold in the lab, substantiated for the reader: lead with the best current answer, keep the history beside it. | "boldest in leading with the best and most current information"; "We can always make RESUME.md" (`d/door/00-keeper-top-block.part:21`) | the self-healing-resume deck; tension T21 | rings T21; elected-image L3 and D1; the two-readers review's "must not ship as written" | none cited | 3 |

**Short of three kinds** (agreed inside the shop only): *readers from one model family are not
independent witnesses, and a human outside reader is the next witness.* Older writing asks for "an
actual second reader" (`h/DISS-2026-09-17-two-readers.md:443`); today, every work that used blind
sessions says so of itself (rings §7, the experiment's limits, the review's disposition, the rework's D7).
I found no line of his that states it, and no outside source was cited for it.

**What agreement cannot show.** Three of the four kinds pass through one hand: mine, or my model
family's. His words are quoted by the record the instrument writes; the older writing was mostly written
by the instrument; today's works are the instrument's. Only the outside column is independent in kind, and
R4 to R7 have none. [PLATFORM] *Falsifier for the table:* a human reader who knows the tree (Bryant,
Alfred, Dee) marks any row as something he never said or would not hold.

Whether to treat R1-R3 as settled and R4-R7 as leans is his call: `execute-brief-lens-D1`.

---

## Where the works disagree (named, not smoothed)

| # | who says what | my reading | whose move |
|---|---|---|---|
| X1 | elected-image (E3 "shown"; E8 "14 of 25") and what-a-member-keeps (its kept loser, "14 of its 25 tensions") repeat the tension reader's count. rings ran that reader's falsifier: no ring in 5 of 14; where a ring decides, it is mostly the org side. | Echo, not agreement: both repeat one track. The rings number is the only one tested. E3 should read "partly". | an erratum beside the essay (execute-brief-lens-D7) |
| X2 | elected-image D5: a tool "that prints where one member's machine differs from the ring's declared list". what-a-member-keeps: a deletion "In the member's own copy: no" need not be announced (`:438`), and "if any output of the claims check or the balance can be sorted by member, it has crossed the line" (`:485`). | Same mechanism, pointed two ways. It stays a member's freedom if the member runs it on their own copy and the output is theirs, shown only when they ask the group for support. | his (execute-brief-lens-D4) |
| X3 | the bulk decision D40: "Your words verbatim; readings as cards". what-a-member-keeps D6: restate the recorded goal as "one reader and a cheap balance". elected-image D1: narrow the "first tool" claim for publication. | Not in conflict once record and publication are kept apart (R7): his words stay verbatim in the record; a published wording is a labelled reading beside it. D6 rewrites a MEMORY bullet that is the instrument's record of his reframe, not his raw words; it is still his goal. | his (execute-brief-lens-D5) |
| X4 | ai-diligence-sysops D1 recommends "Both editions, one text"; the bulk decision D38 recommends "FSF sysops reader, practitioner essay". | Two cards answer the genre question differently. D38 is really about the evaluator; D1 is about the genre, and its answer is already built (v0.2, the two-column HTML, the card). | his (execute-brief-lens-D6) |
| X5 | the bulk decision D32 recommends rewording Q258. The doubled-nine drew Q258 blind: 8 sessions split 4 and 4 between reword and footnote. | The reader tracks lean one way; eight blind readers did not. A tie is evidence the lean is not settled. | SPA presentation (execute-brief-lens-D8) |
| X6 | the bulk decision D37 keeps "Bryant's persona hold until Bryant says yes"; D42 and B11 wait for his instruction. His mid-turn note plans to "republish BRYANT.md". model.md says Bryant's r2 package was "cleared for publication by either maker" (`model.md:84`) and leaves open "does r2's clearance lift the hold on Bryant's persona?" (`:123`). | His note may be the instruction, and r2 may be Bryant's yes, for republication. A combined model is a new use that neither clearance names. | his, with Bryant (execute-brief-lens-D2 and D3) |
| X7 | the bank worklist and the forks ranking use H2 as a weight. Board H2's count points the other way. | Keep H2 as his valuation; stop using it as a measured weight until the outside count runs. | his (execute-brief-lens-D9) |
| X8 | older vs today: the two-readers dissertation says "The method has been proved." (L171-172). Today's experiment: partly grounded; the review says it must not ship as written. | Today's run supersedes, and the review already offers replacement text. | already carried by two-readers D1 |
| X9 | older vs today: the tension summary says "the largest freedom opportunity is one mechanism". rings: "That ring is the biggest opportunity by count. It is not." (`:466`) | Both can stand: largest by freedom value (a judgement), not by count. | none; noted |

---

## The combined CORWIN + BRYANT model, against today's findings

**OBSERVED.**
- CORWIN.md, the persona model of him (written by the instrument from his prose), §22: "**Multi-player
  Claude = a FEDERATION of consented single-player models** (CORWIN.md + a future BRYANT.md + …), **never
  a merged brain.**" (`modelthisbook/CORWIN.md:353-354`). The same section says "blend the work,
  keep the voices distinct" (`:355-356`). Its §25 lists as open: "**Co-authored persona?** — does a co-authored *book*
  want a co-authored *persona model*; is attribution a 13th aspect or folded into S2/§5? The deepest
  seam." (`:425-426`). His mid-turn note answers that open question: yes.
- BRYANT.md calls itself "a sibling to CORWIN.md in the federation (NOT a fork, NOT a merge)"
  (`modelthisbook/BRYANT.md:4`).
- Size in the snapshot: CORWIN.md 36,504 bytes; BRYANT.md 5,647 bytes (the book-seat v1.0) or 3,717 (the
  v0.2 seed). The version Bryant cleared, v3.0.1-public, is named in `model.md:83` but is not in the
  snapshot.
- The two-readers experiment used a stand-in for CORWIN.md because `modelthisbook/` was not in the first
  snapshot. The real file is in ``. [MINE] The experiment's own falsifier ("the same kit with
  `modelthisbook/CORWIN.md` loaded") can now be run.

**JUDGED, against each of today's works.**
- **The doubled-nine.** "The persona changed the *reasons* given, not the *decision*"
  (`EXPERIMENT…:31`). If that holds for a combined model, what others elect by choosing it is mostly how
  their assistant explains itself, and in whose words. So the value and the risk sit in attribution, not
  in outcomes. The Bryant view was the least stable because every run had to invent him (`:164`). A
  combined model built by volume would be roughly six parts Corwin to one part Bryant, and it would invent
  the rest of Bryant. The Bryant half has to come from Bryant's own words. (A faint, post hoc hint: the
  "intersection" view moved least in both runs, ranks 29 and 15 of 35. The agreed core may be the stable
  part. Too small to lean on.)
- **The rings paper.** Two authors make it a team artifact. When another shop takes ghostwheel.org and
  elects the combined model "in their shop", it becomes that shop's image, and an org shop owes its
  audience a view of the wires: which trait is whose. The door parts already carry `owner HIS/MINE` in a
  header; the same line per trait would do (CORWIN / BRYANT / BOTH / SPLIT).
- **What a member keeps.** Each author keeps his own single model, published beside the combined one.
  "Later withdrawal wins" and "no override exists" (`MEMORY.md:361-362`) apply to each author: if either
  withdraws, the combined model degrades honestly. His traits drop out and the file says so. It stops
  claiming a joint election it no longer has.

**The fork** (`execute-brief-lens-D3`; the consent question is `execute-brief-lens-D2`). (A) **A federation index** (recommended): a combined file whose every trait says whose it
is, where the two agree, and where they split, with both single models kept beside it. This is "blend the
work, keep the voices distinct", and it is the two-readers paper's four views made public: me, other A,
other B, and where they meet. (B) **A fused persona**: one voice written from both. This is the "merged
brain" §22 rules out, and it is the easier file to write. (C) **No combined file**: two files and a short
chooser. *The losing option at its strongest:* B is what a newcomer can actually use on day one. Two
voices plus a split list asks the newcomer to adjudicate between two strangers, which is the choice his
note wants to spare them ("in place of picking his or mine"). B loses because it cannot degrade honestly
when either author leaves, and because the experiment says a fused voice would carry mostly Corwin's
reasons under both names.

**Probe for the recommendation.** A three-arm doubled-nine (CORWIN, BRYANT, COMBINED; four runs each; a
live bank question drawn by seed, as the experiment did). *Falsifier:* if the COMBINED arm's reasons trace
to lines in neither single file, the index has become a fused voice. If its decisions differ from both
single arms beyond the rerun noise, the combined model is carrying decisions, and the "reasons, not
decisions" reading above is wrong.

---

## Findings, in one place

1. **H1** holds for the running record and not for the formal writing: 110 of 159 answered rows cite
   MEMORY, model.md, C4.md or the bank; 13 cite formal writing first. The formal writing raises about ten
   questions for each one it settles.
2. **H2** is not shown by any count available here, and the in-tree count favours tools. It stands as his
   valuation, and the worklists should stop using it as a measured weight.
3. **H3** is borne out: eight of twelve ideas now have backing writing, and each piece corrected its idea.
   U10 and U12 are owed.
4. **H4** is partly borne out: the contradictions that sort by ring are the high-freedom ones, but by count
   most contradictions are bookkeeping.
5. **H5**: the unity is partly shown (1 shown, 6 partly, 1 not). It is not self-evident.
6. **Seven conclusions** have three or more kinds of source behind them (R1-R7). R1, R2 and R3 have four,
   including outside prior art.
7. **Nine disagreements** are named (X1-X9). X2 (the balance's direction) and X6 (the combined model and
   the persona hold) bear on other people's freedom; the rest are bookkeeping.
8. **The combined model** fits every one of today's findings if it is built as a federation index, and
   conflicts with CORWIN.md §22 if it is built as a fused voice.

---

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.

```
LENS · the writing held against what is still open · 2026-09-27
a  my view: the record answers the bank, the papers mostly ask; backing writing earns its keep by correcting the idea it backs; seven conclusions stand on three kinds of source, and three of them stand on four.
b  the view I ascribe Corwin: the writing is where the value is (H2), the answers are already in it (H1), and the contradictions are openings; he wants that shown or not shown, plainly.
c  their pull on mine: his H2 pulled me to look for writing's traction; I built a count that could have shown it, and it showed the reverse, so I kept his valuation apart from the count rather than bend either.
d  my pull on theirs: I ask him to stop treating "most traction" as a measured weight, and to read three of my four "kinds of source" as passing through my own hand.
persona / inverse: the keeper-as-author says "the papers are the work that lasts" / the inverse, Bryant reading the combined model, finds what the persona could not: a file six parts Corwin to one part Bryant is Corwin's picture of him, and only Bryant's own words make his half real.
principles reframe: 1. universalism: every rule should say whose it is and which ring it binds, so no member, co-author or stranger is bound by a voice or a count they did not elect (R1, R5, R6). 2. the four freedoms, free software and the wider community: freedoms 1 and 3 hold on each member's copy, and on each author's model; what a group adds is a balance that shows the difference, never a gate (R2, R3), which a community can check without trusting the maker.
notes: written. Probe and its run beside this file; decisions in lens-decisions.json; work done in lens-done.json.
```
