<!--
SPDX-FileCopyrightText: 2026 INPUTLOOP
SPDX-License-Identifier: CC-BY-SA-4.0
-->
# al1ch: the alchemy deck, as both readers must read it

`h/al1ch` (POSIX sh and awk) and `t/al1ch-spec.pl` (Perl) follow this page. Neither copies the other;
the Perl reader reads the atoms itself and its fold and summary must equal the tool's, byte for byte.
The web game (corwin.cloud, `src/js/alchemy.js`) is a third reader of the fold.

## A deck

A folder. Its name is the deck's name.

| path | holds |
|---|---|
| `about` | `title: TITLE`, then a blank line, then one sentence saying what the deck is |
| `start/ID` | one file per element of first matter (what a player starts with); the text is for people |
| `names/ID` | the element's display name, line 1, when the ID alone reads badly (`philosopherstone`) |
| `rx/A/B` | one reaction: A and B together make line 1 (an ID); line 2 says why. Exactly two lines |

An ID is `[a-z0-9]+`. A pair is kept once, in byte order: `rx/air/fire`, never `rx/fire/air`.
An element that is not first matter exists because some reaction makes it; there is no element list.

## The fold

One table, one row per line, TAB between fields, parts in this order and each part sorted bytewise
(`LC_ALL=C`):

    about TAB deck TAB title TAB sentence
    start TAB id
    name  TAB id TAB display
    rx    TAB a TAB b TAB product TAB why

## The promises (`check`)

1. Every ID (start, names, both halves of a pair, every product) is `[a-z0-9]+`.
2. Every pair is ordered: a <= b.
3. Every reaction file is exactly two lines, the second (the why) not empty.
4. `about` has a title and a sentence.
5. There is first matter, and no reaction makes first matter (first matter does not split).
6. Every reaction fires: both its ingredients can be made, starting from first matter.
7. Every `names/` file names an element of the deck.

All seven hold: one line, `al1ch check DECK: E elements (S first matter), R reactions, depth D, N dead
ends: OK`. E counts the elements reachable from first matter; depth is the most combinations any
element needs (fewest-path); a dead end is an element no reaction uses. Any promise broken: `... NOT OK`
last, exit 1 (the tool also names each break on a line of its own before it; the second reader does not).

## Split, and why it is in the game

`split DECK X` lists every pair that makes X, each with its why. On first matter it says so and does
not fail. Combining is how a player discovers; splitting is how a player (or a reader of C4) learns
what a thing is made of, and that one thing can have two roads to it (`stone`; `c4`).

## Falsifiers

- The fold and the second reader's fold differ on any deck: one reader drifted from this page.
- A planted fault in `--prove-red` (either reader) leaves the deck green.
- A deck checks OK and the web game cannot reach an element the reach table lists: the third reader drifted.
