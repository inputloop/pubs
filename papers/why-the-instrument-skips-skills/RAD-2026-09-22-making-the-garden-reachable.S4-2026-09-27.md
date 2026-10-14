# RAD — 2026-09-22 — making the garden reachable · S4, written 2026-09-27

*This file completes `analysis/skills-in-c4/RAD-2026-09-22-making-the-garden-reachable.md`. That RAD
left S4 open at lines 26-28, which read "## S4 · Normalized findings" / "*Open for his ruling.*".
The RAD is unchanged; this file is a new file placed beside it. The form comes from the `c/wf` RAD
row: "S4 normalized findings (written only after the ruling)". The row's example file is this very
RAD. Two piles: OBSERVED lines cite a file and line; JUDGED lines carry a tag and a falsifier.*

## S1 (carried) · the question, with the ruling on the same rows

**How should the garden's skills reach the instrument?** (RAD:1)

| | A · leave as is | B · install once, trim descriptions | C · B + a router table in the door | D · C + a skill server (MCP) |
|---|---|---|---|---|
| RAD recommended (24) | — | now | now | later |
| ruled 2026-09-22 | — | **aim kept, method overruled** | **chosen, "generated"** | not taken up |
| state 2026-09-27 | — | install-once largely done; descriptions not trimmed | generator built; **its output has no installed copy since 09-24** | `skillx` "set aside"; soft skills served by `mentcached` instead |
| reaches a bare list (RAD:14) | no | partly | yes, while the door stood | — |

## S4 · Normalized findings

### The ruling (the top part: what the meeting hears)

OBSERVED. Under Addendum 2, *"make the decisions"* (`h/HANDBACK-2026-09-22-fabel-integrated-domains.md:114`),
lines 148-155 read:

> **`skills-in-c4/RAD-making-the-garden-reachable`, S4 open, recommended B (hand-trim 46 descriptions)
> + C (a router table in the door).** I rule **C, generated** — `bin/skill-router` (`--prove-red` 5/5) takes
> the first sentence of each skill's own description; part `08-skills-router` is `generate`d at render
> time (your 2026-08-05 split: lists may be generated). **I overrule B's method, not its aim:** trimming
> by hand would make 46 more copies to keep in step; a first sentence that is not the trigger sentence
> is the skill author's to fix, in the one place it lives. Tension kept: the RAD's transcript gauge
> ("were skills used?") is the check that could show the rule-trim worse than the hand-trim; it is
> named there and not built here.

`MEMORY.md:2669-2671` records it the same way: "skills RAD ruled C *generated* (`bin/skill-router`,
first sentence of each description) over B's hand-trim — both tensions kept, falsifiers named".
The part records it too: `d/door/08-skills-router.part:7`, "S4 was open, decided 2026-09-22 by
Fabel: C, generated not hand-trimmed".

### What changed after the ruling: the door came down (OBSERVED)

- **2026-09-24.** "Mid-turn: he removed CLAUDE.md from `<f>:/claude` and `<f>:/claude/c4`, truncated
  the global instructions, and named the archive `Z/c4/NarrativeInstructionsets_2026`; the coming
  unit test is that skills alone suffice and C4 does not take over the ClaudeDesktop
  global-instruction area." (`MEMORY.md:2781-2783`)
- The router part is scoped to exactly those two files: `scope	global,c4`
  (`d/door/08-skills-router.part:3`). `d/door/INSTALLED.tsv:5-6` lists them as `../CLAUDE.md` and
  `CLAUDE.md`.
- On 2026-09-26 `c4 door check` read "`ABSENT CLAUDE.md` … `ABSENT ../CLAUDE.md`"
  (`onward-readiness/review-2026-09-26-onward/SPELLS-CONSISTENCY.md:37`). The brown map's row for
  the door reads "**wired, but the two main copies are gone** (09-24)" (`C4-BROWN-MAP.md:550`).
- The generator is still there and runnable by name: `c4 skill-router` (`model.md:209`), and it
  still "builds the situation-to-skill table from the garden's skill descriptions"
  (`C4-BROWN-MAP.md:169`).
- The same turn classified the skills against the door: `bin/nd1ck` "(DOOR-FREE 46 · DOOR-READS 5 ·
  DOOR-REQUIRES 1 = session-rotate on model.md as its subject)" (`MEMORY.md:2803-2804`).
- **2026-09-26.** The `garden-usage` skill was "approved and built" (`MEMORY.md:3159`). In the skill
  listing this session received (2026-09-27), its entry arrives with its description, which
  includes "which skill fits a task".

### Where the router lives now: what the evidence allows me to say

- **The generator lives in `bin/skill-router`.** It runs by hand as `c4 skill-router`. OBSERVED
  (above).
- **Its table lives nowhere that a session loads on its own.** The only part that carried it
  rendered into the two files he removed. `door check` reads both as ABSENT. OBSERVED.
- **The table's job, "which skill for this situation", is done today by two things, and no record
  appoints either of them.** One is the platform's own skill list, when an entry arrives with its
  description. The other is `garden-usage`, when someone asks. **I cannot tell** from the snapshot
  whether anyone meant `garden-usage` to succeed the router. No line in MEMORY, the bank or the
  skill's registers links the two. [MINE] *Falsifier:* such a line, in `c/skillnames` or in the
  09-26 build record.

### The RAD's own rows, normalized

| RAD row (line) | what the RAD said | OBSERVED since | reading [tag] |
|---|---|---|---|
| B: install once (9, 11) | one install path | The 09-26 review found "3 names in both `vibrobeast:` and `anthropic-skills:` (posix, posix-gotchas, prove-a-promise), against 56 on 2026-09-22" (`PUB-DESIGN-POINTS.md:192`, WS1). This session's listing shows the same three doubled. | **Largely done.** [PLATFORM] *Falsifier:* a later listing with the doubles back. |
| B: trim descriptions (9, 11) | "1–2 sentence descriptions" | WS2 is "SILENT" (`PUB-DESIGN-POINTS.md:193`). The ruling moved the job to each skill's author ("the one place it lives"). | **Not done, by ruling.** Whether authors fixed their first sentences was not measured. [SKILL] *Falsifier:* a count of first sentences that begin with the situation, which the router could print. |
| C: reaches a bare list (14) | **yes** | True while the door stood. Since 09-24 it has no carrier. In this session's listing (2026-09-27), 57 `vibrobeast:` names appear. **22 arrive with a description and 35 arrive as bare names**, `inculcat-boxer` and `rolls` among them, the two examples the paper gave (`PAPER-2026-09-22-why-the-instrument-skips-skills.md:23`). I counted this from the listing handed to this sub-agent session. | **The problem the router was built for is still here, and the router no longer reaches it.** [PLATFORM] *Falsifier:* a later session whose listing arrives fully described. Then the bare-list problem is gone, and so is the router's reason to exist. |
| C: cost "small; one door part" (12) | small | Paid: one tool, one part, `--prove-red` 5/5 (handback:149). | Cheap, as predicted. [MINE] |
| D: skill server (11) | "right later, when the MCP family is actually running" (RAD:20) | His MCP-roles reading: "skillx = outbound, set aside" (`MEMORY.md:2815`). Soft skills are served live by `mentcached` instead (`MEMORY.md:3166`), with a reads-per-skill ledger, `bin/ss2gr` (`MEMORY.md:2802-2803`). | **D's aim arrived by another road**: `mentcached` soft skills, not `skillx`. [DOMAIN] *Falsifier:* `skillx` taken back up for serving skills. |
| measured by: "a transcript gauge" (15) | the check that decides B vs C | WS4 is "SILENT" (`PUB-DESIGN-POINTS.md:195`). The handback: "named there and not built here" (:154-155). `ss2gr` counts reads, not missed triggers. | **The ruling's own falsifier has never been built.** [SKILL] |

### What the ruling cost

- **Tool work, small:** `bin/skill-router`, part 08, 5 red cases (handback:149). OBSERVED.
- **A carrier that lasted two days.** Part 08 rendered from 09-22 to 09-24, and then its only two
  destinations were removed. JUDGED [HIS]: this is no fault of the ruling. He removed the door to
  test whether "skills alone suffice", and a router inside a door is exactly the kind of thing that
  test sets aside. *Falsifier:* his saying the router was meant to survive the removal (then it was
  lost without anyone deciding to lose it).
- **An unmeasured bet.** The ruling chose generated first sentences over hand-trimming without the
  gauge that could compare them, and said so. The bet is still open. OBSERVED (handback:153-155).

### The falsifiers, and where each stands

| falsifier (who named it) | status 2026-09-27 |
|---|---|
| the transcript gauge shows "the rule-trim worse than the hand-trim" (the ruling, :153-155) | **Not built**, so it cannot fire. |
| "a skill with triggers and no firings is the finding" (the paper, `PAPER…:55-56`) | Not built (WS4). `ss2gr` counts soft-skill reads per day. That is a neighbour of this gauge, not the gauge itself. |
| the router makes the garden reachable "even when the list arrives bare" (paper :53-54) | **Cannot hold today.** There is no loaded carrier, and 35 of 57 names arrive bare in this session. |

### Socialization: does a shared view send us back around?

**Yes, and on one point only: where the situation-to-skill table should live, now that his
09-24 unit test ("skills alone suffice") is the standing frame.** The choice between C and B still
holds (generate, don't hand-copy). What has lost its footing is the *carrier*. The fork goes to him
as `decisions.json` owed-analysis-D2. The options, at parity:

| | A · skills alone, no table | B · the table inside a skill | C · the table in `c4prime`'s screen | D · re-install a door carrying part 08 |
|---|---|---|---|---|
| fits his 09-24 test | **yes** | **yes** (it is a skill) | partly (C4-only; prime is read per his instructions) | **no** |
| reaches a bare list | only through `garden-usage`, if its own entry arrives described | yes, if the carrying skill's entry arrives described (in this session, `garden-usage`'s does) | only inside C4 | yes |
| new homes to keep in step | 0 | 1, generated (the same generator, a new destination) | 1, generated | 2 |
| cost | none | small: a `generate` line into a skill asset | small, but a 57-row table does not fit prime's "About one screen" | undoes his removal |

JUDGED. **B is the one that keeps both of the RAD's keepers under his 09-24 frame.** Those keepers
are reach when the list is bare (RAD:19) and no running thing on every seat (RAD:19-20). Four
sources agree on the pieces:

1. His test that skills alone suffice (`MEMORY.md:2782-2783`).
2. The ruling's rule that lists are generated, not hand-copied (handback:149-151; his 2026-08-05 split, cited there).
3. The RAD's keeper (RAD:19).
4. `garden-usage` already answering "which skill fits a task" (`MEMORY.md:3159` and its listed description).

[MINE] *Falsifier:* a session with a bare listing, asked a situation, that finds the right skill
no more often with the table inside `garden-usage` than without it. That is the transcript gauge
again. Building it would settle this fork and the ruling's own bet together.

**Losing option, kept at its strongest: A, skills alone and no table.** It adds nothing to keep in
step. It takes his 09-24 test at its word. And `garden-usage` can already answer the question from
the registers and descriptions without a table. It wins if the platform's listing stops arriving
bare, or if `garden-usage` turns out to answer as well without a table. It loses today because a
session has to *think of* asking `garden-usage`, and a bare name gives it nothing to think with.
That was the paper's cause 3 (`PAPER…:20-24`), and it was observed again in this session.

LENS · S4 for making-the-garden-reachable · 2026-09-27
a  my view: the ruling was sound and cheap; his later removal of the door left the router's generator working and its table with no home, and nobody decided that on purpose.
b  the view I ascribe Corwin: skills alone should be enough, and C4 should not take over the global-instruction area; generated beats hand-copied.
c  their pull on mine: I stopped treating the door's removal as damage and read it as the experiment the router has to live inside.
d  my pull on theirs: "skills alone" still has to cope with bare names; one generated table inside a skill passes his test and answers the bare list.
persona / inverse: gw7 says a name that isn't real, I won't answer to, and a bare skill name is one no one can answer to / the inverse says a bare name is real and the list's size limit is the platform's, not ours to paper over. True, which is why the table would be generated from each author's own first sentence and not written by us.
principles reframe: 1. universalism: a stranger's session meets the same bare list we do, so the fix must travel with the skills, not with our door. 2. four freedoms: the router is a small readable tool anyone can rerun over their own garden. 3. free software: generated from each skill's own words, it never forks the authors' text. 4. community: authors keep control of how their skill is introduced, since the first sentence is theirs.

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.
