# The QA passes of the door-image build loop (one section per pass; the counter is sw1ng's)

## Pass 1 — 2026-09-27 (cycle 1) — 4 issues, 2 warnings, all issues corrected

| Q | result | receipt |
|---|---|---|
| Q1 | RED then OK: door-check could not read profiledef.sh (mkarchiso declares `file_permissions` as an associative array first; the check did not). The `--prove-red` control caught it. Corrected. | `sh door-check.sh --prove-red` → every fault RED, every control OK |
| Q2/Q3 | RED: `guix system image` (Guix 1.5.0 binary) updated the `guix` channel to master and then looked for `gnu/installer/aux-files/logo.txt`, which the 1.5.0 modules keep at `gnu/installer/logo.txt`. Correction: pin with `guix time-machine --commit=v1.5.0`. Rebuild running. | build log in the session workspace |
| Q5 | OK, and more: the Arch reader was **minted**: `c4door-2026.09.27-x86_64.iso`, 927,281,152 bytes, sha256 `2f670fe7fb1a6cd1d8edd14c585a08772660ee6ae12278403e00f6927887a7b3`, volume id `C4DOOR_202609`; the door's five files, Emacs, Git and GnuPG are inside (`unsquashfs -l`). | BUILDS.tsv |
| Q4 (Arch) | OK: booted under QEMU (no KVM) to `archiso login:` with `Reached target Login Prompts`. | boot log in the session workspace |
| — | ISSUE: firmware left in by `linux-atm` (pca200e.bin, pca200e_ecd.bin2, sba200e_ecd.bin2). Corrected: added to FIRMWARE-DROPPED. | `unsquashfs -l … | grep usr/lib/firmware/` |
| — | ISSUE: the image called itself "Arch Linux" in its boot menus and "archiso" as its hostname. Corrected: mkdoor.sh renames the menus and refuses if one is left; hostname and motd are the door's. door-check H guards both. | door-check H, mkdoor.sh |
| Q4 (Guix) | WARNING: pending the rebuild. | — |
| Q6 | WARNING: pb1ck not yet run (runs at landing). | — |

## Pass 2 — 2026-09-27 (cycle 1) — 0 issues, 2 warnings

| Q | result | receipt |
|---|---|---|
| Q1 | OK. door-check gained H (hostname, motd, the boot-menu guard) with two new mutants. | `sh door-check.sh` OK; `--prove-red` every fault RED, every control OK |
| Q2/Q3 | OK: **the Guix reader is minted.** `guix time-machine --commit=v1.5.0 -- system image --image-type=iso9660 --label=C4_DOOR guix/c4-door.scm` → an ISO of 1,610,698,752 bytes (fits a DVD), sha256 `5ae5c78fce6ab202…`, volume id `C4_DOOR`, kernel linux-libre 6.17.12. `/etc/c4-door` holds the five door files (README's first line read back from the image); emacs-no-x 30.2, git 2.52.0, gnupg 2.4.7 are in the store. | BUILDS.tsv row 2 |
| Q5 | OK: **the Arch reader, re-minted** with the corrections: 927,281,152 bytes, sha256 `e6b75dcf7141422f…`. Firmware left: only `regulatory.db` and its signature (Wi-Fi rules, data). Boot menus read "C4 door (based on Arch Linux) install medium …". | BUILDS.tsv row 3; `unsquashfs -l`; the menu labels read back |
| Q4 (Arch) | OK: QEMU boot, `c4door login: root`, then on screen: `C4 door -- a free system you can run from this stick.` and `C4 DOOR -- read me first`. | the serial log's lines, quoted here |
| Q4 (Guix) | WARNING: QEMU boot reached shepherd, udev, networking (`ens3 NIC Link is Up`) and then the installer's screen, which holds the console; the door line was not read *on screen*. The files are proven in the image by extraction. | the serial log |
| Q6 | WARNING: pb1ck runs at landing. | — |
| Q7 | OK (hand read): the five door files use common words; "free software" is explained in its first use; Emacs is named as the program that opens the file. | — |
