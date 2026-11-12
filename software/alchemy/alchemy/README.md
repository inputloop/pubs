<!--
SPDX-FileCopyrightText: 2026 INPUTLOOP
SPDX-License-Identifier: CC-BY-SA-4.0
-->
# alchemy

A game of putting two things together to find a third, and of pulling a thing apart to see what it
was made of. Corwin and Dee have both enjoyed the phone games of this kind; this one is free software,
asks for nothing, and keeps its recipes where anyone can read them.

**Play it:** corwin.cloud/alchemy (with scripts on; with scripts off the page still shows how it works).

## The decks

| deck | first matter | what it is for |
|---|---|---|
| `classic` | air, earth, fire, water | the game as people know it |
| `c4` | file, word, key, person | C4's working parts: compose a capability, or split one to see what it is made of and why |

Each deck is a folder of atoms (one fact per file), read by path. `decks/c4/rx/person/record` holds
`consent` and, on its second line, why. The layout and the seven promises a deck keeps are in
`../man/al1ch.md`.

## The tool

    sh h/al1ch decks
    sh h/al1ch combine classic water fire     # fire + water = steam
    sh h/al1ch split c4 consent               # consent = person + record, and why
    sh h/al1ch reach c4                       # how far each element is from first matter
    sh h/al1ch check classic                  # the seven promises
    sh h/al1ch --prove-red                    # each promise shown breaking
    perl t/al1ch-spec.pl                      # the second reader agrees, byte for byte
    perl t/al1ch-spec.pl --prove-red

## Adding to a deck

Make a file `rx/A/B` (A <= B) with the product on line 1 and why on line 2, then `al1ch check`. A new
deck is a new folder with `about` and `start/`. The recipe (how this game is made and why it is made
this way) travels to the pubs shelf as `recipes/alchemy`.

Copyright 2026 INPUTLOOP: Corwin Brust, Bryant Frankford and Contributors. Code GPL-3.0-or-later OR
LGPL-3.0-or-later; decks and prose CC-BY-SA-4.0. Mentat (for Corwin, claude-opus-5-5)
