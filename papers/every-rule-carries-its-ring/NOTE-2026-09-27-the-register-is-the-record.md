# NOTE 2026-09-27 — rings-D1: the ring tags are the door's register now, not a trial

## What he ruled

Card rings-D1 offered four ways to try "every rule carries its ring" on the door; the recommended one was
a side file of tags, with a confirm step on each of the 24 tags that sit on his own parts before any tag
became a part header. He chose that option and rewrote it:

> "Can the side file just be the DOR and and we'll retire the row if I elect not to continue it?  I don't
> want seperate approval steps.  It feels like this recreates the management problem edrx describes if I
> ask you to help me so you ask me if the help is okay"
> — `q/2026-09-27-execute-brief/ANSWERS-2026-09-27.md:13`

Read here as: make the side file the door's own record ("the DOR" = the door), in force now; no confirm
step; a row he no longer wants is retired. If "DOR" meant something else, this note and the one file it
made are the whole change, and both come out cleanly.

## What was done

**Observed** (each with its receipt):

1. `d/door/RINGS.tsv` made: the door's ring register, beside `GOVERNS.tsv` and `SPLIT.tsv`. Its header
   carries his words and how to retire a tag. Its 41 rows are the dry run's rows, unchanged
   (`grep -v '^#' writing/rings/door-rings.tsv` equals the register's rows). sha256 `94e02e5b…`.
2. No part was touched. `cat d/door/*.part | sha256sum` read `29db83c7…` before and after, so every
   rendering's CURRENT stamp still holds — the parts-sha does not cover a `.tsv` beside the parts.
3. `writing/rings/ring-dry-run.sh` now reads the register by default (falls back to the dry run's file
   where no register exists), and knows a fifth ring value, `retired`: a retired row reads green and is
   treated as `one`, so it stays where it was written. Deleting a row still works and reads UNDECLARED —
   a gauge line, never a gate. `--prove-red` is now 5/5; the new case fails if a retired row goes red.
   Prior kept at `archive/2026-09/ring-dry-run.sh.pre-register-2026-09-27`.
4. `writing/rings/door-rings.tsv` is left as the dry run's record; `sha256sum -c SHA256SUMS` still covers it.

**Judged** [MINE]: retiring can never widen a rule's reach, because both ways of retiring fall back to
`one`. That is why no approval is needed to retire, and why none was needed to put the tags in force:
until `door render --ring` exists, a tag changes no rendering at all. It only names, part by part, whose
rule it is.

## The rule under the ruling (his, for the shop)

**No separate approval steps for help or trials.** When he asks for help, the help does not come back as
a question whether the help is okay. A trial he has chosen goes in force as a record he can retire, not
as a queue of confirmations. His reason: asking him to approve the help he asked for recreates the
management problem edrx describes. [HIS]

Falsifier for applying it here: a tag in the register, read by some later tool, puts one of his own rules
in front of a stranger as binding before he has seen it. The guard is that nothing reads the register at
render time yet; the moment `door render --ring` is built, its first run should print what each ring
would carry (`ring-dry-run.sh plan RING` already does) in the hand-back, as a record, not a question.

## Owed

- `door render --ring RING` in `bin/door`: render FULL for parts tagged with that ring, a one-line offer
  for the rest, and the floor clauses split out (the PAPER's §4). `ring-dry-run.sh plan` is its spec.
- The three SPLIT clauses (`his-scope-and-attestations`, `his-drift-baseline`, `project-standing-rules`)
  become their own parts, so the floor renders in every ring. That edits door parts, so it waits for the
  next door session, not for a yes.

## LENS

a my view: the ruling removes the one step my recommendation added, and my recommendation was the
management problem in small. b the view I ascribe Corwin: a trial is a record you can retire, and help is
not a request for permission. c their pull on mine: I dropped the confirm step without softening it into
"confirm later". d my pull on theirs: I added `retired` as a second way to retire, so a retired tag keeps
its history in the file; deleting still works. persona / inverse: a newcomer reads RINGS.tsv and knows
whose rules bind them / a strict keeper says an unconfirmed tag on his words is my label in his house —
answered by: it renders nothing yet, and it retires in one word.

Drafted by Mentat (for Corwin), 2026-09-27. DRAFT — his to keep, change or discard.
