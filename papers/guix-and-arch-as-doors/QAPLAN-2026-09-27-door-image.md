# QA PLAN — door-image

AS-OF 2026-09-27. Written before the build. Every item names the check that settles it.

Q1  `sh door-check.sh` exits 0 on this folder and `sh door-check.sh --prove-red` exits 0 (every
    planted fault goes RED, every control stays green).                       [door-check.sh]
Q2  The Guix reader evaluates: `guix system build --dry-run guix/c4-door.scm` (or `image --dry-run`)
    exits 0 on a host with Guix 1.5.0.                                          [guix, container]
Q3  The Guix ISO is minted: `guix system image --image-type=iso9660 --label=C4_DOOR guix/c4-door.scm`
    returns a store path; its size fits a DVD (≤ 4,700,372,992 bytes); sha256 recorded in BUILDS.tsv.
                                                                               [guix, container]
Q4  The Guix ISO boots to a prompt that shows the door: `qemu-system-x86_64 -cdrom` + serial console
    capture showing the /etc/c4-door README line. RED-pending if QEMU/KVM is not present, named.
                                                                               [qemu, container]
Q5  The Arch reader passes archiso's own rules as the check reads them (profiledef variables, bootmodes,
    mkinitcpio + mkinitcpio-archiso listed, install_dir [a-z0-9] ≤ 30). A real `mkarchiso` build is
    RED-pending until an Arch host (or chroot) is available, named with its fix.   [door-check.sh]
Q6  No lab leak: `pb1ck` on the landed item reads CLEAN, or its NOT CLEAN lines are named.  [bin/pb1ck]
Q7  Every door file a person reads first is in common words: no term of art without its gloss
    (hand read, one line per file in the LENS).                                [hand]
