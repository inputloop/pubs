# LENS 2026-09-27 — Guix and Arch as doors, and what is ready to meet a release

*DRAFT · unsigned · written by Mentat for Corwin, from a research request he carried in from a
Discord conversation with Brigidt and Bryant. Form: LENS (`c/wf`). Beside it: the DESIGN, the
QA PLAN, the build loop's `SWING`, the images' recipes (`guix/`, `arch/`), the door itself
(`door/`), and `door-check.sh`.*

## The hypothesis, verbatim

From `q/2026-09-27-door-images/PROMPT.md` (sha256 `da636338f7d8f759…`, 2215 bytes), his words:

> Whereas: GUIX and ARCH are the existing front-doors for free software; they lack only door
> persona: enter C4/ghostwheel, and to the STEM user or the creative explorer these systems are
> likely great as is, but however (to complete a quick LENS of several likely utile ones to
> examine) to the Organization (especially Enterprise), and especially to the desktop home user
> who's computer interests are orthogonal to technology itself, these systems are incomplete as
> free software lacking meaningful interfaces making the ability to meaningfully express the
> potential for free use and composition to need absent exhaustively articulated statements of
> requirement, while at the same time providing exactly the literate leaning interface which
> should marry well to our designs.

> Proposed:  C4 should consider GUIX and ARCH as two readers of the free software (and open source)
> logical meta-community at depth, building representations of itself targeting ISO and
> distribution by USB and optical media as priority release objective.  This should be the
> foremost principle deliverable, success of which minting represents the completion of the build
> phase on the onward turn.

**A reading, in common words (mine, beside his, not in place of it):** Guix and Arch are already
the two best ways into free software for people who like technology. What they lack is a
friendly front door for everyone else: organizations, and especially people at home who want a
computer for their life, not for its own sake. Today those people must spell out everything they
want in technical terms before the system can serve them. Guix and Arch are both built on plain,
readable text files, which suits how C4 works. So C4 should build its own door on top of each,
make it into a disc image that boots from a USB stick or a DVD, and treat minting that image as
the finish line of the onward turn's build phase.

## The ask and the method

**Ask** (his Opportunity Discussion): evidence of *immediate* opportunity on release — help
minting, printing, distributing, using, testing and contributing; reaching supporters, lab
partners, and the organizations the contributors work with; physical as well as digital copies,
maybe with a group's own logo; and some local printing and making sent back into local
communities.

**Method.** Six lenses, one board each. Every board keeps two piles: OBSERVED (a source, quoted,
with where it came from, or a command and its output) and JUDGED (my reading, tagged [HIS]
[DOMAIN] [SKILL] [PLATFORM] [MINE]). Every concern carries the check that would dissolve it.
Then the build loop (`c4 build-loop`, `sw1ng`) was opened on the design and pushed as far as
this session's machine could take it; the build's state is the last board.

**Reading plan (considerate-reader, his reminder mid-turn).** The decision leaning on this
reading is what the first image must be and how it is named, labelled and handed out, so the
reading needed current release facts, the current rules of each project, and file sizes. The
avenues, lightest first: the tree's own licence copy (`man/licenses/GPL-3.0.txt`) for the GPL;
one `HEAD` per ISO for sizes; one read of each rule page. Arch's GitLab and wiki sit behind a
proof-of-work gate; three pages were read once, through the browser pane, and not again.
**One fault, mine:** www.gnu.org answered 429 twice (the GPL FAQ and the licence text), and I
then asked it once more through the browser (403). A 429 is the host speaking; the retry should
not have happened. The tree's copy answered the need. `git ls-remote` plus one blob would have
been a lighter way to read archiso's `releng` files than three rendered pages; noted for next time.

---

## Board 1 — the STEM user and the creative explorer ("likely great as is")

- **SENSE.** Does each system already serve people who enjoy the machine itself?
- **CANON (OBSERVED).**
  - Guix 1.5.0, released 23 January 2026, ships "ISO-9660 installation images, virtual machine
    images, and tarballs" for "i686, x86_64, ARMv7, AArch64, RISC-V 64-bit (newly added), and
    POWER9" (guix.gnu.org release post, read 2026-09-27).
  - Guix-HPC's 2025 report: "more than 30,000 packages available in Guix itself" and "almost 450
    people contributed to Guix itself" since January 2025 (hpc.guix.info, read 2026-09-27).
  - Arch ships a fresh ISO monthly: `archlinux-x86_64.iso`, last-modified 2026-09-01
    (`curl -sI https://geo.mirror.pkgbuild.com/iso/latest/archlinux-x86_64.iso`).
- **PROBE.** The same three reads, replayable by anyone.
- **READING (JUDGED).** Bears out. Both are large, current and well staffed for this reader. [DOMAIN]
- **STATUS.** gestured (read, not used by a STEM tester this session).
- **Falsifier.** A STEM user handed the door image who says it gets in their way. The door must
  step aside in one keystroke; Q7 in the QA plan is where that is tested.

## Board 2 — the Organization, especially Enterprise ("incomplete")

- **SENSE.** Do organizations use these systems, and if they do, how do they get past the lack
  he names?
- **CANON (OBSERVED).**
  - Guix-HPC names Inria, MDC, Utrecht Bioinformatics Center, CNRS, Université Paris Cité,
    University of Tennessee Health Science Center, Cornell, and AMD as participants; UTHSC runs a
    16-node cluster (438 cores) on it (hpc.guix.info, 2025 report).
  - Valve backs Arch with "a build service infrastructure and a secure signing enclave" (Levente
    Polyak, quoted by Tom's Hardware, 29 Sep 2024). SteamOS 3 is built on Arch.
- **READING (JUDGED).** Bears out, and more sharply than the hypothesis says. Organizations *do*
  use both, and the ones that succeed build **their own door on top**: Guix-HPC wraps Guix in
  channels and workflows for scientists; Valve wraps Arch in SteamOS for people who want to play,
  not to administer a computer. SteamOS is the existence proof that a door persona on Arch reaches
  people whose interests are orthogonal to technology, at scale. [DOMAIN] The opening for C4 is
  not "be the first door" but "be the door that is itself free, readable and electable", which is
  what C4 already is. [MINE]
- **STATUS.** gestured.
- **Falsifier.** An organization that tried Guix or Arch and left for a reason a door cannot fix
  (support contracts, certification). Ask one Guix-HPC member; the report names them.

## Board 3 — the desktop home user ("especially … incomplete")

- **SENSE.** Can a person at home, handed a stick, get to a working computer?
- **CANON (OBSERVED).**
  - Guix's download page tells installers to "Plug in an Ethernet cable or one of the few
    compatible WiFi cards for Internet access" (guix.gnu.org/en/download, read 2026-09-27).
  - Arch's `releng` profile ships `linux-firmware`, `linux-firmware-marvell`, `sof-firmware`,
    `intel-ucode`, `amd-ucode`, `b43-fwcutter` (archiso `configs/releng/packages.x86_64`, read
    once via the browser pane; copied to `arch/releng-packages.x86_64`).
- **READING (JUDGED).** Partly bears out. The persona gap is real. But on Guix the home user
  meets a *second* lack that no persona can supply: many laptops' Wi-Fi needs non-free firmware,
  which Guix does not ship. A door that opens onto no network fails the person it was built for.
  [DOMAIN] So "they lack **only** door persona" does not hold for this reader on Guix. It holds
  better on Arch, at the cost Board 4 names.
- **What would carry it** [MINE]: hand the Guix door out *with* hardware known to work on free
  drivers (refurbished machines, see Board 6), or with an Ethernet adapter, and say so on the sleeve.
- **STATUS.** gestured; no home user has tried the image.
- **Falsifier.** Boot the Guix door on four ordinary household laptops (4 is a house number,
  invented, not derived) and count how many reach a network. Three or four → this concern shrinks.

## Board 4 — the movement (the lens he speaks for, on behalf of the FSF, not as it)

- **SENSE.** Is each door one the free-software movement can hand out without a footnote?
- **CANON (OBSERVED).**
  - gnu.org's common-distros page: "Arch has no policy against distributing nonfree software
    through their normal channels, and nonfree blobs are shipped with their kernel, Linux."
  - Guix System is on the FSF's list of free distributions.
  - Parabola is the FSF-listed free distribution built from Arch. The Parabola pages this reading
    could see show no dated news newer than 2022-11-08 (parabola.nu, read 2026-09-27).
  - Arch trademark policy: a derivative may say it is "derived from Arch Linux", "based on Arch
    Linux", or "a derivative of Arch Linux"; logo use on merchandise needs a licence; "any
    commercial use" needs the Project Lead's approval; the contact address is on the policy page
    (terms.archlinux.org, read 2026-09-27).
- **READING (JUDGED).** Guix is the door the movement can hand out whole. The Arch door can be
  built and named honestly ("based on Arch Linux"), but it is not a free distribution in the FSF's
  sense even with firmware stripped, because Arch's own kernel is not cleaned. [DOMAIN] Parabola
  would be the free reader of Arch, if it is alive. [MINE]
- **Forks (his; none found already ruled — MEMORY.md, model.md and GHOSTWHEEL.org searched for
  firmware, FSDG, nonfree, trademark, ISO, DVD):**
  - **D1, firmware on the Arch door.** A (the profile's default): drop the six firmware packages;
    fewer machines work; closer to the FSF's rule, still not on its list. B: keep them as Arch
    ships; more machines work; say so on the sleeve. `arch/FIRMWARE-FORK` says how to switch.
  - **D1b, the second reader.** Keep Arch, or make Parabola the second reader (if alive), or both.
- **Falsifier for the Parabola row.** Its package repository's latest commit date. One
  `git ls-remote`, when a decision leans on it.

## Board 5 — the distributor: media, source, names

- **SENSE.** What must be true of a stick or a disc handed across a table?
- **CANON (OBSERVED).**
  - Sizes, by one `HEAD` each: Guix 1.5.0 installer `1,188,261,888` bytes; Arch 2026-09-01
    `1,608,286,208` bytes.
  - GPLv3 §6 (`man/licenses/GPL-3.0.txt:252`): object code in "a physical distribution medium"
    goes "accompanied by the Corresponding Source fixed on a durable physical medium customarily
    used for software interchange" (a), or by "a written offer, valid for at least three years"
    (b).
- **READING (JUDGED).**
  - A CD (700 MB) holds neither stock installer, nor either door image (Board 7); **"optical"
    means DVD** (4.7 GB), and USB means a stick of 2 GB or more. [DOMAIN]
  - Every copy handed out carries source or a written offer. Guix can gather the source of a
    whole system; a second DVD or stick of source per batch is the simple honest form (§6a), and a
    three-year offer is the cheap one (§6b). `door/SOURCE` states the duty in plain words; which
    form ships is fork **D3**. [DOMAIN]
  - "Maybe with own logo": a group's **own** logo on the sleeve is fine; Arch's logo is not
    without a licence. The GNU and Guix artwork terms were not read this session. [MINE]
    Falsifier: the Guix artwork page's licence line.
- **STATUS.** instrumented: `door-check.sh` checks the source statement (C), the Arch naming (E),
  and the DVD budget (G); `--prove-red` plants each fault.

## Board 6 — immediate opportunity on release

- **SENSE.** Where, soon, would copies be minted, printed, handed out, tested, and improved,
  with people and groups already near the work?
- **CANON (OBSERVED), with dates:**
  - **Minicon 60, March 25–28, 2027**, Minneapolis (mnstf.org/minicon60). A local convention the
    shop's circle already knows.
  - **LibreLocal** (FSF): in-person free-software meetups each May; for 2026 the FSF offered
    "financial assistance, organizational resources, and potential staff participation", with a
    March 15 deadline for support. The 2026 list has **no Minnesota entry**
    (libreplanet.org/wiki/Group:Librelocal/2026).
  - **Hennepin County Fix-It Clinics**, second weekend of each month, noon–4, volunteer-staffed;
    they fix "small household appliances, clothing, electronics, mobile devices and more";
    computers are not named (hennepincounty.gov). The volunteer contact is on that page.
  - **Twin Cities Maker / The Hack Factory**, Minneapolis nonprofit makerspace (guidestar, Make:).
  - **Software Freedom Day** was 19 Sep 2026; the next third Saturday of September is
    18 Sep 2027 (computed from the calendar).
  - **ghostwheel as it is today**: ghostwheel.cloud describes "an adhoc network" of people,
    computers and equipment, hosting 30+ VMs and an OrgVM live demo, GPL-3.0-or-later, with an
    open invitation to "press the buttons" and report trouble.
- **READING (JUDGED), as openings, each with its falsifier:**

| # | opening | what it would take | falsifier |
|---|---|---|---|
| O1 | Host a **Twin Cities LibreLocal, May 2027**, with door sticks as the take-home | a venue, the FSF's support form | the FSF does not run LibreLocal in 2027 [MINE: guess it repeats] |
| O2 | A **"refresh your old laptop"** table beside a Fix-It Clinic | the county's yes; a list of machines known to work on free drivers (Board 3) | the county says software is out of scope |
| O3 | **Sleeves and inserts printed at the makerspace** (laser-cut or printed), a group's own logo on each | a member willing to run the batch | the makerspace's policy on member commercial work |
| O4 | **Door sticks and source DVDs at Minicon 60** (a table or a panel on free software at home) | the programme team's yes before their deadline | no slot, or no deadline left |
| O5 | **Digital copies from ghostwheel**: images, checksums and detached signatures on the existing hosts | disk and bandwidth on gw7 / gw14 / gw26 | their free disk and monthly transfer, measured |
| O6 | **Test partners in the organizations named in Board 2** (e.g. Guix-HPC members) | one note each, offering the image | no answer is also an answer |
| O7 | **Contributors' own organizations** carry copies with their own logo | the list below, filled in by them | — |

  O7's list, only as the record holds it: the FSF and GNU (Corwin volunteers, and speaks on their
  behalf, not as them), Savannah, Beyond Conventions (its site is on the pub shelf), MNSTF/Minicon.
  **Bryant's and Brigidt's organizations are not in the record, and are left for them to name.**
  (prior-instruction: no who-works-with-whom line is guessed.)

- **Where the money and hands are, as far as this reading shows** [MINE]: printing and pressing
  are cheap per copy; the scarce things are a table, a volunteer to staff it, and a source-DVD
  run. Every opening above except O5 is a *people* opening, and each starts with one note.
- **STATUS.** gestured (dates and pages read; no one contacted — sending is the keeper's act).

## Board 7 — the build loop, pushed

Opened with `SWING_FILE=writing/door-images/SWING sh bin/sw1ng open door-image --design … --qaplan … --max 3`
(the tree's root `SWING` holds a finished asset-browser task and was not touched).

**Both readers were minted this session**, in the session's cloud workspace (Ubuntu, 2 cores, no
KVM), by the recipes beside this file. The receipts are in `BUILDS.tsv` and `QA-PASSES.md`:

| reader | image | bytes | sha256 (first 16) | booted (QEMU, no KVM) |
|---|---|---|---|---|
| Guix 1.5.0 (pinned with `guix time-machine --commit=v1.5.0`) | label `C4_DOOR`, linux-libre 6.17.12 | 1,610,698,752 | `5ae5c78fce6ab202` | to the installer screen; door files proven by extraction |
| based on Arch Linux (archiso 90, releng + the door, firmware dropped) | label `C4DOOR_202609` | 927,281,152 | `e6b75dcf7141422f` | to `c4door login:`; after login the door's first lines on screen |

Both fit a DVD and any stick of 2 GB or more. Neither fits a CD. The Arch reader came out smaller
than Arch's own ISO (1,608,286,208) mainly because the firmware packages were dropped.

**What the loop caught** (sw1ng, cycle 1, two passes of three): the check's own bug (a
`--prove-red` control went red and exposed it); Guix's channel moving to master under a 1.5.0
guix (fixed by pinning); nonfree ATM-card firmware arriving by `linux-atm` (dropped); and the
image calling itself "Arch Linux" in its boot menus and "archiso" as its hostname (renamed, and
guarded in `mkdoor.sh` and `door-check.sh`). Two warnings stand: the Guix door is not yet read
*on screen* at boot (its installer holds the console), and the landing's leak check.

**Against his finish line** ("success of which minting represents the completion of the build
phase on the onward turn"): an image of each reader has been minted, and each boots. What
separates this from *the* minting he named is his: the images were minted in a cloud workspace,
not on Avalon or GIZA; they are unsigned; they carry test-build TERMS, PRIVACY and SOURCE; and
the forks D1–D3 below are open. Reproducing them on GIZA (Guix installs on any GNU/Linux; the
Arch reader needs an Arch host or chroot, as used here) is the natural first act of the onward
walk's "two machines agreeing" test: same recipe, compare the sha256. [MINE]

**Where the images are.** In the session workspace only (each is far over the 20 MB a single
transfer to his disk carries). The recipes on his disk rebuild them; copying them to his disk in
pieces is possible and is offered, not done. [MINE]

## Verdict

**Bears out in shape, not in the word "only".** Organizations that succeed with Guix or Arch
already build a door on top (Guix-HPC; SteamOS on Arch), which is strong evidence that the door
is the missing piece for the people he names. But for the home user on Guix a second piece is
missing that no persona supplies (network hardware on free drivers), and for Arch the door must
be named "based on Arch Linux" and cannot be called a free distribution in the FSF's sense.
Physical copies mean DVD or USB, never CD, and every copy carries its source or a written offer.
The opportunity is real and near (May 2027 LibreLocal with no Minnesota entry yet; Minicon 60 in
March 2027; monthly Fix-It Clinics; a Minneapolis makerspace; ghostwheel's hosts), and every
piece of it starts with a note a person sends.

**Forks for Corwin** (each one line; nothing blocks on them, the build proceeds on the defaults):
D1 firmware on the Arch door (A, the default: drop; B: keep). D1b Arch, Parabola, or both as the
second reader. D2 the name on the media. D3 source on a second medium (§6a) or a three-year offer (§6b).

---
Sources, at the act above; list for a reader without the tree: guix.gnu.org release post and
download page; hpc.guix.info 2025 activity report; terms.archlinux.org trademark policy;
gitlab.archlinux.org archiso `docs/README.profile.rst`, `configs/releng/profiledef.sh`,
`configs/releng/packages.x86_64`; gnu.org/distros/common-distros; parabola.nu; tomshardware.com
(Valve–Arch, 2024-09-29); hennepincounty.gov Fix-It Clinics; libreplanet.org LibreLocal 2026;
mnstf.org/minicon60; ghostwheel.cloud; the tree's `man/licenses/GPL-3.0.txt`.
