# PAPER — 2026-09-22 — the editor's essay: one loop, four readings, and the vessel that was wrong

*What this is: the covering essay for a four-piece anthology in this folder, first edition, minted at
Corwin's ask of 2026-09-22 ("revisit that last decision with some analysis"). It
supersedes nothing; the verdict it answers stays where it was written (spell 06), and the losing
models are kept on their shelf.*

*Editor: **PENUMBRA** (actor `system`; sheet `<f>:/claude/pub/method/h/PENUMBRA.md` v1.2 —
not yet introduced to Bryant or Alfred; the name is held in trust). I am eclipse-pass's fond
archivist: I keep the losers, I keep an index beside the shelf the same day, and I write in the first
person about what I kept and where. I was chosen over a fresh roll because an anthology that asks for
"multiple versions" is an archivist's job, and nobody on the roster was an editor already.*

## The question the anthology was built to answer

This morning the instrument told Corwin the build loop needed no skill. He asked for the decision
to be looked at again — challenged, defended, given alternatives, and shown in the versions that are
easiest for him and for others. Behind that sat a sharper question of his own: *doesn't C4 have to
prove it supports the ordinary way people work — a skill in context, a CLAUDE.md?*

## What the four pieces found

**Mentat's PASS** (`PASS-2026-09-22-build-loop-tank-verdict.md`) turned its own verdict over and found
it wrong. On a seeded random pick of three of his real projects, the loop reached none of them. The
most telling was card-game: its `model.md`, written today, copied C4's door rules word for word and
left the loop behind. Mentat's fault, in its own one line: *"I measured reach from the one tree I was
standing in."* What held was the part worth holding — the counting must stay mechanical.

**The Garden's LENS** (`LENS-2026-09-22-skill-in-context.md`) took Corwin's hypotheses and held them
to the same light. H1 holds, and for a stronger reason than he gave: the skill is how the loop reaches
his *own* other projects, not only strangers. H2 — *no parts are optional* — holds for whoever has
chosen the loop, and the Garden asks that it be re-said before it leaves: **choosing the loop is
optional; once chosen, every step is required; the one number in it is a stated default.** That
sentence is the Garden's wording and his to rule.

**gw7's RAD** (`RAD-2026-09-22-which-vessel.md`) put four vessels side by side with parity. Only one
keeps both things that matter — it reaches, and it counts: a skill that carries `sw1ng`, with a
paste-in text inside it for anyone who wants only the words. gw7 also answered the question Corwin
added at the end: *best to work well for others* picks the counted skill; *most likely to be tried*
picks the paste. They agree only because the one contains the other.

## What we proved, and where we did not

Proved, with receipts on disk: the loop does not reach outside c4 today (three of three, seed 17,
reproduced); the door has already been copied without it once; the counting tool exists and proves
itself (`sw1ng --prove-red`).

Not proved: that anyone outside will *use* the skill. That is a forecast, and it gets a falsifier,
not a claim — *if a year from now no seat outside c4 has opened the loop, the vessel was right and
the audience was wrong.* Also not proved: that three projects stand for the rest. The pick was fair,
not large.

## The revised verdict

**NEW skill, `build-loop`, in the vibrobeast plugin**, three layers in one home: `SKILL.md` (the loop in
plain words, PDCA named first, how to decline it), `assets/BUILD-LOOP.md` (the paste-in, handed over
verbatim), and `scripts/sw1ng` (the counter). c4's `bin/sw1ng` becomes the drawer copy. This replaces
"LEAVE AS IT IS"; the old verdict stays on the shelf as losing model A.

## What I kept, and where

- The losers — four models, A to D — in `h/.eclipse-increments/2026-09-22-build-loop-tank-verdict/pass.md` §4.
- The index for this folder, the same day, in `INDEX.md` beside this essay, with the anthology's load-
  bearing claims as two-column notes (where each was first seen, where it was last cited).

## A note on the personas, since he asked me to tend them

Each author's sheet was read before its piece was written, and each wrote inside its garb. Nobody's
sheet was changed; persona is his pen. Two things I noticed and did not fix:

- **gw7 carries three open WARNs by design**, one of them about receipts that do not verify from
  Avalon. gw7's piece here quotes only things read today, so the WARN is not made worse — and not
  closed either.
- **I am not yet introduced** to Bryant or Alfred. An editor who has not been
  introduced is an editor on trial. If he'd rather a different hand hold this pen, the essay is
  mine to hand over and the index stays with the shelf.

Nothing here fell out of sync badly enough to call for a hand-back spell instead of the writing.

## A seam found on the way

Corwin asked for skills to be used where they fit, so that he could see whether they work. One did
not do what its name suggests: **`two-columns` is about where a note was first learned and last used,
not about putting two things side by side.** Tesla's review this morning asked for the side-by-side
kind. Both are good; they share a name. gw7's RAD did the side-by-side work in tables; the INDEX
uses `two-columns` for what it actually is.

## Gauges, run on the anthology itself

`countable-gauge` (`gauge.sh`, no threshold printed by design), claims per citation: PASS 2.50 · RAD
2.20 · this essay 1.56 · **the Garden's LENS 8.25.** The claim I would want to make is "every piece
stands on its sources about as well as the others"; for that, the LENS would have to sit near the
other three, and it does not. It is the reflective piece, so some of that is the form — but a reader
should know the LENS leans on reasoning more than on receipts.

`two-columns` (`dl1nk INDEX.md`): the four claim notes read OK ×3 and GUESS ×1 (the Garden's
reconciliation, correctly labelled a guess). It also reports five headings as UNSOURCED notes — the
checker treats every paragraph of a mixed file as a note. And the skill's prose teaches a one-line note
shape while its checker wants a multi-line one. Two small seams in a tool Corwin asked to see work.

`writing-forms` (`wf-check.sh`, register pointed at `c4/c/wf`): PAPER, PASS, LENS **OK**; RAD **RED
(unregistered prefix)**, as expected for a first use. A second RAD earns a row in `c/wf`.
