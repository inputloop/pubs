# Colophon

*So You Want To Build A Ghostwheel?*, a pilot in three pieces (Chad's first intermezzo, "door" and
"letters"), in two takes: A, "the company talks to you", and B, "the lap reader".

Words and pictures: Copyright 2026 Corwin Brust; CC-BY-SA-4.0.
Code (everything in `tools/`, `checks/`, `run`, the pipeline files): Copyright 2026 Corwin Brust;
GPL-3.0-or-later.

## Voices

Every voice is a Piper voice from the rhasspy/piper-voices repository on Hugging Face. Each was
chosen only if its own model card names training data that is free **and** says the voice was
trained from scratch on it (or from another voice that passes the same test). The licence and
training lines below are quoted from each model card as read on 2026-11-03; the files were checked
against the md5 sums in the repository's `voices.json`.

| Voice | Speaks for | Dataset, as the card gives it | Licence, as the card gives it | Training, as the card gives it |
|---|---|---|---|---|
| `en_US-ljspeech-high` | the narrator (take B); the first of take A's three narrating voices | LJ Speech, https://keithito.com/LJ-Speech-Dataset/ | public domain | "Trained from scratch for 1000 epochs on medium quality settings using the LJ Speech dataset." (Bryce Beattie, https://brycebeattie.com/files/tts/) |
| `en_US-kristin-medium` | the second of take A's narrating voices | LibriVox recordings, https://librivox.org | public domain | "Trained from scratch on medium quality settings for 2000 epochs. I put together the dataset ... All recordings came from LibriVox.org." (Bryce Beattie) |
| `en_US-libritts-high`, speaker `p8138` | the third of take A's narrating voices | LibriTTS, http://www.openslr.org/60/ | CC BY 4.0 | "Trained from scratch on train-clean-360." |
| `en_US-libritts-high`, speaker `p3032` | Pin (both takes) | LibriTTS, http://www.openslr.org/60/ | CC BY 4.0 | "Trained from scratch on train-clean-360." |
| `en_GB-cori-high` | Spoke (both takes) | LibriVox recordings, https://librivox.org | public domain | "Trained from scratch on high quality settings for 500 epochs. I put together the dataset ... All recordings came from LibriVox.org." (Bryce Beattie) |
| `en_US-norman-medium` | Chad (both takes) | LibriVox recordings, https://librivox.org | public domain | "Trained from scratch on medium quality settings for 1200 epochs. I put together the dataset ... All recordings came from LibriVox.org." (Bryce Beattie) |

**Attribution for LibriTTS (CC BY 4.0):** LibriTTS, a corpus derived from LibriSpeech for
text-to-speech, by Heiga Zen and others (Google), 2019, published at http://www.openslr.org/60/
under CC BY 4.0. LibriSpeech in turn comes from LibriVox's public-domain readings. The speaker
labels `p3032` and `p8138` are the corpus's own reader numbers. Pin's voice and one narrating
voice are synthesized from this model; no change was made to the model.

**Thanks** to the LibriVox readers, whose public-domain recordings stand behind four of these six
voices, to Keith Ito and Linda Johnson for LJ Speech, and to Bryce Beattie, who trained and released
the LJ Speech, Kristin, Cori and Norman voices.

### Voices read and not used, and why

- **`en_US-libritts_r-medium`** (LibriTTS-R, CC BY 4.0, 904 speakers), the voice first suggested
  for the guides. Its card says: "Fine-tuned from English lessac medium on train-clean-360." The
  lessac voice's card points to the Blizzard 2013 licence, which, as read on 2026-11-03, grants "a
  non-exclusive and non-transferable licence, without the right to sub-licence" for "Research
  Purposes" only, and excludes "the development, marketing, commercialisation, sale or licencing of
  voice synthesis". So the LibriTTS-R voice starts from weights trained on data that is not free.
  The same holds for every English voice whose card says "Finetuned from U.S. English lessac
  voice": alan (medium), alba, aru, jenny_dioco, northern_english_male, semaine, vctk, amy (medium), arctic,
  hfc_female, hfc_male, joe, kusal, l2arctic, mike, reza_ibrahim, ryan (medium) and sam. The
  LibriTTS (not -R) voice used here was trained from scratch, and passes.
- **Voices fine-tuned from Ryan** (alan low, amy low, danny, kathleen, southern_english_female):
  the Ryan dataset's card gives CC BY-NC-SA 4.0, which is not free.
- **`en_US-bryce-medium`**: public-domain data, but "Finetuned ... from an unreleased voice", whose
  data cannot be read.
- **`en_US-john-medium`**: passes (fine-tuned from Kristin), but its pitch sat too close to Chad's
  voice to tell them apart.

### The engine

- **Piper** (`piper-tts` 1.8.0, from https://github.com/OHF-voice/piper1-gpl), GPL-3.0-or-later,
  with its bundled espeak-ng phoneme data (GPL-3.0-or-later). Piper ran for every line; the
  espeak-ng fallback in `tools/narrate.py` was not needed.

## Sounds

- **The page turn** before each new spread is made in the pipeline by ffmpeg from filtered pink
  noise (`tools/narrate.py`, `page_turn`). No recording is used.

## Pictures

- Original SVG drawings made for this book: the shop door and its wheel, the hall of seventeen
  lettered doors, Chad's spotlight, the cover wheel and the goodbye. The three figures are drawn
  once, in `src/figures.svg`, and placed into each picture.
- **Spoke** (a small ghost) and **Pin** (a mouse with a pencil) are the session's proposal for the
  two guides.
- **Chad** is Corwin's own character, by name. The drawing is an original figure (a round,
  smiling face, a cap worn backwards, a teal sweater, a thumb up and a card with an arrow) and is
  not drawn from any image of a "Chad" found elsewhere.
- The two diagrams on the fuller pages are drawn by `tools/slides.py` from the data in each
  spread's source: the rings from 17 hosts, 2 kept aside and an odd divisor of 3; the letters
  from the seventeen lines of C4's `m/t`, copied into the source with that file's hash.

## Homages

Structural only; no art, character or text is taken from any of these books (from `PLAN.md` §6).
In this pilot: *Frog and Toad Are Friends* (Arnold Lobel, 1970), two friends who see things
differently, in Spoke and Pin; *The Cat in the Hat* (Dr. Seuss, 1957) and *Go, Dog. Go!* (P. D.
Eastman, 1961), a page written from a short list of easy words, in `src/easy`; *What Do People Do
All Day?* (Richard Scarry, 1968) and *The Way Things Work* (David Macaulay, 1988), the cutaway
diagram, in the fuller pages; *Harold and the Purple Crayon* (Crockett Johnson, 1955), drawing
from data as you go.

## Facts

Every fact about C4 on a fuller page comes from the C4 tree itself, read read-only on Avalon at
2026-11-03T20:08:58Z. Each spread's source lists, for every fact, what the file said, the file and
line, and the file's sha256 at that moment; the deck shows these rows behind each numbered mark.
Files read: `C4.md`, `C4-LANG.md`, `m/t`, `d/m/t`, `m/v/t`, `facts/ghostwheel-ring-of-rings`,
`facts/ghostwheel-cloud-the-public-c4`, `facts/c4-demands-two-registers.md`.

## Tools

Python 3.13 (standard library only), POSIX sh and awk; ffmpeg 6.1.1 with libx264 (GPL-2.0-or-later),
libmp3lame (LGPL-2.0-or-later) and libass (ISC); Node.js 22 with Playwright (Apache-2.0) driving
Chromium (BSD-3-Clause). The video's lettering is set in the fonts present where it was rendered:
Inter and Lora (both SIL Open Font License), DejaVu Sans for the burned captions (Bitstream Vera
licence). The deck itself loads no fonts; it asks for fonts already on the reader's computer.

Mentat (for Corwin, claude-opus-5-5)
