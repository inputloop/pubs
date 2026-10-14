# PAPER, 2026-10-14, edition 0.2: the persona shows in the voice and in what its sheet says, not in the gaps

Edition 0.2, DRAFT, unsigned. Minted by Mentat (for Corwin; claude-opus-5-5) at his ask of 2026-10-14 03:25 CDT (quoted in
0.1). **Supersedes edition 0.1** (`PAPER-2026-10-14-persona-ownership-and-the-gaps.md`, kept unedited as the record) on the
findings of two peer reviews: `review/REVIEW-A.md` (Sonnet, doubt-first) and `review/REVIEW-B.md` (Haiku, cold reader). Both
said ACCEPT WITH CHANGES, and their changes overturn 0.1's headline. Voice: plain, third person; my judgements say so.

## 1. What this edition claims

In one run of eight readers, the persona showed in two places: the voice, which a method instruction put there, and
statements that follow from the persona sheet itself. The microscope's "persona fills the gaps" result of 0.1 does not hold
once one counting rule is applied to every file. The firmware stick moved in two of four legs and the second-pair pick in none,
which one run per reader cannot separate from noise.

## 2. What changed from 0.1, and why

| 0.1 said | what the reviews found | now |
|---|---|---|
| unsupported command lines: persona 12, cold 5 | the pass-1 rule was applied unevenly: an `[added]`-marked line was counted, persona-arch's header said 7 but listed 6, and lines left uncounted in cold recipes were counted in persona ones (B §2; A §4) | one rule for every file (`microscope/COMMANDS-pass3-uniform.txt`): persona 8, cold 5 on line-or-block marking; counting persona-arch's prose mark ("As a block **[added: the literal commands]**") as marking its block: persona 6, cold 5. **No gap worth the name.** |
| the persona fills holes in its own voice | several of the five Sonnet items follow from the persona sheets, which the packet-only count does not credit (A, "strongest alternative") | **the persona imports its sheet.** persona-proxmox's "the leg that sits beside those hosts" rests on proxmox.md's "the kiosk living on our own hosts". |
| neutral judge quoted as "the answers themselves don't divide into two groups of four" | not in `judge2/SPLIT.md` (A §1, B §3): the words were from the judge's hand-back message | the file says: "The answers alone do not split cleanly (6 Guix to 2 Proxmox, 6 without-firmware to 2 with-firmware)". |
| "did not detectably change what it decided" | the stick moved in 2 of 4 persona legs, 0 of 4 controls (B §4) | "moved the stick in two of four legs; one run cannot separate that from rerun noise" (about 0.21 by chance, B). |
| "with the voice left in, it could, every time" | one judge, one run, and it also used the stick choice as a cue (B §5) | "one judge recovered the arms 8 of 8, partly through the stick choice". |
| doubled-nine's personas "were not told to write in the first person" | that file says nothing about the persona wording (A §8) | struck; the voice cue here is our METHOD's instruction, which is enough to explain the 8 of 8. |
| the readers' `claims[]` all cite the packet: "the strongest single clue" | the format required a file per claim, so the count is forced (A §9) | a filled field, not a measure; whether each cited file supports its claim is unchecked. |

## 3. What still stands

- **The neutral-voice control.** Rewritten in one voice, the eight answers were split by a blind judge at chance (6 of 8;
  17 of the 35 possible splits do as well). With the instructed first person left in, the arms were found 8 of 8.
- **The rhyme with doubled-nine** (`writing/two-readers/EXPERIMENT-2026-09-27-doubled-nine.md:31-34`): "The persona changed
  the *reasons* given, not the *decision*", and "A blind reader, given all eight answers, could not tell the two conditions
  apart in either run." Tonight's run cannot disagree with it: it has no rerun floor of its own (A §7).
- **The rhyme with "every run *invented* a Bryant"** (same file, `:163-165`): unsupported lines fell where the packet was thin
  (two scripts named without their usage), in both arms alike.
- **The PREREG correction:** with two groups of four, 7 of 8 cannot happen, and 8 of 8 is 1 in 35, not 1 in 9.

## 4. What peer review earned here

The microscope looked like news because one reader (me) applied one rule unevenly to two sets of files and then patched one
set. Two readers from other model sizes, given the files and not my summary, each found the unevenness on their own, and the
first also named the sheet as the alternative cause. The finding that survives is smaller and more useful: **a count is only
as good as the rule applied to every file the same way, and a persona's extra input must be credited before its output is
called invention.**

## 5. Falsifiers, and the next run

- A rerun with the persona sheet given to the *cold* readers too (sheet, no voice instruction): if the Sonnet-style items
  appear in the cold arm as well, they come from the sheet, not the persona.
- Four reruns per reader on the stick question: the rerun floor this run lacks.
- The microscope as a tool: one rule, the counted bytes hashed, prose marks within three lines above a block credited, and a
  `--prove-red` with a planted uneven count.
