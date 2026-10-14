# LENS 2026-10-10 — accessibility first (warm-up GRAIN, member 1 of 4, HEAVY)

The keeper's hypothesis, verbatim (his words tonight, as given in the brief; chapter 1 of the spell wins
any conflict):

> "our overall solution proves seamless access to all the information the user has entrusted as context
> passing before us, so that issues that come and go such as with sandbox or some connector benefit from
> TMTOWTDI and other upstream and original influence I and Bryant bring"

> "GRAMMARY needs work, as do documentation; as we go and at the end just like tests ... If GRAMMARY is
> out of date or confusing the garden isn't correct."

And from the spell's own chapter 1 (`c4/spells/extension/chapters/01-his-words.md`): "accessibility
forward (pref/defaults)", and from his 18:26 rulings: "fix the spelling, this is a point of
accessibility ... absolutely critical to get that right in this context."

**Ask.** Does the hypothesis bear out when the whole scope of the extension (now and later) is looked
at through one chosen way of seeing: **accessibility first**? The scope: A1 Wire and Tavern RECIPES;
A2a socialized preferences, A2b PRINCIPLES / organisation / Terms of Service read first, A2c the tone
dial; A3 one question at a time with the 17% bar; Q1 to Q5; usage capture; token economy; seamless
context access; the persona net; the seating act.

**Method.** Three readers stand at the door, and every board is read by all three:

- **R1, a screen-reader user.** Hears the text in a line, one word after another. Tables, symbols and
  short codes are spoken letter by letter. Cannot see layout, colour or a picture.
- **R2, a dyslexic reader.** Sees the page, but lookalike letters (1 and l, 0 and O), two spellings of
  one word, and long sentences cost them most.
- **R3, a newcomer to all our terms.** Knows computers in general, none of our words.

Each board (one per measure) has: SENSE (what the measure is), CANON (what we already hold), PROBE (a
check a stranger can replay), READING (worked on a real case from tonight's studies), STATUS
(instrumented / gestured / absent). Then the two piles: OBSERVED (with its source or command) and
JUDGED (tagged [HIS] his own stated rule, [DOMAIN] true of accessibility work in general, [SKILL] how
a skill or the plugin is written, [PLATFORM] the Cowork mounts and app, [MINE] my guess, never blocks).
Every concern carries a falsifier: the one check that would show it wrong.

Short paths: `S1`..`S5c` = the study files in `c4/spells/extension/runs/2026-10-10/study/`;
`AS/` = `AS4CE0001/`; `SP/` = `c4/spells/extension/`.

---

## Words in plain terms (for R3, before anything else)

- **GRAMMARY** — the shop's word list, `AS/GRAMMARY.md`. A made word (grammar + glossary), not a
  misspelling of "grammar".
- **garden** — the shop's set of skills and the tools around them.
- **skill** — a folder with a `SKILL.md` that tells an assistant how to do one kind of work.
- **plugin / extension** — the bundle (named vibrobeast) that carries the skills and six small servers.
- **preference ("pref")** — a saved setting; `pref_list` shows them, `pref_set` changes one.
- **Wire** — a public relay between gardens, reached by a web name (DNS) over an encrypted link (TLS).
- **Tavern** — Bryant's private room for people and agents, reached over a private network (VPN) by
  number (IP address).
- **RECIPE** — one pickable card: its name, what it needs, what it touches, and how to undo it.
- **persona** — a written character sheet for a voice; its **inverse** is what that voice must never
  turn into.
- **seat / seating** — marking a folder with small files that say what it is and who may do what there
  (`.gate` = the access sign-post; `INDEX.md` = the map).
- **GRAIN** — a team of 4 helpers; GREAT is 9, GRAND is 17 (the house numbers).
- **HEAVY** — his tag for "try hard; lean back against shortcuts where that gives a better result".
- **falsifier** — the check that would show a claim wrong.
- **prove-red** — making a test fail on purpose, to show it can fail.
- **tokens** — the units a language model reads and writes; the plugin counts them because they cost
  money and energy.
- **rung** — one step on build-loop's ladder of checks (LADDER is the access step).
- **one path over** — a table's column names kept in a twin file whose path is the table's path with
  `d/` in front (`c4/m/t` has its names in `c4/d/m/t`).
- **byte-exact** — the copy has the same bytes as the original, checked by a hash (sha256).
- **confidence (as in "17%")** — how sure we are of a guess, from 0 to 100%; the 17% is our confidence
  that a second question could be skipped.
- **Genesis** — the name of the Tavern room on this machine (from its `config.json`).

---

## Board 1 — Words: GRAMMARY and spelling

**SENSE.** A word list a newcomer can trust, and one spelling per word, so reading, searching and
listening all land on the same thing.

**CANON.** His rule above; `GRAMMARY.md` itself; `labels.tsv`; the healed-spelling rule in his 18:26
rulings ("Ask yourself if the answer makes any sense as a new term of art ..."); the reformat-session
rule that downstream copies correct his spelling and list each fix (S2 A4).

**PROBE.** `git log -1 -- GRAMMARY.md`; `grep -c` of each word the studies use most against
GRAMMARY.md; `grep -rhoi 'optimi[sz]er\|licen[cs]e\|organi[sz]ation\w*' SP/chapters | sort | uniq -c`.

**OBSERVED.**
- O1.1 GRAMMARY was last changed 2026-07-09, commit e2abb56 (S2 B1). Its own line 4 says
  "**Initially very large on purpose** — it will need `tar.gz`" and it is 114 lines (S2 B5.1).
- O1.2 Words with no GRAMMARY entry, used in many files: prove-red 109 files, edition 94, falsifier 72,
  persona 68, seat 54, Wire 45, door 35, spell 26, soft skill 26 (S2 B3). `grep -n -i grain
  AS/GRAMMARY.md` finds nothing; HEAVY is in 0 tree files (S2 B3).
- O1.3 Inside one spell, one line uses two spellings: `SP/chapters/05-build.md:9` has both "optimiser"
  and "optimizer". Across the chapters: "organisational" 1 and "Organizational" 1, "contextualised" 1
  and "contextualized" 1, "licence" 1 and "license" 1 (command above, run today).
- O1.4 Names spelled two ways: "Bridget" 1 and "Bridgit" 13 across the studies and spell files
  (`grep -ohiE 'bridg[ie]t'`, run today); persona gh7 "was gw7" and the file is still
  `PERSONA-gw7.md` (S4 A.0, S2 B4); a folder `paralax-caterpillar-skills-guide...` holds the skill
  `parallax` (S5c A.1); Alfred answers to "Briant" (S1 §1).
- O1.5 `ccspt` is never spelled out in GRAMMARY (S2 B5.9); "H6" means a section of another book
  (S2 B5.3).

**JUDGED.**
- J1.1 [HIS] By his own test the garden is not correct today: GRAMMARY is three months behind and does
  not hold the words R3 meets first. Falsifier: another file defines seat, soft skill, edition, door,
  spell, prove-red, GRAIN and HEAVY, and GRAMMARY's first lines point at it.
- J1.2 [DOMAIN] Two spellings of one word are a search defect before they are a style question: a
  screen-reader user who searches "optimizer" never hears the line that says "optimiser", and a
  dyslexic reader loses confidence that both mean the same. Falsifier: every search tool the shop uses
  (`word_where`, grep in the skills) already folds the two spellings.
- J1.3 [SKILL] The default spelling of a term should be the spelling its own name uses
  (`token-optimizer` → "optimizer"; "license" in GPL/SPDX lines, as the FSF writes it). Prose dialect
  beyond that can be a preference. Falsifier: he rules one dialect for all house prose.
- J1.4 [MINE] GRAMMARY's name itself will be "fixed" to GRAMMAR by spell checkers and by kind readers;
  its first line should say it is a made word. One line, does not block.

**READING.** The spell asks for "RECIPES" where his prompt wrote "RECIPIES" (`SP/SPELL.md` chapter 4
heals it; chapter 1 keeps his word verbatim). That is the healed-spelling rule working as he asked.
**STATUS:** gestured. Healing is done by hand; nothing counts the variants.

---

## Board 2 — Names: short tool codes and lookalike letters

**SENSE.** A name R1 can hear and R2 can tell apart from its neighbours.

**CANON.** The four-character load-bearing anchors are his design (account memory
`c4-load-bearing-character.md`: "4-char immutable anchors"). The house already pairs a code with words
in places ("`bin/se1sn` (SEAT ENTER 1 SESSION NOTE)").

**PROBE.** `grep -ohE '\b[a-z]{2}[0-9][a-z]{2}\b' study/*.md | sort -u`.

**OBSERVED.**
- O2.1 40 distinct codes of that shape in the seven studies, 101 uses (command above, run today): cm1bd,
  cs1gk, dr1pg, ft1mt, gd1ck, hb1ck, pb1ck, pb2br, sw1ng, tp2mt and 30 more.
- O2.2 GRAMMARY lists one marker under two spellings that differ only by letter O and digit 0:
  "`NO4C`/`N04C`" (`AS/GRAMMARY.md:104`).
- O2.3 Most studies gloss a code once ("`c4/bin/pb1ck` ... eleven patterns" S5b A1), some never do
  (`sl1gk`, `ss2gr`, `rl2bp` in S2 A1).

**JUDGED.**
- J2.1 [DOMAIN] A screen reader reads "pb1ck" as "p b one c k". With no words beside it, R1 has a
  string, not a name; with 40 of them, R1 has a code book to learn before reading a page. Falsifier: a
  screen-reader user (Corwin can name one; the Discord review readers may) reads a study aloud and
  understands what each code does without a gloss.
- J2.2 [HIS] Do not rename the codes: the anchors are load-bearing by his design. Ship the tension as a
  feature: **anchor plus gloss.** Every code, first time on a page, is followed by its words in
  brackets: "pb1ck (the pub leak check)". Default rule 1 (both work, so both ship). Falsifier: he rules
  the gloss noisy for his own reading; then it becomes a preference, default on for anyone else.
- J2.3 [DOMAIN] The digit 1 beside a letter l, and 0 beside O, are the classic dyslexia lookalikes.
  `NO4C`/`N04C` is a live case: one marker, two byte strings, so a grep for one misses the other.
  Falsifier: every reader of the marker (the tools that act on it) already accepts both spellings.

**READING.** A first-meeting line for R1, written both ways: "run sw1ng" versus "run sw1ng (the build
loop's pass counter)". The second costs five words and saves a lookup. **STATUS:** gestured.

---

## Board 3 — Tables, symbols and numbers said aloud

**SENSE.** Whatever is handed to a person can be read in a line: a table has a words read-back, a
symbol has a word, a number has a sense.

**CANON.** His preference: "He cannot usefully read TSV ... reads it back in words" (account
preferences). The VIEW form's pair rule: a `.html` has a `.txt` twin "for a reader without a browser"
(`writing-forms` SKILL.md, the pair rule). S1 §7: "one TSV for tools, and one plain-words page that
reads each row back in sentences". S5a step 2: "No TSV pasted at him".

**PROBE.** For each table a skill hands a person, look for its words read-back beside it.

**OBSERVED.**
- O3.1 The proposed shared data frame (S3 §3.2) is headerless TSV with names "one path over"
  (`c4/u/fr` with names in `d/u/fr`). That is two files to read one row, and a file R1 hears as a run
  of tabs.
- O3.2 The tone dial's default is written "(0/0, 0/0)" (`SP/SPELL.md` chapter 4, A2c); what the two
  pairs mean is still the carry-in's one open question (`SP/runs/2026-10-10-NOTE-carry-in.md`).
- O3.3 DRIFT.log separates fields with a middle dot: "`2026-10-04T18:14Z · checkpoint · on-bearing?
  yes ...`" (S3 §3.1).
- O3.4 The question bar is written as a percentage: "17% or less" and "≥ 83%" (`SP/SPELL.md` A3).

**JUDGED.**
- J3.1 [HIS] Every table that reaches a person ships with its words read-back, by default. The house
  already has the rule in three places (CANON); the extension should make it one default, not three
  habits. Falsifier: a table handed to him in tonight's work that already carries a read-back every
  time without being asked.
- J3.2 [DOMAIN] "(0/0, 0/0)" is spoken "zero slash zero comma zero slash zero" and means nothing to
  R3. Whatever the carry-in question settles, the dial's default should also be said in words: "no
  signals yet: middle of the dial, no confidence". Falsifier: he rules the notation is only for the
  record (sheets, logs), never shown to a person.
- J3.3 [MINE] 17% is about one chance in six: one face of a six-sided die. The house already speaks
  dice (persona kits: "1/4 needs a d4"). Saying "about one in six (one die face)" beside "17%" is a
  numeracy aid for R2 and R3. One line, does not block.
- J3.4 [DOMAIN] The middle dot is read as "middle dot" or skipped, depending on the reader. Skipped is
  worse: fields run together. Falsifier: DRIFT.log is never read by a person, only by `dr1pg`.

**READING.** The S2 "Pending to Corwin D1-D5" shape (numbered, common words, each answerable alone)
already reads well aloud (S2 A4). **STATUS:** gestured.

---

## Board 4 — Preferences and their order (A2a, A2b, Q3)

**SENSE.** A person can say once how they read ("plain words", "screen reader", "short"), and every
skill hears it, without editing a file.

**CANON.** His D3: a switch is set by asking Claude, never by editing JSON, "for accessibility" (S2
A4). prior-instruction: instruction > preference > default (S3 §1.3). The spell's A2b: PRINCIPLES,
organisational commitments and Terms of Service are read before any setup.

**PROBE.** `pref_list`; `grep -liE 'accessib|screen.?reader|dyslex' AS/dist/vibrobeast/skills/*/SKILL.md`.

**OBSERVED.**
- O4.1 `pref_set` takes only 14 fixed keys, all server switches and paths; an unknown key is refused,
  and a hand-added unknown row is silently ignored (S3 §1.1, `prefs.py:79,101-103`).
- O4.2 None of the 14 is about reading or access (S3 §1.1 key list).
- O4.3 Only 3 of 66 shipped SKILL.md files mention accessibility (build-loop, color-theory,
  emacs-tashaki; command above, run today). build-loop's LADDER rung reads: "down to scaffold for all
  access we can offer: keyboard, screen reader, reduced motion, contrast, a path that needs no picture"
  (`AS/dist/vibrobeast/skills/build-loop/SKILL.md:157`).
- O4.4 Preferences live in nine stores; four are hand stores or outside the plugin (S3 §1.3). The
  prefs file sits on C: under the home folder, which a session through the linked shell cannot read
  (S3 §3.2).

**JUDGED.**
- J4.1 [SKILL] The managed preference act (A2a) should open with one access question before any other
  setup: "How do you like to read what I hand you: short, plain words, read-back of tables, or as is?"
  It is A3's own first question. Falsifier: the first setup moment in every preference-writing skill
  (S3 §2: soft-skills, nongnu-steward, llama-bridge, tavern, c4) is already about access.
- J4.2 [DOMAIN] Order matters for access too: Terms of Service and PRINCIPLES read first (A2b) must be
  offered in a short plain-words summary with the full text one step away, not pasted whole. A wall of
  terms is where screen-reader users give up. Falsifier: `tp2mt`'s ToS/Privacy pages are already short
  enough to hear in under two minutes.
- J4.3 [SKILL] An access preference has a reader in code only if the plugin reads it. Today's closed
  set (O4.1) refuses it. Either route (S3 §1.2: an open `user.*` namespace, or skills declaring their
  keys) works; the default is one named key, `access.readback` (on), whose reader is "every skill that
  hands a table or a code to a person". Falsifier: `pref_set user.access ...` is accepted today.
- J4.4 [PLATFORM] "Seamless access to entrusted information" fails here for the person: the store that
  decides what the servers do is on a drive the session's shell cannot see (O4.4). Falsifier:
  `pref_list` reports a path under a mounted folder.

**READING.** His D3 (ask, do not edit JSON) is accessibility already shipped; the extension extends a
working rule. **STATUS:** instrumented for switches (R15 refusal is tested); absent for access.

---

## Board 5 — The tone dial (A2c, Q4)

**SENSE.** Length and detail follow the reader's signals; with no signals, a sensible middle.

**CANON.** A2c: one dial from crisp/laconic to detailed/contextualised, at the origin with no signals;
"always guessing in pairs" (Q574). His preferences: concise answers; and "Whistle While You Work" (work
out loud). Those two sit at different ends of the dial and both are his.

**OBSERVED.**
- O5.1 The dial's default shape is still open (carry-in J9 and its one question).
- O5.2 His saved preferences hold both "prefers concise" and "work out loud" (account preferences).

**JUDGED.**
- J5.1 [DOMAIN] **The dial changes length, never the floor.** At every setting, terms are defined on
  first use, codes are glossed, tables are read back. A crisp answer that drops the definition is short
  for the writer and long for R3, who must go and look it up. Falsifier: a crisp reply at the dial's
  short end that keeps every gloss runs longer than the reader can bear (count words before and after
  on three real replies).
- J5.2 [DOMAIN] For R1, crisp is kind: listening is slower than skimming. For R3, detail is kind. So
  the dial is an access setting as much as a tone setting, and its default (the origin) should lean
  toward "say the subject first, then stop" (his rule of 10-05: the work leads with its subject; S2 A4).
  Falsifier: he reads the origin as "detailed" and says so.
- J5.3 [MINE] His two preferences are not a contradiction: concise in the answer, out loud in the work.
  Two dials, not one, may be what "(0/0, 0/0)" means. A guess, offered for the carry-in question.

**STATUS:** absent (not built).

---

## Board 6 — Questions one at a time (A3)

**SENSE.** A person holds one question in mind at a time; a second question waits unless it is very
likely needed.

**CANON.** A3; his ruling: 17% or less confidence the second can be skipped; the log of two-question
frames is the gauge.

**OBSERVED.**
- O6.1 The carry-in asks exactly one question, with lettered choices and a stated default if
  unanswered ("If unanswered, the firing goes ahead on (b) and says so").
- O6.2 S5a's seating act: "Ask one question ... Then, separately, 'Add PMO key X?' Never both at once."

**JUDGED.**
- J6.1 [DOMAIN] This bears out strongly through this lens. One question at a time is a known aid for
  working memory and for screen-reader users, who cannot glance back at question one while answering
  question two. Falsifier: the gauge log shows people answering two-question frames as fast and as
  correctly as single ones.
- J6.2 [SKILL] Default shape for every question that reaches a person: (1) one sentence of context in
  common words; (2) lettered choices, each answerable alone; (3) what happens if unanswered. O6.1 is
  the model. When two questions are framed together, say "two questions" first, so R1 knows how much
  is coming. Falsifier: a question in tonight's hand-backs that follows this shape and still confused
  the reader.

**STATUS:** gestured (the rule is written; the gauge log does not exist yet).

---

## Board 7 — Connectivity RECIPES (A1, Q5)

**SENSE.** A person can pick a connection, know what it will do to their machine, and undo it, without
reading a config file.

**CANON.** S3 §4 recipe table (needs / touches / undo); S5b B3 egress RECIPE; S5c D2 first meeting with
a Tavern.

**OBSERVED.**
- O7.1 Wire joining needs a browser-first 2FA pairing and "keeper's live OTP per mutation"; undo for
  2FA unpairing and bearer revocation is "not stated" (S3 §4).
- O7.2 Tavern is reached by IP; its config already has a name, `tavern_name "Genesis"` (S5c B.3).
- O7.3 Tavern recipes share one shape: preference on, restart, status tool says how to undo; Wire
  recipes do not go through preferences (S3 §4 [MINE]).
- O7.4 `tavern.as` default `claude` would register a second agent beside the existing `claudewin`
  (S5c J-B2).

**JUDGED.**
- J7.1 [DOMAIN] A DNS name is itself an access feature: a name can be heard, said and remembered; an IP
  address is a string of digits R2 will misread. Each Tavern RECIPE should show the room by its name
  ("Genesis") and keep the IP one step away. Falsifier: tavernface already shows the Tavern name in
  `tavern_status`.
- J7.2 [DOMAIN] One-time codes from an authenticator app are a known barrier for some screen-reader and
  motor-impaired users (copying six digits inside a time window). The Wire RECIPE's "needs" line should
  say so plainly and name the timeout. Falsifier: the relay's OTP window is long enough (well over a
  minute) and the code can be pasted, not typed.
- J7.3 [SKILL] An empty undo cell must print as words: "how to undo this is not known yet", never a
  blank. A blank cell is silent to R1. Falsifier: the RECIPE card format already refuses an empty
  cell.
- J7.4 [SKILL] One agent, one name: set `tavern.as` to `claudewin` by default on this machine. Two
  names for one agent is the newcomer's worst puzzle in a room log. Falsifier as S5c J-B2.

**STATUS:** gestured (cards drafted in studies; none built).

---

## Board 8 — Seamless access to entrusted context (the hypothesis itself)

**SENSE.** What the person has entrusted can be reached by the person and by any helper, even when one
road (sandbox, a connector) is down, because there is more than one way to do it (TMTOWTDI).

**CANON.** His hypothesis; his preferences "never expect him to work out or become the expert on how
to give access" and ASK-FOR-iT.

**OBSERVED.**
- O8.1 The only byte-exact road for persona files to Drive is "Corwin dragging the file in"; the Drive
  copy is about one week behind (S4 A.3, CARD 2).
- O8.2 Three Bryant intake places overlap and disagree; "which wire_mcp is current cannot be answered
  from disk" (S5c J-A2).
- O8.3 "pub" names three different folders (S5b B2.5).
- O8.4 The field-comic folder is not connected; an agent would have to pop a dialog (S4 B.0).
- O8.5 The prefs and spans stores sit on C: outside the mounts (S3 §3.2).
- O8.6 The c4 site pages carry `aria-` attributes (12 to 62 each) and 10 of 11 declare a language
  (`grep -oi 'aria-'`, `<html ... lang=`, run today over `c4/site/*.html` and
  `projects/topoforge/*.html`).

**JUDGED.**
- J8.1 [HIS] The hypothesis **bears out for the agent and fails for the person.** With the mounts, an
  agent reaches nearly everything (the seven studies prove it). Without the agent, the person and a
  newcomer meet three "pub"s, three intake places, a drive the shell cannot see, and a mouse-only road
  to Drive. Seamless access is not yet seamless for a human reader. Falsifier: a newcomer, given only
  the INDEX files, finds the current wire_mcp, the current persona sheet and today's preferences in
  three lookups.
- J8.2 [DOMAIN] Drag and drop is a mouse act. A road that only works by dragging shuts out keyboard and
  screen-reader users. Every hand card should offer a keyboard road (an upload button, a copy command)
  or say there is none. Falsifier: Drive's keyboard upload keeps bytes exact (S4 suggests the MERLIN
  proof of 09-24 may have used one; worth re-testing).
- J8.3 [DOMAIN] TMTOWTDI is an access principle when the ways are equal in result and the reader can
  pick the one they can use (keyboard or mouse, words or table, read or listen). The extension should
  name, for each act, at least one way that needs no picture and no mouse (build-loop's LADDER rung,
  O4.3). Falsifier: a build task's QA plan that declines the LADDER rung with a reason that holds.

**STATUS:** partly instrumented (aria in pages); absent as a check.

---

## Board 9 — The persona net (his ruling: the inverse carried by other personas)

**SENSE.** R3 can tell who is speaking and what that voice will not do; the check lives among the
personas, not in a side tool.

**OBSERVED.**
- O9.1 Every sheet with an inverse writes its own; no sheet carries another's (S4 A.0, A.2).
- O9.2 MERLIN is the synthetic control: a builder with "no house lexicon, no signature voice" (S4 A.1).
- O9.3 The byline formula is plain words: "Authored by Mentat (for Corwin; claude-opus-5-5)" (every
  study's last line).

**JUDGED.**
- J9.1 [MINE, unlikely idea U2 below] MERLIN, the persona with no house lexicon, is the newcomer already
  in the cast. By his rule the knowledge that falsifies must be held by a participant: MERLIN holds the
  absence of our words. A term MERLIN's sheet cannot use without a gloss is a term R3 cannot read.
  Falsifier: MERLIN's sheet already uses house terms unglossed (then it is not a clean newcomer).
- J9.2 [DOMAIN] The byline formula reads well aloud and names who wrote for whom: keep it as the
  default (Q2). Falsifier: a screen reader mangles the semicolon-and-model tail; then the model name
  moves to a second line.
- J9.3 [SKILL] The proposed sheet section "Whose inverse I carry" (S4 A.4 step 3) is a plain heading in
  plain words; good for R1, who navigates by headings. Falsifier: none needed; it is a note.

**STATUS:** absent (net not built).

---

## Board 10 — The seating act, usage capture and token economy

**OBSERVED.**
- O10.1 S5a's act: detect, show in words, check copies, propose one grain, ask one question, write on
  yes, never list `.house/` or `.keys/` (S5a §4).
- O10.2 Usage capture: off by default; when on, two counts only (spell chapter 5).
- O10.3 Spans record tokens the caller reports; the server cannot read them (S3 §3.1).

**JUDGED.**
- J10.1 [SKILL] The seating act bears out through this lens as written. Add one default: every
  `INDEX.md` it writes opens with one sentence saying what the folder is for, in common words, before
  any table. That sentence is what R1 hears first. Falsifier: hb1ck (the INDEX layout check) already
  requires an opening sentence.
- J10.2 [DOMAIN] Usage counts should be shown as a sentence ("this session started with about N tokens
  left and used about M"), not a row. Default off is right. Falsifier: no person ever sees the counts.
- J10.3 [MINE] Read-backs and glosses cost tokens. The local model can draft them (his "liberal llama
  use"); the cost moves off the metered side. A test of this is recorded below. Falsifier: the local
  model's read-backs need so much fixing that Claude spends more than it saved.

---

## The DEFAULTS this lens says the extension must ship

Each names which of the spell's three default rules set it (1 = both work, ship both; 2 = one is
clearly more accessible; 3 = technical).

1. **Define on first use, at every dial setting.** Rule 2.
2. **Code plus gloss** on first use of every short tool code; codes are not renamed. Rule 1.
3. **One spelling per term in our prose**, the spelling the thing's own name uses; his verbatim words
   stay as written beside the healed reading. Rule 2.
4. **Every table handed to a person has a words read-back beside it.** Rule 2.
5. **Questions:** one at a time; lettered choices; what happens if unanswered; "two questions" said
   first when two are framed. Rule 2.
6. **RECIPE cards** show a Tavern by its name, say a blank undo in words, and name the OTP window.
   Rule 2.
7. **One access question opens the managed preference act**, saved as one named key with a reader.
   Rule 3 (which namespace route is a technical choice).
8. **A no-mouse, no-picture road** named for every act that touches the person (LADDER rung required in
   every build task's QA plan). Rule 2.
9. **Usage capture off; when on, said in a sentence.** Rule 2.

## Three unlikely ideas (and more)

- **U1. A hearability gauge.** Add a row to countable-gauge's `gauges.tsv` that counts what a screen
  reader spells letter by letter: all-caps words not in GRAMMARY, letter-digit codes with no gloss in
  the next ten words, bare symbols (· → ⇄ ≥). It prints counts, never a verdict. Falsifier: the counts
  on a page do not change when the same page is rewritten with glosses.
- **U2. MERLIN as the standing newcomer** (J9.1): the persona net already has a reader who knows none of
  our words. Falsifier as J9.1.
- **U3. The die face.** Say the question bar as "about one in six (one die face)". Falsifier: he finds
  the dice reading misleading (17% is not exactly 1/6, which is 16.7%; the guess rounds the right way).
- **U4. Spelling aliases as data.** Build an alias list from tonight's cases (paralax → parallax,
  Briant → Bryant, ERATA → ERRATA, gw7 → gh7, Bridget → Bridgit, optimiser → optimizer, N04C → NO4C)
  and feed it to `word_register` / `word_where` so a search finds both spellings. It also gives the
  spell's falsifier "a misspelling was banked as a question" a mechanism. Falsifier: `word_where` on
  "paralax" already returns the parallax skill.
- **U5. The local model as the permanent first reader.** Every new GRAMMARY entry and skill description
  goes to the local model with "what would a newcomer not understand?" before it ships. Tried once
  below.

## Three obvious wins (and more)

- **W1. Bring GRAMMARY up to date:** one plain sentence each for the words in S2 B3 (seat, soft skill,
  edition, door, spell, prove-red, persona sheet, Wire, Tavern, GRAIN, HEAVY, falsifier, carry-in),
  split tree words from book words (S2 J5), and say on line 1 that GRAMMARY is a made word.
- **W2. Heal the spell's own mixed spellings** (O1.3) and the one "Bridget" (O1.4), with the list of
  fixes kept beside the change. Not done here: this run modifies nothing else.
- **W3. Require the LADDER rung** (O4.3) in every build task of chapter 5.
- **W4. Mint README facts from code** (S2 J6), so a newcomer is not told "three servers" when there are
  six.
- **W5. `tavern.as` = claudewin; show "Genesis", not the IP** (J7.1, J7.4).

## Verdict

The hypothesis **bears out in part.** It holds for the agent: with the mounts, entrusted context is
reachable and the studies show it. It holds for the shop's newest rules: one question at a time,
asking instead of editing JSON, no TSV at him, show-in-words seating. These are already access work.
It **fails for the human reader today**: GRAMMARY is three months stale and missing the words a
newcomer meets first; one spell mixes spellings within a line; 40 short codes go unglossed; the dial's
default is written in a notation no one can say aloud; only 3 of 66 skills mention access; and some
roads (Drive by dragging, the prefs store on C:) are open only to a mouse or to the agent. By his own
test the garden is not correct yet, and the nine defaults above are what would make it so.

## The local model's reading (model efficacy record)

What it was given: the ten top findings above, about 2,600 characters, model `gemma4:12b-8k`,
think off, and the ask: "list every word, name, number or idea you would still not understand ...
then name the one change that would help you most".

How the call went: the bridge did not answer for about five minutes (four calls timed out after 60 s,
including `get_stats`, while `ollama_status` answered at once and showed the model loaded). The likely
cause is other GRAIN members' jobs queued ahead on the one GPU (S2 A4: "600 s per call times out jobs
queued behind one GPU"). The fifth call answered. That is a usage datum: four helpers sharing one local
model in the same few minutes block each other, and the plain call has no way to say "queued".

What it said (shortened, its own words in quotes). It could not understand 14 things:
"GRAMMARY: Is this a dictionary, a database, or a specific code library?"; "the garden"; "prove-red:
Is this a typo for 'proven' or a specific technical term?"; Wire / Tavern ("internal tools, external
platforms, or metaphors?"); GRAIN / HEAVY; "tokens" in "token optimizer"; the codes ("These look like
obfuscated IDs"); NO4C / N04C ("codes, hex values, or intentional typos"); "(0/0, 0/0)"; "17% or less
confidence: ... I don't know what 'confidence' is being measured against"; "access rung"; "Genesis:
Is this a server name, a project phase, or a file?"; "one path over"; "byte-exact". The one change it
asked for: "Provide a Glossary of Terms defining 'the garden', 'Tavern', 'Wire', and 'tokens'."

What survived into this file. Six points were new to my draft, and each is now in "Words in plain
terms": **tokens**, **rung**, **one path over**, **byte-exact**, **confidence** (what the 17% is a
confidence *in*), and **Genesis** as the Tavern's room name. Its reading of "prove-red" as a possible
typo is a second witness for J1.4 (a made word reads as a misspelling to a newcomer), and its
"intentional typos?" on NO4C / N04C is a second witness for J2.3. The other seven items were already
covered in the words list or the boards; it saw only the 2,600-character excerpt, not the list.

Did it help (model efficacy): **yes, moderately.** It found six real gaps in about 300 words, with no
false claims about the project. It cost no metered tokens to write and about five minutes of wall time,
almost all of it queueing. It could not judge what was right, only what was unclear, which is exactly
the newcomer's job (U5). Grade [MINE]: worth keeping as the first reader for GRAMMARY entries, run one
at a time, not four at once.

---
Authored by Mentat (for Corwin; claude-opus-5-5).
Copyright (C) 2026 Corwin Brust <corwin@bru.st>.
SPDX-License-Identifier: GPL-3.0-or-later
