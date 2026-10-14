# ESSAY 2026-09-27 — Account checks first, disclosure always

*Form: ESSAY (`c/wf`, row ESSAY: "A worked argument on one question, longer than a note"). The question:
when a shop that cannot build locks for everything says "disclose first", what stops "first" from turning
into "instead"? This is the first written argument for `decks/accountability-first.deck.md`. The reader
found the idea cited in 26 files and argued in none (`writing/execute-brief/tracks/unwritten.tsv:11`; recount today:
`grep -rliE 'accountability.first|Account Checks First' corpus | wc -l` → 26).*

## Thesis

The keeper's name for the doctrine, and the card that states it, verbatim
(`decks/accountability-first.deck.md:2` and `:32-36`):

> "ACCOUNT CHECKS FIRST, DISCLOSURE ALWAYS."
>
> ACCOUNTABILITY FIRST, and never accountability ONLY. (a) Every guard must at minimum be
> accountable — disclosed and recorded — because that is always available and always cheap.
> (b) Where prevention is available and cheap, prevention is ADDITIONALLY required. (c)
> Accountability never substitutes for an available cheap prevention. The doctrine is an
> ordering (do the disclosure first, it costs nothing and it is owed), not a licence to stop.

**Plain words.** A guard is one of two kinds. A *prevention* makes a harmful act impossible. An
*accountability* guard makes the act visible: it tells the person at risk ahead of time that it can
happen, records it when it does, and lets someone review the record later. The doctrine says: always do
the second kind, because you always can; and where the first kind is also cheap, do that too.

## How this essay was made (the movements)

- **I.** What the doctrine says and what the tree has done with it (observed).
- **II.** Five people who meet the doctrine, each at their strongest.
- **III.** Where several kinds of source agree.
- **IV.** The drift in today's own writing, and the line that repairs it.
- **V.** What "cheap" can mean without a number.
- **The loser kept:** prevention first, and where it wins.
- **Coda:** what I recommend, the decisions that are his, and the falsifiers.

---

## I. What the doctrine says, and what the tree has done with it

### Observed

- **Two kinds of guard.** "PREVENTION makes the act impossible. ACCOUNTABILITY makes the act legible — its
  possibility DISCLOSED in advance to whoever bears the risk, the instance RECORDED when it happens, and
  the record REVIEWABLE after" (`decks/accountability-first.deck.md:15-17`). And: "Signatures, seals,
  receipts, two-reader, fail-closed cards: none PREVENT anything" (`:26`).
- **The fence is the point of the deck.** "Clause (c) exists because "first" is exactly the word that
  erodes into "instead"" (`:48-49`); "The fence is the doctrine; without it this deck is a permission
  slip" (`:50`).
- **The deck names its own falsifier**, the card-games security review of the same day: "Of six, only ONE
  was answered by disclosure. Two demanded prevention outright" (`:98-99`); "if this doctrine is ever
  cited to defer a cheap available prevention, the doctrine is wrong at that juncture, not the objection"
  (`:102-103`). The same card records the reverse case: card-games "ALREADY hides each player's hand per
  seat. A real protection, shipped, never claimed. The failure was the missing disclosure, not the missing
  guard" (`:111-113`).
- **The handoff that followed applied it.** "This review is the deck's own falsifier case, so cheap
  preventions here are not optional" (`journal/HANDOFF-2026-07-29-cg-net-fixes.md:33-34`). Whether the
  fixes shipped is not in the snapshot.
- **The deck limits its own claim.** "an accountability claim is unfinished until you can name WHO reads
  the record and by what path they act on it. "It is logged" with no reader is ceremony"
  (`:119-121`); his refinement: "the reader may be a FUTURE one" (`:139-140`).
- **Its evidence, and a bias it names.** Four blind scorers "converged 4/4 on the ACCOUNTING half" and
  "split 4/4 on the prevention FOUNDATION" (`:55-57`). "NOT a leg: that the doctrine matches the keeper's
  lifelong practice. That match is a reason for MORE scrutiny, not less" (`:59-61`). The deck records as
  his: "Accountability based control is exactly how I live and operate and what I preach personally"
  (`:43-44`). His prompt that day: "it fits with the Account Checks First, Disclosure Always system we
  are spinning" (`q/PROMPT-2026-07-29-corwin-trust-and-registers.md:29`).
- **Where it sits.** model.md: "Over the floor sits **Account Checks First, Disclosure Always**
  (`decks/accountability-first.deck.md`, signed)" (`model.md:480-481`). But the deck's own header says
  "CANDIDATE until Corwin's detach ceremony" (`:8`); an August panel listed it among "3 edit-after-sign in
  `decks/`" (`MEMORY.md:932`); and its `.asc` is on the list removed on 2026-09-17 by the pass that kept a
  signature "only where something mechanical reads it" (`q/cleanup-2026-09-16/removed-2026-09-17.txt:3`,
  `:300`). `ls decks | grep asc` finds no signature beside it. **So "signed" in model.md is stale.**
- **Its falsifier sits where nothing reads it.** "`accountability-first`'s falsifier is well-stated in a
  field no tool can read" (`h/NOTE-2026-08-29-gardening.md:42`). The card-falsifier count of 2026-08-29:
  "432 cards / 78 decks -- BORNE 0" (`evidence/question-bank-iTNH.tsv:533`).
- **Its home is an open question of his.** Q03: "Does accountability-first belong on the guard floor, in
  CORWIN.md, or neither?" (`evidence/question-bank-iTNH.tsv:20`). Today's bulk decision lists it with the
  reader's recommendation to keep it a CANDIDATE deck (`writing/execute-brief/DECISION-2026-09-27-bank-in-bulk.md:1055`).

### Judged

The doctrine is well made. It names its opposite, its own falsifier, and a bias. What it lacks is
anything that makes those three work. Its falsifier is prose; its "signed" status is stale in the one file
every session reads; and today, as Part IV shows, the shop's own writing quoted its first half and not its
fence. That is the failure the deck predicted in itself, "first" becoming "instead". It happened in
citations, not in code.

---

## II. Five people who meet the doctrine, each at their strongest

**1. The operator who prefers prevention.** "Disclosure is a promise that I will tell you after I have
let it happen. Some harms do not wait. Finding 2 was a path by which text from a game host could act
inside a player's Emacs; he himself pictured it reaching "~/.ssh or points scarier"
(`q/PROMPT-2026-07-29-corwin-trust-and-registers.md:25`). No paragraph in a README undoes that. The
security canon is on my side: Saltzer and Schroeder say that recording a compromise instead of preventing
it works poorly in computers, because "logical damage (and internally stored records of tampering) can be
undone by a clever attacker." Build the lock where a lock is possible, and stop calling logs
protection." *Strongest where the harm cannot be undone and the record sits where the actor can reach
it.*

**2. The audited party.** "Every record you keep is a record of me. Accountability is cheap *for you*;
I pay for it with being watched. A shop that says 'we record everything and disclose everything' has
built a surveillance habit and called it virtue. Today's essay on members already drew my line: if any
output of the balance "can be sorted by member, it has crossed the line"
(`writing/what-a-member-keeps/ESSAY-2026-09-27-what-a-member-keeps.md:485-486`, as quoted in the LENS
`writing/execute-brief/LENS-2026-09-27-written-against-open.md:362`). Record the act, not the person, and
name who reads it and why." *Strongest inside a group, where the record outlives the trust that made it
acceptable.*

**3. The user who needs the disclosure.** "A disclosure is for a decision. If it reaches me after I have
decided, it is a record, and a record does not help me choose. Your own critique says so: "records are for
later; a disclosure is for a decision" (`decks/disclosure-practice.deck.md:27-28`) and "not one
disclosure we have written has reached the reader it was written for" (`:86-87`). Put it where I cannot
miss it, before I install, in words I read." *Strongest at the moment of choice: install, join, publish.*

**4. The org whose policy demands gates.** "We perform for people who are not in the room. Our policy
requires some acts to be impossible without sign-off, and we are allowed to require that of our members
because they agreed to it. His ring model gives us this: orgs have "little to no tolerance save whatever
limited list of as-counted measures an org may exhaustively describe"
(`q/2026-09-27-execute-brief/PROMPT.md:18`). The ceremony paper agrees that a ceremony may be required
"where multiple parties have already agreed to bear the cost together"
(`analysis/ceremony/PAPER-2026-09-24-users-pick-ceremonies.md:101-102`). Disclosure alone does not
satisfy an auditor; a gate we can show was closed does." *Strongest where the gate is written in the org's
own terms and the members consented to it.*

**5. The stranger.** "I never met you. I will not read your signature and I may not read your README. What
protects me is what happens when I do nothing: the default. If your game listens on every network
interface unless I change a setting, your disclosure protected the people who read it, and I am not one of
them. Your deck says it: "A signature means nothing to a card player; a plain paragraph in a README means
everything to the admin deciding whether to install" (`decks/accountability-first.deck.md:91-92`). I am
neither. I am the person who clicked through." *Strongest for anything that ships to people who never
agreed to anything.*

---

## III. Where the sources agree

Kinds of source: **his** words; **older** shop writing; **today's** works; **outside** prior art.

| conclusion | his | older | today | outside |
|---|---|---|---|---|
| **A1. Always disclose the possibility, before the decision, to whoever bears the risk.** | "no filter may go unannounced" (`MEMORY.md:2974`, his word as recorded); "such expectations must be disclosed, just as the checks some program must perform and the reasons for it must" (`q/2026-09-26-onward-readiness/PROMPT.md:27`) | "DISCLOSE THE POSSIBILITY, not the instance" (`decks/accountability-first.deck.md:79`); the hyphen as "the only correctly-timed disclosure in the shop" (`decks/disclosure-practice.deck.md:71-72`) | LENS R2 (`writing/execute-brief/LENS-2026-09-27-written-against-open.md:334`), four kinds | Debian Social Contract clause 3, "We will not hide problems": "We will keep our entire bug report database open for public view at all times." (https://www.debian.org/social_contract) |
| **A2. A record protects only if someone other than the actor holds it and reads it.** | "the reader may be a FUTURE one" (`decks/accountability-first.deck.md:139-140`, his refinement) | "an unread record is data, not protection" (`:121-122`); "recorded faithfully, read by nothing" (`h/PAPER-2026-08-29-the-lab-for-david-1.0.0.md:313`) | what-a-member-keeps VI: the balance is struck at the egress, compared by each member (`:422-431`) | Saltzer & Schroeder, records "can be undone by a clever attacker" (https://www.cs.virginia.edu/~evans/cs551/saltzer/); RFC 6962 makes the record public so that "anyone" can "audit certificate authority (CA) activity and notice the issuance of suspect certificates" (https://www.rfc-editor.org/rfc/rfc6962.html) |
| **A3. Where a cheap prevention exists, disclosure is not enough.** | Finding 2 "CONFIRMED", "Corwin ran the check in his own Emacs" (`journal/HANDOFF-2026-07-29-cg-net-fixes.md:26-27`) | clause (c) and the card-games falsifier (`decks/accountability-first.deck.md:34-35`, `:97-103`) | **none.** Today's works cite only the first half (Part IV). | Saltzer & Schroeder's "Fail-safe defaults": "the default situation is lack of access" (same URL) |
| **A4. Different rings may require different guards; the outer never inherits the inner's.** | the puppet analogy and the org tolerance ruling (`q/2026-09-27-execute-brief/PROMPT.md:18-19`) | "the outer never inherits the inner's requirement" (`analysis/ceremony/PAPER-2026-09-24-users-pick-ceremonies.md:116-117`) | rings §2 (`writing/rings/PAPER-2026-09-27-every-rule-carries-its-ring.md:80-126`) | Lampson: "in the real world security depends more on police than on locks" (http://bwlampson.site/69-SecurityRealIEEE/69-SecurityRealIEEE.htm), which presumes a group able to police its own |

**Judged.** A1, A2 and A4 have four kinds of source each. A3, the fence, has three, and it has **no
support from today's writing at all**. That gap is the finding of this essay.

---

## IV. The drift in today's own writing, and the line that repairs it

### Observed

- what-a-member-keeps, Coda: "a claims check that objects only to lying, and a balance that makes silence
  loud. Neither prevents anything. Both follow *"ACCOUNT CHECKS FIRST, DISCLOSURE ALWAYS."*"
  (`writing/what-a-member-keeps/ESSAY-2026-09-27-what-a-member-keeps.md:504-505`).
- The LENS, conclusion R2: "Disclose, don't gate, for anyone outside a consenting ring", with the deck's
  line 2 as his source (`writing/execute-brief/LENS-2026-09-27-written-against-open.md:334`).
- The elected image, D5: a tool "that prints where one member's machine differs from the ring's declared
  list, and never blocks" (`writing/elected-image/ESSAY-2026-09-27-the-elected-image.md:570-571`).
- The shop door: "The door points; it does not gate." (`d/door/50-shop-door-intro.part:12`).

### Judged

None of these four is wrong where it stands. A balance that reports and never blocks is the right tool
for a member's own copy; the door should not gate its reader. But read together, and read as
*applications of the doctrine*, they say something the doctrine forbids: that "account checks first"
means "account checks, and no gates". That is clause (c) failing in the citations. [MINE]

The repair is not to weaken today's works. It is to notice that **"gate" and "prevention" name two
different things**, and the must-versus-journey test already sorts them: "Ask: who is harmed if this is
wrong, and are they in the room?" (`decks/must-versus-journey.deck.md:49`).

- A **gate** stops a person from doing what *they* chose. It limits their own act. Gating a member's own
  copy, or a reader at a door, takes a freedom from the person the rule is for. His ruling of 2026-09-24,
  as the ceremony paper states it: "What we never do is pick a ceremony *for* users by making the door not
  open without it" (`analysis/ceremony/PAPER-2026-09-24-users-pick-ceremonies.md:127-128`).
- A **prevention**, in the deck's sense, stops something from reaching a person who *did not* choose it:
  a game host's text acting inside a player's Emacs; a port open to every network when the player meant
  to play on one machine. Nobody in the room chose that harm. Preventing it takes no freedom from the
  person protected.

And the cheapest preventions in the falsifier case have a shape worth naming: **they are defaults the
person protected can change.** Listening on `127.0.0.1` unless the player says otherwise is a prevention
that any player can undo in one setting. Saltzer and Schroeder named it fifty years ago: fail-safe
defaults, "the default situation is lack of access, and the protection scheme identifies conditions under
which access is permitted". A default is where prevention and freedom stop fighting: the stranger who
does nothing is protected, and the user who wants the other behaviour keeps it.

**The repaired line, offered as a gloss, not a rewrite of his deck:**

> Disclose, don't gate, a person's own choices. Prevent, cheaply and by a default they can change,
> what reaches people who did not choose it.

That keeps every one of today's four statements true, and it keeps clause (c).

*Concern [MINE].* The gloss adds a sentence someone must learn. *Falsifier:* if a reader handed only the
deck's clause (c) and the card-games card sorts the four statements above into "fine" and "not fine" the
same way the gloss does, the gloss is not needed.

---

## V. What "cheap" can mean without a number

The doctrine turns on "available and cheap", and nothing in the tree prices it. The operator says every
prevention is cheap next to a breach; the builder says every prevention is expensive next to a sentence in
a README. Either can win by choosing the base.

I do not propose a threshold; any number here would be invented. The falsifier case suggests a test that
needs none:

- **A prevention is cheap when it costs the builder no more than writing the disclosure would, and costs
  the protected person nothing unless they choose to change it.** `substring-no-properties` on incoming
  text is one call on each path; the `127.0.0.1` default is one argument. Each is about the size of the
  sentence that would disclose its absence.
- **A prevention is not cheap when it takes a choice away from the person it protects, or when it costs
  more than the thing it guards is worth to the people who use it.** Then the doctrine's ordering governs:
  disclose, record, name the reader.

This test has an owner problem: "worth to the people who use it" has no measurement in a shop with few
users. That is the subject of the companion essay (`writing/viewpoints/ESSAY-2026-09-27-certainty-and-adoption.md`). [DOMAIN]

*Falsifier:* a prevention that passes this test and that a real user then asks to have removed. If one
appears, "cheap" needs the user's own price, not the builder's.

---

## The loser kept on the table: prevention first

**At its strongest.** "Order the other way. Prevent first; disclose what you could not prevent. A small
shop's disclosure reaches almost nobody: the shop's own count of disclosures that met their intended
reader is ZERO (`decks/disclosure-practice.deck.md:57-58`). A policy whose first act has never once
worked is not a first act. Saltzer and Schroeder had it right: recording instead of preventing is a
physical-world idea that computers honour poorly. And his own nightmare, a stray keybinding reaching
~/.ssh, is not something any disclosure helps with."

**Where it wins, and I think it does win there.** For an **irreversible act that reaches people outside
the room**, prevention should come first even when it is *not* cheap. The floor already carries this as a
candidate: "irreversible mid-run reach needs a live two-key consent" (`model.md:478`, gf-03). A two-key
consent is a prevention, and it is not cheap; its cost is someone else's time, every time. The doctrine
as written would allow disclosure-plus-record where that prevention is expensive. For irreversible reach,
that is the wrong answer. [DOMAIN]

**Where it loses.** Everywhere else. Most of what a small shop can build is accountability, as the deck
says (`:18-19`), and a rule of "prevent first" in a shop that cannot prevent most things turns into
"claim to prevent", which is the overclaim the deck's audit found (`:26-28`). It also loses on freedom:
prevention first, applied to a member's own copy, is a gate, and his rings forbid it there.

**A second loser, briefly: accountability only.** Lampson's "police, not locks" model works where there
is a police: a group that can find and sanction its own. A team in one room can be that; his rings give
teams *more* private wiring than one person (`q/2026-09-27-execute-brief/PROMPT.md:18`). So accountability
alone may suffice inside a consenting team. It fails the stranger, who has no police to call. That is
why the deck's "never accountability ONLY" is right for anything that leaves the room.

---

## Coda

**What I recommend.**

1. **Read the doctrine as two rules sorted by who bears the risk:** disclose (never gate) what a person
   chose; prevent, cheaply and by default, what reaches people who did not choose it. Carry this as a
   gloss on the deck and on LENS R2, and correct R2's short form to include its fence. (Decision
   `viewpoints-D1`.)
2. **Name the exception the floor already implies:** for irreversible reach outside the room, prevention
   comes first whatever it costs (gf-03). (Decision `viewpoints-D2`.)
3. **Two corrections that are just work, not decisions:** model.md's "signed" at `:481` should read
   "CANDIDATE, unsigned since 2026-09-17" (the removal list is the receipt); and the deck's falsifier
   should move into a field a tool can read, as the 08-29 note asked. I cannot edit either from this
   folder; they are listed in `done.json` as owed, not done.

**On Q03 (where the doctrine lives).** The reader's recommendation, keep it a CANDIDATE deck, fits
this essay: the doctrine is a rule about *order*, and the floor is a list of *prohibitions*. Putting it on
the floor would make an ordering look like a prohibition. I add nothing to that decision beyond the
falsifier field.

**Falsifiers for the whole essay.**

- If a check of today's works finds one that cites the doctrine *and* applies clause (c), Part IV
  overstates the drift.
- If the card-games fixes shipped without the disclosure text (Part 2 of the review), the doctrine's
  ordering was not followed even where it was cited, and "first" is the weaker half, not the stronger.
- If a user of a C4 tool reports being harmed by a default they could not find to change, the "default
  they can change" half of the gloss is not doing its work.

---

## Sources (each is also cited where it is used)

**Tree** (corpus snapshot ``; each quote checked with `grep -n`):
decks/accountability-first.deck.md:2,8,15-19,26-28,32-36,43-44,48-50,55-61,79,91-92,97-103,111-113,119-122,139-140 ·
decks/disclosure-practice.deck.md:27-28,57-58,71-72,86-87 · decks/must-versus-journey.deck.md:49 ·
model.md:478,480-481 · MEMORY.md:932,2974 · q/PROMPT-2026-07-29-corwin-trust-and-registers.md:25,29 ·
q/2026-09-26-onward-readiness/PROMPT.md:27 · q/cleanup-2026-09-16/removed-2026-09-17.txt:3,300 ·
h/NOTE-2026-08-29-gardening.md:42 · h/PAPER-2026-08-29-the-lab-for-david-1.0.0.md:313 ·
evidence/question-bank-iTNH.tsv:20,533 · journal/HANDOFF-2026-07-29-cg-net-fixes.md:26-27,31-34 ·
analysis/ceremony/PAPER-2026-09-24-users-pick-ceremonies.md:101-102,116-117,127-128 ·
d/door/50-shop-door-intro.part:12 · q/2026-09-27-execute-brief/PROMPT.md:18-19 · writing/execute-brief/tracks/unwritten.tsv:11.

**Today's works:** writing/what-a-member-keeps/ESSAY-2026-09-27-what-a-member-keeps.md:422-431,485-486,504-505 ·
writing/elected-image/ESSAY-2026-09-27-the-elected-image.md:570-571 ·
writing/rings/PAPER-2026-09-27-every-rule-carries-its-ring.md:80-126 ·
writing/execute-brief/LENS-2026-09-27-written-against-open.md:334,362 ·
writing/execute-brief/DECISION-2026-09-27-bank-in-bulk.md:1055.

**Outside** (fetched 2026-09-27):
- J. H. Saltzer and M. D. Schroeder, *The Protection of Information in Computer Systems* (1975),
  https://www.cs.virginia.edu/~evans/cs551/saltzer/ — fail-safe defaults; compromise recording is one of
  two principles that "apply only imperfectly to computer systems", because records of tampering "can be
  undone by a clever attacker".
- B. Laurie, A. Langley, E. Kasper, *RFC 6962: Certificate Transparency* (2013),
  https://www.rfc-editor.org/rfc/rfc6962.html — a public log that lets "anyone" audit issuers: the
  record held beyond the actor's reach.
- Debian, *Social Contract*, clause 3, https://www.debian.org/social_contract — disclosure as a
  standing promise to the public.
- B. Lampson, *Computer Security in the Real World* (2004),
  http://bwlampson.site/69-SecurityRealIEEE/69-SecurityRealIEEE.htm — "security depends more on police
  than on locks"; the gold standard includes "Auditing the decisions of the guard".

---

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.

```
LENS · ESSAY account checks first · 2026-09-27
a  my view: the doctrine is right and well fenced, and today's writing cited its first half without its fence; "gate" (limits a person's own choice) and "prevention" (stops what reaches someone who did not choose it) are different, and a changeable default is where they agree.
b  the view I ascribe Corwin: accountability is how he lives, and he named that as a bias to check; he wants user freedom, so no gates on what people choose, and he confirmed the card-games prevention himself.
c  their pull on mine: his "that match is a reason for MORE scrutiny" pulled me to look for where the doctrine was being cited too comfortably, which is how I found the drift in today's works.
d  my pull on theirs: I ask him to accept one exception (irreversible reach outside the room: prevent first, whatever it costs) and a gloss that makes "don't gate" and "do prevent" sit in one sentence.
persona / inverse: the operator says "logs are not locks, build the lock" / the inverse, the stranger, says "I will read neither your log nor your README; only your default reaches me", which moves the argument from lock-versus-log to what happens when nobody does anything.
principles reframe: 1. equal regard: the stranger who never agreed to anything gets the same protection as the reader who did, and that protection is the default. 2. freedom 0 and 1: a default the user can change protects without taking the freedom to run the program as they wish. 3. free software: disclosure of problems is a standing public promise (Debian clause 3), not a courtesy. 4. community: a record only protects when someone other than its author reads it.
```
