# ESSAY 2026-09-27 — What a member keeps

*Peers electing their system, the honest degrade, and seeing quiet changes: three ideas the reader
found unargued (`writing/execute-brief/tracks/unwritten.tsv` rows U02, U04, U05, with U08 at the end), argued here as one.*

## Thesis

> "the person who has to peel what we made apart to fix us will not thank us for making our tool
> impossible to reinvet [sic] from whatever line or phrase.  In any event, we have no control over
> that, and that is proper."
>
> — Corwin, 2026-07-31, `q/PROMPT-2026-07-31-corwin-metalanguage-and-bootstrap.md:34`

That is his sentence, and it is the thesis. The same line opens with the words the deck later
quoted: *"While this represents my #1 trepidation I could also argue it is my #1 requirement"*
(same file, same line). The deck that carries the idea (`decks/degrade-honestly.deck.md:74-77`)
quotes it with his two typos silently corrected ("reinvent", "Things"). The words above are the raw
capture.

**The question this essay puts to the thesis is mine [MINE]:** *he wrote that sentence about one user
editing one model file. Does it still hold when peers elect a system together? If it does, what does
a member who disagrees keep, what must the system say once someone has deleted a part, and how do
members see a change that nobody announced?*

**How this was made.** I grepped the corpus snapshot (``: MEMORY.md, model.md, q/, decks/,
facts/, analysis/, d/door/, the bank) for *elect, dissent, fork, withdraw, degrade, unannounced,
quiet, witness, double entry*. I checked every quote with `grep -n`. I fetched outside sources on
the web and cite each by title and URL where it is used. Movements I and II set out the problem and
the five voices. III and IV give the answer that several sources agree on and name where they do
not. V and VI are the two concrete sections the brief asked for. VII covers U08. A coda and the
sources follow.

---

## I. Three ideas that are one idea

### Observed

- **U02, peers electing.** model.md:497-498: *"C4 is a discipline you ELECT, not a dialect you must
  ADOPT."* q/TAG/co-elected-words.md:3-6: *"When we "turn ON," we will have ELECTED THE WORDS
  TOGETHER that we agree represent what we are building"*, and this holds *"for EACH turn after,
  unless we are broken"*. He asked about the group case directly on 2026-09-24
  (`q/2026-09-24-users-pick-ceremonies/PROMPT.md:6`): *"What I want to know is to what extent we can
  let users pick ceremonies (especially together in potentially-concentric self-governing rings)."*
  In the same paragraph: *"Remember how attracting the idea of helping people find governance in
  groups was?  That is't a carrot.  That's the ambition."* And today
  (`q/2026-09-27-execute-brief/PROMPT.md:13`): *"our project could be the first tool in human history
  specifically created with no motive other then enabling peers to elect systems specifically
  designed around our communication and collaboration preferences"*.
- **U04, degrade honestly.** decks/degrade-honestly.deck.md:17-22: *"A C4 artifact that has been
  cut down MUST NOT keep making the claims its missing parts supported."* and *"when someone deletes
  the part of C4 they don't like, does what remains LIE?"* The deck's verdict is CANDIDATE (line 26).
  Its eclipse pass was *"set up but NOT run"* (line 99). A grep for the pass's seed `20260731-DH`
  finds only the deck itself, so the pass has not been run.
- **U05, quiet changes.** MEMORY.md:102-107 records "The goal, in his own reframe (2026-07-31)". The
  project *"cannot really weaken the state of the art"* *"if more users actually read the disclosures
  and can keep each other honest about routine maintenance and quiet changes to software they depend
  on — especially unannounced ones. If we cannot move that ball as a group, we should say what we are
  solving for and name the requirement some other way"*. I found no q/ prompt holding his raw words
  for this. The MEMORY bullet is a record of his reframe, not a verbatim capture.

### Judged

All three describe the same event seen from different seats: **a shared picture changes, and one
party's copy stops matching it.**

- The dissenter's copy leaves the group's picture on purpose.
- The user who deletes a part changes their own copy and leaves the claims behind.
- The maintainer who ships a quiet fix changes the shared picture and leaves members' copies behind.

In each case the harm is the same. **Something goes on asserting what is no longer true.** The group
image asserts a member who has left. The cut-down copy asserts a guarantee it no longer supports.
The member's copy asserts "unchanged since I looked".

So I read "what a member keeps" as two things:

1. **Their copy**, with the freedom to change it (the thesis).
2. **The truth about the difference** between their copy and everyone else's (degrade honestly for
   deletions, a balance for quiet changes).

The first is old free-software ground. The second is what C4 could add.

---

## II. Five voices, each at its strongest

The brief names five seats. I state each one as its best advocate would put it, before any of them
is answered.

**1. The member who dissents from what the group elected.** "I agreed when we elected this. I no
longer agree. What I built while I was inside is mine. The words I helped elect are partly mine. I
will not pretend to agree in order to keep them. Let me leave with my copy and my work and keep
running it my way. Don't punish my leaving by making my copy break, or my data unreadable, or my
name disappear from what I made. And if I stay while disagreeing, let me say so out loud without
that counting as leaving."

**2. The group that needs a shared, supportable image.** His field-support picture puts it best
(`q/2026-09-27-execute-brief/PROMPT.md:13`): *"The goal of that team is a clear picture, sufficient to
train a pod to answer calls about whatever crash or trouble a given user runs into."* In the group's
voice: "Every private deviation is a hole in the picture we train on. If you change your machine
quietly and then call us, you spend our time on a machine we cannot see. We are not asking you to be
like us. We are asking you not to make us guess." He draws the limit himself (same line): *"what we
can do to prep people helping end users will be specifically bounded by the freedoms end-users
have"*.

**3. The org that must show its wires to outsiders.** His puppet ruling
(`q/2026-09-27-execute-brief/PROMPT.md:19`): *"That group needs to show how the wires are working if
they aren't working according to the means described by the version of the C4/ghostwheel manuals
users see while using the system"*. In the org's voice: "The audience at our club never voted in our
election. They rely on the manual matching the machine. Whatever we elected, removed or changed, we
owe them the difference between what the manual says and what the wires do."

**4. The newcomer who meets the system with no history.** "I wasn't there for the election.
Everything you agreed, I meet as something imposed. Before I can elect anything I need to see three
things with nothing but the tree in front of me: what is in force, why, and how to leave." An
election the newcomer cannot read is, for them, an adoption. That turns elect-not-adopt (model.md:497)
against the group that forgets them.

**5. The maintainer who supports whatever people deleted or changed.** "I get the bug report. If you
cut a part and the rest keeps claiming it works, I am debugging a system that exists nowhere. I don't
need you to keep my parts. I need to be able to tell what you are running." He has put the
maintainer on the same level as the user: *"only users/maintainers are queens of C4/ghostwheel: each
program is a simple peer of the realm"* (`q/2026-09-26-onward-readiness/PROMPT.md:23`).

**What pulls between them.** Voices 1 and 2 pull hardest against each other: exit and freedom
against the supportable picture. Voices 3 and 4 each ask for legibility to someone outside the
election. Voice 5 asks for legibility to someone inside it. The one thing none of the five asks for
is **uniformity**. Even the group asks only *not to guess*. That shared absence is where the answer
starts.

---

## III. What the dissenter keeps — where the sources agree

### Observed (the tree)

- **Leaving is structural. It cannot be overridden.** MEMORY.md:358-363, the gen6 minting ruling:
  *"MINE mints freely (we may decline to build, never to SHOW"*. For THEIRS: *"THEIRS only under the
  owner's LAST-EFFECTIVE consent (later withdrawal wins) — build-anyway structurally degrades to a
  FORK (register mis-alignment) and **no override exists**"*. So by the tree's own ruling, the
  owner's withdrawal wins, and anyone who goes ahead anyway has made a fork, not an override.
- **The group cannot govern a member's machine.** d/door/36-his-attribution.part:14-16 (owner HIS,
  from his chat 2026-09-23): *"C4 treats an organization's context and a local user's context as
  equals, and assumes neither is the default."* and *"C4's own best practice does not govern what
  someone else does with their computer."*
- **Joining is consented and revocable. Rings bind inward only.**
  analysis/ceremony/PAPER-2026-09-24-users-pick-ceremonies.md:124-128: *"To the full extent,
  outside a ring — every user picks, including "none", and the tools tell the truth about what that
  buys."* Joining a ring is *"consented per party, fresh, specific, uncoerced … revocable (Y11)"*.
  Lines 115-117 of the same paper: *"an inner ring may require more of its members than the outer
  ring requires of the public; the outer never inherits the inner's requirement"*.
- **Disagreement is a signal, not a fault.** His ruling on which sense of C4 governs when two
  disagree (C4.md:266-272): none should, and *"There are many meanings for C4 and each of them is
  something we must be true to"*, *"learning about usage from places where tensions suggest lack of
  clarity."*
- **Control of a shipped thing is impossible, and would be unwanted.**
  decks/known-impossible.deck.md:93-94: *"There is no construction that both ships a thing and
  retains control of it, and we would not want the one that did."*

### Observed (outside)

- **The GNU Free Software Definition**, https://www.gnu.org/philosophy/free-sw.en.html. Freedom 3 is
  *"The freedom to distribute copies of your modified versions to others"*. Freedom 1 reads *"The
  freedom to study how the program works, and change it so it does your computing as you wish"*. A
  direct fetch of that page was refused (robots/connection reset). The Freedom 1 wording is confirmed
  by an exact-phrase web search that returned the GNU page. The Freedom 3 wording is confirmed through
  Wikipedia's *The Free Software Definition* (https://en.wikipedia.org/wiki/The_Free_Software_Definition).
- **Fork (software development)**, Wikipedia, https://en.wikipedia.org/wiki/Fork_(software_development):
  *"Free and open-source software, by definition, may be forked without permission."* It also gives
  David A. Wheeler's four outcomes of a fork: the fork dies, it re-merges (EGCS back into GCC), the
  original dies (XFree86 → X.Org), or both continue as distinct projects (OpenBSD/NetBSD). And it
  names XEmacs as the schism that entered folklore.
- **Constitution for the Debian Project**, https://www.debian.org/devel/constitution. §2.1.1:
  *"Nothing in this constitution imposes an obligation on anyone to do work for the Project. A person
  who does not want to do a task which has been delegated or assigned to them does not need to do
  it."* §4.1.2: the Developers may amend the constitution *"provided they agree with a 3:1 majority"*.
  Foundation documents need the same 3:1 to be superseded.
- **GDPR Article 20 (right to data portability)**, https://gdpr-info.eu/art-20-gdpr/: the data
  subject has the right to receive their data *"in a structured, commonly used and machine-readable
  format and have the right to transmit those data to another controller without hindrance"*.
- **Hirschman, *Exit, Voice, and Loyalty***, summarised at
  https://en.wikipedia.org/wiki/Exit,_Voice,_and_Loyalty: members can *"exit (withdraw from the
  relationship); or, they can voice (attempt to repair or improve the relationship through
  communication of the complaint, grievance or proposal for change)."*
- **Elinor Ostrom's design principles**, listed at https://en.wikipedia.org/wiki/Elinor_Ostrom.
  *"Most individuals affected by the operational rules can participate in modifying the operational
  rules."* And *"The rights of appropriators to devise their own institutions are not challenged by
  external governmental authorities."*

### Judged

**Agreement is strong on the floor, and I think it shows the right answer.** Take free software's
right to fork, Debian's no-obligation clause, the data-portability right, the tree's "no override
exists", door part 36, and the ceremony paper's "revocable". These are six independent sources from
four traditions: software licensing, a volunteer constitution, privacy law, and his own rulings.
They agree on one thing. **A dissenting member keeps:**

1. **Their copy, and the freedom to run and change it.** This is freedoms 0, 1 and 3 applied to the
   member's copy of the group image.
2. **Their own contributions and data, in a form they can carry.** "Commonly used and
   machine-readable" is the outside standard. In C4 terms that is plain files on a filesystem, which
   C4 already is.
3. **No duty to do the group's work.** This is Debian §2.1.1 almost word for word.
4. **Voice without being counted as exit.** Hirschman's point, and his own C4.md ruling: a tension
   between members is a diagnostic, not a defect. A member who stays and disagrees is information.
5. **Credit.** MEMORY.md:2974 records his word from 2026-09-25: *"credit people, don't leave them
   out to protect them"*. A member who leaves does not leave the history.

**What the dissenter does not keep** is the group's name on their changed copy. A fork is a new
system, and it must not claim the old one's election. This is the one thing the group may insist
on. It is exactly the thesis's obligation seen from the group's side: the leaver's copy must degrade
honestly, stop claiming membership, and say so.

**What a group may require of a member who stays** is set by the ring rule, not by majority alone.
The ring may require what its members wrote down and consented to (ceremony paper lines 112-121),
and nothing more. Joining is revocable. The requirement never leaks outward (the paper's first
falsifier, line 155). Debian adds a refinement I recommend C4 borrow as an *example*, not a rule:
foundational terms take a supermajority to change, so a simple majority cannot rewrite what a
minority joined for.

The one requirement the supportable-image voice legitimately earns is this: **if you want the
group's support, declare your deviations.** That is not uniformity. It is the group's "don't make us
guess", and it costs the member one honest record. Section V is the machine that makes that record
cheap.

**Concern [DOMAIN]:** "declare your deviations" could slide into "report yourself".
*Falsifier:* if any draft ring terms require a member to declare changes that the group does not
support, or to declare them to anyone outside the ring, the requirement has become surveillance and
should be struck back to "declare only what you ask us to support".

---

## IV. Where the sources do not agree

I found four places where no agreement exists. I name them rather than settle them.

1. **How a group of more than two decides.** h/ENHANCE-2026-09-15-registers.md:17 says so plainly:
   *"Nothing anywhere says what an X is at n>2 — whether majority rules, whether a 2–1 split is
   agreement or fault, or which half to believe."* The outside sources split three ways. Debian uses
   graded majorities (simple, 2:1, 3:1). Ostrom asks that "most individuals affected" can take part
   in changing the rules, which is not a vote rule at all. Consensus traditions refuse majority.
   **No agreement.** My lean [MINE]: C4 should not pick. It should require only that a ring **write
   its decision rule down before its first contested decision**, and that exit survives every rule.
   *Falsifier:* a ring that wrote its rule down and still could not tell, after a split, whether it
   had decided.
2. **Quiet fixes for good reasons.** Debian's Social Contract clause 3, *"We will not hide problems"*
   (https://www.debian.org/social_contract), sits beside the common practice of holding a security
   fix quiet until users can patch. His own word is *"no filter may go unannounced"* (MEMORY.md:2974).
   The strongest maintainer case is that announcing the specific fix early hands attackers a map.
   **Partial agreement** only: announce that a change happened and its class, and delay the detail.
   decks/disclosure-practice.deck.md:133-135 already has this shape (see V). How long the delay may
   run has no agreed answer.
3. **Sanctions.** Ostrom's principles include graduated sanctions for rule-breakers. Nothing in the
   C4 tree contemplates sanctioning a member. The tree's grammar is consent, withdrawal and fork, not
   penalty. I think the gap is real. A ring whose member deviates silently and then demands support
   has a grievance, and C4 offers it only "leave" or "tolerate". **No agreement, and no C4 text.**
4. **Who owns the co-elected words.** q/TAG/co-elected-words.md makes the vocabulary joint. When a
   member leaves, may they take the words? The licences on the writing (CC BY 4.0 and GPLv3+, per
   MEMORY.md:2974-2977) say anyone may copy with credit. So legally, yes. Whether the leaver may keep
   *calling* their fork by the elected words is a trademark-shaped question the tree does not raise.
   **No agreement.**

### The loser I keep on the table: "the image is the image"

**At its strongest:** a supported system is a uniform one. Managed desktop fleets work because the
image is locked. Support staff can train on one picture because there is only one. Every freedom to
deviate is a cost moved from the user to the support pod, and the user did not ask the pod first.
His own prompt concedes the core of it: with self-installed apps, *"we will likely be no better
prepared than any given person asked a question"*
(`q/2026-09-27-execute-brief/PROMPT.md:13`).

**Why it loses here:** it reads one ring's rule, the org that owns the machines, as the rule for
every ring. `writing/execute-brief/tracks/tensions-summary.md` finds that same pattern behind 14 of its 25 tensions. And it
fails the thesis: we have no control over the copy, and that is proper.

**Why it stays on the table:** door part 36 makes org and local user *equals*, neither the default.
An org that owns the hardware and writes the lock into its ring terms is using exactly the exception
clause the ceremony paper allows. The loser is right *inside that ring*. It is wrong only when
exported.

A second, weaker loser, also kept: **"announce every deletion, everywhere".** It would give the
group a perfect picture. It fails because it reaches into the member's own computer, which door
part 36 puts out of bounds.

---

## V. The honest degrade — what C4 would need

The deck already states the law and names the mechanism: *"A missing part must be DISTINGUISHABLE
FROM A PART THAT HAD NOTHING TO SAY."* (decks/degrade-honestly.deck.md:44-45). It also says why the
law is worth having: *"delete a piece and look"* (line 38) makes it *"falsified in an afternoon"*
(line 39). What follows is a check that could do the looking. It is described, not built.

### Observed: the half-instances already in the tree

- **c4log GAP record.** A disabled span is written at the next enable, *"because an unexplained gap
  is indistinguishable from concealment"* (degrade-honestly.deck.md:55-56).
- **do0r.** *"the door diets only as fast as the tool can vouch for the pointers left behind"*
  (MEMORY.md:559-560).
- **ju1as balance.** *"Every link is recorded at both ends, by one run, and a trial balance fails
  when they disagree."* (q/junctures/README.md:141).
- **ccspt Gate 1.** *"rejection reserved for tamper never absence"* (ceremony paper lines 148-149).
- **Z as declaration.** Bank Q274 (evidence/question-bank-iTNH.tsv:293): SEALED means *"the row
  declares the absence"*.
- **The honest-tier manifest.** An unsigned skill reads TIER 1, author unverified, and *"Nothing
  pretends"* (ceremony paper lines 104-107).
- **The known violation.** journal/LENS-2026-07-31-ladder-test.md:87-89 found that gitignored
  increments leave a clone *"citing passes with nothing to show a pass ever happened. That is
  degrade-honestly violated inside our own tree"*.

### Judged: the check, in plain words

Call it a **claims check**. It rests on one small table and one rule.

**The table.** Each row is a claim the system prints to a person: in the README, the disclosures,
GHOSTWHEEL.org's Terms and Privacy, or a tool's `--help`. Each row carries four things:

- the claim, in the words the person reads;
- the part or parts that make it true;
- a test that shows it is true;
- where the claim is printed.

This is double entry in the junctures sense. The claims table names the part, and the part's own
header names the claims it supports. A balance fails when the two ends disagree.

**The rule.** The check reads the tree as it stands and sorts every claim into one of three states:

| state | what it means | exit |
|---|---|---|
| SUPPORTED | the part is present and its test passes | 0 |
| WITHDRAWN | the part is gone, and the printed claim now says so ("not available in this build") | 0 |
| LYING | the part is gone or its test fails, and the claim is still printed as if whole | non-zero |

Removal is never the fault. **LYING is the only fault.** That is the thesis made mechanical: the user
may delete anything, and the tool objects only to the remainder asserting what it cannot support.

**Stranger-replayable.** It needs POSIX sh and the tree, and nothing else: no key, no network, no
history, no C4 knowledge. The newcomer (voice 4) can run it on day one. The maintainer (voice 5) can
ask for its output with any bug report and learn what the reporter is actually running. The org
(voice 3) can publish its output as the answer to "how are the wires working".

**Proved red by deletion.** The harness deletes each declared part in turn and runs the check. Every
claim that part supported must come out LYING until its printed text is changed to WITHDRAWN. A part
whose deletion turns nothing LYING either supports no printed claim, or its claims are undeclared,
and the harness names which. This is the deck's "delete a piece and look", run over every piece. Per
his standing rule on coverage, the harness should be written in a different language from the check.

**Scope clause (open bank Q30).** The attack the deck could not answer (lines 108-111) is that
*"an artifact that announces its own missing parts is announcing an attack surface."* The tree has
already answered it twice, and nobody has joined the two answers up:

- decks/disclosure-practice.deck.md:133-135: *"announce the CLASS of what is missing, not the
  specific capability that is gone."*
- decks/proof-bearing-sets.deck.md:106-107: *"the count is the honest minimum and the path is the
  overshoot."*

So the check prints two faces. The face that travels (a published image, a shared log) shows class
and count. The face on the member's own console, or given to an investigator, shows the part.

**The warranty rule.** Removing part X ends X's claims and only X's claims. The check must never
declare the whole system void because one part is gone. That is the software form of the "warranty
void if removed" sticker. The FTC's 2018 warning letters
(https://www.ftc.gov/news-events/news/press-releases/2018/04/ftc-staff-warns-companies-it-illegal-condition-warranty-coverage-use-specified-parts-or-services)
found such conditions *"generally are prohibited by the Magnuson-Moss Warranty Act"* unless the
warrantor supplies the parts free. That is the outside agreement: a maker may disclaim what you
removed, not everything you kept.

**What it cannot do.** It detects absence, not a part changed to keep passing its test while doing
something else. That is tamper, and the deck keeps the two apart on purpose (lines 82-85):
honest degradation *"accuses no one, and it works when the user's edit was entirely legitimate."*
Tamper belongs to signatures and witnesses (section VI).

**Concern [MINE]:** the claims table is a new hand-kept list, and hand-kept lists rot.
*Falsifier:* if the deletion harness finds, on its first run over the current tree, more undeclared
supporting parts than declared ones, the table cannot be kept by hand. Its rows would then need to be
generated from the parts' own headers, as junctures are.

---

## VI. Quiet changes — how members see what nobody announced

### Observed

- **His design words** (`q/2026-09-26-onward-readiness/PROMPT.md:25`): *"there are not two actors,
  but three:  the two actors read ("witness") each other, each dealing in paired sets"*. They must
  *"write two places and doubly link each); the third actor is the egress, which is the solution to
  keeping the other two N(1) in terms of lookups, checks included."*
- **The double-entry specification** (q/junctures/README.md:12): *"use your best double entry
  bookkeeping (doubly linked lists, cross-referencing both/n-ways)"*. Today he named the same
  practice as one of the two ways the whole design is carried out: *"in practice though the practices
  of double entry book and bold, resume-forward guess-work"* (`q/2026-09-27-execute-brief/PROMPT.md:13`).
- **The UX stance banked as Q348** (MEMORY.md:1331-1334): signatures are for maintainers and
  machines, and *"users get RECEIPTS + AMBIENT VERIFICATION (tripwire shape: quiet when good, loud
  with specifics on regression)"*.
- **Expectations must be disclosed** (`q/2026-09-26-onward-readiness/PROMPT.md:27`): *"such
  expectations must be disclosed, just as the checks some program must perform and the reasons for
  it must"*.
- **XZ Utils backdoor**, Wikipedia, https://en.wikipedia.org/wiki/XZ_Utils_backdoor. Andres Freund
  found it in March 2024 because *"SSH connections were generating an unexpectedly high amount of
  CPU usage as well as causing errors in Valgrind"*. The malicious build script was not in the git
  repository. It *"was only available from tar files released by 'Jia Tan' separately from Git."*
- **Reproducible Builds definition**, https://reproducible-builds.org/docs/definition/: *"A build is
  reproducible if given the same source code, build environment and build instructions, any party
  can recreate bit-by-bit identical copies of all specified artifacts."*
- **Certificate Transparency**, Wikipedia, https://en.wikipedia.org/wiki/Certificate_Transparency:
  *"a system of append-only certificate logs"* watched by monitors, built after the 2011 DigiNotar
  compromise to detect mis-issued certificates.
- **Ostrom's monitoring principle** (https://en.wikipedia.org/wiki/Elinor_Ostrom): *"Monitors, who
  actively audit CPR conditions and appropriator behavior, are accountable to the appropriators or
  are the appropriators."*

### Judged

**A quiet change is an unbalanced entry.** Put it as bookkeeping. Between two moments, the
difference between the group image then and the group image now must equal the sum of the changes
announced in between. Anything left over is a change nobody announced. The xz case is this equation
failing in public. There were two records of the same software: the git history, which was announced
and reviewed, and the release tarball, which was shipped. They disagreed, and for weeks no party
struck the balance between them. A reproducible build is exactly that balance struck by a stranger.

His three-actor design maps onto this directly:

- **Witness one** is the member's own copy, with the claims-check output and a hash list from when
  they last looked.
- **Witness two** is the group's change log, where announcements go.
- **The third actor, the egress,** is the published image: the release, the shared tree, the thing
  that crosses the ring's edge. That is where the balance is struck. Each member's check compares
  "what changed at the egress since I last looked" against "what the log announced". The result
  comes back in the tripwire shape: silent when the two balance, loud with specifics when they
  don't.

The balance must be generated. No member's virtue produces it. That is how *"no filter may go
unannounced"* becomes a property of the system rather than a promise.

**Must a deletion be announced to the group?** The sources split cleanly by *where* the deletion
happens, and the answer follows:

- **In the member's own copy: no.** Door part 36 puts their computer outside C4's writ. The only
  duty is the honest degrade in V: the copy must stop claiming what it lost. If the member then asks
  the group for support, the claims-check output is the declaration, and it costs them nothing to
  write.
- **In the shared image: always, and automatically.** The balance announces it whether or not anyone
  wrote a note. A maintainer's embargoed fix appears as "a change of class X occurred; detail
  follows". That is the class-not-path face, which IV.2 names as the partial agreement.

**Renaming the requirement, as the MEMORY bullet demands.** The bullet says that if C4 cannot move
"more users read the disclosures" as a group, it should name the requirement another way. I think the
xz case and Certificate Transparency together name it. **Neither depended on many readers. Both
depended on one reader and a cheap balance.** Freund was one person. Certificate Transparency runs on
a handful of monitors. Ostrom's principle needs the monitors to *be* the members, not to be
numerous. So the requirement, renamed [MINE]:

> *Any one member can check, the check is cheap enough that one is enough, and an unbalanced change
> is loud to every member the moment one of them looks.*

That trades a claim about scale ("more users read") for a claim about a mechanism ("no change stays
unbalanced once anyone looks"). A small shop can prove the second claim. It cannot prove the first.

**Concern [DOMAIN]:** a balance only catches changes that cross the egress. A change made inside a
member's copy after the check ran is invisible to it.
*Falsifier:* if the first real quiet change a ring meets was made *between* egress points (for
example, a hook that alters files after install), the balance-at-egress design is too narrow. The
check would then have to run at use time, not only at release time.

**Concern [PLATFORM]:** Freund noticed half a second of latency. A balance would have caught the xz
tarball only if someone ran a reproducible build against it.
*Falsifier:* the claim "one reader suffices" is wrong if a ring runs the balance by default and a
quiet change still passes unnoticed for as long as xz's did. The measure is the time from the change
to the first OFF reading. Record it; do not set a threshold in advance.

---

## VII. Patterns the user did not act on (U08)

PREFERENCES.md:30-31 names this *"the highest-value and least-served case in the whole program"*:
*"The log line they skimmed past."* The xz story is the case in miniature. A pattern most people
would have skipped, CPU on SSH logins, was the only thread to a quiet change.

It fits this essay at one point only, and I keep it small. **The balance in VI is a way of noticing
on the member's behalf, and noticing is where help and watching meet.** The line I would draw [MINE]
is that the check notices the *image*, not the *members*. It reports what changed in the system and
whether that change was announced. It never reports who ran what, who deviated, or who skipped a
line. A group that wants the second kind of report is asking for the "report yourself" drift flagged
in III.
*Falsifier:* if any output of the claims check or the balance can be sorted by member, it has
crossed the line.

---

## Coda

He wrote the thesis about a stranger unpacking a tarball of prose, bootstrapping, and cutting out
what they did not want. Today he wrote about peers electing a whole system. The two are the same
sentence at two sizes.

A member keeps what the stranger keeps. That is their copy and their freedom to peel it apart, with
their work and their name intact, and no duty to do the group's work. Leaving makes a fork, and no
override exists. What the group gets in return is not uniformity. It gets **the truth about the
difference**: a cut-down copy that says what it no longer does, and a shared image whose changes
balance against what was announced. That truth is also the only thing the org owes its audience, the
newcomer needs on day one, and the maintainer needs to answer the call.

The thesis's last clause, *"that is proper"*, carries the ethics. The two mechanisms here carry the
engineering: a claims check that objects only to lying, and a balance that makes silence loud.
Neither prevents anything. Both follow *"ACCOUNT CHECKS FIRST, DISCLOSURE ALWAYS."*
(decks/accountability-first.deck.md:2): accountability that makes the act legible, owed to a user who
does not owe us cooperation. The deck puts that user bluntly (degrade-honestly.deck.md:34-35): the
only kind *"who matters"*.

---

## Sources (each is also cited where it is used)

**Tree** (corpus snapshot ``; every quote checked with `grep -n`):
q/PROMPT-2026-07-31-corwin-metalanguage-and-bootstrap.md:34 · decks/degrade-honestly.deck.md:7,17-22,34-39,44-45,55-56,82-85,99,108-111 ·
decks/known-impossible.deck.md:93-94 · decks/disclosure-practice.deck.md:133-135 ·
decks/proof-bearing-sets.deck.md:106-107 · decks/accountability-first.deck.md:2 ·
journal/LENS-2026-07-31-ladder-test.md:87-89 · MEMORY.md:102-107,358-363,559-560,1331-1334,2974-2977 ·
model.md:497-498 · q/TAG/co-elected-words.md:3-6 · q/2026-09-24-users-pick-ceremonies/PROMPT.md:6 ·
analysis/ceremony/PAPER-2026-09-24-users-pick-ceremonies.md:104-107,112-128,148-149,155 ·
d/door/36-his-attribution.part:14-16 · C4.md:266-272 · q/2026-09-26-onward-readiness/PROMPT.md:23,25,27 ·
q/junctures/README.md:12,141 · h/ENHANCE-2026-09-15-registers.md:17 · PREFERENCES.md:30-31 ·
evidence/question-bank-iTNH.tsv:47 (Q30),293 (Q274) · q/2026-09-27-execute-brief/PROMPT.md:13,19 ·
writing/execute-brief/tracks/unwritten.tsv, writing/execute-brief/tracks/tensions-summary.md (the reader's tracks).

**Outside:**
- *What is Free Software?*, GNU Project — https://www.gnu.org/philosophy/free-sw.en.html (freedoms 1 and 3)
- *The Free Software Definition*, Wikipedia — https://en.wikipedia.org/wiki/The_Free_Software_Definition
- *Fork (software development)*, Wikipedia — https://en.wikipedia.org/wiki/Fork_(software_development) (forking without permission; Wheeler's four outcomes; XEmacs)
- *Constitution for the Debian Project* — https://www.debian.org/devel/constitution (§2.1.1 no obligation; §4.1.2 3:1 to amend)
- *Debian Social Contract* — https://www.debian.org/social_contract (clause 3, "We will not hide problems")
- *Art. 20 GDPR, Right to data portability* — https://gdpr-info.eu/art-20-gdpr/
- *Exit, Voice, and Loyalty*, Wikipedia — https://en.wikipedia.org/wiki/Exit,_Voice,_and_Loyalty
- *Elinor Ostrom*, Wikipedia (design principles) — https://en.wikipedia.org/wiki/Elinor_Ostrom
- FTC, *FTC Staff Warns Companies that It Is Illegal to Condition Warranty Coverage on the Use of Specified Parts or Services* (2018-04-10) — https://www.ftc.gov/news-events/news/press-releases/2018/04/ftc-staff-warns-companies-it-illegal-condition-warranty-coverage-use-specified-parts-or-services
- *XZ Utils backdoor*, Wikipedia — https://en.wikipedia.org/wiki/XZ_Utils_backdoor
- *Definitions*, Reproducible Builds — https://reproducible-builds.org/docs/definition/
- *Certificate Transparency*, Wikipedia — https://en.wikipedia.org/wiki/Certificate_Transparency

Sibling works in this round that touch the same ground: writing/elected-image/ (U01, the
field-support image) and writing/rings/ (U03, the puppet and its rings). I did not read them; they
were empty when this was written.

---

LENS · what a member keeps · 2026-09-27
a  my view: the dissenter keeps their copy, their work, their credit and their exit; the group gets the truth about the difference, not uniformity; two mechanisms (the claims check, the balance at egress) make that truth cheap.
b  the view I ascribe Corwin: user freedom first and "that is proper"; he wants peers to self-govern in rings, and he distrusts any mechanism that becomes ceremony or leans on users.
c  their pull on mine: it moved me off "announce every deletion" (it reaches into the member's computer) and toward "only lying is a fault".
d  my pull on theirs: I ask him to accept that "more users read disclosures" should be renamed "one reader and a cheap balance", which changes how the project's goal is stated.
persona / inverse: the support-pod lead says "a picture I can't train on is no picture"; the inverse, the member who left, finds something new: a fork also needs the claims check, to stop claiming the old group's election, so the check serves the leaver as much as the group.
principles reframe: 1. universalism: every member, newcomer and outsider gets the same readable truth, with no special standing needed to run the check. 2. four freedoms: freedoms 0, 1 and 3 are kept whole on the member's copy, and the only duty added is not to lie about it. 3. free software: forking is the dissenter's exit, and C4 names it rather than fights it. 4. community: rings write their own terms and decision rules; C4 supplies the balance, not the verdict.

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.
