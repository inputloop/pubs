# PLAN: dates linked by atom, and "So You Want To Build A Ghostwheel?"

*Shaped by the stack: `LENS.md`, `PERSONAS.md` (the panel ran blind, on his own machine), `MINIONS.md`,
`PRINCIPLES.md`. Evidence: `PACKET.md`. His message: `PROMPT-2026-11-03-0814.md`.*

## The short version

- **An atom is the smallest thing someone will reuse that can be true one month and false the next**: one
  fact, one count, one ruling, one cell of a register. It is named as the question it answers. A file is
  not an atom, and neither is a folder.
- **Its date lives in a witness row, not in a filename.** Each time something sees the atom, one row is
  added: what it said, when it was seen, who or what saw it, where, and the hash of the record it came
  from. Rows are added, never overwritten. This is the question bank's shape, already 940 lines old.
- **The array is kept.** Two witnesses that say slightly different things are both kept, side by side.
  Where they differ, that is the finding. An atom seen by one hand only wears the paper's own dagger (†)
  until a second hand writes a row. Nothing is thrown away to make one source win.
- **The writer is the act.** The command that does the work writes the row. No extra step for anyone, at
  2 a.m. or any other hour. That is the one thing every earlier register lacked, which is why each went
  quiet.
- **q/ stays as the record.** Its index gets healed, work products move to their homes with a trail, and
  facts are lifted out when they are reused. Publishing counts as reuse.
- **Wormholes are kept ideas with doors**: registered, findable by name, each saying what would open it.
- **The book carries the model**: facing pages that are two witnesses to one idea, two guides who are the
  two writers, every fact tappable for its dates, and seventeen spreads (the house's GRAND, chosen, not
  derived).

## 1 · What an atom is, and where its date lives

**The atom.** If you can say it in one sentence that could be wrong next month, it is an atom. "GitHub
reports inputloop/ta's licence as CC-BY-4.0." "There are 165 five-character tool names in `bin/`."
"Run-levels above 4 are virtual." Each is named as its question, as `facts/` already does ("name it as
the question", `c4/facts/README.md`).

**The witness row.** One line per sighting, seven fields, in plain words:
1. **atom**: which question;
2. **said**: what this witness said, short;
3. **seen**: when it was seen true, in UTC;
4. **by**: who or what saw it (a tool, a model, a person, the live system);
5. **from**: where (a path and line, a web address, or the command that was run);
6. **sha**: the hash of that record at that moment, so a later change to the record is noticed (his rule:
   a path is an address, a hash is an identity);
7. **state**: seen, ruled, superseded, could-not-check, or opened.

It copies the question bank exactly in spirit: one ID, every row dated, a ruling added beside the default,
nothing renumbered ("Q607 2026-10-19 DEFAULTED", then "Q607 2026-10-20 RULED",
`c4/evidence/question-bank-iTNH.tsv`). It borrows its "who, when, what changed" from the GNU ChangeLog.

**Where the rows live.** A register, proposed name `c/seen`, with its columns described in `d/c/seen`, as
every C4 register is. To read by atom, not by path, unfold it with the tool the shop already has:
`tv1cr unfold` with a composite key (atom, seen, by), and the atom column becomes a folder with one entry
per atom listing every row that witnessed it. `tv1cr who` answers "who saw this, and when".

**Why "seen" and not "last changed".** We can rarely know when a fact changed in the world. We can always
say when each witness saw it. So a row stores *seen*, and "it changed between Tuesday and Friday" is read
off two dated witnesses that differ. "Could not check" is its own state, never a blank (C4-LANG §9).

**The two writers.** His rule: to register is "two paths minimum back to referent context, and two
writers per idea moved/installed" (memory, 2026-11-01).
- Writer one is **the act**: the command that did the work appends the row.
- Writer two is **the record**: the file the fact came from, pinned by its hash. When the register is
  unfolded, tv1cr's two sides (each column a folder, each row a folder) are two more paths back.
- **Two witnesses**, in the paper's sense ("someone other than its author can run it",
  `ai-diligence-sysops-v0.2.1.md:175`), means two rows with a different *by*. One *by* only earns the
  dagger (†, the paper's own mark for "Claims resting only on that single witness", line 170). The
  dagger is a gauge, printed and counted, never a refusal.

## 2 · A fact copied out of a q/ record keeps its date and its source

**Today's worked example.** `q/2026-11-03-license-and-vibrobeast-site/RECEIPTS.md` holds twelve
repositories' licence facts. Lifted as atoms, each gets two rows from two different hands:
- inputloop/ta, row one: *said* CC-BY-4.0; *by* GitHub's licence detector (REST); *from* RECEIPTS.md and the
  API address; *sha* of RECEIPTS.md; *seen* at the time of the read.
- inputloop/ta, row two: *said* "LICENSE holds the CC BY 4.0 text"; *by* git (the file itself at commit
  9e523d8); *from* that file at that commit; *sha* the file's own hash.
- Two hands, so no dagger.

**The disagreeing pair is the best part.** For inputloop/hello-taxgnomes, RECEIPTS.md says the LICENSE file is
"now its own statement", and GitHub reads it as "NOASSERTION (a statement plus third-party licences:
correct, not detectable)". Both rows are kept. The difference
teaches something neither witness says alone: GitHub's detector cannot read a mixed statement. That is his
paper's method exactly: "Where they diverge … that gap is not a defect in the argument. It is the
argument's instrument" (lines 24-25).

**The run-levels atom.** "What are C4's run-levels?" has four witnesses on disk (`PACKET.md` O14): the
build ladder in `ghostwheel.fn.sh` (via CORWIN.md §27), the lifecycle list in C4-LANG §8, the tumblers in
the 2026-09-11 fact, and the promise-break ladder in `facts/drift`. Plus his ruling of 2026-09-11
("The higher run-levels are virtual"). That is five rows, each saying its standpoint (host, build,
assurance, promise). None is deleted. C4-LANG §8 gets one line beside it pointing to the atom: the errata
printed beside the error, as Roux-Abara insists. The fact file's own words say why this matters: "A ruling
that has to be re-answered is a memory failure, not a question."

## 3 · What happens to q/ and today's folder

**Decision: q/ stays as the record. No migration.** It holds his verbatim prompts, and a prompt is honestly
dated. Nine tools in `bin/`, two facts and two registers read paths inside q/ item folders (`MINIONS.md`
N2), so moving it would break them. The canon and his paper both keep dated records and earlier versions.

Three things change:
1. **Heal q/'s own index.** 36 dated folders have no row in `q/INDEX-captures.tsv`, and today's three have
   none. It is the fault the readers named most often: 15 of the 18 reader-runs across both models cite it. *Falsifier, the shut-book
   test:* for any dated folder, one `grep` of the index finds it; the count of unindexed folders is zero.
2. **Work products go home, with a trail.** Today's `site/` and `site-check/` belong with the site's own
   source; `journal-terms/` belongs on the publication shelf, where its signed files now are (below).

   *A live example of why every row says when it was seen.* His log pasted at 08:14 CST (14:14Z) shows the
   README copy failing ("cp: cannot stat 'README.md.asc'"), and the first signature gpg then reported was
   "made Sun Jul 12 19:27:11 2026". Read on Avalon later the same morning: `README.md.asc` was written at
   14:15:43Z, and the shelf's `README.md` has the same time and the same size (2,881 bytes). So the shelf's
   README was "the July one" at 14:14Z and the new one by 14:15:43Z. Two witnesses about ninety seconds
   apart say different things, and both were true when they were seen. A fact copied from the log without
   its time would now be wrong. (A first draft of this plan made exactly that mistake; this paragraph
   replaces it.) Each move gets
   a `c/moved` row so `sh bin/where <old path>` answers; signed files travel with their `.asc`, and
   `gpg --verify` passes at the new path. Anything signed moves by his hand.
3. **Rulings inside q/ get atoms.** `q/2026-10-11-labav-kiosk/RULINGS-2026-10-12.md` is read by `bin/di1ct`
   and `facts/the-kiosk`. Each ruling in it gets a bank row pointing back by hash. The tools keep working;
   the ruling gains its second path.

**Lift on reuse, and publishing is reuse.** No backfill of 266 entries for its own sake (a stem nobody reads
is "this shop's named failure mode", the cxr skill). When a fact from q/ is reused, the act that reuses it
writes its rows, pointing into q/. Everything that goes into the book, a paper or a public page gets its
rows before it ships (`PRINCIPLES.md` P2).

The same rule holds for the other dated folders (`skills-mint/` 12, `d/` 18): records stay; atoms on reuse.

## 4 · Tools: what exists and what is missing

**Already built, and used as they are:**
- `bin/tv1cr`: two writers per cell, the writer's own stamp per column and per row (distinct from file
  time), every overwritten value kept, `who`, `check`, `stale`, composite keys.
- The question bank: the shape to copy.
- `facts/`: one fact per file, named as the question.
- `c/moved` and `bin/where`: the path history, with hashes.
- `evidence/claims.tsv` and `h/cheque.sh`: a claim is refused if it has no pointer; a receipt holds a hash
  and a time.
- `q/INDEX-captures.tsv` and `bin/prompt-file`: the record's own index.

**Missing, each small:**
1. **A `seen` command** (name his to give, in the house's five-character shape): POSIX shell, appends one
   witness row, fills in *seen* and *sha* itself, and refuses a row with no *from* (as `cheque.sh` refuses
   prose). It ships with a spec in a second language, a prove-red, and a reader in a third language that
   rebuilds the dagger list, per his rule of 2026-09-14. *Density test:* seven plain fields, readable in
   any language in minutes.
2. **A gauge at session open:** atoms with one witness (†); atoms whose record's hash no longer matches;
   q/ folders with no index row. Counts printed with the date they were counted. A gauge, not a guard.
3. **The undo walk over tv1cr's kept values by stamp** (already on the cxr skill's "not built" list): it
   gives every cell its own history, so existing tables get per-cell dates for free.
4. **The first two writers wired in:** the landing receipts and the site check already produce receipts;
   they call `seen` as they do. The second witness is made by the system (Roz's opening).
5. **The persona tool**: a copy whose first lines carry its own version and date is an EDITION, not drift
   (routed to SkillTank).
6. **The cxr naming cap**: it cuts a name at 200 bytes without counting the folders above it, which is how
   paths under q/ reached 270 characters on Avalon. Cap against the whole path, or hash long free-text
   values instead of spelling them (routed to SkillTank).

**Where unfolded stems may live.** Shallow, at C4's root registers (`c/seen` and its stem), never inside a
dated record folder. Only short columns (atom, by, state) become collections.

## 5 · YES AND, and the wormholes

Nothing is refused; things are placed. A **wormhole** is a registered idea that cannot build yet. Each one
carries:
- the idea, in one sentence, named as its question;
- **what would open it**: a tool, a level, a person, a ruling;
- **its return line**: the atom or the spread of the book it belongs to;
- for an idea that is unlikely ever to build with us, **the reason**, and still the condition that would
  reopen it. It is a kept loser with a door, never deleted (CANON: "No abandonment").

When its condition is met, a row is added beside it saying OPENED, the bank's ruling shape. *Falsifier,
the shut-book test:* given a wormhole's name, one command on one file finds it, with no memory needed.

In the book, a wormhole is a little door drawn on the spread it belongs to. June's question ("What's a
wormhold?") gets a picture before it gets a word: a round door with a star on it. The fuller page says
what is behind it and what would open it. You can always come back through.

## 6 · The book: "So You Want To Build A Ghostwheel?"

**The two pages.** Left, the picture page: one picture and a few easy words, at most about forty, drawn
from an easy-word list of its own, kept as a register. Right, the fuller page: at most about 250 words
(Nan: "too hard … if the facing page is too bulky"), one diagram drawn from data, and a small mark beside
each fact that opens its witness rows (when it was seen, by whom, from where). The two pages are equals,
two witnesses to one idea (`PRINCIPLES.md` P8). On a phone the picture page comes first; on a wide screen
they sit side by side. Static, nothing from another host, no cookies, screen-reader friendly, and it
prints.

**The two guides** (my proposal, his to keep or change). **Spoke**, a small ghost who lives at the hub of
the wheel (SPOKE is a C4 word, on the S row), *sees* things. **Pin**, a mouse with a pencil, *writes down*
what Spoke saw, with the date and where (C4.md: a PIN is "a statement someone has made, about anything").
They are the two writers. When they disagree, both are kept, and that is the best part of every story.

**Each spread is an atom with editions** (the Garden's opening): one file per spread, named by one bare
word, with a picture page, a fuller page and its witness list. A new edition is added beside the old.

**The spine** (seventeen spreads, the house's GRAND, chosen; one idea or level each):

*Part One: how we say things*
1. **door**: Hello, this is the shop. What a ghostwheel is: computers in rings that look after each other.
2. **letters**: every room has a letter on the door (the seventeen registers and their four faces).
3. **seams**: one word can mean several things, and that is fine (seam, pin, semaphore).
4. **doing**: a word we can *do* is a real word (virtual types; LIST).
5. **spaces**: a space changes everything (space binds, case resolves).
6. **keeping**: nothing gets thrown away (every word stands for itself; "could not check" has a place).
7. **proving**: every promise brings its own test (falsifiers, prove-red).
8. **twice**: two ways to say everything, and two writers for every idea.
9. **when**: Pin writes down when and where (today's lesson; the dagger for a lone witness).
10. **witnesses**: two friends, two answers (the run-level ladders side by side; where they differ is the
    finding).

*Part Two: how a ghostwheel wakes up* (depends on fork F1)
11. **zero**: is anyone home?
12. **floors**: on the picture page, four floors that spell the name: Containers, Components,
    Configurations, Connections. On the facing page, the locks on each floor's door: present, fresh,
    digest, signed. Two ladders for one set of numbers, two witnesses on facing pages (my reading of how
    his ladders fit; his to bless).
13. **running**: the lights are on (level 5, the host's "running").
14. **roof**: pretend floors above the roof (virtual levels: an application climbs while the host still
    says "running").
15. **rings**: friends hold hands in rings (the ring of rings).
16. **wormholes**: doors to things we cannot build yet.
17. **goodnight**: goodnight wheel, goodnight letters: the last spread names every atom in the book with
    the day it was seen. NEWS and a ChangeLog sit at the back, in GNU's own forms.

**Homages** (structural nods only; no art or text is copied; these are books read across generations):
- *Goodnight Moon* (Margaret Wise Brown and Clement Hurd, 1947): naming everything in the room becomes the
  last spread's inventory of atoms.
- *The Cat in the Hat* (Dr. Seuss, 1957) and *Go, Dog. Go!* (P. D. Eastman, 1961): stories written from a
  short list of easy words become the easy page's word register.
- *The Little Engine That Could* (Watty Piper, 1930): the climb up the levels, and then the test that says
  whether we made it.
- *Harold and the Purple Crayon* (Crockett Johnson, 1955): drawing the path as you walk it becomes
  diagrams drawn from data.
- *What Do People Do All Day?* (Richard Scarry, 1968) and *The Way Things Work* (David Macaulay, 1988):
  cutaway drawings become the fuller page's diagrams of a host and a ring.
- *Frog and Toad Are Friends* (Arnold Lobel, 1970): two friends who see things differently and stay
  friends become Spoke and Pin.
- *The Phantom Tollbooth* (Norton Juster and Jules Feiffer, 1961): a kingdom of words and a kingdom of
  numbers who quarrel become C4's two registers.
- *Where the Wild Things Are* (Maurice Sendak, 1963): going far and coming home to find supper still hot
  becomes the wormhole door you can always come back through.
- *The Very Hungry Caterpillar* (Eric Carle, 1969): every day counted becomes every count with its day.
- *Charlotte's Web* (E. B. White and Garth Williams, 1952): words written in a web that make something true
  in the world become "a word we can do is a real word".

**How it carries the model.** Its spreads are atoms with editions; its facts open their witness rows; its
facing pages are two witnesses; its doors are the wormhole bank; its last page is the inventory. Reading
the book teaches the scheme, and building the book tests it. Text CC-BY-SA-4.0 and code GPL-3.0-or-later
or LGPL-3.0-or-later (TERMS v2); pictures ship with their sources. The book draws only on atoms whose
source is already public (`MINIONS.md` N4).

## 7 · First steps, in order, each with its falsifier

1. **The `seen` command**, its second-language spec and its prove-red. *Falsifier:* the prove-red plants a
   row with no *from* and a row with a wrong hash, and both turn the spec red.
2. **Witness rows for today's receipts** (twelve repositories, two hands each) and for the run-levels atom
   (five rows). *Falsifier:* the gauge prints zero daggers for the receipts and shows the hello-taxgnomes
   disagreement as two rows.
3. **Heal q/'s index** (36 plus today's 3). *Falsifier:* the shut-book test on any dated folder.
4. **Draft spreads 9 and 10 first** (when, witnesses), built from those rows, so the book and the register
   are born together. *Falsifier:* every fact on both pages opens at least one row; none is daggered
   without saying so.
5. **The gauge at session open.** *Falsifier:* a planted lone-witness atom shows a dagger; a record edited
   after its row shows as changed.
6. **Work products home** (today's site and its check), with `c/moved` rows; the signed `journal-terms`
   only by his hand. *Falsifier:* `bin/where` answers for each old path; `gpg --verify` passes at each new
   one.

## 8 · Where I disagree with him, with the witnesses, and the check that would settle each

1. **"A C4 daily folder makes no sense at all"; I agree in part.** q/ was designed as a record of prompts
   (`c4/q/README.md`), and the canon and his paper both keep dated records and earlier versions. But he is
   right that it is also used as a home: nine tools read rulings and prompts inside it. *The check:* after
   the index heals and today's work products go home, count new non-record files landing under q/ item
   folders for a month. If work keeps settling there, his reading is the true one, and q/ item folders
   should hold the prompt and response only.
2. **"The date that information was last changed": I would store "seen at" instead** (`PRINCIPLES.md` P11;
   CANON.md:27; C4-LANG §9). *The check:* pick nine atoms at random; if for most of them the moment of
   change is knowable apart from when someone saw it, "last changed" is the better field and I am wrong.
3. **"An array of slightly different facts from the same pool provides a second witness": not until a
   second hand writes one of them.** The paper's own words are "someone other than its author can run it"
   (line 175); the words "array" and "second witness" do not appear in it (searched). His array is in its
   spirit: §V's five attempts, all kept. So I keep every member and add the dagger rather than say no.
   *The check:* if he means "second witness" to include a second reading by the same hand, the dagger is
   too strict and should go (fork F6).
4. **Long paths: I said they were not the fault, and I was half wrong.** A long *name* is fine: `facts/`
   names run to 81 characters and are good, because each is named as its question. But *depth plus length*
   is a fault, and it is already biting. The main session's own attack/defend
   (`LENS-2026-11-03-daily-folder-attack-defend.md`, Board 3) found a 255-character path under q/. I
   recounted on Avalon: that is relative to c4, so with `F:/claude/c4/` in front it is 270 characters, past
   the classic Windows limit of 260; 42 files under q/ are 230 or longer. All three of the longest are
   tv1cr-unfolded cells (long values spelled out as file names) inside a dated q/ folder. *What it changes:*
   unfolded stems live at shallow paths and never inside q/ item folders; long free-text columns (like a
   witness row's *said*) are not unfolded as collections; and the cxr naming cap (200 bytes) should count
   the whole path, not just the name (routed to SkillTank). *The check that would dissolve the rest of my
   disagreement:* once those stems move or are re-capped, if nothing in c4 exceeds 230 characters absolute
   and people still cannot find things, length was never the finding-problem, only the breaking one.
5. **Conceded: "we don't quite get it" stands.** My LENS said the shop understands and only failed to keep
   writing. Building a register five times and letting each go quiet is what not quite getting it looks
   like (`PRINCIPLES.md` P10).

## A second witness to this review

While this review ran, the main session wrote its own attack and defence of the same hypothesis, as an
independent hand (`LENS-2026-11-03-daily-folder-attack-defend.md`, in this folder; I read it after my
stack had run). Two reviews of one question from the same pool, which is his method applied to us.

- **Where they agree:** a file's date is when it was written, not when its facts were true (it names three
  dates: observed, true-as-of, written; I name the date of record and the date each witness saw it);
  `facts/` already dates on the atom; the second witness was in the pool and the folder hid it (its real
  case: the journal relabel stopped by one line of TERMS v2); and atoms sit underneath while he reads a
  page, a spread or the book, never a raw register.
- **Where they measure the same thing slightly differently:** it counts 38 of q/'s 266 entries named from
  any register, descriptor or fact; I count 85 of 121 dated folders with a row in q/'s own index. Both are
  true from where each stands, and the gap between them says q/'s own index is better kept than C4's other
  registers know.
- **Where it corrected me:** path length (my disagreement 4, now half conceded, above).
- **One thing it has that I folded in:** "true-as-of" can differ from "seen" (a log read today can cover
  yesterday). A row whose observation covers an earlier moment says so in its *said* field; a column of
  its own waits until a real row needs one.

## 9 · Forks only he can decide

- **F1. Which ladder is the book's spine?** "C4 language levels" could mean (a) the run-levels (how a
  ghostwheel wakes up), (b) the language's heights (ASSY walks, META weighs, C4QL looks, then prose), or
  (c) both, Part One the language and Part Two the levels. I lean (c). Inside it: does he bless reading his
  ladders as two witnesses for one set of numbers (build floors and tumbler locks, 5 running, pretend floors
  above)?
- **F2. Where wormholes live.** (a) A new state word in the question bank: fewer registers, and it matches
  his "banks of registered ideation". (b) A sibling register with the same shape: the book can list its
  doors without the bank's 399 open questions.
- **F3. The witness register.** Its name (`c/seen` proposed), and lift on reuse only (my lean) or backfill.
- **F4. The book's home, and when it goes public.** An inputloop repository, corwin.cloud, or the
  modelthisbook shelf. Publishing is his act.
- **F5. Today's site and check tool in q/.** Move them home with a trail, or leave them and point.
- **F6. The dagger.** Keep † for lone-witness atoms (the paper's mark), or a softer mark.

Mentat (for Corwin, claude-opus-5-5)
