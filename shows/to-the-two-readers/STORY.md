# To the Two Readers: the story of a mark

A second show for Ghostlights: an animated mark from Corwin's hand, with the story it tells drawn from the
shelf. Like every ghostlight, each line names its witness: the file it came from, the lines, when it was read
and a hash of what was read (WITNESSES.tsv; `sh checks/run.sh` re-reads each one).

## His hand (the four frames, 2026-11-04 21:51 CST)

Four photographs of one page of a lined notebook, in brown ink. Corwin sent them with these words: "I had this
very abstract idea (just an animated logo idea and one of the sample frames I show is photographed even worse
than the others!) that I thought could be another be good work for ghostlights". Read in order:

1. "To th' TRUE READER / accross / TIME", with "& SPACE" standing on end beside TIME and a hooked arrow from
   READER's last stroke curling down and back (frame sha256 0c3805a9…).
2. The same, with TRUE struck through (342e0b53…).
3. The same page upside down, photographed worse than the others (c78c05b8…).
4. TRUE struck, and "two" written above it in a second, blue ink (345c6125…).

What is my reading, and not his words: "Toh" is "To th'"; the hook is the page's turn; the upside-down frame
is the page as the reader across the table sees it. The mark spells "across"; the hand's "accross" is kept
here, in the witness.

## Draft 1: the story, from the shelf (written before reading the book)

He asked that the story come first from our own reading material, leaving *So You Want To Build A
Ghostwheel?* aside, and that the book's coaching then be used to harden it. Draft 1 is that first pass, kept
as it was; draft 2, after the book, follows it.

| beat | what the mark does | the line | witness |
|---|---|---|---|
| 1 | the line is written, in brown | To the true reader, across time and space. | W0, his hand |
| 2 | "across TIME" | When you write to a future session, you are emitting into a channel. | W1, two-readers §III |
| 3 | TRUE is struck through | There are never more than two. | W2, two-readers, preface |
| 4 | "two", in a second ink | The first is the maker. The second reads by principles first. | W3, two-readers, preface |
| 5 | the page turns half way round, to the reader across the table | A reflection is not a witness. | W4, two-readers §IV |
| 6 | it turns on, back to us | The newcomer, the tired maintainer, the stranger. | W5, a name a stranger can read |

The spine is the two-readers paper (*There Are Two Readers, At Most*, edition 0.2): a writer only ever reads
their own construal of the reader, so the honest move is two construals held apart, and a reflection of
yourself does not count as the second. The mark already says this with no help: "true reader" is struck, and
"two" is written over it in another hand's ink. A mirror would flip the page left to right and give you
yourself again; the turn gives the page to someone sitting opposite. The stranger closes it: the reader
across time is whoever comes later, and a name or a line they can read without us is the gift.

## Draft 2: hardened against the book's coaching

Read after draft 1: the book's brief to its writers (`books/build-a-ghostwheel/WRITERS.md`), its colophon and its
checks. What it taught, and what changed here:

| The book's coaching | What changed in the show |
|---|---|
| "When two sources differ, write both rows and say so on the page if it matters. That is the book's whole point." | The paper asks that its review be read before §IV is cited. Read, it partly disagrees: a rerun is not a witness to what is true, but it is a witness to how much the answer moves. Both rows are in WITNESSES (`moves`, and the paper's own edition-0.2 line `moves-paper`), and the page says so at beat 4. |
| Chad: "DO NOT ensure we dive the point home: I will be the judge of that" | Two captions that explained the mark came out (the maker and the governor; the stranger). Draft 1's closing paragraph, which explained the turn, is no longer on the page; the page says what is his and what is mine and leaves the rest to the mark. |
| "Where his words exist, use them, quoted and cited. Where a reading is yours, the note says so." | His words and frames are quoted and hashed; "To th'", the hook as a turn and the upside-down frame as the opposite reader are named as my readings, on the page and in the witnesses. |
| "Say what is built and what is designed or planned, plainly." | The page has a "Built, and not yet" section: not on ghostlights.theater yet; his photographs travel only on his word; no narration. |
| Witness rows: fact, said, seen, by, from, sha, state, note | WITNESSES uses exactly that form. His photographs are `state: held`: their hashes are recorded, and the check says they are not checked here instead of passing them. |
| "No `style=` and no `on...=` attributes (the reader's CSP forbids them)" | The animation is SVG's own (SMIL): no script and no `<style>`, so the theater's `default-src 'none'; style-src 'self'` serves it unchanged; a still version is served when the reader asks for reduced motion. C3 checks it. |
| "think in terms of a physical thing we are emulating" | A lined notebook page with its red margin, brown ink and a second, blue ink; it turns on a table, around its own centre. |
| One check per promise, each with a planted fault, in another hand than the tools | `checks/run.sh`, sh and awk (the drawing is Python): C1 to C4, six planted faults, all red. |

The closing caption is new, from the paper's own provenance: neither of its checks was the second reader it asks
for, "That reader is still wanted." It answers the mark without explaining it.

Mentat (for Corwin, claude-opus-5-5)
