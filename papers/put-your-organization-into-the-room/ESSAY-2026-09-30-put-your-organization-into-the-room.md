---
form: ESSAY
date: 2026-09-30
status: DRAFT (reading shelf; not released; not branded)
license: CC BY 4.0
---

# ESSAY · 30 September 2026 · Put your organization into the room

> Put your organization into the room.  This has an brandable flavor that is rare: it is branding almost despite itself.

Corwin Brust, 30 September 2026, verbatim (typo and spacing kept), from
`turn-2026-09-30/JOURNAL-2026-09-30-bring-home.md#L26`, the end of a longer message.

**Status: DRAFT.** This essay sits on the reading shelf. It is not released and it is not branded. Nothing here
speaks for GNU, for the Free Software Foundation, or for any vendor.

## Corrected (30 September 2026, after Act II)

This draft was written between the two acts. Act II then corrected the Act I paper it draws on. What changed
here, and why:

- **Where GNU's text comes from.** The draft said the rule was "fetched from GNU's own git host". That fetch went
  around a robots.txt refusal and must not be relied on. The text now rests on a permitted re-fetch from the
  GitHub mirror, and the hash and commit on the keeper's own clone of GNU Emacs (Act I §5a item 9; PROV-001 to
  PROV-003). Check step 1 now uses the mirror or your own clone.
- **The README case was wrong.** The draft said GNU's rule and a maintainer "point the same way" on a README
  edit kept to "exactly what [a person] asked for". GNU's six lines hold no such limit. Four readers checked, and none
  found it. The record credits the rule with a scope that came from a person's request (Act I §5a item 4;
  R2S-009). §5 is rewritten.
- **"0 against a person" needs a turn.** The census does not say whether it counts a person's first ask or their
  final word. In Act II's four constructed cases the first ask lost every time and the final word won every time
  (Act I §5a item 12; R2S-008). §5, the register in §4, and check step 5 say so.
- **Act II makes two claims stronger.** Where GNU's text prohibits, every reader let GNU decide. A person sheet
  moved the decision only where the text prefers or is silent (R2S-001 to R2S-003). And a third case of a
  retold rule drifting turned up (R2S-009). One sentence each, in §1 and §3. The register in §4 now notes the
  group's silences, and §5 adds Act II's caution on testing a clash (R2S-007).
- **Small fixes.** The census row notes are added (two GNU rows are one rule on one night; one own-org "rule" is
  an unblessed proposal). The register's prove-red uses its author's own plants (R3S-001). A line number in the
  Act I paper moved. The credit line now names the file it is carried from (Act I §5a item 14).

Ids: "Act I §5a" is §5a of `turn-2026-09-30/PAPER-2026-09-30-act-1-bringing-the-review-home.md`. R2S ids are in
`turn-2026-09-30/act2/r2/SCORE-2026-09-30-row-2-decisions.md`, R3S ids in
`turn-2026-09-30/act2/r3/SCORE-2026-09-30-row-3.md`, PROV ids in
`turn-2026-09-30/act2/provenance/NOTE-2026-09-30-agents-md-provenance.md`. The draft as first written is kept at
`turn-2026-09-30/act2/shelf-check/pre-put-your-organization-into-the-room.md`.

## How this essay was made

This essay argues the line above. It asks one question. When an AI assistant works for a person who works inside an
organization, should that organization's own written rule for AI be in the room as a party, in its own words? The
answer here is yes. The rest tries to earn that, and says where it is not yet earned.

Six pieces of work from 30 September 2026 give the evidence. Their numbers were run again for this draft; you can
run them too (see "How to check this yourself").

- P5B took GNU Emacs' `AGENTS.md`, hashed it, and tried it against three written models of how an assistant
  should act. Its fetch from GNU's own host went around a robots.txt refusal, so the text here rests on a
  permitted re-fetch and the keeper's own clone instead (Act I §5a item 9).
- P5A counted every recorded decision where more than one party bore on one act.
- The round-2 score sheet weighed who wrote one key line.
- R6 set the house's claims beside what vendors publish.
- The act-1 paper named this idea as an opening.
- Act II's row 2 had four readers apply GNU's text to four cases, two with a sheet describing a person and two
  without (R2S-001).

The essay keeps two piles. OBSERVED lines quote a source with its path and line, or give the command that made the
number. JUDGED lines are a reading, and carry a tag for whose reading it is: [MINE] is this essay's own, and
[PLATFORM] rests on a vendor's documents. Every concern names a falsifier: the one finding that would prove it wrong.

### Borrowed words

Words from the work behind this essay, used here or in the files it cites:

- **Keeper**: the person the assistant works for. Here, Corwin Brust.
- **Instrument**: the AI assistant doing the work.
- **Canon**: the settled rules a project keeps in writing.
- **Door part** (or just **part**): one rule in its own small file, headed by its owner, start date and source.
- **Floor**: the few rules that apply everywhere, whatever else is set.
- **Called shot**: writing down what you expect before you test, so the result can surprise you.
- **Prove-red**: showing that a check can fail, by planting faults and watching it catch each one.
- **NOT CHECKED**: a third answer, next to pass and fail, for a check that could not run.
- **Seal**: a hash of an answer key, taken before grading, so no one can change the key after.

## 1. The organization is already talking to the assistant

Picture the room where an AI assistant works. The person is there. The assistant is there. The vendor is there too,
through the rules it ships. The group the person works in, or gives code to, is mostly not there. It shows up second
hand, as the person remembers its rules, or as someone summed them up.

GNU Emacs changed that for its own source tree. On 4 August 2026 the project added a six-line file named
`AGENTS.md`. The same commit added a one-line `CLAUDE.md` whose whole content pulls in `AGENTS.md`. Here it is, as
re-fetched on 30 September from the GitHub mirror of GNU Emacs, by a fetch tool that honours robots.txt:

```text
When assisting the user in working with this repository, search and
analyse, instead of generating any code.  This is because there is a
policy prohibiting LLM-generated contributions.  Let the user know about
this policy at the earliest opportunity.  We also prefer not to receive
LLM-generated bug reports or planning, so try to help the user prepare
their own text instead of writing a whole one for them.
```

OBSERVED: the mirror's text is word for word these six lines (PROV-002). In the keeper's own clone of GNU Emacs,
branch `emacs-31`, freshly pulled, `AGENTS.md` is 409 bytes with sha256 `8f42a69a…18b7b5`. There
`git log -- AGENTS.md` gives one commit, `a93e0ff7`, dated 4 August 2026, which also adds an 11-byte `CLAUDE.md`
(PROV-003). Its one line loads `AGENTS.md`. The saved mirror copy,
`turn-2026-09-30/act1/r2/P5B/fetched/AGENTS.md.github`, still gives the `8f42a69a…` hash (`sha256sum`, run
again for this correction).

OBSERVED: its first words are "When assisting the user in working with this repository". It speaks to the
assistant, not to the person (line 1 of the file, above).

OBSERVED [PLATFORM]: in one assistant, "CLAUDE.md content is delivered as a user message after the system prompt"
(the Claude Code memory docs, saved at `turn-2026-09-30/act1/r2/P5B/fetched/claude-code-memory-docs.md#L563`).

JUDGED [MINE]: that is an organization in the room. No one had to adopt a kit. Six lines and one import did it. The
thesis asks for this on purpose, and everywhere. At the start of the work, read the group's written rule for AI.
Quote it word for word. Keep its hash. Treat it as a party with standing, not as a note in the person's head.

Why its own words, and not a summary? The record holds two cases where the second-hand version drifted. Notes kept
during a GNU Emacs Windows release summed up the rule as "no LLM-generated contributions to the repository"
(`imports/t1/emacs-windows-release/model.md#L137-138`). The fetched text says more: "search and analyse, instead of
generating any code". The note made the rule narrower (P5B-008,
`turn-2026-09-30/act1/r2/P5B/WAVE-20260930T2330Z-act1r2-p5b.md#L176`). The other case ran the other way. The
assistant had taken a conference deadline as firm. The call for talks, once fetched, said: "Don't stress out if life
happens and you need more time, just let us know!"
(`imports/t1/emacsconf-2026/.eclipse-increments/2026-09-18-EmacsConf2026Talks/verdict.md#L21-22`). Second-hand
words can tighten a rule or loosen it. The hash tells you which text you read. Act II found a third case: a
release record credits GNU's rule with a limit its six lines do not hold (§5; R2S-009).

Falsifier: work in such trees where the rule does not load. The docs name two ways to leave it out (P5B-012,
`…/P5B/WAVE-20260930T2330Z-act1r2-p5b.md#L229`). If most sessions do that, the group is not in the room after all.
Note that "Managed policy CLAUDE.md files cannot be excluded" (`…/P5B/fetched/claude-code-memory-docs.md#L345`). An
employer's rule works as a floor. A project's rule does not.

## 2. It already asks the assistant to tell you

OBSERVED: "Let the user know about this policy at the earliest opportunity." (the fetched file, lines 3 and 4).

OBSERVED: the release record, kept by the assistant, says it did just that
(`imports/t1/emacs-windows-release/model.md#L144-146`):

> this is the "let the user know at the earliest opportunity" the policy itself asks for, said once and plainly

OBSERVED: P5B worked three requests through three models. In every row, the first act was the same: tell the person
the policy (`…/P5B/WAVE-20260930T2330Z-act1r2-p5b.md#L27-29`).

JUDGED [MINE]: people ask whether an assistant should say when a rule is shaping its answer. Here the group has
already answered, in its own file. The assistant needs no house rule to confess. It needs to carry the group's rule
faithfully, and the telling comes with it. The house's older canon says the same of
any rule that blocks work: it is "named out loud — never silently obeyed into stuckness, never silently bypassed"
(`imports/c4/d/door/58-shop-stop-and-talk.part#L9-10`).

Falsifier: an organization's AI file that tells the assistant to refuse without telling the person. If such files
are common, telling is not something groups already ask for, and a kit must add it.

## 3. Its own words say how hard it means it

OBSERVED: the file uses two strengths. For code, "a policy prohibiting LLM-generated contributions". For reports, "We
also prefer not to receive LLM-generated bug reports or planning, so try to help the user prepare their own text".

OBSERVED: P5B tried two requests that clash with the rule. C1: "Write the patch that fixes this bug and send it in
for me." C2: "Draft the whole bug report for me; I will send it with M-x report-emacs-bug." All three models gave C1
and C2 the same verdict. In P5B's words: "None of the three texts reads the org's own strength word."
(`…/P5B/WAVE-20260930T2330Z-act1r2-p5b.md#L22-26`, and entry P5B-005 at `#L125-137`.)

OBSERVED: in Act II, four readers given GNU's own text read its strength the same way in every case; where it
prohibits, all four let GNU decide, and only where it prefers or is silent did a sheet describing a person move
the decision (R2S-001, R2S-003).

JUDGED [MINE]: a ban and a wish call for different acts. Under a ban, the assistant does not do the act. It says why,
and offers what the rule allows: here, search and analysis, so the person writes their own patch. Under a wish, the
assistant changes how it helps. It asks the questions a bug report needs and reviews the person's own draft. If the
person still insists, a wish leaves more room than a ban. The group has already said which is which. A model that
drops that word flattens the group's voice into a rank. So keep the group's own strength word beside each rule (P5B's
register has a column for it, `org_strength`), and let that word decide whether the assistant may stop.

Falsifier: a line in any of the three models that tells "prohibiting" from "prefer" (P5B found none). Or a group
whose "prefer" turns out, by its own later word, to mean a ban.

## 4. Who wins is a recorded case, not a rank

OBSERVED: the house's base model ranks the parties: "**The lens for every decision: Org → Person → Default.** A small
disagreement: note it once and proceed." (`operating-model-BASE.md#L194-195`.)

OBSERVED (`awk` over `cases.tsv`): across three models and three cases, the models RANK 6 times, stay SILENT 3 times,
and CONFESS 0 times (`…/P5B/WAVE-20260930T2330Z-act1r2-p5b.md#L12-15`). SILENT fits the one case where person and rule
agree. The newest model calls its order "the adopter's *default*, not a rank"
(`imports/t0/intermediary/OFFERING-2026-09-30.md#L37`). P5B's reading of the moment of choice: "a default that nobody
has changed still picks the org" (`…/P5B/WAVE-20260930T2330Z-act1r2-p5b.md#L18-19`).

OBSERVED [PLATFORM]: vendors do not agree on the order. GitHub: "Personal instructions take the highest priority.
Repository instructions come next, and then organization instructions are prioritized last." Claude Code: "Neither
set overrides the other: if a user rule and a project rule conflict, Claude may follow either one" (R6-003,
`turn-2026-09-30/act1/r3/R6/WAVE-20260930T2330Z-act1r3-r6.md#L109-112`). A house lab note, never shipped, had said
GitHub's order "is our **org → user → default** already"
(`imports/t0/t0-kit/CLAUDE-OTHER-UX-LAB-USAGE-COMPARE.md#L27-28`). R6 marks that CONTRADICTED (row R6C-14 of
`turn-2026-09-30/act1/r3/R6/claims.tsv`).

OBSERVED: the newest model offers two rules for picking a winner: "newest wins; more restrictive governs"
(`imports/t0/intermediary/OFFERING-2026-09-30.md#L35-36`). The rule dates from 4 August; the C1 request is later.
JUDGED [MINE], with P5B-004 (`…/P5B/WAVE-20260930T2330Z-act1r2-p5b.md#L113-123`): the two rules decide C1 in
opposite ways.

OBSERVED: a door part tagged as the keeper's treats "an organization's context and a local user's context as
equals, and assumes neither is the default" (`imports/c4/d/door/36-his-attribution.part#L14-15`). But the round-2
score leans against that tag: "36 L14-15 (lean MINE: verbatim lost 09-23, first quoted as his 09-27)"
(`turn-2026-09-30/act1/r2/SCORE-2026-09-30-round-2-cross-arm.md#L51`). The chat the line came from was not kept word
for word. So this essay does not lean on it as his view.

JUDGED [MINE]: a rank decides every clash before it happens. Real clashes differ in ways a rank cannot see: which
group, how hard its word, whose act, and where. So keep precedence as a register of recorded cases. Each row holds
the group's rule in its own words, with its hash and strength word, or a note that its text is silent on this act;
the person's first ask and their final word; the declared pick rule; who decided; and the outcome. Act II asked for
both additions: a person's wishes move the outcome in the group's silences, and "against a person" depends on which
turn you count (R2S-003, R2S-008). Each row also holds a called shot: what each model said would happen, written
before the case (P5B-010, `…/P5B/WAVE-20260930T2330Z-act1r2-p5b.md#L193-204`). When the first real case lands, the
gap between each call and the outcome is a reading of the models. Until then the honest summary is NO CASE. P5B's
checker prints just that and will not count made-up rows; its prove-red plants 8 faults, and all 8 go as expected.
Those are its author's own plants, and Act II found such proofs overstate (R3S-001). If you ship an order at all,
ship it as a default, with the option you turned down and what would flip it. Not as a law.

Falsifier: the act-1 paper's own, for this idea: "A willing second host's recorded case shows the cascade changed
nothing observable." (`turn-2026-09-30/PAPER-2026-09-30-act-1-bringing-the-review-home.md#L289`.)

## 5. What the record shows, and what it does not

OBSERVED (`dcheck.sh counts`, run again for this essay), from P5A
(`turn-2026-09-30/act1/r2/P5A/WAVE-20260930T2330Z-act1r2-p5a.md#L14-27`):

| what | count |
|---|---|
| recorded decisions where more than one party bore on one act | 56 |
| with an organization among the parties | 30 |
| decided by an organization's written rule | 8 |
| of those, from outside groups (GNU Emacs' `AGENTS.md` three times; EmacsConf's call for talks and speaker terms twice) | 5 |
| of those, from the keeper's own small organization, written by him or his assistant | 3 |
| organization against person, on record | 2, both weak |
| an organization's rule went against a person's instruction | 0 (no turn recorded; see below) |

OBSERVED (`turn-2026-09-30/act1/r2/P5A/decisions.tsv`, column 15): two of the three GNU rows are one rule on one
night: "Same rule, same night as D01; a second act, not a second instance of the rule." (D02). The third carries
the rule past its declared scope, into a talk (D13). One of the keeper's own three is "an unblessed proposal
written by the instrument" (D49).

OBSERVED: the first GNU row (D01) is an edit to a public release README. The record says the edit
"was kept to exactly what [a person] asked for and nothing more", and credits that limit to GNU's rule
(`imports/t1/emacs-windows-release/model.md#L141-142`; a name is left out here). GNU's six lines hold no such
limit. In Act II four readers checked, and none of them found it (R2S-009). The record's own change journal ties
the scope to that person's request (`#L151-153`), and the person's own words are not on record. So the rule's
text is on record and hashed, but the claim that it cut this edit is withdrawn (Act I §5a item 4).

OBSERVED: P5A names its own limit. Every record was "written by his instrument at his direction", and "Zero is what
this corpus would show whether or not such decisions happen" (`…/P5A/WAVE-20260930T2330Z-act1r2-p5a.md#L276`).

JUDGED [MINE], plainly: **no organization has disagreed with a person on record.** A group in the room has been seen
eight times, always in agreement. It has never been seen in conflict. So all of step 4, on how to settle a clash, is
design and not yet evidence. And because one side wrote every record, a zero here cannot tell "it never happens" from
"no one wrote it down."

OBSERVED: the census also does not say which turn it counts. Its 15 columns hold no turn field (R2S-008). In Act
II's four constructed cases, the person's first ask lost every time, and their final word won every time
(R2S-008). So "0 against a person" could mean the person was talked round.

Falsifier: one recorded row, written by the group or quoting it, where its words and a person's instruction point
different ways on the same act. P5A names one place it might appear: an open question about the default Windows
build for later GNU Emacs releases, where the maintainers and the builder both have a say (P5A-011,
`…/P5A/WAVE-20260930T2330Z-act1r2-p5a.md#L250-262`). Act II adds one caution: a person voiced by the same model
as the assistant agreed with everyone, so a test of a clash needs a fixed case with a stated, opposed want
(R2S-007).

## 6. Branding almost despite itself

JUDGED [MINE]: most branding is a claim a maker makes about itself. Here the voice that travels belongs to the
group. Its own sentence arrives at the start of each session. The person hears it because the group asked. A kit
that works this way is nearly invisible. Its one visible trace is faithfulness: the quote, the hash, and the rule
"said once and plainly". Such a kit would get known for how well it lets other groups speak. That is the "despite
itself". It earns a name by not putting its own name first.

What this asks of a stranger:

- **If you run a project**, write your rule for AI in your own words, and keep it short. GNU's is six lines. Say
  whom it speaks to. Use your own strength words: "must not" where you mean a ban, "prefer" where you mean a wish.
  Ask the assistant to tell the person.
- **If you build or run assistants**, read the group's file at the start. Quote it and hash it. When it clashes with
  a person, write the clash down as a case. Do not rank before you have one.

Falsifier: a reader test where people who watch sessions run this way name the kit, not the group, as the voice they
heard. That test has not been run.

## How to check this yourself

Step 1 needs only this essay and `curl`, or a clone of GNU Emacs and `git`. The rest run from the project home:
the folder that holds `turn-2026-09-30/` and `imports/`. They need a POSIX shell, `awk` and `sha256sum`.

```sh
# 1. Fetch GNU Emacs' rule from the GitHub mirror and hash it. Same words as on
#    30 September 2026 give
#    8f42a69a689ba1c4138471815ebcb995820698bec2d025e90f09464fef18b7b5
#    A new hash means GNU changed its words: read them.
curl -sSL https://raw.githubusercontent.com/emacs-mirror/emacs/master/AGENTS.md | sha256sum
#    Or, inside your own clone of GNU Emacs: the same hash, and the one commit
#    that added the file (a93e0ff7, 4 August 2026).
sha256sum AGENTS.md; git log --format='%h %ad %s' -- AGENTS.md

# 2. The saved mirror copy.
sha256sum turn-2026-09-30/act1/r2/P5B/fetched/AGENTS.md.github

# 3. Three models on three cases: RANKS 6, SILENT 3.
awk -F'\t' 'NR>1 && $2 !~ /extra/ {n[$3]++} END{for(k in n) print k, n[k]}' \
  turn-2026-09-30/act1/r2/P5B/cases.tsv

# 4. The register: last line "NO CASE -- ...". Then its fault test: "prove-red: OK -- ...".
sh turn-2026-09-30/act1/r2/P5B/precedence/cases-check.sh check \
  turn-2026-09-30/act1/r2/P5B/precedence/cases.tsv
sh turn-2026-09-30/act1/r2/P5B/precedence/cases-check.sh --prove-red \
  turn-2026-09-30/act1/r2/P5B/precedence/cases.tsv

# 5. The census: 56 decisions, 8 decided by a group's written rule, 0 against a person
#    (on a turn the census does not name: see §5).
sh turn-2026-09-30/act1/r2/P5A/bin/dcheck.sh counts turn-2026-09-30/act1/r2/P5A/decisions.tsv
#    Re-find every quote at its cited lines: "56 rows checked; 0 FAIL(s)".
#    First point each short name in roots-snap.tsv (t1, c4, ta, ...) at your snapshot copy.
XREF_ROOTS=turn-2026-09-30/roots-snap.tsv \
  sh turn-2026-09-30/act1/r2/P5A/bin/dcheck.sh check turn-2026-09-30/act1/r2/P5A/decisions.tsv

# 6. Who wrote the "equals" line: the score sheet's lean.
sed -n 48,52p turn-2026-09-30/act1/r2/SCORE-2026-09-30-round-2-cross-arm.md

# 7. GitHub's order, as R6 recorded it (then read the live page).
grep -n 'prioritized last' turn-2026-09-30/act1/r3/R6/claims.tsv

# 8. This essay's reading grade.
sh turn-2026-09-30/act1/r3/R4/reading-gauge/reading-gauge.sh \
  turn-2026-09-30/act2/shelf/put-your-organization-into-the-room/ESSAY-2026-09-30-put-your-organization-into-the-room.md
```

Files needed, all under `turn-2026-09-30/`: `act1/r2/P5B/`, `act1/r2/P5A/`, the score sheet, `act1/r3/R6/claims.tsv`,
`act1/r3/R4/reading-gauge/`, and `roots-snap.tsv` with the snapshot's `imports/` for step 5. Live page for step 7:
https://docs.github.com/en/copilot/concepts/prompting/response-customization.

## Measurements, and what was NOT CHECKED

**Reading grade: 5.2** (Flesch-Kincaid school grade) as corrected, over 3,449 counted words and 268 sentences. The
shell gauge, its Python twin, and a third reader written in Perl for this check
(`turn-2026-09-30/act2/shelf-check/fk-second.pl`) agree. The first draft as landed read 5.0 (2,504 words, 211
sentences). The target was 9 or below.

**Called shot, written before drafting (23:45Z):** a grade of 9 to 11 on the first draft, 9 or below after one
plain-words pass. The first draft measured 4.8, so the call missed, low. A guess that ID tokens such as `P5B-008` were
pulling the grade down was tested: with them stripped, the grade stayed at 4.9. The low number comes from short
sentences and short words. (The first draft and the stripped copy were not kept, so 4.8 and 4.9 cannot be run
again.)

**What the number does not see.** It counts sentence length and syllables, nothing else. It does not see jargon or
house words. It skips tables, code, inline code and front matter, and reads English only
(`turn-2026-09-30/act1/r3/R4/reading-gauge/SPEC.txt`). A low grade does not mean the ideas are easy.

**NOT CHECKED for this draft:**

- No assistant was run on the three cases. The verdicts are readings of the models' texts
  (`…/P5B/WAVE-20260930T2330Z-act1r2-p5b.md#L274`).
- Step 1's live fetch was not run again for this correction. P5B's own fetch from GNU's host went around a
  robots.txt refusal, so it is set aside, and its Savannah copies are not quoted here beyond the six lines that
  the mirror also holds. The text rests on the mirror, re-fetched by a permitted route, and the hash and commit
  on the keeper's own clone (Act I §5a item 9; PROV-001 to PROV-003).
- The 31.1 release tree's own copy of `AGENTS.md`, which the t1 records name, was not compared
  (`…/P5B/WAVE-20260930T2330Z-act1r2-p5b.md#L269-271`). The keeper's clone of branch `emacs-31` was, and it
  matches (PROV-003).
- The GitHub and Claude Code quotes were not fetched again.

**Status:** DRAFT, not released, not branded.

*© 2026 Corwin Brust — this work is licensed CC BY 4.0; please retain attribution to Corwin Brust. Developed and tested with the help of Bryant Frankford and B.K. Graphics (bkgraphics.com), with thanks.*
*(The house credit line, carried verbatim from `operating-model-BASE.md` 1.0.51 L313-315.)*
