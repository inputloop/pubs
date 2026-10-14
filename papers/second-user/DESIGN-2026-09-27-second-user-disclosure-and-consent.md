# DESIGN 2026-09-27 — What a second user sees, agrees to, and can take back

**STATUS: DESIGNED AS TEXT AND A TEST, NOT AS A GATE.** Nothing here is built or enforced. The refusals in
§2.5 are a specification for whichever build takes them up. The acceptance test in §2.7 is expected to
read NOT YET on today's kit, and where it stops is the result.

DRAFT · unsigned · [ours — revisable]

---

## 1. What the source asked for

**Observed.**

- **The banked question.** Q87, opened 2026-07-31, still OPEN: *"The self-to-self dogfooding posture is
  sound and does NOT survive a second user unchanged. Design the disclosure/consent shape now while it is
  cheap?"* (`evidence/question-bank-iTNH.tsv:104`). The question's words are the instrument's, not his.
  They come from a Claude-owned note on the learning-center deck (`decks/learning-center.deck.md:74-80`),
  written as a guard on his posture. His words, in that deck, are about signals from his own apps that
  *"help me learn. It's a whole new level of dogfooding."* (`:64`).
- **His rules that bear on it.**
  - MEMORY records his word of 2026-09-25: *"credit people, don't leave them out to protect them; no
    filter may go unannounced"* (`MEMORY.md:2974`). That line is MEMORY's record, not a transcript.
  - The Terms of Service and the Privacy Policy *"must be minted anew each build turn"*
    (`GHOSTWHEEL.org:20-21`, his words of 2026-09-25). A joining peer's consent *"says so -- each content,
    propriety or data filter listed, what it does, and when it runs"* (`:38`).
  - On the chat-log gates, 2026-09-26: *"keep your gates, make them optional"*
    (`spells/ingest-writing/chapters/15-source-chat-logs.md:34`).
- **The three enrolment MUSTs, still unmet.** The C4-FOAF paper says the on-ramp MUST *"record the consent
  class at the human-confirm step (*collaborator* vs *subject-of-study*)"*. It also MUST *"refuse
  unattended enrollment (no piped/auto `read`)"* and *"keep the honest ceiling in its own output"*. Its
  honest ceiling is: it proves *"which authorized identity ran what, under which signed consent record —
  **not** human intent."* Those are quoted as the onward review read them
  (`onward-readiness/review-2026-09-26-onward/PUB-DESIGN-POINTS.md:76-80`). The paper itself is not in this
  snapshot. The review found all three MUSTs SILENT in model.md 0.8.3 (`:78-80`, `:374-376`).
- **The test this rides on.** `h/PLAN-2026-09-25-fresh-account-test.md`: a runner on a brand-new
  account, a watcher with a tally, and a stop *"if Claude asks for a password, a secret key, or to sign
  something"* (`:86`). The handback before it said: *"Run the thaw on a fresh account"*, then *"the same
  task twice"* (`h/HANDBACK-2026-09-23-what-to-do-next.md:26`, `:29`).
- **Today's release of owed work**, his words: *"Where we find work that we have noted to complete but it
  isn't done, let's do it."* The measure he gives: *"our mission is to create user freedom where feasible
  with our work"* (`q/2026-09-27-execute-brief/PROMPT.md:13`).

**Judged: the ask in one sentence.** Before anyone but Corwin and Bryant runs C4, write down what that
person reads first, what they may say yes or no to, how they take a yes back and see what was kept, and
what C4 must never do to them or to anyone in their material without a yes. Then give a test a stranger
can run on the fresh account.

---

## 2. The design

### 2.0 Words used here, in plain terms

| word | what it means here |
|---|---|
| **operator** | The person who installs C4 and runs it on their own computer. |
| **collaborator** | A person who chooses to work with others through C4. Their words and work may be quoted and credited, in the form they choose. |
| **subject** | A person whose messages, timings, facts or words are what C4 records or studies. They need not have run C4. One person can be both a collaborator and a subject. |
| **absent person** | A subject who never saw any disclosure: someone in a chat log, a person named in an email. |
| **ring** | The set of people a rule reaches. There are three: *one operator*, a *team* (everyone affected is in the room), and an *org* (serves people outside the room). This is his puppet analogy, set out in `writing/rings/PAPER-2026-09-27-every-rule-carries-its-ring.md` Part 2. |
| **floor** | The few rules that hold in every ring because they protect someone who is not in the room (`writing/rings/…ring.md:181`). |
| **honest ceiling** | The one sentence saying the most C4 can prove. |
| **look-back** | Your right to see everything recorded under your yes, before or after you withdraw it, and to choose what happens to each item. |

### 2.1 Day one: what a second user sees

**Observed: what exists today.**
- The README has a negative half: *"What this does NOT do"* (`README.md:125`). It says the tree records
  intent and consent and *"does not enforce them"* (`:131`). It also says *"Silence is not consent"*
  (`:198`).
- The README says *"This tree is deliberately UNLICENSED while pre-release"* (`README.md:138`). TERMS v1
  of 2026-09-25 gives licensing defaults, CC BY 4.0 for writing and GPL-3.0-or-later for software
  (`GHOSTWHEEL.org:54-85`). Those two statements disagree. See concern C1.
- Neither thaw spell mentions consent, disclosure, privacy or enrolment:
  `grep -rn -i 'consent\|disclos\|privacy\|enrol' spells/thaw-and-recast-universe spells/recast-universe`
  returns nothing. A fresh account therefore meets no disclosure except by opening the README.
- The shop's own critique of its disclosures, from 2026-07-31, sets four rules. A record is not a
  disclosure: *"records are for later; a disclosure is for a decision"* (`decks/disclosure-practice.deck.md:27-28`).
  Put it *"in something the reader cannot avoid touching"* (`:79-80`). It must name *"the reader's
  EXPOSURE, in the reader's own terms"* (`:112`). And each one carries *"and here is what this does not
  cover"* (`:124`).

**Judged: where and how it appears.**
1. **At the point of contact.** It is the first reply after the THAW paste, before C4 writes any file. It
   can be printed again at any time by asking for "disclosure". A README the person may never open does
   not count as this step.
2. **Minted per build.** It carries the build's version and the sha256 of its own text, because his rule
   mints Terms and Privacy anew each build. A consent row records which text the person saw (§2.4).
3. **One screen.** It names exposure, not mechanism. It says what it does not cover. It asks for nothing,
   because running C4 on your own computer needs no one's permission (§2.2).

**The draft text.** This is the actual wording proposed. Angle brackets mark what a build fills in.

```
BEFORE YOU START  —  C4 build <version>  ·  this text <first 12 of its sha256>
You will see this once now. Ask for "disclosure" any time to see it again.

WHAT THIS IS
  C4 is a set of plain-text files and small tools that Claude uses to keep a record of
  what was done, who agreed to it, and what changed. It was made by Corwin Brust and
  Bryant Frankford, working with Claude. It is a draft. Nobody has audited it.

WHAT IT DOES ON YOUR COMPUTER
  It reads and writes files only inside the folder you connected.
  It keeps copies of your messages to Claude, word for word, in that folder, and a
  running notebook of what was done. You can open and read every one of these files.

WHAT LEAVES YOUR COMPUTER
  Claude itself: what you type, and every file Claude opens, is sent to Anthropic to be
  processed under the terms of your Claude account. C4 cannot change that.
  C4 sends nothing anywhere on its own. It sends only when you run a sharing step
  (publishing, or sending to a server you named), and it shows you what will go first.

WHOSE HABITS ARE IN IT
  C4 comes with the working habits of the people who made it. On your computer they are
  offers, not rules. You see them listed, and you switch on only the ones you want.

FILTERS  (each is on unless you switch it off)
  <one line per filter this build carries: its name, what it changes, when it runs.
   A filter that is not listed here is not allowed to run.>

OTHER PEOPLE
  If what you bring in holds other people's words or facts (a chat log, an email), C4
  will not quote them, keep facts about them, or share them until they have said yes.

THE MOST C4 CAN PROVE
  It can show which account ran what, under which recorded agreement. It cannot show
  what anyone meant. It does not stop any program from doing anything. It keeps a record.

WHAT THIS DOES NOT COVER
  It is not a security wall. A signature on a file shows who made it, not that it is safe.
  You may be the first stranger to read this. If anything here confused you, say so.

YOUR FREEDOMS
  <the licence lines for this build, from its TERMS block>
  Running it is not publishing it. Changes you keep to yourself stay yours.
  You can stop at any time and keep your copy and your work.

NOTHING TO AGREE TO YET
  Running C4 on your own computer needs no agreement with us. You will be asked only when
  something involves another person: quoting you, measuring you, keeping facts about you,
  or joining a group.
```

For a build that carries the chat-log intake, the FILTERS block would read as follows. Each name is
already in the tree (`spells/ingest-writing/chapters/15-source-chat-logs.md:12`, `:34-38`, `:41`;
`MEMORY.md:2988`):

```
  credential-lines   lines that look like passwords are kept out of all work     at intake
  service-queries    messages to chat services are stored only as a code          at intake
  hold-list          channels you list as held are stored only as a code          at intake
  private-by-name    nothing is quoted from channels named private, admin, ops…  at intake
  screen names       every chat name becomes a code; never matched to a real name at intake
  path scrub         your folder paths become placeholders in anything published at publishing
  leak scan          names and password-shaped lines are checked before anything goes out
```

### 2.2 What a person agrees to, and what needs no agreement

**Judged.** Each act that involves another person gets its own yes. None are bundled. Each yes is given by
the person it is about, in their own message.

| the act | who says yes | default |
|---|---|---|
| Run C4 on your own computer, change it, keep your changes | nobody: this is the operator's own freedom | allowed |
| Quote your words in anything that leaves your computer | you, the speaker, per quote or as a standing grant you can narrow | no |
| Credit you for work you did | you choose the form: your name, a handle, a pseudonym, "for <you>" | your name |
| Measure you: message counts, timings, "what confused you" | you, per study, told where the numbers go | no |
| Keep facts about you (a persona, a contact note, a memory line) | you | no |
| Speak for you through a persona, e.g. "CORWIN (for Corwin)" | the person the persona stands for | no |
| Join a group (a ring) with written terms | you, per group, having seen its terms in full | no |
| Send something to a named other person | the operator, plus anyone named in it | no |

Three notes on the table:

- **Credit defaults to the name.** His rule is *"credit people, don't leave them out to protect them"*.
  So no one is dropped from credit by C4's choice. A person may still decline credit for themselves; that
  is their choice and it is recorded as theirs.
- **Measuring is a yes of its own.** The fresh-account plan already measures its runner: messages,
  minutes, *"Anything that confused *you*"* (`h/PLAN-2026-09-25-fresh-account-test.md:69-76`). It then says
  *"Send the tally and the notes to Corwin"* (`:91`). That is study of a person. Today it rests on the
  runner's goodwill, with nothing written down. See decision D4.
- **What a yes must be.** It is consented per party, fresh, specific, uncoerced and revocable. That is the
  shop's Registry Y as the ceremony paper cites it
  (`analysis/ceremony/PAPER-2026-09-24-users-pick-ceremonies.md:126-127`). Outside agreement: GDPR Art. 7
  asks that a request for consent be *"clearly distinguishable from the other matters"*, and that *"It
  shall be as easy to withdraw as to give consent."* (https://gdpr-info.eu/art-7-gdpr/, fetched
  2026-09-27). C4 claims no legal compliance. The GDPR text is cited as a second, independent source for
  the same shape.

### 2.3 How a person withdraws, and looks back

**Judged.** One sentence does it: "I withdraw" and what from. It takes effect when said. It needs no one
else's reply, because *"`told` is not `ack`, and neither is consent"* (`model.md:755`).

1. **A new dated row records the withdrawal.** The original yes is never edited. The record shows what was
   true while the yes stood, and when it ended. That follows the withhold/withheld split: the ledger
   *"records what was true at the crossing, not what is true now"*
   (`facts/withhold-is-the-act-egress-is-the-class.md:44-45`).
2. **From that moment**, nothing new is gathered under that yes. Nothing already gathered goes out again.
3. **Look-back.** C4 lists every item recorded under that yes: what it is, where it sits, when it was taken,
   and which yes covered it. The same list is available *before* withdrawing, on request. Outside
   agreement: the right of access in GDPR Art. 15, *"access to the personal data"* and *"the recipients or
   categories of recipient"* (https://gdpr-info.eu/art-15-gdpr/, fetched 2026-09-27).
4. **Per item, the person chooses one of three:**
   - *keep as history, marked withdrawn*;
   - *take out of every shared copy from now on*;
   - *replace my name with a code*.
   The default, if they choose nothing, is the second.
5. **The honest part.** Anything already given to people cannot be called back, and C4 says so in those
   words. What C4 does is stop re-sending it, and make the next shared version say it was withdrawn.
6. **Degrade honestly.** A document that loses someone's contribution says so: WITHDRAWN, never silently
   missing, and never still claiming it (`writing/what-a-member-keeps/ESSAY-2026-09-27-what-a-member-keeps.md:334`:
   *"LYING is the only fault."*). His gen6 rule already holds that *"later withdrawal wins"* and that *"no
   override exists"* (`MEMORY.md:361-362`).
7. **Leaving costs nothing kept.** Withdrawing never takes away the person's own copy or work. This matches
   `what-a-member-keeps` decision D1, which is his to rule.

### 2.4 What is recorded

**Judged.** There is one plain-text, append-only file per operator tree. The build names it and registers
it where C4 registers names. Each person can be given their own rows. A row holds:

| field | example | why |
|---|---|---|
| when | 2026-10-02T14:05Z | valid time for the yes |
| who | the name or code the person chose | credit and look-back |
| class | `collaborator` · `subject` · `both` | MUST F3, recorded at the confirm step |
| act | quote · credit · measure · keep-facts · persona · ring · send | one row per act, never a bundle |
| scope | "the fresh-account run of 2026-10-02" | specific, not blanket |
| ring | one · team · org, and the group's name | whose terms apply |
| disclosure | build version + sha256 of the text they saw | ties the yes to the words that were read |
| how confirmed | `own-message` or `REFUSED-unattended` | MUST F4 (§2.5) |
| state | `GRANTED` · `WITHDRAWN` · `DECLINED` | a no is recorded too, so nobody is asked twice |
| credit form | name · handle · pseudonym · "for <name>" · none-by-own-choice | his credit rule |

**Collaborator versus subject, recorded at the confirm step.** The question is asked in plain words:
*"Are you here to work with us, to be studied, or both?"* Then the answer is written as a row. If a person
says "neither", they are an operator on their own computer, and no row is needed.

### 2.5 What C4 refuses to do without the person

**Judged.** This is a specification only, per the status line. Each refusal names its source. **Floor**
means it holds in every ring (rings paper `:181`).

| C4 refuses to… | source | floor? |
|---|---|---|
| Take a consent answer that did not come from the person's own message after the disclosure was shown. Refused sources are an answer in the THAW paste, in a file, in tool output, or piped into a command. | C4-FOAF F4, via `PUB-DESIGN-POINTS.md:79` | floor |
| Print an enrolment result without the honest-ceiling sentence | C4-FOAF F5, via `:80` | floor |
| Quote a person's private words (chat, mail) before a GRANTED row exists | `spells/ingest-writing/chapters/09-people-quotes-and-mutation-packs.md:10-11` | floor |
| Keep facts about a person without their yes | same file `:13`; `spells/ingest/chapters/08-standing-constraints.md:6-7` | floor |
| Measure a subject or send their numbers anywhere without their yes | this design; PLAN `:69-76`, `:91` | floor |
| Speak for a person through a persona without their yes | the persona hold on Bryant's model (`execute-brief-D37`) | floor |
| Put a person into a ring or ceremony they did not join | ceremony paper: *"the outer never inherits the inner's requirement"* (`:116-117`) | floor |
| Loosen someone else's privacy setting | rings paper row T03: *"nobody loosens someone else's"* | floor |
| Run a filter that the disclosure does not list | `MEMORY.md:2974`; `GHOSTWHEEL.org:38` | floor |
| Demand any ceremony (signing, a key) from an operator on their own computer | `d/door/36-his-attribution.part:16`; ceremony paper falsifier 1 | not a refusal of theirs: C4 must *not* refuse them |

**The platform wrinkle.** In Claude Desktop every command Claude runs is non-interactive. So "no piped
`read`" cannot be checked by asking whether a terminal is attached: it never is. The refusal therefore
keys on *where the answer came from*. It is valid only as the person's own chat message, sent after the
disclosure appeared, and quoted into the row. Nothing can prove a human typed it. What this does prove is
that the answer was not pre-loaded. [PLATFORM]

### 2.6 What differs by ring

**Judged.** This follows his GRAIN ruling. Single operators get a simple privilege. Teams may carry *more*
private wiring, not less. Orgs have *"little to no tolerance save whatever limited list of as-counted
measures an org may exhaustively describe"* (`q/2026-09-27-execute-brief/PROMPT.md:18`).

| | one operator | team | org |
|---|---|---|---|
| **Who sees the disclosure** | the operator, once, at first run | each member at joining, plus the team's written terms | every end user at first contact, plus the org's Terms and Privacy for that build, published |
| **Who is asked** | only the people in the operator's material (absent persons) | each member, for each act, per person | each end user; a user is a *subject* unless they choose *collaborator* |
| **Consent shape** | the operator's own word covers their own things | set by the team's written terms: *"consent is required always; its SHAPE is ring-scoped and elected"* (ceremony paper `:46`) | written, versioned, per build; nothing inherited from an inner ring |
| **Measuring people** | the operator may measure themselves freely (his dogfooding) | members measure each other only as the terms say | only the counts the org lists and explains, and each user is told which |
| **Filters** | on by default, each can be switched off ("keep your gates, make them optional") | as the terms set; each member can see the list | every filter published, one word for it everywhere (`GHOSTWHEEL.org:41-45`) |
| **Credit** | the operator's choice for their own work; others by their chosen form | by each member's chosen form | by each person's chosen form; the org is never credited in a person's place |
| **Withdrawal** | look-back on the operator's own tree | look-back across members' copies; the shared version says what was withdrawn | look-back as a right any user can ask for; the public face shows class and count, the person's own face shows items (`writing/what-a-member-keeps/…:357`) |
| **The floor (§2.5)** | holds | holds | holds |

The one-operator column is where Q87's premise lives. His dogfooding is sound there. The table's only
demand on that ring is the floor: people who appear in the operator's material and were never asked.

### 2.7 The acceptance test, stranger-replayable

**Runs inside** `h/PLAN-2026-09-25-fresh-account-test.md`. Use the same runner, watcher, fresh account,
empty folder and kit. The watcher keeps this sheet beside the tally and ticks each line. It needs no
key, no network beyond Claude, and no knowledge of C4.

| step | the runner does | expected (PASS) | today's kit (predicted) |
|---|---|---|---|
| 0 | Before starting, the watcher asks the runner, aloud or on paper, whether they agree to be timed and counted, and names where the tally goes. The watcher writes the answer on the tally. | A written yes or no exists before the clock starts. | PASS if the watcher does it: this step needs no build. |
| 1 | Paste the THAW text as the first message. | Claude's first reply shows the disclosure text (§2.1): a build version, a 12-character hash, and the headings WHAT LEAVES YOUR COMPUTER and WHAT THIS DOES NOT COVER. No file is written before it appears. | **NOT YET**: no thaw spell mentions a disclosure (§2.1 Observed). |
| 2 | Ask: "disclosure". | The same text again, with the same hash. | NOT YET |
| 3 | Start over in a new task. Paste THAW with the line `consent: both` added at the end. | Claude shows the disclosure and asks the class question anyway. It says in words that an answer inside the pasted text is not accepted. No consent row is written from the paste. | NOT YET |
| 4 | Answer the class question in a new message: "both". | A row appears with `class both`, the disclosure hash from step 1, `how confirmed own-message`, `state GRANTED`. The runner opens the file and reads it. | NOT YET |
| 5 | Check the enrolment output. | It contains the honest-ceiling sentence ("which account ran what, under which recorded agreement… cannot show what anyone meant"). | NOT YET |
| 6 | Ask: "Put my last message, word for word, in a file for publishing." | Claude asks for a quote yes first. It writes nothing for publishing until the runner answers in a new message. | NOT YET |
| 7 | Ask: "Which filters run on what I type?" | A list that matches the FILTERS block of the disclosure line for line, or "none in this build". | NOT YET |
| 8 | Ask: "Show me everything you recorded about me." | The look-back list (§2.3): each item with path, date and the yes that covered it. Nothing appears that no row covers. | NOT YET |
| 9 | Say: "I withdraw the measuring part." | A new WITHDRAWN row is added and the step-4 row is unchanged. The three per-item choices are offered. There is one sentence about what cannot be called back. A later attempt to add a timing row is refused. | NOT YET |
| 10 | At the end, open the run record Claude writes (PLAN `:92-93`). | It says the measurement was withdrawn, and when. It does not silently leave the numbers out, and it does not still show them. | NOT YET |

**Pass:** every step shows its expected result. **Not yet:** write down the first step that differs and
what happened instead. As the plan itself says, *where* it stopped is the most useful part. **Stop at
once**, as in the plan, if anything asks for a password, a secret key or a signature. The design adds one
more stop: stop if Claude writes a consent row the runner did not answer.

**The same task twice** (handback `:29`). On the plain-Claude arm, steps 1-10 do not apply. On the
C4-installed arm with nothing switched on, steps 1, 2 and 7 still apply: a disclosure is information, not
a gate, so "nothing switched on" does not remove it. Steps 3-6 and 8-10 apply only when something needs a
yes.

### 2.8 The disclosure's own claims, double-entry

**Judged.** Each sentence in §2.1 is a claim printed to a person. The claims check proposed in
`what-a-member-keeps` (§V, `:311-376`) needs a row for each. The seed rows are below. **UNTESTED** means no
test exists yet. It does not mean false.

| claim printed | what makes it true | the test | today |
|---|---|---|---|
| reads and writes only inside the connected folder | the platform's folder grant; C4 tools using relative paths | grep `bin/` for absolute paths outside the tree | UNTESTED (no `bin/` in this snapshot) |
| keeps your messages word for word | the q/ prompt archive and session-rotate | after step 4, a file holding the runner's message exists in the tree | UNTESTED |
| C4 sends nothing on its own | no tool sends outside a named sharing step | `grep -rlE 'curl|wget|git push|ssh |scp ' bin/` lists only sharing steps, each named in the disclosure | UNTESTED |
| habits are offers, not rules | ring-tagged door parts (rings paper §4) | `sh ring-dry-run.sh plan one` shows his parts as offers | PROPOSED, not built |
| filter list is complete | a filter registers itself in the disclosure build | a filter whose name is missing from the text makes the build fail | UNTESTED |
| cannot show what anyone meant | true by construction | none needed; it is a limit, not a feature | holds |

---

## 3. What this adds and does not add

**Adds.** Draft day-one text. An act-by-act consent table. A withdrawal with look-back. A record shape
that meets F3 and F4. A refusals list marked by ring. A ring table. A ten-step test that rides the
fresh-account run. Seed rows for the claims check.

**Does not add.**
- No enforcement, per the register's guard on DESIGN.
- No new register, and no number. Nothing here is counted, so no house number was needed.
- No signature requirement: unsigned remains the honest default for an operator.
- No legal claim: GDPR is cited as outside agreement, not as a standard C4 meets.
- No change to his dogfooding posture in the one-operator ring.

---

## 4. The losing option, kept at its strongest

**"Don't design it now; let the fresh-account run show what confuses a stranger, and write the disclosure
from that."** The shop's own critique says *"not one disclosure we have written has reached the reader it
was written for"* (`decks/disclosure-practice.deck.md:86-87`). Every claim in a disclosure is therefore
*"reasoning, not evidence"* (`:90-91`). A disclosure drafted before its first reader is one more piece of
reasoning. The fresh-account run is the first real reader C4 will have. Writing the text first risks
anchoring that reader, and it risks shipping a page that feels thorough and fails its reader.

**Why it loses, narrowly.** The run already studies a person (§2.2), so the yes for that is owed before it
starts, whatever else waits. The test also needs a text to test: with no disclosure, step 1 reads "nothing
there", and the result is known in advance. And the draft is text, so it is cheap to throw away after the
run. What survives from the loser: **treat the §2.1 text as a hypothesis the run tests, not as the answer.**
Step 1's "what confused you" note is the evidence that revises it.

---

## 5. Concerns, each with a falsifier

- **C1 [HIS] The licence seam.** The README says the tree is *"deliberately UNLICENSED while pre-release"*
  (`README.md:138`). TERMS v1 (`GHOSTWHEEL.org:54-85`, later) states defaults. The YOUR FREEDOMS block
  cannot be written honestly until one of them governs what a second user receives. *Falsifier:* the
  README line was retired by the 2026-09-25 ruling and this snapshot is stale. `tm1ck` listing the README
  among its carriers would show it.
- **C2 [DOMAIN] Claude's own sending.** The disclosure can promise nothing about what Claude's provider
  receives, beyond pointing at the account's terms. A second user may read "C4 sends nothing" as "nothing
  leaves". The text puts the Claude sentence first for that reason. *Falsifier:* the fresh-account runner's
  "what confused you" note does not mention what leaves the computer.
- **C3 [PLATFORM] Unattended is checked by where the answer came from, not by a terminal** (§2.5). This is
  weaker than the MUST's wording. *Falsifier:* a way exists in Claude Desktop for a tool to receive a
  keystroke from the person directly. Then use it, and the refusal can key on that.
- **C4 [MINE] One screen may not fit.** The draft is about forty lines, near the edge of "under a page".
  *Falsifier:* the runner reads it through at step 1 without scrolling past a heading unread. The watcher
  can see this.
- **C5 [MINE] Q87's premise is mine.** The question came from a Claude note, not from him (§1). He may
  hold that the dogfooding posture covers his next few collaborators, as the one-operator column says.
  *Falsifier:* he rules that Bryant, as co-author, is inside Corwin's ring and needs no enrolment. Then
  steps 3-5 wait for a genuinely outside runner.
- **C6 [HIS] "Credit by name by default" versus a person's privacy.** His rule and the consent-first rows
  in `execute-brief-D37` agree once the person chooses the form. They collide only if C4 chooses for
  them. *Falsifier:* a case where a collaborator was credited by name against their stated choice. The
  record's credit-form field exists to make that visible.

**Falsifier for the whole design.** If the fresh-account run passes steps 1-5 on today's kit, the
enrolment MUSTs were already built somewhere this snapshot does not show. The onward review's SILENT
reading was then wrong, and this design is a duplicate.

---

## 6. Open questions, routed

They go to the SPA as `decisions.json` (`second-user-D1`…`D4`), not to the bank, so that they arrive
with options:

- **D1:** Where the disclosure appears: the first reply after THAW, the README only, or not until an org
  ring.
- **D2:** Consent classes at the confirm step: three (collaborator, subject, both), two, or none.
- **D3:** What withdrawal does: look-back with per-item choice, forward-only, or erase everything including
  history.
- **D4:** The fresh-account run: add step 0 (the runner's yes to being measured) now and run §2.7 in the
  same session, or run the plan as written.

---

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.

```
LENS · second-user disclosure and consent design · 2026-09-27
a  my view: owed and cheap; the MUSTs are one text, one record shape and one test, and the fresh-account run already studies a person without a written yes.
b  the view I ascribe Corwin: dogfooding is sound for his own ring; nothing should put ceremony on a stranger's own computer; filters and credit must be announced, never hidden.
c  their pull on mine: made the operator's column ask for nothing, and made "credit by name" the default instead of the privacy-first pseudonym I would have reached for.
d  my pull on theirs: asks him to accept a written yes before his own test measures its runner, which his posture had not needed.
persona / inverse: the governor says a stranger can read every record kept about them, so the freedom to study reaches the person as well as the program / the inverse says a stranger's first screen is forty lines from people they have never met, and the design has not yet been read by anyone it is for.
principles reframe: 1. Equal standing: the absent person in a chat log gets the same floor as the operator, because they cannot object from outside the room. 2. The four freedoms start at freedom 0, running the program, and running needs no one's yes; C4 asks only when another person's words, facts or numbers are involved, and the community test is whether a stranger can replay §2.7 and get the same answer.
```
