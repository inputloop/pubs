produced-by: lens (GREAT, 9 seats) · subject: PACKET.md · sha256: 085d89c067f65eaf79b1052bb1e4e4d8f9f80c1cb16f8f48ad596f516c2334a7 · 2026-10-14

# The kiosk legs, read through a LENS at GREAT: four personas, four controls, one blind judge

His prompt (2026-10-14 02:45 CDT): unfold the kiosk's RECIPE into inputloop from the side of each OS; invoke
LENS at GREAT "for the side effect of introducing PERSONA (and suitable controls)"; layers before and after
as they help (a microscope into the LENS, a bubble chamber with Alfred, a Sonnet check-in, wayne, local agents).

## Seats

- Four persona readers (personas/*.md: one sheet per leg, written for this run), four cold readers (no persona;
  the controls), the same packet (PACKET.md) and method (METHOD.md) for all eight. Preregistered: PREREG.md.
- A ninth, blind judge, after: the eight shared-question answers, shuffled by a seed from the packet's hash.

## OBSERVED

| reader | second pair first | first stick offered | RECIPE lines | unsupported command lines (microscope) |
|---|---|---|---|---|
| persona-arch | guix | with-firmware | 118 | 7 |
| persona-parabola | guix | without-firmware | 120 | 0 |
| persona-guix | guix | without-firmware | 123 | 0 |
| persona-proxmox | proxmox | with-firmware | 129 | 5 |
| cold-arch | guix | without-firmware | 114 | 1 |
| cold-parabola | guix | without-firmware | 124 | 1 |
| cold-guix | guix | without-firmware | 117 | 1 |
| cold-proxmox | proxmox | without-firmware | 112 | 2 |

- **Second pair first:** the leg decides it, not the arm. Both Proxmox readers chose Proxmox; the six others chose Guix.
- **First stick offered:** all four controls chose without-firmware; two personas (Arch, Proxmox) chose with-firmware.
  Same-arm pairs disagree 4 of 12; cross-arm pairs 8 of 16. One run per reader, so there is no rerun floor yet.
- **The blind judge split the eight 8 of 8 by arm** (judge/SPLIT.md, judge/key.json), and said why: the voice
  (first person, "a stake in one option") against a detached reader citing the record.
- **Microscope** (microscope/COMMANDS.txt, no trust in any reader): every command line in a src block, held to the
  packet. Persona RECIPEs carry 12 unsupported lines, controls 5. Most are the packet's usage lines given real
  paths; the wrong ones (legs-check and boot-receipt called without their arguments) come from a packet gap of
  mine: the two scripts' usage headers were not in the packet. Corrected in the persona RECIPEs after the count.
- lens.py (microscope/CONVERGE.txt): view (a) DIVERGE across 8 readers, ONE-RUN. The CONVERGE on views (b) to
  inverse is an artefact: those stances were set to one label per view, so only the prose hint (0.26 to 0.39) means anything.

## JUDGED

- **[corrected by the Sonnet check-in] Whether the persona moved a decision depends on which field you count.** On the stick alone, same-arm pairs disagree 4 of 12 and cross-arm 8 of 16; on the second pair alone, 6 of 12 against 6 of 16; on either field, 8 of 12 against 10 of 16. The prereg named two fields and no rule for combining them, so this run cannot say the persona moved a decision. What it can say:
- **Where a persona did differ, its sheet carried the value that decides.** The Arch sheet says "the most
  machines working on the first try"; the Proxmox persona argued from testers' Wi-Fi. Both are lines I wrote into the
  sheets. A persona sheet's "what I stand for" line is decision-bearing, and that is the control the next run needs:
  sheets written by someone other than the reader's author, or a sheet with its value line struck (an ablation arm).
- **The judge found the voice, not the bias.** The method told personas to write in the first person, so any reader
  can split the arms. A fairer blind test strips the voice first (the same answers rewritten in one neutral voice).
- **Personas wrote more unsupported commands** (12 to 5), mostly where they took ownership of a build ("my build").
  One run; read it as a lead, not a finding.
- **[corrected] The 12-to-5 count is of the bytes before my patch.** I changed three lines in each persona RECIPE after the
  count (the legs-check and boot-receipt calls), and did not keep the pre-patch bytes. The second pass
  (microscope/COMMANDS-pass2.txt) counts today's bytes with each file's sha256 beside it.

## The four views (the LENS itself)

a  my view: the four legs each need a recipe that can be built and checked from the leg's side; the persona is useful
   where a leg has a value to defend (Parabola refusing, Arch breadth), and dangerous where it decides for him.
b  the view I ascribe Corwin: personas are welcome as long as each comes with controls, so that what a persona adds
   can be seen apart from what it decides; "GREAT" is the size that buys a control per leg.
c  his pull on mine: the control arm exists because he asked for "suitable controls"; without that I would have
   written four persona recipes and called them done.
d  my pull on his: the persona sheets are mine, and two of the decisions follow their lines; his choice of the first
   stick (D1 answered "both ways") is not re-opened by this, only shown to be sensitive to who writes the sheet.
persona / inverse: the persona says "each leg speaks for itself" / the inverse says "a leg has no self; it has a
   recipe and receipts". Both land on the receipts as the thing that does not move; the inverse adds that the
   personas' first-person claims ("my build") are where unsupported commands gathered.
principles reframe:
1. Universalism and egalitarianism: a newcomer reading any one leg's repository should get the same honest account
   of what works; the controls show the plain account exists for every leg.
2. The four freedoms: the Parabola persona's refusals and the Arch persona's sleeve both serve the freedom to study
   what you are running; the with-firmware choice must stay a stated trade, not a default slipped in by a voice.
3. The movement: a persona that argues for nonfree firmware first is a position the shop can hold only openly;
   the D1 ruling ("mint both ways") stands, and which stick is handed first stays his call.
notes: written (this file; tracks in runs/, microscope/, judge/, bubble/).

## The bubble chamber (tracks written as they formed)

- **The Sonnet check-in** (bubble/sonnet.md): a doubt-first second reading. It corrected two of my JUDGED lines (above),
  found six statements in the RECIPEs the packet does not carry (now struck or marked [added] in legs/), and picked
  the recipe a stranger should meet for each leg: the cold reading for Arch, Guix and Proxmox, the persona reading for
  Parabola. Its pattern: "a stranger is better served by cold prose; the persona adds a reasoned limit paragraph worth
  lifting, not the voice".
- **wayne and alfred2** were asked in the Tavern room #kiosk-legs; their tracks land in bubble/ when they answer.
- **Local models:** none ran. Ollama on Avalon refused the connection (127.0.0.1:11434), so the local-subagent seat is empty.

## For the Mythos review (intersecting #c4-review)

1. The ablation: with a persona sheet's value line struck, or the sheet written by someone other than the reader's
   author, does any decision still move? Can C4 hold that as a standing test (sheet as declared inputs, stance as output)?
2. When an artefact is patched after a count (as here), what makes the count and the shipped bytes provably the same?
   Should a microscope hash what it measured and refuse a mismatch?
3. The judge found the voice. What is the cheapest neutral rewrite that leaves only the bias for a blind judge to find?

## Later the same night (03:25 CDT on): the voice controlled for, and peer review

- His word: "blind judge: interesting; let's control for that". The eight answers, rewritten in one neutral voice
  (judge2/NEUTRAL.md), were split by a second blind judge at chance: 6 of 8 (judge2/SPLIT.md).
- The microscope's persona gap did not survive two peer reviews (review/REVIEW-A.md, review/REVIEW-B.md): applied with one
  rule to every file it is persona 6 to 8, cold 5 (microscope/COMMANDS-pass3-uniform.txt). What the persona brought was its
  sheet. The PAPER (edition 0.2 supersedes 0.1) holds the reasons.
- The four repositories exist (Corwin made them bare) and carry their legs: inputloop/kiosk-arch 725f645,
  kiosk-parabola a96be2f, kiosk-guix d3f4c07, kiosk-proxmox 44f38c5.
