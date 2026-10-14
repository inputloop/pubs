# A name a stranger can read: taxonomy-conformant program naming as a social opportunity

*C4 working paper · 2026-09-18*

## Abstract

Program basenames are usually treated as labels — mnemonics chosen for the author's
convenience and decoded, if at all, by reading the source or asking the author. We report
on a naming convention in the C4 project (the "AS4CE pattern") in which a basename instead
*follows from* the system's own taxonomy: five characters, `LL#LL` — two register letters, a
run-level digit in the middle, two register letters — the four letters also evoking a plain
English word. The middle digit encodes how much the tool touches the system (0 foundational,
1 read-only, 2 writes or serves, 3 digests to a verdict or regenerates, 4 folds a whole
collection), so a reader learns a tool's register and its risk-level before running it. A
survey of N=115 in-scope program homes finds 49.6% already conform, with 58 rename candidates
and a migration path by non-destructive alias-shim rather than hard rename. We argue the
convention is best understood not as an aesthetic uniformity but as an *anti-guessing
affordance* and a social opportunity: a self-describing name is a message from a maker to a
reader who cannot ask them, and the run-level digit in particular is a safety-and-consent
signal that a stranger can read off the filename, lowering the expertise required to operate a
system safely. We hold this against an honest caveat from the project's own record — a 2026
attempt to formalize the letter-arrangement into a closed system failed adversarial review as
"a dictionary question wearing an architecture question's clothes," and consumed the attention
two real defects were waiting on — and conclude that the affordance lives in the *shape* (the
run-level grammar, mechanically real) and not in proving the *mapping* complete. Conformance
near 50%, migrated by non-collapsing alias, is therefore a waypoint in a system that never
deletes an entry, not a failure to reach 100%.

## 1. Introduction

The freedom to run a program as one wishes presupposes the ability to know what it will do.
That knowledge conventionally has two sources — reading the source, or asking the author —
and both are costly: the first demands literacy the operator may lack, the second demands the
author be reachable, which for most software at most moments they are not. A naming convention
that puts a tool's behavioural class *on the outside of the tool* removes both costs for the
one fact that matters most before invocation: how far the tool reaches into the system.

C4 encodes exactly this in its program basenames. We treat the convention as an instance of the
project's stated *no-guessing* principle — every knob documents its value or refuses; nothing
requires the reader to guess an unstated fact — realized at the level of the filename itself. A
conformant name is anti-guessing by construction: it declares register and run-level without a
manual. This paper asks what such naming *buys socially*, and answers with a claim about
expertise, risk, and consent, bounded by an unusually well-documented failure the project has
already survived.

## 2. Methods

We surveyed the program homes reachable inside the C4 tree: `bin/` and one `q/.../bin/` CLI
program, plus the `lib/`/`serve/` JavaScript modules, for **N = 115 in-scope items** (a
separate class of five JS library files is reported but flagged as a different artifact class;
draft twins under `h/` and one ported roguelike module are listed as out-of-scope rather than
silently dropped). Each basename was classified against the convention:

- **Y** — full AS4CE shape (`LL#LL`, run-level digit mid-position, letters traceable to `m/t`
  register facets);
- **V** — a documented variant still recognizably "the pattern" (word-preserving digit
  insertion such as `st4ge`/`do0r`; short forms `it4c`/`w0sh`; mirror/pun forms `ix0xi`/`m4dot`);
- **N** — no run-level digit at all (plain word, hyphenated, or `.sh`-suffixed).

The run-level ladder (0–4) was read *off the tools themselves* — roughly twenty headers state
their own digit and its meaning — rather than from any single canonical spec, because none
exists. Where a tool contradicts the inferred ladder (`sg1pl` treats its digit as a CLI-adjustable
default; `t4c1k` carries two digits), we recorded the disagreement rather than smoothing it.
Breakage surface was estimated by raw grep counts across `bin/`, `CLAUDE.md`, run-cards, decks,
and facts, with the caveat that common-word names (`whose`, `card`, `skill`) inflate wildly and
require a caller-only regrep before the counts can be trusted.

## 3. Findings

**Conformance.** 57 / 115 items conform (Y or a documented V) — **49.6%** — leaving 58 rename
candidates. Treating the five JS library files as a separate class rather than counting them in
the denominator raises the figure to 51.8%.

**The digit reads cleanly; the letters read softly.** The run-level digit is applied
consistently and is the mechanically reliable part of a name: a reader can act on "the middle
character is how hard it reaches" across the whole conformant set. The letter-to-facet *mapping*,
by contrast, is a per-tool interpretive act that the tool authors themselves mark "guessed
freely, marked provisional." A name therefore carries one claim a reader can lean on (run-level)
and one they can only lean toward (register).

**Breakage is concentrated, not diffuse.** Most rename candidates carry single-digit to low-teens
reference counts — ordinary find-and-replace. The risk is concentrated in the original `c4*`
legacy family (22 tools predating the pattern) and in `c4prime` specifically, which is cited 36
times *including the door's own first-move onboarding line.* A migration that hard-renamed these
would break the system's own instructions to itself.

**Migration preserves references by construction.** The proposed path never hard-renames: each
new name lands as an alias-shim beside the old one and delegates to it, so no existing invocation
breaks; the shim is retired only when a *caller*-scoped grep (not a mention-scoped one) returns
zero. Five names — `c4prime`, `whose`, `card`, `skill`, `vms` — are recommended as permanent
documented exceptions, because their current forms do communicative work (a plain-English
question, a spelled-out register, a self-describing pun) that a facet-tuple would erase.

## 4. The social opportunity

The findings above are housekeeping. The argument is this: **taxonomy-conformant naming lowers
the expertise required to operate a system safely, and that is a social good, not a tidiness one.**

**A name is a message to a reader who cannot ask you.** The project's two-reader theory holds
that a maker and a reader are separated parties, and that the normal condition of a name is that
the maker is *gone* by the time the reader arrives. The name is the entire channel between them.
A conventional mnemonic optimizes that channel for the author's recall; a taxonomy-conformant
name optimizes it for the stranger's comprehension. The run-level digit is the highest-value
payload the channel can carry, because it answers the one question a reader most needs answered
before acting — *what will this do to my system* — and answers it to someone with no source
literacy and no standing to ask.

**The run-level digit is a safety and consent signal.** The project's deepest stated problem —
the *imponderable* — is that a program's assertions cannot capture a human's true understanding
at the moment of evaluation, because context bears that the user does not hold and because human
understanding ebbs and flows over time. The operator is, in this precise and non-pejorative
sense, an *unreliable witness to their own intent*: the driver is fallible across time, not from
malice but from being human. Two postures follow. One engineers the unreliable driver *out* —
lock the interface, mandate the training, gate on the certificate. The other, the software-freedom
posture, takes the unreliable driver as the *given* — the person actually being served — and moves
what they cannot be trusted to carry in their head onto the outside of the tool, re-readable at
every moment their understanding has drifted. This is the exact user for whom the unreliable-driver
imponderable is not a defect to be eliminated but an *opportunity to design toward*: the name does
the remembering the operator cannot be asked to do.

Consent, in this project, cannot be *stored* — only re-enacted, cheaply, at the moment of effect.
A run-level digit is not stored consent; it is a standing prompt to *re-enact* consent at the
instant of the deed. A `2` in the middle of a name says "this one writes — and you are about to
let it," readable at run time, which is exactly where the imponderable makes consent most
expensive and a stored yes from last week is worth nothing. Naming-as-affordance thus makes
consent cheap at the place it is otherwise dearest.

**The acceptance criterion is no-guessing, and it is met by the shape.** A conformant name passes
the project's own no-guessing test — it declares register and run-level rather than requiring the
reader to guess them — and it passes it for a non-expert reader, which is the whole point. Risk
becomes legible to the newcomer, the tired maintainer, the stranger who could not trace a single
letter back to the register table but can still read the middle character and know whether the
thing in front of them looks, writes, or folds the world. That is a widening of who can safely
operate a system without a guardian present. In a project whose values put universal access
first, that widening *is* the deliverable.

## 5. Limitations

We state these plainly, because the strongest evidence against over-claiming here is the project's
own record.

1. **The distraction caveat (the load-bearing one).** In 2026-08 the project tried to formalize the
   letter-*arrangement* into a closed system and it failed three rounds of adversarial review: two
   target words (`user`, `jot`) stayed homeless under every arrangement, and the effort was
   diagnosed as "a dictionary question wearing an architecture question's clothes" — no tool reads
   the arrangement, so no arrangement constrains anything a tool does. Worse, the formalization
   *consumed attention two real defects were waiting on.* The affordance this paper defends lives in
   the *shape* (the run-level grammar); it does **not** extend to proving the *mapping* complete, and
   a program of renames that began to manufacture the feeling of a finished taxonomy would be
   repeating the exact error. Read our recommendation as "make the shape consistent," never "the
   meaning is settled."

2. **Breakage cost is real and concentrated.** The `c4*` legacy family and `c4prime` in particular
   carry enough references — including the system's own onboarding line — that even alias-shim
   migration imposes a relearning cost on every future session. The cheapest conformance win
   (`c4prime` → a conformant form) is also the most cosmetic and the most disruptive; we recommend
   *against* it.

3. **The convention is a provisional heuristic, not a lookup table.** The letter-to-facet mapping is
   an interpretive act per tool, self-marked provisional by the authors; only the run-level *shape*
   is mechanically checkable. A reader should lean on the digit and merely lean toward the register.
   Presenting the mapping as a deterministic decode would overstate what the name can defend.

4. **The 50% figure is a waypoint, not a target.** Because the registry never collapses an entry, a
   non-conforming name is a dimension not yet folded, not a failure; five names are recommended to
   stay non-conforming permanently. 100% is not the goal and the ratio should not be read as a
   burn-down chart. Conformance near 50%, migrated by non-collapsing alias, is a healthy state, not a
   deficit.

## 6. Conclusion

A taxonomy-conformant program name converts a private mnemonic into a public affordance: it tells a
stranger the register and — reliably — the run-level of a tool before they run it, paying down the
reading cost that freedom-zero otherwise leaves on the operator. Its social value is a widening of
who can safely operate a system without the author present: the run-level digit is a legible risk
signal and a re-enactable consent prompt aimed squarely at the fallible, drifting, real human
operator the system is actually for. The convention earns this only in its shape, and only so long as
it resists the documented temptation to prove its own vocabulary closed. Make the shape consistent;
do not declare the meaning settled; let the digit do the one honest job it is good at.

---

*Credits.* Principal author of record: Corwin (persona lens; no-guessing and
two-reader theory; the imponderable and the consent discipline). Written with Claude (Mentat, in
Cowork), C4, 2026-09-18. Sources:
`h/PLAN-2026-09-18-basename-taxonomy.md` (the survey and figures),
`facts/the-taxonomy-question-was-a-distraction` (the 2026-08-03 adversarial failure),
`facts/registry-dimensions-and-no-guessing` (no-guessing; non-collapsing registry),
`facts/two-readers-at-most` (the two-reader theory),
`facts/consent-cannot-be-stored-only-re-enacted` (the imponderable; consent re-enacted at effect).
Companion essay cycle: `h/ESSAY-2026-09-18-basename-taxonomy.md`. No license boilerplate — that is
the ON ceremony's to add at the ship boundary, not the drawer's.
