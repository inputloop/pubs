---
title: To what extent can we let users pick ceremonies?
description: A ceremony is a hook to knowledge, choosing one is the user's option, and a ring is the set of parties who agreed to bear its cost together. Read from gen0 (C4/0, C4/01), the hooks-to-knowledge canon, and Corwin's 2026-09-24 prompt.
metadata: {node_type: paper, modified: 2026-09-24, register: c/wf}
---

# To what extent can we let users pick ceremonies?

*Written for a reader who has never seen this shop: someone with a local C4 install and a project
pointed at it, wondering why a build asks them to sign things, and whether it must.*

## The question, in the keeper's words

> "I know we can pick users, however tacitly, and I know we can pick ceremonies. What I want to know
> is to what extent we can let users pick ceremonies (especially together in potentially-concentric
> self-governing rings)." — Corwin, 2026-09-24 (`h/REFORMAT-2026-09-24-users-pick-ceremonies.md`)

Two things were said in the same breath that bound the answer. Signing is *parked, not dead*: he
will sign what is about users (a 1.0 of card-games, the Emacs releases) and otherwise spend about
zero time on it, by preference. And two demands are rejected utterly: any design that says a
ceremony is a *must* for all users irrespective of purpose, until that is agreed in the precise
terms it would be put to them; and any demand on him personally that is not stated, in context, as
an obligation or an opportunity before him.

## Correction, the same day: the tree had already said it, and I did not find it

Corwin: *"of course mount the folder (it actually does say that in the claude.md I'm saying I'm about
to remove)."* The folder is `projects/ccspt` (the prompt's "ccspd" is a slip), and the answer to this
paper's question was baked on 2026-09-03 and LGTM'd by him: `h/METHOD-lens-and-granule-ring.md`,
**"THE WEARER'S DIAL — the freedom in it"** — *someone who cares wears a granule only after Gate 2's
attestation; someone who doesn't wears it on land, taking Gate 1's advisory record; neither dial is
forced on the other: the ring guarantees availability and provenance; the wearer keeps how much
ceremony they require.* The hand-coloured diagram is `h/DIAGRAM-poly-ccspt-ring.html` ("the granule
ring — draggable actors"). Everything below re-derives that dial from gen0 canon and the
hooks-to-knowledge deck; it agrees with it, which is the two-reader result, but it was written as if
the question were open. That is `prior-instruction`'s own first falsifier — *the person answers a
routed fork with "I already said"* — firing on the skill's second day. The miss had a cause: I
searched for the name he typed (`ccspd`) and for the word *ceremony*, never for *ring*, and the
registry had no `ring` row for a lookup to hit. It has one now (`wd1nn ring`; terms-of-art, pinned,
Q521). What the paper adds to the dial is the naming of the *ring* one layer up — the parties who
agreed to bear a ceremony's cost together — and the build-side switch.

**And a second prior, from the enclave, once it was attached the same day.** SAVANNAH's
`CHARTERS-2026-08-15-rings-and-defaults.md` (a DRAFT for the keeper's read, unsigned by design) names
the ring model once — R0 keeper + lab · R1 lab ↔ Bryant's garden · R2 more collaborators · R3 group
publication ceremonies — and rules Charter A, Consent-Shape: *consent is required always; its SHAPE is
ring-scoped and elected, never inherited … R3: the ceremony the GROUP elects — signatures only where
members chose them or an entrusted surface demands … a signature is an ACK whose meaning is set by
agreement — it is never consent's only valid costume, and it is never levied downstream. No
participant owes reading an upstream ring's agreements: every artifact CARRIES its terms fully.*
Charter D tabulates the defaults per ring (consent: chat LGTM / keeper word / written, versioned /
group-elected ceremony; signing: keeper's election / co-sign / optional, offered / only as group
elects). So the question this paper asks was answered twice before it was asked — in August in the
enclave, in September on the granule ring — and this paper's contribution shrinks to what it adds:
the hooks-to-knowledge derivation (a ring is rule 2's exception clause), the build-side switch, and
the word rows so the next reader finds all three by typing `ring`. Method travels, cases don't: the
enclave is cited by path (`wd1nn ring` → leaf `z`), never copied.

## What the tree already says (read, not invented)

**A ceremony is opted into, or excepted from — by construction.** The gen-zero notation's run-level
anchor (`gen0/0/NOTATION.md`): the graph is declared over all consented run levels, *"defaulting
where duly accepted, with express exception required against any known prior rite or ceremony."*
The default is acceptance; the exception is express; neither is silent. A ceremony that fires
without a declared level or an express exception is not a C4 ceremony — it is a lever.

**Universal standing is never asserted; it is built by turns.** Also NOTATION: outward standing
*"is built constructively, only via multi-operation sequences ... each involving a turn of a
consent-bearing tumbler."* So nobody can declare a ceremony universal. A ceremony's reach is
exactly the set of tumblers that have been turned toward it — which is the definition of a ring
before the word is used.

**The ritual without the privilege exists.** C401 (`gen0/01/C401-SPEC-DRAFT.md`) makes root a
setting: `ROOT_MODE=pretend` gives *"the full ritual without the privilege ... Identical transcript,
prefixed clearly; nothing privileged actually happens."* That is a ceremony a learner may run as
scenery — verification *"optional scenery for the learner and standing regiment for the producer"*
(`gen0/0/README.md`, constraint 3). The outermost ring was designed in July.

**Ceremony was deferred by the parties who would bear it.** The countersigned GOVERNANCE
(`gen0/0/GOVERNANCE.md`, re-homed to `governance/`): *"Ceremony deferred by agreement until the open
TODO queue clears"* — and *"pseudonymous assertion is expressly sufficient for the unnamed
collaborator."* Three people picked their own ceremony level, together, and wrote it down. That is
a ring choosing.

**The address family gives four checks with no ceremony at all.** ADDRESS-FAMILY
(`gen0/01/ADDRESS-FAMILY.md`): engine + caboose bracketing a register reference yield authorization,
baseline-match, disclosure and rejection-status *"from the address alone, before any heavier tool
runs"* — and the standing limit: *"cause cannot subjugate greater values ... a caboose that would
decry a change protecting a human outranks any engine authority that would push it through."* So
the floor under every ring is not a signature; it is a readable claim and a human-protecting veto.

**No paradigm of the right way to be.** PR-3 (`gen0/0/PRECEPTS.md`): representation over
protectionism — no *"how to define identity the right way™"* with blessed examples; instead ropes,
so a community can tell an anomaly from an innovation. Applied to ceremony: no blessed ceremony
either. A ring that mints its own is the design working, not a fork of it.

## The mechanism (hooks-to-knowledge, applied)

The canon deck says a hook is *to knowledge, not unique function*: its value is what it lets you
see, and behaviour behind a seam may be substituted to optimise or to test — **at your option, never
as a demand on anyone else**, *"except where multiple parties have already agreed to bear the cost
together."* Read that sentence as the whole answer:

1. **A ceremony is a hook.** Signing at `make dist` exposes knowledge — who minted these bytes,
   against which key — it does not own the build. The build runs without it (`UNSIGNED=1 make dist`,
   built today). The manifest without a signature is the honest TIER 1 state: files match, author
   unverified. Nothing pretends.
2. **Choosing a ceremony is substitution, and substitution is the user's option.** A user who runs
   the same seam with no signature, a different key, a pseudonymous assertion, or `ROOT_MODE=pretend`
   has substituted behind a hook they hold. The promise of the seam ("what changed, and who says so")
   is kept in each case at a different confidence, and the tool prints which one.
3. **A ring is the exception clause.** *"Where multiple parties have already agreed to bear the cost
   together"* a ceremony may be required — of those parties, by those parties. That is what a
   self-governing ring is: a set of people who wrote down the ceremony they hold each other to, in
   the precise terms they were put to them. Concentric rings follow: an inner ring may require more
   of its members than the outer ring requires of the public; the outer never inherits the inner's
   requirement, because inheritance would be an assertion of universal standing, which NOTATION
   forbids.
4. **The cross-check must survive the substitution.** Rule 3 of the deck: when a lighter ceremony
   replaces a heavier one, whatever check rode on the heavier one is re-homed, not dropped. The
   express manifest is that re-homing for signing: drop the signature, keep the byte-match
   (`skill-sign.sh manifest`), and say aloud that authorship is now unverified.

So: **to what extent?** To the full extent, *outside* a ring — every user picks, including "none",
and the tools tell the truth about what that buys. *Inside* a ring, to the extent the ring's own
written terms say — and joining a ring is itself a tumbler turn, consented per party, fresh,
specific, uncoerced (Registry Y, `gen0/0/DIMENSIONS.md`), revocable (Y11). What we never do is
pick a ceremony *for* users by making the door not open without it.

## What this changes for the keeper personally

His "roughly zero" is a ring of one, written down here in his own terms: signs what is about users;
otherwise not. Any demand on him beyond that must arrive as an obligation or opportunity in context
(his words), and this paper is not one. The instrument's standing obligation is the reverse: keep
everything ready to sign with no hand-editing (`modify-signed-then-tell-me`, 2026-09-06), so that
when signing *is* the problem space, the cost of entering it is a key, not a cleanup.

## His worry-question, answered

*Do I worry about users as we think again about "sharing instructions" — a persona giving critique is
sharing instructions?* Yes, and the worry has a shape rather than a feeling: a lens (PERSONAS-KIT-v0)
*"imposes vocabulary, syntax, and grammar — not WHO a person is,"* and a lens that critiques is
handing the reader an instruction set. The guards already written are the right ones: the lens must
stand alone as a sentence-and-dictionary provider (so what it says can be read without the reader
adopting it); `[MINE]`-tagged critique never blocks; a persona's critique is offered under the same
rule-2 as a ceremony — an offer, never a demand. What no file-level tag can do — he is right — is
change the value proposition; what it can do is keep the offer legible as an offer. The elaborated
answer lives in ccspt's two gates (`projects/ccspt`: Gate 1 lenient, advisory when no key, rejection
reserved for tamper never absence; Gate 2 strict) and in the granule ring's prose and diagram named
in the correction above (Q522, ruled). A persona's critique travels as a granule: vouched if the
wearer cares, on land if they do not — the same dial.

## Falsifiers

- A ring's requirement leaks outward: a public user is refused a build, an install or a read for
  lack of a ceremony they never agreed to. (`UNSIGNED=1 make dist` failing; a `.gate` that is not a
  stub gating a public surface.)
- A substitution loses its check: an unsigned mint ships with no manifest at all, or `verify`
  reads a TIER-1 skill as anything but UNVERIFIED-AUTHOR.
- A ceremony asserts universal standing in one step (a "must" with no tumbler turn behind it).
- He is asked to sign something not about users, without an obligation or opportunity named.

## What was built beside this paper (so it is not advice)

`make dist` now bumps `z`, records the release's start and finish (`releases/<x.y.z>`), calls the
signing tool unless `UNSIGNED=1`; `skill-sign.sh manifest` writes the express manifest; `ns2hw`
writes one for every skill it sweeps; the dynaloader keeps a usage ledger and `ss2gr` reports which
soft skills have earned a graduation nobody is forced to grant. Each is a hook; each has the
switch; each prints what the switch bought.

---
Copyright (C) 2026 Corwin Brust <corwin@bru.st>. Authored by Mentat (for Corwin). GPL-3.0-or-later;
this file is part of C4 and comes WITHOUT ANY WARRANTY — see <https://www.gnu.org/licenses/>.
