# ESSAY 2026-09-27 — Certainty and adoption

*Form: ESSAY (`c/wf`, row ESSAY: "A worked argument on one question, longer than a note"). The question:
a shop that proves everything can prove itself into standing still; what sets the price of a check, and
who pays it? This is the first written argument for `decks/certainty-and-adoption.deck.md`. The reader
found it cited in 13 files and argued only in decks (`writing/execute-brief/tracks/unwritten.tsv:13`; recount today:
`grep -rliE 'certainty-and-adoption|absolute certainty' corpus | wc -l` → 13).*

## Thesis

His words of 2026-07-31, as the deck quotes them (`decks/certainty-and-adoption.deck.md:5-7`). His
original prompt of that day is not in the snapshot; the deck is the only source.

> "here we build our system toward a zero where only absolute certainty can move it, recreating the
> problem we set out to solve. This is a flippable script and it is informative… What could make
> that spiral out of control? Users."

**Plain words.** Every safety check the shop adds makes sense on its own. But a check that nobody has to
pass costs nobody anything, so nothing stops the next one. Keep adding and you reach a point where
nothing can move unless it is certain, which is its own kind of failure. Then turn the question over:
what would make the opposite failure happen, everything loosening at once? Users. Users are what the
shop does not have, and they are the thing that would push it either way.

## How this essay was made (the movements)

- **I.** What the deck argued on 2026-07-31 (observed).
- **II.** What happened in the eight weeks since (observed): five things the deck did not have.
- **III.** Four people at tension, each at their strongest.
- **IV.** Where the sources agree, and the one place they do not.
- **V.** The writing programme as the shop's first priced work (the tie to the LENS's H2).
- **The loser kept:** certainty first, and where it wins.
- **Coda:** what I recommend, and the falsifiers.

---

## I. What the deck argued

### Observed

- **The mechanism.** "a check that nobody has to pass costs nothing to add. No one is delayed, no one
  complains, no throughput drops. So there is no counter-pressure, and **a verification programme with no
  users has no natural stopping point.**" (`decks/certainty-and-adoption.deck.md:24-26`). "The absence of
  users is not a side condition of the stagnation. **It is the mechanism.**" (`:27`).
- **His objection, kept.** "*"Not doing SSL certs or whatever basic hygiene won't make people rush to
  follow our lead."*" (`:42`). The deck agrees: bad practice spreads only "as **cargo on something that
  is.**" (`:44`), and adoption pressure "selects precisely against the ones that matter" (`:57-58`), the
  controls whose absence nobody feels until the rare day they were for.
- **The synthesis.** Stagnation and chaos "are the same absence, seen from two population sizes" (`:63`);
  "we do not know what a check is worth" (`:67`). "The cure for both is one instrument: make the COST and
  the BENEFIT of each check observable at the same time." (`:69-70`).
- **The caution that rides with it.** "*"Get a user so your checks acquire a price"* is only honest when
  **the risk being taken is the user's to take and they can see it**" (`:87-88`).
- **The one experiment.** Two conventions, one operator, one week: the hyphen in every filename
  "Survived perfectly"; the interlocks convention, which "requires a separate deliberate act", "Decayed to
  five orphaned decks" (`:97-101`). Its limits, in its own words: "It is a suggestive coincidence, not a
  finding" (`:117-118`), with a test to run "against controls we have NOT looked at" (`:118-119`).
- **The hinge left open.** His sentence "cumulatively weighted toward stagnation but " stops at *but*
  (`:146`). It is Q101. Today's bulk decision proposes closing it as stale
  (`writing/execute-brief/DECISION-2026-09-27-bank-in-bulk.md:175`). This essay does not guess at his
  hinge, and it does not need it.

---

## II. What happened in the eight weeks since

Five observations the deck did not have. Each is from the tree; none was gathered to test this deck,
which makes them better witnesses than the deck's own example.

1. **The separate-act forecast came true on a control the deck did not pick.** On 2026-08-29 the drift
   record went dark: "`drift.sh` is a separate deliberate act at the *end* of a turn — precisely the act
   that gets dropped when a turn ends in ceremony" (`h/NOTE-2026-08-29-drift-review.md:44-45`). The paper
   of that day: "The fix is not discipline. It is chaining" (`h/PAPER-2026-08-29-the-lab-for-david-1.0.0.md:310-311`).
2. **A check written as prose was never counted.** The card-falsifier tool, run the same day: "432 cards /
   78 decks -- BORNE 0" (`evidence/question-bank-iTNH.tsv:533`). A falsifier is a check; a falsifier
   nobody reads costs nothing to write.
3. **The shop removed checks without any user.** On 2026-09-17 a pass removed signatures, keeping one
   "only where something mechanical reads it" (`q/cleanup-2026-09-16/removed-2026-09-17.txt:3`). His rule
   that followed: "no signing asks without a named reader" (`MEMORY.md:2746`). **The zero was pushed back
   from inside, and the price used was a named reader, not a user.**
4. **The first user price arrived, and it was silence.** His review of 2026-09-26 on
   `archive-markdown.sh`: "The version that I made was called by me by hand several dozen times. Since you
   fixed it … I have not called it manually a single time" (`q/2026-09-26-onward-readiness/PROMPT.md:23`).
   The defensive rewrite added checks; the one user paid for them by leaving. Nothing in the tree
   recorded that departure until he said it.
5. **The newcomer's price was measured once.** The throughput read of 2026-09-23 quotes his worry: "we
   make fewer errors but since we do so much less work per prompt … most AI focused users will see C4 as a
   step backward" (`analysis/throughput/INDEX.md:10-12`). Measured: ceremony was "9% by call count"; the
   door read before any act was "46,404 bytes global" (`:22`, `:35`). Its conclusion: "four defaults
   flipped and one thing measured" (`:77`), default OFF first (`:79-83`). The A/B demo that would price
   it (`:122-125`) has not been run; I found no record of it in `MEMORY.md` after the 09-23 entry
   (`grep -n 'A/B' MEMORY.md` → the plan at `:2767`; the other two hits are about other things).

### Judged

Observation 1 lifts the deck's decay forecast from "coincidence" toward "pattern": a second control,
chosen by nobody who wanted the result, decayed for the same reason. It is still one shop and one
operator. [MINE]

Observation 3 narrows the deck's strongest sentence. "**Users are the only thing that prices a check**"
(`:34`) is too strong: on 09-17 a *named reader* test priced every signature in the two trees it covered, and 324 were
removed because nothing reads them (`grep -vcE '^#|^\s*$'` over the removal list). What a reader gives is not the cost of a check but its *benefit*. The user supplies the cost. So
the deck's "one instrument" splits into two names, and both can be written down before any measurement:
**who pays for this check, and who reads what it finds.**

Observation 4 teaches the most. The price users supply is mostly **not a complaint**. It is quiet
departure. A shop that waits for objections to price its checks will hear nothing and conclude its checks
are free. That is the deck's mechanism again, with a user present.

---

## III. Four people at tension, each at their strongest

**1. The verifier who wants certainty.** "I have watched a control decay in a week with one careful
operator. Every control I drop because it 'costs someone something' is a control that was there for the
rare day. Your own deck says adoption 'selects precisely against the ones that matter'. Nobody notices a
missing consent check until someone's consent was ignored, years later. I will take a slow shop over a
shop that learned what its checks were worth by losing one. And 'a claim needs a tool that fails it'
is his rule, not mine." *Strongest for checks whose absence nobody feels for a long time.*

**2. The adopter who wants to move.** "I have one prompt and a job. Claude alone gives me the tool;
Claude with C4 gives me the tool plus a design, a QA plan, a loop and a quiz, at four times the tokens
(`analysis/throughput/chapters/02-arm-a-doubt-first.md:3-7`). The two defects your discipline caught I
would have found on the next run. Gabriel's old essay said it: the simpler thing 'has better survival
characteristics than the-right-thing'. The tool I will actually call is the small one." *Strongest for a
tool one person calls by hand, where a failure is seen at once and costs little.*

**3. The community that supplies the price.** "You cannot price a check by yourself, and you should not
try to get us to pay for your calibration without telling us. Herley showed that users who ignore
security advice are often right, because the advice 'offers to shield them from the direct costs of
attacks, but burdens them with far greater indirect costs in the form of effort'. When we walk away from
your checks, that is information. But your deck is right that it is only honest to use us as the price if
the risk is ours and we can see it. Disclose first." *Strongest where users bear both the cost and the
risk and can say so.*

**4. The newcomer.** "I opened the door and read 46 KB of someone else's corrections before I could do
anything. I do not know which of your checks are for me. His principle, as your throughput read states
it, is that 'turning it on and clicking through gives a fairly comparable experience to using Claude
without C4' (`analysis/throughput/INDEX.md:15-16`). Right now it does not. Tell me what is on, why, and
how to turn it off." *Strongest on the first day, which is when adoption is decided.*

---

## IV. Where the sources agree, and the one place they do not

| conclusion | his | older | today | outside |
|---|---|---|---|---|
| **B1. A check with no cost to anyone grows without bound; its cost must be visible to be judged.** | the zero (`decks/certainty-and-adoption.deck.md:5-7`); "That doesn't mean we cannot build it. It means that we cannot build it in advance of instrumentation that measures my feedback from/on it." (`decks/deck-as-return-channel.deck.md:83-84`) | the deck's mechanism (`:24-27`); the throughput read (`analysis/throughput/INDEX.md:73-77`) | LENS H1: "The formal writing asks roughly ten questions for every one it settles" (`writing/execute-brief/LENS-2026-09-27-written-against-open.md:117-118`) | Herley: "advice almost always ignores the cost of user effort" (Microsoft Research, NSPW 2009) |
| **B2. A control survives when obeying it is cheaper than skipping it.** | "We cannot make an ant-farm out of queens" (`q/2026-09-26-onward-readiness/PROMPT.md:23`); his hand-called archive tool (same line) | the hyphen vs the interlocks (`decks/certainty-and-adoption.deck.md:97-103`); chaining the drift record (`h/PAPER-2026-08-29-the-lab-for-david-1.0.0.md:310-311`) | the throughput read's "Ceremony lives in spells, never in tools" (`analysis/throughput/INDEX.md:87`) | Saltzer & Schroeder, psychological acceptability: "the human interface be designed for ease of use, so that users routinely and automatically apply the protection mechanisms correctly" |
| **B3. Users price checks mostly by leaving, not by objecting.** | "I have not called it manually a single time" (`q/2026-09-26-onward-readiness/PROMPT.md:23`) | "Users are the only thing that prices a check" (`decks/certainty-and-adoption.deck.md:34`) | LENS H2: the probe is blind to the outside readers (`writing/execute-brief/LENS-2026-09-27-written-against-open.md:165`) | Herley: "users' rejection of the security advice they receive is entirely rational from an economic perspective"; Adams & Sasse (CACM 1999): users route around mechanisms that do not fit their work |
| **B4. Some checks must not be priced by users at all.** | "the SAFETY set must be ENUMERATED and made non-electable BEFORE any persona-election machinery ships" (his card, as quoted in `decks/person-system.deck.md:64-65`) | adoption "selects precisely against the ones that matter" (`decks/certainty-and-adoption.deck.md:57-58`) | account-checks-first, the irreversible-reach exception (`writing/viewpoints/ESSAY-2026-09-27-account-checks-first.md`, the loser) | Vaughan's normalization of deviance: "deviance from correct or proper behavior or rule becomes culturally normalized" (Wikipedia summary) |

**Judged.** B1, B2 and B3 hold across four kinds of source. **B4 sits against B3**, and the two outside
sources name the split exactly: Herley says users who drop a check are usually right; Vaughan says a group
that drops a check because nothing went wrong is how disasters are made. Both are true, for different
checks. The deck already holds the sorting test: a performance check "announces its own neglect within a
day", a consent check "once, years later" (`decks/certainty-and-adoption.deck.md:56-57`). **Let users
price the checks whose failure shows up quickly. Hold a short list, written down in advance, of the checks
whose failure shows up late, and keep those out of the pricing.**

*Concern [MINE].* The short list is itself a check that nobody has to pass, and so it will grow. The
person-system deck gives it a test ("its absence would not be felt for a long time",
`decks/person-system.deck.md:67-68`), and says a first attempt exists at `evidence/safety-floor.tsv`
(`:66`). That file is not in the snapshot, so I cannot check its length. *Falsifier:* if the list, when
read on Avalon, holds more than a handful of rows that a user would notice missing within a day, the test
is not being applied.

---

## V. The writing programme as the shop's first priced work

The LENS of this morning found no count that shows his H2, "The writing programs have shown to have the
most traction of any work so for": inside the tree, tools draw his prompts' attention most and formal
writing least (`writing/execute-brief/LENS-2026-09-27-written-against-open.md:147-150`, `:173-174`).

This deck says which count would matter, and it is not the inside one. **Traction, in the deck's terms,
is a price paid by someone outside.** On that count, the record is small:

- The first dissertation has "an outside reader", with "eight comments" and a registry at
  `evidence/comments.tsv` (`model.md:776`). His prompt today calls those comments "a pretty meaningful but
  of thinking" (`q/2026-09-27-execute-brief/PROMPT.md:7`).
- Before that, his wife's use of the word-rating page was carded as "the first evidence this shop has ever
  had that anything here is usable by someone who did not build it" (`decks/empty-copying.deck.md:178-180`),
  with the deck's own tie: "users are the only thing that prices a check" (`:181-182`).
- The counter-case, from the LENS: Bryant engaged through skills and tools (`model.md:84-86`).

**Judged.** Two of three recorded outside engagements are with writing or a reading surface; one is with
tools. That is too few to rank anything, and I do not. But it explains why the writing *feels* like
traction to him while the in-tree count says otherwise: the writing is the only part of the work that
readers outside have paid attention to. By this deck's logic, that makes it the only part whose checks
have begun to acquire a price, and the comments are that price. [MINE]

There is a cost on the writing side too. The LENS counts "31 decisions marked his alone" raised today and
"8" discharged (`:227`). Each question banked for him is a check that costs its writer nothing and costs
him attention. That is the deck's mechanism, operating on him. This essay raises two.

*Falsifier:* the count the LENS already proposed, run on Avalon: rows of `evidence/comments.tsv` and the
partners' contributions, per kind of work (`:178-180`). If tools lead that count, this part is wrong.

---

## The loser kept on the table: certainty first

**At its strongest.** "Stop apologising for being slow. The free-software world has shipped plenty of
fast, popular, broken things, and users trusted them because they were popular. Worse-is-better won the
market and gave us decades of memory-unsafe code. A shop whose mission is user freedom should not buy
adoption with the users' safety, and 'get a user so your checks acquire a price' is, as your own deck
admits, 'a wager placed with someone else's stake' (`decks/certainty-and-adoption.deck.md:90`). Stay at
the zero until you are sure."

**Where it wins.** On the short list of B4: consent, irreversible reach, other people's facts. For those,
certainty first is right, and no amount of adoption should price them down. It also wins on one point of
order: the deck's caution holds that seeking users before a disclosure has reached its reader is the
wager. The account-checks essay says the same from the other side.

**Where it loses.** Everywhere else, and the evidence since July is on its side of the ledger less than
it thinks. The zero was reached: 432 cards with no falsifier a tool can read, a drift record that went
dark, a door of 46 KB, a rewritten tool its one user stopped calling. Certainty first did not deliver
certainty. It delivered checks that nobody read, which the account-checks deck calls "ceremony"
(`decks/accountability-first.deck.md:121`). The shop's own best repairs (the 09-17 removals, chaining the
drift record, default OFF) all moved *away* from certainty first.

---

## Coda

**What I recommend.**

1. **Name the payer and the reader of every standing check.** Two plain fields, written when the check is
   made: *who pays for this* (whose time, whose act) and *who reads what it finds*. A check with no named
   reader goes to default OFF, as signatures already did on 09-17; a check whose payer is a user is
   disclosed to that user. This is the deck's "one instrument" in a form that needs no measurement to
   start. (Decision `viewpoints-D3`.)
2. **Keep the late-failure list short and separate.** Checks whose absence would not be felt for a long
   time are held out of user pricing, by the person-system test. Everything else is priced by use. This
   is already his card; I recommend it is read as the boundary of this essay's argument, not as a new
   rule.
3. **Count use, not complaints.** The price users pay is mostly departure. The throughput read's A/B demo
   (`analysis/throughput/INDEX.md:122-125`) and the comments count in Part V are the two cheapest
   instruments that see departure. Neither needs his ruling; both need his machine. Listed in
   `done.json` as owed.
4. **Q101** stays with the bulk decision's proposal (close as stale). This essay argues without his
   hinge.

**Falsifiers for the whole essay.**

- The A/B, run with default OFF, shows Claude with C4 doing less per prompt *and* catching nothing
  Claude alone missed: then the checks were not priced wrongly; they were not worth having, and the
  verifier's case loses more than I say.
- A check with a named payer and reader that still decays at the same rate as one without: then naming
  is not the instrument, and the deck's "make cost and benefit observable" needs a real measurement.
- A user who drops a check on the late-failure list, and is shown right by the outcome: then the list's
  test is wrong, and Herley wins even there.

---

## Sources (each is also cited where it is used)

**Tree** (corpus snapshot ``; each quote checked with `grep -n`):
decks/certainty-and-adoption.deck.md:5-7,24-27,34,42,44,56-58,63,67,69-70,87-88,90,97-103,117-119,146 ·
decks/deck-as-return-channel.deck.md:83-84 · decks/person-system.deck.md:64-68 ·
decks/empty-copying.deck.md:178-182 · decks/accountability-first.deck.md:121 ·
h/NOTE-2026-08-29-drift-review.md:44-45 · h/PAPER-2026-08-29-the-lab-for-david-1.0.0.md:310-311 ·
evidence/question-bank-iTNH.tsv:533 · q/cleanup-2026-09-16/removed-2026-09-17.txt:3 ·
MEMORY.md:2746,2767 · q/2026-09-26-onward-readiness/PROMPT.md:23 ·
analysis/throughput/INDEX.md:10-16,22,35,73-87,122-125 · analysis/throughput/chapters/02-arm-a-doubt-first.md:3-7 ·
model.md:84-86,776 · q/2026-09-27-execute-brief/PROMPT.md:7 · writing/execute-brief/tracks/unwritten.tsv:13.

**Today's works:** writing/execute-brief/LENS-2026-09-27-written-against-open.md:117-118,147-150,165,173-180,227 ·
writing/execute-brief/DECISION-2026-09-27-bank-in-bulk.md:175 ·
writing/viewpoints/ESSAY-2026-09-27-account-checks-first.md.

**Outside** (fetched 2026-09-27):
- C. Herley, *So Long, And No Thanks for the Externalities: The Rational Rejection of Security Advice by
  Users* (NSPW 2009), https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/SoLongAndNoThanks.pdf
  — rejection of advice is "entirely rational from an economic perspective"; advice "ignores the cost of
  user effort".
- R. P. Gabriel, *The Rise of Worse is Better* (1991), summarised at https://en.wikipedia.org/wiki/Worse_is_better
  — the simpler design "has better survival characteristics than the-right-thing".
- D. Vaughan, normalization of deviance, summarised at https://en.wikipedia.org/wiki/Normalization_of_deviance
  — deviance from a rule "becomes culturally normalized".
- A. Adams and M. A. Sasse, *Users Are Not the Enemy*, CACM 42(12), 1999,
  https://cacm.acm.org/research/users-are-not-the-enemy/ — users work around security mechanisms that
  conflict with how they work (described in my words, not quoted).
- J. H. Saltzer and M. D. Schroeder, *The Protection of Information in Computer Systems* (1975),
  https://www.cs.virginia.edu/~evans/cs551/saltzer/ — psychological acceptability.

---

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.

```
LENS · ESSAY certainty and adoption · 2026-09-27
a  my view: the deck's mechanism held up and its forecast gained a second witness; its "users are the only price" is too strong (a named reader prices benefit, a user prices cost), and the price users pay is mostly silent departure.
b  the view I ascribe Corwin: he named the zero from inside and flipped it himself; he wants C4 used, not admired, and his own tool review showed him the price of a defensive rewrite.
c  their pull on mine: his "flippable script" pulled me to ask what each side would have to be supplied, which is how the named-reader repair (09-17) showed up as a price without users.
d  my pull on theirs: I ask him to accept two plain fields on every standing check (who pays, who reads) and to keep a short list outside user pricing, instead of treating "get users" as the whole cure.
persona / inverse: the verifier says "a slow shop beats a shop that learns by losing" / the inverse, the adopter, says "your checks were priced already, by my leaving, and you did not record it", which finds that the shop's missing instrument is a count of use, not of objections.
principles reframe: 1. equal regard: the newcomer's first day counts as much as the keeper's hundredth, and the first day is where the price is paid. 2. freedom 0: a check the user cannot see or switch off limits running the program as they wish. 3. free software: users who walk away are exercising a freedom, and their walking is information the project owes itself to read. 4. community: a short, written list of checks nobody may price down protects the people who are not yet users.
```
