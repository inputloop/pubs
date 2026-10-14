# DESIGN 2026-09-27 — the door image (C4/ghostwheel as a door persona on Guix and on Arch)

**Status:** DRAFT · unsigned · [ours — revisable]. MINTED AS A BUILD TARGET, NOT AS A GATE. Nothing
here restricts what anyone else builds; it says what the first image is before it is built.

## 1 What the source asked for, in his words

From `q/2026-09-27-door-images/PROMPT.md` (sha256 `da636338f7d8f759…`, 2215 bytes), verbatim:

> Proposed:  C4 should consider GUIX and ARCH as two readers of the free software (and open source)
> logical meta-community at depth, building representations of itself targeting ISO and distribution
> by USB and optical media as priority release objective.  This should be the foremost principle
> deliverable, success of which minting represents the completion of the build phase on the onward turn.

The reading this design builds on is in `LENS-2026-09-27-guix-and-arch-as-doors.md` beside it.

## 2 The design itself

One door, two readers. The door is the same small set of files; each reader (Guix, Arch) wraps it
in its own image recipe.

- **The door** (`door/`): what a person meets on first boot — `README` (what this is, in common
  words), `WELCOME.org` (the literate entry: open it in Emacs and the steps run), `TERMS` and
  `PRIVACY` pointers (the ghostwheel build rule: minted anew each build turn), `SOURCE` (how to get
  every line of source the image carries — the GPLv3 §6 duty, see LENS board 5), and the persona
  byline. No personal data, no host names, no paths from the lab.
- **Guix reader** (`guix/c4-door.scm`): an `operating-system` that inherits Guix's own
  `installation-os` and adds Emacs, Git and GnuPG and the door under `/etc/c4-door/`. Built with
  `guix time-machine --commit=v1.5.0 -- system image --image-type=iso9660 --label=C4_DOOR guix/c4-door.scm` (the pin was added after QA pass 1; see QA-PASSES). FSDG-clean by
  construction (Guix is on the FSF list).
- **Arch reader** (`arch/profile/`): an archiso profile derived from `releng`, with the door in
  `airootfs/etc/c4-door/`. Named *based on Arch Linux*, never "Arch Linux"; no Arch logo on media
  (trademark policy, LENS board 4). Whether it ships `linux-firmware` is a fork for Corwin (LENS
  board 3), recorded in `arch/FIRMWARE-FORK`; the default in the profile is the FSDG-leaning choice
  (omit it) so the image errs toward the movement he speaks for.
- **Media**: USB (hybrid ISO, any stick of 2 GB or more) first; DVD second. A CD (700 MB) cannot hold
  either reader's stock installer (Guix 1.5.0: 1,188,261,888 bytes; Arch 2026-09-01: 1,608,286,208
  bytes, both measured by `curl -sI`), so "optical" means DVD.
- **The check** (`door-check.sh`, with `--prove-red`): each rule above as a test that can fail.

## 3 What it adds and does not add

Adds: a buildable seed and a check. Does not add: signing (his pen), a release (his door),
branding (tombstone COPYING until he blesses), any claim that the image boots — that claim is
earned only by a boot receipt (QEMU or a real stick), which the QA plan names.

## 4 Open questions routed to the bank

- D1 Arch firmware: omit `linux-firmware` (FSDG-leaning, fewer machines boot to Wi-Fi) or include it
  (more machines work; not FSDG). His.
- D2 Name on the media: "C4 door" / "ghostwheel door" / something a comrade org prints with its own logo.
- D3 Source on the medium (GPLv3 §6a, a second DVD or a partition) or a written offer (§6b, three years).
