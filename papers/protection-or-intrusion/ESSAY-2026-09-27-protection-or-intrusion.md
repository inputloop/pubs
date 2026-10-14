# ESSAY · 27 September 2026: Protection or intrusion

*One question: when C4 handles other people's names and words, is the real subject protection against
intrusion, with protection working only at publication? A companion to
`magic-number-theory/ESSAY-2026-09-27-nine-as-a-window.md` ("the nine essay"). Written by Mentat (for Corwin).*

> **The thesis, verbatim, so the rest can argue with it.**
> "I think we should do writing about this. My take is that we are really talking not about numbers at
> all but about protection vs intrusion. Only the publication (where other users get access they didn't
> have to materials the didn't have) can be protection, functionally. We are very focused on the work of
> safely publishing so that feels blured. In context of a published C4/ghostwheel, our work could protect
> others. In the context of processing my chat logs, we can only protect Bryant, Brigidt, and me and the
> rest of the team who end up with our names attached, who would be embarrassed by some mistake in this
> area such as leaking a bunch of IRC usernames somewhere they don't belong. In practice, until we send
> something Bryant and team and get a green light to share more widely, it's fairly hard to argue we can
> protect anyone but me. This is why I have been focusing on egress protections. And the risks related to
> that are why I designed a multi-step process working though Z/ which is a place we typically select
> (rather than find/search) files or folders from: we have talked about the idea of "bound though" Z, or
> other folders, and you will have seen Z/h suggesting a pattern to visually clue as well as group
> logically simply in terms of the offering as-via register. See how well this stands up to challenge?"
> (Corwin, 2026-09-27, answer to execute-brief-D37)

**How this is built.** I split the thesis into four claims (I). Two readings then run separately: a
doubt-first reading that tries hard to break each claim (II), and a reward-first reading that finds where each
is strongest and what it opens (III). Where they agree is the stable part (IV). The losing readings are kept
at their strongest (V). Last come what survives, what changes, and options with falsifiers (VI). **OBSERVED**
marks what a file or command shows. **JUDGED** marks my reading, with a tag and a falsifier. Nothing here quotes
chat content or names a screen name.

Plain words used below. **Intake**: taking material into the lab and indexing it. **Egress**: the way out,
meaning any copy that leaves his hands. **Pseudonymize**: replace a screen name with a fixed code (`P-` and 8
hex digits). **Cast**: the whole-tree archive that `spells/recast-universe/` builds.

---

## I. The thesis as four claims

- **T1.** The question is not about numbers. It is about protection against intrusion.
- **T2.** Only publication can protect, in practice. Publication is where someone gets access they did not have.
- **T3.** In the chat-log work, before a green light from Bryant and the team, the only person we can protect
  is Corwin (with Bryant, Bridget and the team as far as their names are attached).
- **T4.** So the work goes into egress checks and a multi-step route through `Z/`, a place we *select* from
  rather than search. `Z/h` marks and groups material that wants care.

## II. Doubt-first: try to break it

**Against T2: intrusion is the one privacy wrong that needs no publication.** [DOMAIN] In US tort law,
intrusion upon seclusion (Restatement (Second) of Torts §652B) stands apart from public disclosure. Wikipedia,
"Intrusion on seclusion" (https://en.wikipedia.org/wiki/Intrusion_on_seclusion): "There is no requirement that
the defendant disclosed any facts about the plaintiff." Solove's "A Taxonomy of Privacy" (*University of
Pennsylvania Law Review* 154:3, 2006, 477–570; SSRN https://papers.ssrn.com/sol3/papers.cfm?abstract_id=667622;
summary at https://wiki.openrightsgroup.org/wiki/A_Taxonomy_of_Privacy) puts *dissemination* in one group and
*aggregation* and *identification* in another, *information processing*. Aggregation means gathering facts
about a person so that together they show something no single fact did. So his own pair of words works against
T2: "intrusion" names a wrong that can be finished before anything is published.

The tree has three observed cases where other people's material moved with nothing published:

- **OBSERVED.** The checker once printed a clear screen name beside its pseudonym "in this session's own
  transcript, before the fix" (`spells/ingest-writing/runs/2026-09-26-corwin.md:117-118`). A transcript is a
  copy outside `.private/`, held by a service.
- **OBSERVED.** ASK rows 1–4 and a search file's name "carry [SOMEONE]'s screen name in the clear" in `h/`
  (`h/NOTE-2026-09-26-tagging-a-person.md:25-29`).
- **OBSERVED.** The search file holding other people's chat lines sat in `h/` until "Corwin moved the file to
  `Z/h/` himself" (`spells/ingest-writing/runs/2026-09-26-corwin.md:115`). It now sits at
  `Z/h/SEARCH-2026-09-26-libera-<name>.txt` (host fact, 2026-09-27).

The shop already counts *copying* as the act that needs care. The ingest spell says: "A third party's
person-facts in the material need consent before they are copied anywhere the source did not put them"
(`spells/ingest/SPELL.md:70-71`). Its next rule sends held material to `Z/` "keeper-eyes", not read "without
Corwin's say-so" (`:72`). That is a rule about *reading*, not publishing. Aggregation is also live here:
"People named on one network turn up in his lines on another" (`…/runs/2026-09-26-corwin.md:99`). Twelve
networks indexed together hold a picture that no single log held.

**Against T3: the people in the logs are protected by default already.** Chapter 15 keeps four gates "each
`on` by default because chat defaults lean toward the privacy of the people in the logs"
(`spells/ingest-writing/chapters/15-source-chat-logs.md:33-34`). It says "a screen name is never matched to a
real name here" (`:39`). By design, then, the protection reaches people who never chose, before any green
light. Saying "it's fairly hard to argue we can protect anyone but me" undersells the tree. The one place where
the tree does *not* protect them is a number: the vocab exemption. It leaves "a screen name in clear once it
has been used as an ordinary word in 17 or more hunks" (`writing/rings/PAPER-2026-09-27-every-rule-carries-its-ring.md:422-423`).
A hunk is a run of chat lines he took part in. The nine essay calls this a fence, meaning a line that decides
which people are exposed. It fences "people who never entered the count"
(`magic-number-theory/ESSAY-2026-09-27-nine-as-a-window.md:123-124`).

**Against T4, egress: routes out that no egress check sees.**

- **Model context and transcripts** [PLATFORM]. When a cloud session reads a file, its bytes go off the
  machine. The transcript case above is one of these.
- **Memory stores.** His signed project instructions call a Cowork per-space memory "a one-reader silo this
  project must not depend on". A silo that holds a fact is still a copy of it.
- **Shared pages.** `MEMORY.md:2689`: "The hosted page reads 'anyone with the link'." This round's brief
  reports that today's brief page became readable by link too. I did not re-check that from here.
- **The cast.** `spells/recast-universe/SPELL.md:22` takes "every drawer, including `Z/`" and leaves out only
  `Z/chatlog/` among Z's contents (`:27`). The egress spell's "never travels" list is `Z/chatlog/`, `.private`
  folders, `chamber/` and the spoilers file (`spells/egress/SPELL.md:26-28`). **`Z/h/` is on neither list.** So
  a cast today would carry the search file of other people's chat lines, and `Z/h/BRIGIDT/`, unless someone
  thinks to remove them.
- **The leak list is blind to vocab nicks.** `pb1ck`'s list holds only "the names he addressed"
  (`magic-number-theory/REVIEW-2026-09-26-ingest-writing-firing.md:91-97`). From the VM it reads "salt not
  readable: NOT …" (`…/runs/2026-09-26-corwin.md:230`).

**Against T4, Z as the place we select from.** His replacement for the old fence: "C4 should be focused on
provably looking on the right thing not dependent on not having wrong things sitting around to be not looked
at" (`README.md:188`; `d/door/20-his-scope-and-attestations.part:16-18`). Select-not-search is a habit, and a
habit depends on nobody looking. It holds when the reader chooses to make it hold. Today's reader corpus was
built "no Z/", which is an exclusion by name (`HOUSE-RULES-for-writers.md`, this round's brief). The vocab sweep
read `Z/chatlog/.private/work/` because it named that path
(`spells/ingest-writing/runs/2026-09-27-sweep-vocab-threshold.md:9-15`). But a plain `grep -r` from the root
reads `Z/` unless told not to, and the cast walks into it by default. The access ledger `Z/z` has six rows:
stage, savannah, arma, enclave, logvol and comments (host fact, 2026-09-27). None of them is `Z/h` or
`Z/chatlog`, the two places this question is about.

## III. Reward-first: where it is strongest, and what it opens

**For T2: protection only does something where someone could gain access.** Nobody outside the lab has been
harmed. The one scary claim, that the search file "travels on the next push", was withdrawn: "Nothing pushes
this tree anywhere" (`…/runs/2026-09-26-corwin.md:109-113`). The legal category of intrusion does not fit
either. He was a party to those channels and holds his own logs. §652B is about entering someone's private
affairs, and a person reading his own conversations is not doing that. T2's parenthesis is also the right
test: "where other users get access they didn't have". A check aimed anywhere else has nobody to protect.

**For T3: consent matches it exactly.** His signed wheel grant lets "his own information … travel outward
**point by point, on per-item approval**; third-party and family person-facts are **not covered**"
(`facts/withhold-is-the-act-egress-is-the-class.md:79-81`). He can say yes only for himself. Until Bryant and
the team say yes for themselves, "protect anyone but me" is literally true of *consent*. The shop's own figures
back holding that line. Consent-grounded refusals were retracted 0 of 16 times
(`facts/refusals-sort-by-whose-fact-they-are-about.md:9`). They do not dissolve when more context arrives.

**For T1: "not numbers" makes R1 easier.** R1 is the review fork on the vocab exemption. Once the question is
put as protection against intrusion, the 17 has nothing left to defend it. MEMORY records his gauge as "17
never multi-user without consents" (`MEMORY.md:3176`), and the sweep found it "sits on a slope"
(`…/2026-09-27-sweep-vocab-threshold.md:31`), so the data gives no reason for 17 either. So the 17 is a line
that affects people who never agreed to it. Dropping it is the protective choice, and this framing makes that
clear. Framed as numbers, it looked like a calibration problem.

**For T4: one place to check is what makes checking possible.** The egress spell makes the way out "the third
actor" that keeps the other two cheap to check (`spells/egress/SPELL.md:7-9`), and it runs its checks a
second time after reporting done (`:53-58`). Every leak the record shows *caught* was caught at a boundary.
`pb1ck` found two credited names on the way to pub (`…/runs/2026-09-26-corwin.md:227-229`), and he fixed the
search file by moving it himself. Guarding at every intake point is the cost the shop has already named: "the
protection is aimed at a hypothetical third party who is not in the room, and paid for by the person who is"
(`facts/refusals-sort-by-whose-fact-they-are-about.md:87-88`).

**For Z: selection works where the fence failed.** The old fence was retired because it "depends on
compliance" (`README.md:191`). Selecting is not a fence. It is a route plus a ledger. `Z/z` marks each place
COUNTED or SEALED. From the rows and from README's "counted, read with care, and not walled" (`README.md:180-181`),
I read COUNTED as "reached and counted by name" and SEALED as "not opened". `Z/h` does what `h/` does, a shelf of
dated hand-back work, but you reach it *via* Z. That is my plain reading of "as-via register": the folder
is shaped **as** `h/` and reached **via** `Z/`. "Bound through Z" then means the only way a tool reaches the
material is a route that names a Z path. Door part 16 fits: "The fence is an honest admission, not a finished
design", and "walk toward the weak point" (`d/door/16-fence-is-an-admission.part:11-12`, `:23`).

## IV. Where the two readings meet (the stable part)

1. **Protection works at a crossing, where someone gains access they did not have.** Both readings keep this
   core of T2. Doubt-first adds one fact the thesis leaves out: in a lab worked by AI sessions, crossings
   happen *before* publication. Agent reads, transcripts, memory writes, shared pages and casts are all
   crossings. **Stable form: protection works at egress, and egress is any copy leaving his hands, of which
   publishing is the largest and not the only one.** JUDGED [MINE]. Falsifier: an intake-side harm with no
   copy leaving his hands at all (for example, a linking done and kept only on his disk that still hurts
   someone).
2. **Intake safeguards are egress protection paid in advance.** Pseudonymizing, cutting only his lines, and
   the ban on linking a screen name to a person are worth something because they shrink what can cross later
   by any route, a transcript included. At intake, the real intrusion risk here is aggregation and
   identification, not reading. JUDGED [DOMAIN]. Falsifier: someone is harmed by the index while no copy of it
   ever crossed.
3. **"Only me" is true of consent and false of care.** Only he can say yes (the wheel grant). The defaults
   care for everyone in the logs (chapter 15's gates), and the one exception is the vocab 17. JUDGED [MINE].
   Falsifier: he reads `Z/chatlog/.private/vocab.*` and finds no one's handle, only words
   (`…/REVIEW-2026-09-26-ingest-writing-firing.md:71-73`). Then the exception exposes nobody.
4. **Select-not-search holds as a practice and fails as a guarantee.** It held in every read I can cite. It
   does not hold for the cast or for a plain tree grep. His own principle asks for proof that we looked at
   the right thing, and "a receipt is a fact anyone can re-derive": `c4at --scope` →
   `evidence/read-scope.tsv` (`d/door/20-his-scope-and-attestations.part:18-19`). JUDGED [HIS] (his principle,
   applied by me). Falsifier: a read-scope log over some stretch shows no tree-walk ever entered `Z/`.

## V. Losing readings, kept at their strongest

**Doubt-first loser: "indexing other people's chat is itself the intrusion; stop at his lines."** At its
strongest, aggregation is a harm with or without publication, and the people in twelve networks never agreed
to be indexed together. The shop's consent refusals never get retracted. Why it loses here: rule C6 already
keeps others' words as pointers, a paraphrase at most (`chapters/15-source-chat-logs.md:17`). Linking a name to
a person is barred (`:39`). The logs are his own conversations, and in his decision order his freedom to study
his own record counts. It stays live if the index ever links people across networks by anything more than a
salted code.

**Reward-first loser: "egress checks plus his hand are enough; Z needs no more."** At its strongest, every fix
in the record came at a boundary or from his own hand, and he wants no ceremony. It loses on one observed gap.
The cast takes `Z/h/` today, and the egress "never travels" list does not name it. A habit cannot cover a
route that nobody thinks of as a route.

## VI. What survives, what changes, and the options

**What survives, in his terms.** It is not about numbers. It is about protection against intrusion.
Protection works where someone gets access they did not have, and in this shop *every* copy leaving his hands
is such a place, not only publication. Until the team says yes, he can consent only for himself, but the
defaults already care for everyone in the logs and should keep doing so. Egress checks are the right centre.
Z is the right staging place, provided the routes through it are *proved*, not just remembered.

**What needs changing.** (a) The vocab 17: the one default that does not care for the people in the logs.
(b) `Z/h` is missing from the cast's and the egress spell's "never travels" lists. (c) Select-not-search
has no receipt. (d) Chapter 15's promise, that every screen name becomes a code, is not what the code does
(`…/REVIEW-2026-09-26-ingest-writing-firing.md:35-40`).

**Options for R1 (keep or drop the vocab exemption), in his terms.**

- **A. Drop it; win back readability by a short list he names (recommended).** Every screen name becomes a
  code. Any word he wants in clear goes on a list, one line per word, each line his decision. This protects by
  default and puts him in control. Falsifier: he reads `vocab.*` and finds only ordinary words and project
  names. Then A cost him readability and bought nobody anything.
- **B. Keep 17, say so in rule C1, and add vocab nicks to `pb1ck`'s leak list.** This keeps his memes readable
  and checks at the way out. At its strongest, it is the pure egress answer to T4. Falsifier (for keeping B
  over A): an item built from memes goes through `pb1ck` with the vocab nicks added and gets no hit. It fails if
  a meme crosses by a route other than pub first, such as a transcript or a cast.
- **C. Keep the clear words inside Z only, and turn them into codes at every crossing.** This is the literal
  thesis. Falsifier: a model session or a cast reads a meme before the crossing step runs. The transcript case
  says that happens.

**Options for Z.**

- **Z1. Name `Z/h/` in the cast's and the egress spell's "never travels" lists (recommended).** It closes the
  one gap I observed, cheaply. Falsifier: a cast built after the change contains any `Z/h/` file, or `Z/h/`
  turns out to hold nothing that should stay home.
- **Z2. Make "select" provable.** Tree-walking tools skip `Z/` unless given a Z path, and every read of Z
  writes a read-scope row (named or walked). Falsifier: a stretch of read-scope rows shows zero walked reads.
  Then the habit already holds and this is a spare gauge.
- **Z3. Add rows for `Z/h` and `Z/chatlog` to `Z/z`, with their terms.** Falsifier: nobody reads the rows.
- **Z4 (kept loser). Leave it to his hand.** Falsifier: any Z content found in a cast, pub item or shared page.

---

**Coda, for a stranger.** A lab that works with AI crosses its own threshold every time a session reads a
file, so "only publication protects" becomes "only crossings protect", and there are more crossings than it
looks. Guard the crossings. Keep the defaults kind to people who never chose. Prove the route into the
sensitive drawer, and do not just trust that nobody walked in.

*Outside sources: Restatement (Second) of Torts §652B, via Wikipedia, "Intrusion on seclusion",
https://en.wikipedia.org/wiki/Intrusion_on_seclusion (says liability needs no disclosure); D. J. Solove, "A
Taxonomy of Privacy", U. Pa. L. Rev. 154:3 (2006) 477–570, https://papers.ssrn.com/sol3/papers.cfm?abstract_id=667622,
groups summarized at https://wiki.openrightsgroup.org/wiki/A_Taxonomy_of_Privacy (aggregation and
identification under processing; intrusion under invasion; disclosure under dissemination).*

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.

```
LENS · ESSAY protection-or-intrusion · 2026-09-27
a  my view: the thesis holds once "publication" widens to "any copy leaving his hands"; the vocab 17 is the one default unkind to the people in the logs; Z/h is missing from what the cast leaves out.
b  the view I ascribe Corwin: protect where access is gained; consent only for himself until the team says yes; egress is the one place to check; Z is chosen from, not searched.
c  their pull on mine: his "not numbers" moved R1 from calibrating 17 to asking whom it exposes; his "provably looking on the right thing" moved Z from a fence question to a receipt question.
d  my pull on theirs: in an AI-worked lab every agent read, transcript, memory and shared page is a crossing; and "only me" is true of consent, not of care.
persona / inverse: a privacy lawyer says intrusion needs no publication, so intake can wrong people / the inverse says he was in the room and holds his own logs, so the live risk is linking, not reading, which the gates already bar.
principles reframe: 1. universalism: people in the logs get the same default care as the team, whether or not they can consent. 2. four freedoms: his freedom to study his own record is kept; readability returns by his named list, not by a fence nobody chose. 3. free software: a route anyone can re-derive (read-scope rows) beats a habit nobody can check. 4. community: nothing of theirs crosses until they say yes, and the check is where anyone can run it.
```
