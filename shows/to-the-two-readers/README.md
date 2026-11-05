# To the Two Readers

A second show for Ghostlights (ghostlights.theater): an animated mark from Corwin's hand, "To th' ~~TRUE~~ two
READER across TIME & SPACE", with its story drawn from the shelf, every line naming its witness.

| File | What it is |
|---|---|
| `public/logo.svg`, `public/logo-still.svg` | the mark: the page writes itself, TRUE is struck, "two" comes in blue, the page turns to the reader opposite and back (16 s, looping); and its still |
| `public/show.svg`, `public/show-still.svg` | the same with its five captions, on the theater's dark stage |
| `public/index.html`, `public/show.css` | the show's page: what happens, what is his and what is mine, what is built, and the witnesses |
| `WITNESSES` | the facts, in the book's form (fact, said, seen, by, from, sha, state, note) |
| `STORY.md` | the story: draft 1 from the shelf, then draft 2 after the book's coaching |
| `tools/make.py` | draws it all (Python, standard library) |
| `checks/run.sh` | one check per promise (sh and awk), `--prove-red` for the planted faults |

```sh
python3 tools/make.py
sh checks/run.sh && sh checks/run.sh --prove-red
```

Not yet: his four photographs (they travel only if he
says so; their hashes are in WITNESSES).

Words and pictures: Copyright 2026 Corwin Brust; CC-BY-SA-4.0. Code (`tools/`, `checks/`): Copyright 2026
Corwin Brust; GPL-3.0-or-later. Mentat (for Corwin, claude-opus-5-5)
