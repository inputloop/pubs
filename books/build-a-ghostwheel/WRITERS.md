# Brief for the writers of "So You Want To Build A Ghostwheel?"

Two writers work at once, each on their own spreads. This file is the same for both.

## What Corwin asked (2026-11-03 17:48, verbatim)

"The story is really great. I can offer some tuning. We on the first page showing just the picture
book side is great: a bank or dedication page on the right. after that we should usually show facing
pages: the pacing is good here, where you wait to introduce the ideation but remember to think in
terms of a physical thing we are emulating and know where you are stepping off plan so theere's a map
(maybe we can show that if someone looks lost, we know a little about drawing some different mapped
shaped things from dungeon to roguelike doom to nexttime-dev). Don't repeat the title line in the body
on the first page: instead move text around a bit to lead the eye about the drawing or frame/lead the
action. We can have all of the body text below the image in the picture book some of the time, but
varying the shape of text flowing into the image can help keep a wandering eye feel like it's
following the action instead of starting to get lost in it while learning new word sound to shape and
meaning and experiential lens (or so I conceptualize this, as to express here as best able). It's some
of our best work. I would very much like to read this full story and learn how things work."

So: the full book, written so a reader **learns how things work**, as a picture book with facing
pages. Mentat is building the reader (tools/book.py); you write spreads.

## Read first

- `README.md` here: the source format, section by section. It is exact; follow it.
- `src/door`, `src/letters`, `src/chad`: **the voice to match.** Short, warm, exact. The picture page
  is for a child or a grandparent; the fuller page is for the curious adult reading along, and it
  never talks down.
- `src/easy`: the picture-page word list. `src/cast`: the voices. `src/figures.svg`: Spoke, Pin, Chad.
- `/mnt/user-data/outputs/atom-dates/PLAN.md`, section 6 (lines 176-249): the spine, the two guides,
  the homages (structural only: no art, text or characters from any book), and the rules. Section 1
  explains atoms and witness rows, which the book teaches. `PACKET.md` beside it holds the evidence the
  plan was built from, with paths. `MINIONS.md` N4 and N5 are rules you keep.

## Each spread you write

One file per spread in `src/`, named by its bare word (the list below), in the README's format:
`kind: spread`, `number:`, `title:`, `part:`, then these sections:

1. **`== picture page ==`**: at most 40 words, every word on `src/easy`. Do NOT edit `src/easy`
   yourself (two writers share it). Put the words you need added, one per line with a reason if not an
   everyday word, in `src/easy-wanted-<your-name>` (part-one or part-two). Keep additions few and truly
   easy: short, common, sayable by a five-year-old.
2. **`== fuller page ==`**: at most 250 words. It must teach the idea plainly and correctly. Mark each
   claim that could be wrong next month with `[id]`, and give each id at least one witness row.
3. **`== diagram ==`** (optional, drawn from data). Kinds the reader draws:
   - `rings` (see `src/door`), `grid` (see `src/letters`);
   - `ladder`: one row per line, top of the ladder first, written `N | label | note`. Add
     `focus: N` to light one rung. For floors, levels, steps.
   - `pair`: `left: Title` and `right: Title`, then one row per line, `left text | right text`. For
     two witnesses, two ways of saying one thing, two answers side by side.
   Every diagram has a `caption:`.
4. **`== facts ==`**: witness rows exactly as in `src/door`: `fact`, `said` (quote the source's own
   words where you can), `seen` (the UTC time you read it), `by: <your name> (claude-opus-5-5),
   reading the c4 tree on Avalon`, `from` (file and line numbers), `sha` (sha256 of that file when you
   read it, `sha256:<hex>`), `state: seen`, and a `note:` when something needs saying (a disagreement
   between two sources, a reading that is yours and not his). **When two sources differ, write both
   rows and say so on the page if it matters.** That is the book's whole point.
5. **`== narration ==`**: both takes, `[picture A]` `[fuller A]` `[picture B]` `[fuller B]`, in the
   manner of `src/door` (A: the company talks to you; B: one close lap reader, Spoke and Pin mostly
   talk to each other). Use `{C4|C four}` and the like for sounds. 6 to 12 lines a page.
6. **`== layout ==`** (new; the reader honours it). This is where Corwin's tuning lives: the words of
   the picture page lead the eye around the drawing and toward the action. Vary it across your spreads:
   about a third `below`, the rest `inset`, `scatter` or `wrap`. Lines:
   ```
   picture: full        full = the drawing covers the whole page (draw it 800 x 800);
                        top  = the drawing sits at the top (800 x 600) and the words go under it
   words: scatter       below | above | inset | scatter | wrap
   at: 8 6 40           inset and scatter: X Y W, percent of the page (the block's top-left corner,
                        and its width). scatter takes one at: per paragraph of the picture page,
                        in order, placed along the path the eye should travel
   side: right          wrap only: which side the words go
   outline: 0 0, 58 0, 70 45, 55 100, 0 100
                        wrap only: the drawing's edge as a polygon in percent of the page;
                        the words flow round its shape
   align: left          left | center | right
   ground: soft         optional: a soft paper glow behind words that sit on the drawing
   ```
   Words sit in the quiet parts of the drawing (sky, wall, floor), never across a face or a figure.
   Break the picture page into short paragraphs so `scatter` has pieces to place.
7. **`== picture ==`**: an original SVG you draw, in the style of `src/door` (warm paper, small smiling
   computers, soft shapes, the same palette). Figures by placeholder only:
   `<g data-figure="spoke" transform="translate(x y) scale(s)"></g>` (also `pin`, `chad`). A `<title>`
   that describes the picture for a screen reader, with `role="img"` and `aria-labelledby`. No `style=`
   and no `on...=` attributes (the reader's CSP forbids them); use attributes and the classes in
   `tools/slides.py`. Ids must be unique to your spread (prefix them with the spread's word). With
   `picture: full`, use `viewBox="0 0 800 800"` and leave the quiet areas your `at:` lines name.

## Facts come from C4 itself, read-only

C4 is on Corwin's machine. Load the tool with ToolSearch `select:mcp__remote-devices__device_bash`;
the tree is at `$HOME/mnt/c4`. Start with `C4.md`, `C4-LANG.md`, `m/t`, `facts/`, and the registers
those name. Keep each command small (one file, `grep -n`, `sed -n 'A,Bp'`, `sha256sum FILE`): commands
over the whole tree time out. **Never write there.** Read nothing under `.git`, and never print a key,
token or password if a file holds one.

- Say what is **built** and what is **designed** or **planned**, plainly. If C4 says a thing is not
  built yet, the page says so.
- **People:** the book names Corwin only as the maker, and Spoke, Pin and Chad. No family, no one not
  taking part, nothing from anyone's private life (PLAN N4, N5; CORWIN.md section 10). q/ holds his
  verbatim prompts: you may read them to understand, and cite a line only when it is about the work.
- Where his words exist, use them, quoted and cited. Where a reading is yours, the note says so.

## Chad

Corwin's own character: "a re-occurring character who shows up at the start of chapters or for some
brief intermezzo, initially seeming a little out of place and slightly goofy (in a very Chad, Chad got
this, (but why is chad here?)) way", whose ideas make sense only at the climax, near C4's query
language. "DO NOT ensure we dive the point home: I will be the judge of that and much happier if I'm
saying "we didn't make the cut, telegraph it a tiny bit more"". Chad is brief, confident, a little out
of place, and **explains nothing**. His one line so far: "Last word first. Every time." (A writers'
note in `src/chad`: C4.md section 9, 2026-08-25, records "C4 backward consing (rightmost token = the
logical CAR ...)" under the ASSY / C4QL / C4META stack.)

## Your report (short)

The files you wrote; for each spread, word counts (picture, fuller), the layout you chose and why
(one line), the facts and their sources; disagreements you found between sources; words you want
added to `src/easy`; anything you could not confirm, marked plainly. Do not edit `src/book`,
`src/easy`, `src/cast`, `src/figures.svg`, `tools/`, `checks/`, or another writer's files.

Copyright 2026 Corwin Brust; CC-BY-SA-4.0. Mentat (for Corwin, claude-opus-5-5)
