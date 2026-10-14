# Supported, not required: how far C4 works with no AI today, and a test anyone can replay

## What this paper is

Edition 1, 2026-09-27. Minted by Mentat at Corwin's ask. It answers the question in his ruling on
`elected-image-D1`: "We support agentics, we hope not to require them; how possible is this? we shall
see." (`q/2026-09-27-execute-brief/ANSWERS-2026-09-27.md`). It supersedes nothing. DRAFT, unsigned. Its companion is
`writing/elected-image/NOTE-2026-09-27-the-claim-as-he-ruled-it.md`, which rewords the claim to match.

*On voice.* "Agent" here means an AI model session doing work: Claude, a local model, anything that
reads a prompt and acts. "A person with written steps" means someone with a shell and a page, who does
what the page says and writes down what they chose. The host counts below were taken on Avalon on
2026-09-27 and handed to me (`in/answers…`, section "Host facts for supported, not required"); the
snapshot I read (``) holds no `bin/` and no garden, so I did not recount them.

## 1. Two claims already in the tree, and they do not match

- **The front door claims it as done.** `README.md:46`: "No AI is required. That is the point."
  `:48`: "**Nothing here needs an AI to use.**" `:58-59`: "An AI helped build this; none is needed to run
  it, read it, or hold it to account."
- **His ruling today calls it a hope**: "we hope not to require them".
- **The level-set in between.** `facts/drift` (2026-08-08), recorded as his level-set: "AI-agnostic at
  production — AI-AVERSE for users who want that — provable on Ghostwheel with no ML/generative system
  needed to get off the ground" (host facts). The session record of the same day: "IDENTITY captured:
  AI-agnostic/averse end-state, Ghostwheel the AI-free proof bed, Claude-focus deliberate now"
  (`MEMORY.md:1551-1552`).

**Judged.** All three are true of different layers. The README is right about *using* C4. His "hope"
is right about *making* it: the shop's own turn cycle. The rest of this paper sorts the layers into
three bins.

## 2. The layers, sorted

| layer | today | evidence |
|---|---|---|
| **1. Records and registers** (plain files: `m/t`, `c/wf`, `MEMORY.md`, `facts/`) | **no agent** | `README.md:41-44`: the filesystem is "the one store readable by `cat`, checkable by `sha256sum`, and owned by you". |
| **2. Tools** (`bin/`) | **no agent** | 151 files: 137 `#!/bin/sh`, 6 bash, 3 python3, 2 perl, 2 signature files. A grep for `claude -p\|anthropic\|ollama\|llama` hits only `bin/cl1ix:168`, a regex that tags chat *about* AI. No tool calls a model (host facts). |
| **3. Checks and gauges** | **no agent** | 57 tools carry a `--prove-red` self-test (host facts). `c4prime` is "Generated every time — never hand-written" (project instructions). The intake gate `c4 intake check` "reads the manifest first, re-hashes every SHA256SUMS line" (`spells/ingest/SPELL.md:36-37`). |
| **4. Decisions** (the question bank) | **person with written steps** | Chat cards need an agent. The file form does not: "`sh bin/w0sh` (text to fill, or HTML via `C4_W_OUT=html`…)" (project instructions); "filled rows RETURN to the bank" (`MEMORY.md:1124-1125`). |
| **5. Ghostwheel builds** (the elected image) | **needs an agent, in its wording** | "Defaults are one prompt away … rebuilding with other defaults is one sentence from the person the build is for" (`GHOSTWHEEL.org:47-50`). "Prompt" names an agent. |
| **6. Spells** (12) | **mixed; all addressed to an agent** | Every `SPELL.md` names an agent (host facts). Six say "Paste the block below…". See §3. |
| **7. Skills** (the garden) | **mixed, not measured** | 47 skills, 20 ship `scripts/` (host facts). The other 27 are prose instructions for an agent. Since 2026-09-24 "skills alone must suffice" for sessions (`spells/turnover/SPELL.md:17`). |
| **8. Verification by blind readers** | **agent today; a person could take the seat** | Today's rings check: "two headless sessions … `claude -p …`" (`writing/rings/PAPER-2026-09-27-every-rule-carries-its-ring.md:355-356`). The prompt is plain text (`writing/rings/blind/PROMPT-plain.txt:1`); the scorer is stdlib Python (`writing/rings/tools/score.py`). |
| **9. Session close and continuity** | **agent today** | Sessions close with "`session-rotate` (Skill)" (project instructions). `MEMORY.md` is file-based "on purpose" (same). |

**Observed, the spell steps.** I counted the numbered steps inside the pasted block of each spell and
whether a step names a runnable command (`c4 …`, `sh …`, `python3`, `perl`, `gpg`, `tar`, `git`,
`sha256sum`, `bin/…`). This is a rough measure: an awk pass over the step markers, which does not
judge whether the prose around a command needs judgment.

| spell | steps | with a command |
|---|---|---|
| build-turn | 7 | 5 |
| egress | 6 | 2 |
| fabel-repeat | 3 | 1 |
| freshen-spells | 7 | 4 |
| ingest | 8 | 5 |
| ingest-writing | 9 | 3 |
| onward-turn | 16 | 7 |
| recast-universe | 5 | 3 |
| thaw-and-recast-universe | 7 | 4 |
| **nine spells** | **68** | **34** |

The other three use other headings. `turnover` has six steps (0 to 5), and most of them are commands
(`spells/turnover/SPELL.md:16-52`). `ideation-fit` works "by tools alone" (`spells/ideation-fit/SPELL.md:6`). `last-swing` is a
review of "the session's own records" (`:16`).

**Judged, spell by spell.**

- **A person can follow these today:** `thaw-and-recast-universe` says so itself ("and for a person
  reading along, who can drive every step", `:4-5`; "Work in plain steps a person could follow",
  `:18`). `egress` is a checklist around one tool (`secrets-run`) and a template. `recast-universe`,
  `freshen-spells`, `ingest` (the gate "travels on its own", `spells/INDEX.md:16`) and `ideation-fit` are
  in the same group. `ideation-fit` already measures "the share of the work the tools did with no agent
  in the loop", and "Past half is enough" (`:58`) is his own rule from 2026-09-26 (`MEMORY.md:3174`).
- **These need an agent today:**
  - `build-turn`: "every step below is required" (`:21`), and QA-2 puts a quiz "to every model you can
    reach — sub-agents at each available size" (`:42-45`).
  - `ingest-writing`: persona changes are "applied only through the persona tool (`persona_mutate` on
    the vibrobeast plugin), never by editing a sheet by hand" (`:91-92`). That is a tool only an agent
    can reach.
  - `fabel-repeat`: "You are FABEL" (`:11`). It exists to compare agents.
  - `last-swing`: it reviews an agent's own session.
  - `onward-turn` and `turnover`: they hand builds to `build-turn`.

## 3. The gaps that make an agent required, and the smallest fix for each

Each gap below comes with the smallest change that would make that layer supported rather than
required, and a falsifier for that change.

**G1. Spells are written as prompts to an agent.** Every spell opens "You are…". *Smallest change:*
one rule for `freshen-spells`, which already walks every spell. Each step either names its command and
the output to expect, or says "judgment:" plus what the person decides and where they write it down.
That is the run-card shape the tree already rated resolvable ("steps are pasteable with EXPECTs",
`journal/LENS-2026-07-31-ladder-test.md:20`). The step count in §2 then becomes an exact count instead
of a heuristic. *Falsifier:* a spell rewritten this way still leaves a person stuck on a "judgment:"
step. That would mean the judgment needs knowledge that is not written down, and the fix is more text,
not just a new form.

**G2. build-turn's QA-2 requires models.** *Smallest change:* one word. "Put the quiz, cold, to every
model you can reach" becomes "to every reader you can reach: models, and a person if one is willing".
Add that a run with neither records NONE and goes on. The quiz already has fixed letters, an oracle
that drives the tool, and a scorer, so a person can take it as it stands. *Falsifier:* the oracle or
the scorer reads a model's output format that a person would not write.

**G3. Persona changes go through `persona_mutate` only.** *Smallest change:* a shell entry to the same
operation, so that "never by editing a sheet by hand" means "never with a text editor", not "never
without an agent". *[MINE]:* I have not seen the plugin's code. *Falsifier:* the operation lives only
inside the MCP server and cannot be called from a shell without rewriting it. Then the smallest change
is a documented page of the steps the tool performs, run as a check afterwards.

**G4. Blind checks ran as `claude -p`.** *Smallest change:* one line in the protocol saying a reader
may be a person who answers in the same line format (`P1 | ring of Rule 1: …`), with `score.py`
unchanged. Leave `two-readers` alone. It measures how a *model* varies between runs, and a check
*about* an AI needs an AI. That is not a requirement C4 places on its users. *Falsifier:* a person
cannot keep to the line format `score.py` parses without help, which shows the format was built for a
machine reader.

**G5. "Defaults are one prompt away."** *Smallest change:* `GHOSTWHEEL.org:47-50` gains "or one edited
line in a named file and one command". This is owed: find the file and the command for each default
it names (licensing first; TERMS v1 is already one block, `GHOSTWHEEL.org:54`). *Falsifier:* some
default has no single file where it lives. That default then cannot be elected without an agent to
find it, and the gap is in the design, not the wording.

**G6. Session close runs through a skill.** *Smallest change, if needed:* if `session-rotate` ships
a script, its SKILL.md names it as the no-agent path. If it does not, a person's close is the three
acts the project instructions list: archive the last exchange, snapshot `model.md`, bump its version.
Each is a `c4 archive` call. *Owed host check:* `ls AS4CE0001/skills/session-rotate/`. *Falsifier:*
the rotate depends on reading an agent transcript. A person has no transcript to rotate, which makes
the gap moot for them.

**G7. The pages say less than the tools need.** The thaw spell says nothing needs more than "`sh`,
`tar`, `gzip`, `sha256sum`, `git`, `python3`, `node` and `gpg`" (`:19-20`). But `bin/` holds 6 bash
tools and 2 perl tools (host facts), and C4.md says "The generated LIBRARY needs bash" (`C4.md:124`).
`README.md:48-51` still counts "86 of the 93 executables". A person, unlike an agent, will not
improvise around a missing `perl`. *Smallest change:* regenerate the README count and the thaw list
from `bin/` shebangs, with one command, not by hand. *Falsifier:* the thaw path never calls a bash or
perl tool. Then the list is right for that path, and only the README count is stale.

## 4. The test: a person with only a shell and the tree

His own bar already exists. It was set for GIZA, which has no agent: "ClaudeDesktop is not installed
on GIZA", and "The bar is 'a person can run this from a page', not 'an agent can figure it out'"
(`q/shippable-surface-2026-09-17/README.md:34`, `:41`). The planned "simple-minded-user test" there
*is* the no-agent test. My proposal is to run it as that test and record it.

**Setup.** One person with no AI account and no one on call who uses one. A machine with `sh`, `bash`,
coreutils, `tar`, `gzip`, `git`, `gpg`, `python3`, `perl` and `node`. A recast archive, its
`SHA256SUMS` and `MANIFEST.md`, and printed or on-screen copies of the pages named below. Nothing else.

**Tasks** (one per layer that §2 says works without an agent):

1. Verify and unpack the archive by the thaw spell's steps (layers 1 and 3).
2. `sh bin/c4prime`, then say in their own words one fault or urgent ask it shows (layer 3).
3. Run the self-test battery, or `--prove-red` on three tools of their choosing, and see green and red
   (layer 2).
4. Run the egress checklist on one small file of their own, and write its `MANIFEST.md` (layer 6,
   egress).
5. Answer one banked question through `sh bin/w0sh` and see the answer land in the bank (layer 4).
6. Change one ghostwheel default (the licence line) without a prompt (layer 5). *This task should fail
   today; it is in the list to measure G5.*

**Record.** For each step: DONE, DONE WITH A GUESS (the guess written down), or STUCK (what they
needed, in their words). Record the machine, the date, and whether they asked anyone for help, and
whom.

**Passes when** tasks 1 to 5 have no STUCK step. That is a count of zero, not a chosen threshold.
Task 6 is reported on its own. His "past half" rule (`ideation-fit`, `:58`) measures tool share inside
one spell. I do not transfer it here; that is his to do if he wants it.

**Falsifier of the promise:** any STUCK step in tasks 1 to 5 whose only instructions address an agent,
or that needs a tool the pages did not name. Either would make "supported, not required" false for
that layer until fixed. **Falsifier of a false pass:** the walker got help from someone who used an
AI. The help line in the record catches this.

**Standing or once?** Once, as the GIZA walk. After that it becomes one line in each recast run record:
"no-agent test: last run <date>, STUCK <n>". It is not a gate. It fails for free the next time a
spell's pages drift, because the next walker will get stuck.

## 5. The losing reading, at its strongest

**"Agent-required is honest and fine for now. The promise costs more than it returns."** The shop has
chosen to focus on Claude: "Claude-focus deliberate now" (`MEMORY.md:1552`). His own worry is
throughput: "most AI focused users will see C4 as a step backward" (`analysis/throughput/INDEX.md:9-12`).
Every person-path is a second set of instructions. Second sets drift: the spell index already keeps
one spell in two voices on purpose (`spells/INDEX.md:24-27`), and that doubles the reading. Nobody
without an agent has asked to use C4. The README's promise can stay true for layers 1 to 4, where it
already holds, while the making side stays agent-shaped and honestly labelled. On this reading the G1
rewrite is spending on an audience that does not exist yet.

**Where it wins.** For `fabel-repeat`, `last-swing` and `two-readers`, the thing measured or reviewed
*is* an agent. A person-path there would be theatre.

**Where it loses.** The README makes the promise at the front door (`:46-59`). He ruled for it today.
Tasks 1 to 5 are cheap because they test what the tree already claims. The GIZA walk costs no extra
setup, because it was planned anyway. *Falsifier for my side:* if the walk comes back with STUCK steps
in tasks 1 to 5 that take more than the G1 to G7 changes to fix, the loser is right, and the README
should narrow its promise to "using, not making".

## 6. Findings

1. Using C4 needs no agent today, measured at the tool layer (0 of 151 tools call a model) and by
   design at the record and check layers. Deciding needs no agent through `w0sh`.
2. Making C4 needs an agent today. All 12 spells address an agent. `build-turn` requires models in
   QA-2, and persona changes run through a tool only an agent can reach. Roughly half the spell steps
   (34 of 68 counted) name a runnable command.
3. The front door states as done what his ruling states as a hope. Both are true of different layers.
   The README should say which layer it means.
4. Two small corrections are owed: the README's tool count and the thaw spell's list of what a machine
   needs. Both should be regenerated from the shebangs.

*Concern [HIS].* G5 touches `GHOSTWHEEL.org`, his text with his TERMS block. *Falsifier:* he wants
"one prompt away" kept as the headline, with the file-and-command path as a footnote. Then G5 moves
into a note beneath it.

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.

```
LENS · PAPER supported, not required · 2026-09-27
a  my view: the promise already holds for using C4 and fails for making it; seven small changes and
   one walk that was planned anyway would show which gaps are real.
b  the view I ascribe Corwin: welcome agents, never make them the price of entry; measure rather than
   hope, and do not build ceremony to do it.
c  their pull on mine: "we shall see" kept me from scoring the promise as met on reading alone; the
   walk is the measurement, and my sort is a guess until it runs.
d  my pull on theirs: I split "use" from "make". He may see them as one, since C4 is a tool that
   mints tooling, and then my split lets the making side off too lightly.
persona / inverse: the field technician on GIZA says "give me the page and I'll run it" / the inverse,
   the agent in the loop, says "half of what I do here is choose, and nothing on the page says what I
   chose from". That is G1's "judgment:" line, which the technician alone would not have asked for.
principles reframe: 1. equals first: a person with no AI, or with no money for one, must be able to
   run, read and check what binds them (universalism). 2. freedom 0 and freedom 1 cannot depend on a
   vendor's model; the free-software movement gains a governance tool that runs on a bare shell, and
   the wider community gains a replayable test in place of a promise.
```
