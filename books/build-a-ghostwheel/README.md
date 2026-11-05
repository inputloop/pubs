# So You Want To Build A Ghostwheel? (pilot)

A pilot of the book in three pieces (Chad's first intermezzo, spread 1 "door" and spread 2
"letters"), made by a small pipeline from one hand-written source per spread. The same sources
make a narrated video, a captioned copy, an mp3, captions, a transcript and a slide deck.

There are two takes of the narration, from the same pages:

- **A, the company talks to you.** Every voice speaks to you. The narration passes among three
  voices, so it feels like a room of people who came to talk with you.
- **B, the lap reader.** One close voice reads to you. Spoke, Pin and Chad mostly talk among
  themselves while you overhear, and turn to you only in a short aside.

Both lean slow and quiet, with short pauses between speakers and no echo.

## What is here

| File | What it is |
|---|---|
| `pilot-A.mp4`, `pilot-B.mp4` | the narrated video, one per take (1920x1080, 25 frames a second, H.264) |
| `pilot-A-captioned.mp4`, `pilot-B-captioned.mp4` | the same, with the captions burned in |
| `pilot-A.mp3`, `pilot-B.mp3` | the narration alone, with chapter marks |
| `pilot-A.vtt`, `pilot-B.vtt` | captions (WebVTT); a character's line starts with the character's name |
| `transcript-A.txt`, `transcript-B.txt` | every line in plain words, with times |
| `slides.html` | the deck: one page at a time, centred like a lens; works with no network |
| `stills/` | frames from each video at 3840x2160, to look at closely |
| `src/` | the sources: the book, the cast, the easy words, the figures, and one file per spread |
| `tools/`, `run`, `pilot.pipeline` | the pipeline |
| `checks/` | one check per promise, each with a planted fault that turns it red |
| `COLOPHON.md` | voices, datasets, licences and tools |

In the deck: the arrow keys, Page Up and Page Down, Space, Home, End and the number keys turn the
pages, as do the buttons and the dimmed pages at either side. Each small numbered mark on a fuller
page opens what Pin wrote down about that fact: what was said, when it was seen, by whom, from
which file, and that file's hash. Escape closes it.

The first brief named the outputs `pilot.mp4`, `pilot.mp3` and so on; with two takes they are
`pilot-A.*` and `pilot-B.*`. A book with no takes (narration headings with no take letter, and no
`set takes=` line) writes the plain names.

## The one command

```sh
sh run
```

That runs every stage of `pilot.pipeline`, for take B and then take A, and ends with the checks.
It needs `pip install piper-tts`, ffmpeg, and Node.js with Playwright. Voices are downloaded once
into `~/.cache/ghostwheel-pilot` (set `GW_CACHE` to move it); working files go in `build/` (set
`GW_BUILD`). The first run takes a while: each take is about three and a half minutes of speech, which
Piper speaks in about four minutes, and drawing its 5,400 frames takes about ten minutes on two
processor cores. Later runs reuse every line already spoken.

```sh
sh run -t A               # only take A
sh run narrate            # one stage
sh run frames..burn       # a range of stages
sh run -l                 # list the stages and settings
sh run -n                 # say what would run, run nothing
sh checks/run.sh          # the checks on their own
sh checks/run.sh --prove-red
```

## Switching takes

The take is a setting, one line in `pilot.pipeline`:

```
set takes=B A
```

Write `set takes=A` or `set takes=B` to make only one, or pass `-t A` for one run. In the sources,
a narration heading names its take (`[picture A]`, `[fuller B]`); a heading with no take is read
by every take. In `src/cast`, `narrator@A:` and `narrator@B:` give each take its own narrator; a
line with several voices joined by `|` is a company, and the role's lines pass from voice to voice.
Adding a take C is a `take:` line in `src/book`, `[... C]` blocks in the spreads, and `C` in the
`set takes=` line.

## Writing a spread by hand

One plain-text file per spread in `src/`, named by one bare word, listed in order in `src/book`:

```
kind: spread
number: 1
title: Door

== picture page ==
This is the shop. Come in!          (at most 40 words, all on the list in src/easy)

== fuller page ==
The first design has seventeen of them [hosts].   (at most 250 words; [id] marks a fact)

== diagram ==
kind: rings                          (drawn from these numbers by tools/slides.py)
hosts: 17

== facts ==
fact: hosts                          (one block per witness row; a fact may have several)
said: The prototype design is 17 nodes.
seen: 2026-11-03T20:08:58Z
by: who or what saw it
from: the file and line it came from      (a row without this is refused)
sha: the file's hash when it was read
state: seen

== narration ==
[picture B]
narrator: This is the shop. Come in.
spoke: Pin. Someone new, at the door.
[fuller B]
narrator [hosts]: The first design has seventeen computers.   ([hosts] lights that fact while it is said)

== picture ==
<svg viewBox="0 0 800 600"> ... <g data-figure="spoke" transform="..."></g> ... </svg>
```

`{C4|C four}` writes "C4" on the page and in the captions and has the voice say "C four". A
`kind: intermezzo` has a picture page and no fuller page; a `kind: card` is a title or closing card.

## Assembling a pipeline

A pipeline file is a list of stages, one per line, in the order they run:

```
set NAME=VALUE                        a setting; every tool sees it as GW_NAME
STAGE  once|each  TOOL [ARGS...]      # a note
```

`each` runs once per take, `once` runs on the first take's pass only. A tool ending `.py` runs with
python3, `.sh` with sh, `.js` with node. Every tool reads the same few settings (`GW_SRC`,
`GW_BUILD`, `GW_OUT`, `GW_CACHE`, `GW_TAKE`), writes its outputs where the next stage looks, and
can be run alone.

The stages in `pilot.pipeline`:

| Stage | Tool | Reads | Writes |
|---|---|---|---|
| voices | `tools/voices.py` | `src/cast` | the Piper voices, checked by md5, and their model cards |
| narrate | `tools/narrate.py` | sources, cast | `build/X/narration.wav`, `build/X/timeline.json` |
| captions | `tools/captions.py` | timeline | `pilot-X.vtt`, `transcript-X.txt`, chapters |
| mp3 | `tools/mp3.sh` | narration, chapters | `pilot-X.mp3` |
| slides | `tools/slides.py` | sources, `src/figures.svg` | `slides.html` |
| frames | `tools/frames.js` | deck, timeline | one folder of frames per shot |
| mp4 | `tools/mp4.sh` | frames, narration | `pilot-X.mp4` |
| burn | `tools/burn.sh` | video, captions | `pilot-X-captioned.mp4` |
| stills | `tools/stills.js` | deck, timeline | `stills/X-*.png` |
| check | `checks/run.sh` | everything | a verdict |

**To add a stage**, add one line. For example, a stage that makes a smaller copy for phones:

```
small     each  tools/small.sh      # pilot-X-small.mp4
```

where `tools/small.sh` is any script that reads `pilot$GW_TAKE.mp4` (with a dash) and writes its
own file. **To swap a stage**, change the tool on its line: `narrate each tools/narrate-other.py`.
**To make a new pipeline**, copy the lines you want into a new file. `audio.pipeline` is one:
narration, captions and an mp3, no pictures, and the checks that apply:

```sh
sh run -p audio.pipeline
```

Tuning without code: `GW_FPS`, `GW_XFADE` (crossfade seconds), `GW_GAP_TURN` and `GW_GAP_SAME`
(pauses between and within speakers), `GW_LUFS` (loudness), `GW_PRESET`, `GW_CRF`. Each tool's
first lines list what it reads.

## The checks, and the faults planted to prove them

`sh checks/run.sh` runs one check per promise; `sh checks/run.sh --prove-red` builds a broken copy
for each and requires that check to turn red, ending `PROVE-RED OK`. The checks are POSIX sh and
awk, plus JavaScript where a browser is needed, so they read the work with different hands from
the Python that wrote it.

Since the book moved to its home in inputloop's pubs (2026-11-04), a bare `sh checks/run.sh` checks
the book edition that folder carries (words, inventory, current, privacy, site, sources,
bookoffline, bookread) and a
bare `--prove-red` plants that edition's faults. The pilot's full set, which reads the narration, the
video and the deck that `sh run` makes, is `sh checks/run.sh pilot` and `--prove-red pilot`; the
pilot pipeline's own check stage asks for it. `sh run -p book.pipeline` builds the book edition alone.
Two promises came with the move: **current** (book.html and book-hosted.html are byte for byte what
`tools/book.py` makes from `src/`; planted: the cover's words edited after the build, and
book-hosted.html edited by hand) and **site** (the ghostlights.theater source in `site/` carries this
book.html as its show page; planted: that copy one byte long, and missing). A third came with the C4
files: **sources** (every C4 file a witness row cites has an entry in `sources/INDEX.org`, each row's
`sha:` is its entry's recorded hash, each copy in `sources/` hashes to its entry, and nothing sits there
unlisted; planted: a copy a byte long, a row's `sha:` changed, and an unlisted file). The same day the
book gained a privacy note (Corwin's choice: "Keep it, disclose it"): **privacy** (the note in the map
names exactly the keys the page's script writes, the page sets no cookie, and the note carries the
request-log sentence of `src/privacy-log`, which matches its stamp, with no copy typed into
`tools/book.py`; planted: a second key written, a key named that nothing writes, a sentence typed into
the book's code, and the sentence file edited by hand), the browser promise **forget** in `checks/book.js`
(opening the map stores nothing, a picked view is stored, Forget my settings removes every `gwbook.`
key and says so, and `#privacy` opens the map at the note; planted: one fault for each of the last
three), and more for **site** (the house pages carry no script, and the front page links to the note and
carries the sentence of `site/privacy-log`, which matches its stamp; planted: a script on the front page,
the link gone, the sentence gone, and the sentence file edited by hand). Both sentences are rendered by
lo1re from the logreq register (his pick A+agent, live on gw33 since run 20261104T225156Z).

| Promise | Check | Planted faults |
|---|---|---|
| every output exists | each file is there and not empty; videos hold sound and picture; at least three stills a take | the mp3 removed; the transcript emptied |
| the video is as long as its narration | ffprobe; within 0.2 s, for both copies of both takes | the video cut 1.5 s short |
| every caption cue lies inside the audio | every cue starts at or after 0, ends after it starts, and ends by the audio's end | a cue ending after the audio; a cue that ends before it starts |
| the page word limits hold | picture pages at most 40 words, all on the easy list; fuller pages at most 250 | 20 words added to a picture page; 80 to a fuller page; "inventory" on a picture page |
| the deck loads nothing from another host | no outside address in markup or style, no network calls in script, no inline event handlers, a CSP of `default-src 'none'`; then a browser loads it and counts requests | an image from another host; `onclick=` on a button; the CSP removed with an outside stylesheet |
| the deck works with the keyboard and honours reduced motion | a browser turns pages with arrows, Page keys, Space, Home, End and numbers, opens a fact mark with Enter and closes it with Escape, clicks the buttons; with reduced motion asked for, nothing animates and pages do not slide | the keydown listener renamed away; the reduced-motion rule disabled |

Planted decks are built through the real `tools/slides.py`, so their policy hashes are honest and
each turns red for the reason it names.

## The guides, and Chad

**Spoke** (a small ghost at the hub, who sees; SPOKE is a C4 word, on the S row of `m/t`) and
**Pin** (a mouse with a pencil, who writes down what was seen, with when and where; in C4.md a PIN
is "a statement someone has made, about anything") are this session's proposal. They are Corwin's
to keep, rename or replace; the figures live in `src/figures.svg` and the voices in `src/cast`.

**Chad** is Corwin's character. In this pilot he is brief, confident, a little out of place, and
explains nothing. His one idea is in his card and in two words of his line. The source carries a
writers' note on where it might land; the page and the voices do not.

## The book (book.html)

`tools/book.py` (the `book` stage) makes `book.html` from the same sources: the picture book, read
like a paper one.

- **The first opening** is the title page, with the title lettered into the drawing and never
  repeated in its words, and the dedication facing it. `dedication:` in `src/book` holds the words;
  left empty, the page is blank but for the ghost light.
- **Then facing pages:** the picture page on the left, full size, and the fuller page on the right. A
  Part page faces each of Chad's visits. NEWS and the ChangeLog (`src/NEWS`, `src/ChangeLog`) sit at
  the back, and the map of the shop is inside the back cover.
- **The words move.** A spread's `== layout ==` section says where its picture-page words go:

  | line | means |
  |---|---|
  | `picture: full` or `top` | the drawing covers the page (draw it 800 x 800), or sits at the top (800 x 600) |
  | `words: below`, `above`, `inset`, `scatter`, `wrap` | under or over the drawing; in one block on it; each paragraph in its own place; or flowing round its shape |
  | `at: X Y W` | for `inset` and `scatter`: a block's top-left corner and width, in percent of the page; `scatter` takes one per paragraph, in order |
  | `side:`, `outline:` | for `wrap`: which side the words go, and the drawing's edge as a polygon in percent of the page |
  | `align:`, `ground: soft`, `size: N` | alignment; a soft paper glow behind words on the drawing; the words' height in percent of the page width |

- **Off the paper:** the numbered marks open Pin's notes, and M (or the Map button) opens the map,
  drawn three ways from one list of rooms: a floor plan, a roguelike's tiles, and a board of cards.
  Someone who pages back and forth as if lost is offered the map, at most once in two minutes.
- **What it remembers:** one thing, the map view last picked (`gwbook.look`), in the reader's browser
  only. The note under the map says so and has a Forget my settings button; `book.html#privacy` opens
  the map at that note.
- **A narrow screen** shows one page at a time, picture page first.
- **The type fits:** a fuller page that runs long has its type stepped down (to 74% at most) until it
  fits, as a typesetter would, so that a wide screen never scrolls a page.

The book's promises are checked in a browser by `checks/book.js` (facing, title, keys, map, lost,
motion, narrow, figures, fit) and offline by the same check as the deck; `sh checks/run.sh --prove-red
book` plants a fault for each.

## Before anything here is published

The plan says the book draws only on atoms whose source is already public (`MINIONS.md` N4). This
pilot cites files in the C4 tree as read on Avalon; some of them (`m/t`, `C4.md`) may not be public
yet. Publishing is Corwin's act; the check to make first is that each file named in a `from:` line
is public, or that he chooses to make it so.

He chose (2026-11-04: "OK to publish underlying materials RE C4 so there is contunity for
readers/researchers"). The C4 files the witness rows cite are in `sources/`, each at its C4 path,
after a sweep for secrets, private details about people, and private repositories or hosts;
`sources/INDEX.org` lists every one with the rows that cite it and its hash then and now, and marks
the two the sweep held back.

Mentat (for Corwin, claude-opus-5-5)
