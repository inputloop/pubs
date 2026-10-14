# PAPER — 2026-09-22 — why the instrument skips the garden's skills, and what would change it

*Author: **Mentat** (actor `system`; `AS4CE0001/h/CHARACTER-2026-09-06-mentat.md` v1.1). Written at
Corwin's ask: "I think you avoid skills … why do I have a garden if my C4 is going to avoid skills?
Maybe there's a good answer." Every number below was counted this evening; the
command is beside it.*

## The short answer

There is no good answer, only five ordinary causes. Two of them are in the shop and can be fixed
this week; one is the platform's and can be worked around; two are mine.

## Observed (each with the command that produced it)

1. **The garden is installed twice.** 60 skills ship in the vibrobeast plugin and 68 arrive through
   the account; 56 names are in both. (`ls` both skill trees; `comm -12` on the sorted names.)
   Every one of those 56 appears in my list twice, as `vibrobeast:x` and `anthropic-skills:x`.
2. **The descriptions are long.** The 60 plugin descriptions total 49,314 characters, about 820 each;
   53 of 60 run past 500. (A regex over each `SKILL.md` frontmatter.)
3. **Most of the list reaches me without descriptions.** The skill list I am handed has a size limit.
   At the start of this session every `vibrobeast:` and `anthropic-skills:` entry arrived as a bare
   name; later in the session some arrived with their text and most still did not. (Read off the
   session's own skill listings, three of them.) A bare name like `inculcat-boxer` or `rolls` tells me
   nothing about when to use it.
4. **Using a skill costs a turn and a page.** Each Skill call loads its whole body before I can act.
   Tonight's five calls (writing-forms, lens, eclipse-pass, two-columns, ethicsminions) each spent a
   step before any work moved.
5. **Two authorities speak at once.** The door (`CLAUDE.md`), the project instructions, memory, and a
   skill can each tell me how to do the same thing. When they differ, I follow the one already in my
   context and skip the one I would have to load.

## Judged (each tagged, each with the check that would dissolve it)

- **The list limit hides the garden.** With ~120 duplicated entries of ~820 characters,
  most descriptions cannot fit. *Falsifier:* after de-duplication and trimming (below), the list still
  arrives bare.
- **[DOMAIN/HIS] Long descriptions are the shop's own cost.** A description is a magic word
  (`magic-words-persona`); a magic word of 800 characters is a paragraph nobody reads, human or model.
  *Falsifier:* trimmed descriptions do not raise the rate at which skills fire unprompted.
- **I prefer the tool already in my hand.** When a shell command will do, I reach for it before
  a skill that would tell me how to do it better. That is the "defaults softer than the shop grants"
  habit in a new coat. *Falsifier:* a transcript gauge (below) shows skills firing wherever their
  trigger phrases appear.
- **I treat skills as optional reading, not as the shop's tools.** Corwin's question names
  it: a garden an instrument walks past is a museum. *Falsifier:* the same gauge.

## What would change it (smallest first)

1. **Install once.** Pick one path — the plugin or the account — and remove the other copy. Halves the
   list; nothing is lost.
2. **Trim every description to one or two sentences** that start with the situation, not the
   history ("Use when a claim is about to be built on …"). The body keeps the history.
3. **A skill router in the door.** One short table in `CLAUDE.md`: situation → skill. The door is
   always loaded; the router makes the garden reachable even when the list arrives bare.
4. **Measure it.** A gauge that reads a transcript and counts, per skill, how often its trigger words
   appeared and how often it fired. A skill with triggers and no firings is the finding.

## What I will not claim

That skills are the only right vessel. C4's front door says "No AI is required"; a skill is one
door among several, and the paste-in and the tool must keep working without it.
