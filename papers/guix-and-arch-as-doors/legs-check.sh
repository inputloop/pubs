#!/bin/sh
# legs-check.sh -- read what each door image actually carries, from the image itself, and hold it to
#   what its leg promises.  A second reader beside the builders: it does not run their scripts, it
#   opens the ISO, lists the root filesystem, and reads pacman's own record of what is installed.
# usage (in a container or host with bsdtar and unsquashfs): sh legs-check.sh OUT
#   OUT holds nofw/*.iso, fw/*.iso and parabola/*.iso (any may be missing; a missing leg is said)
# the promises:
#   nofw      kernel linux;       no linux-firmware*, no *-ucode; no program firmware under usr/lib/firmware
#   fw        kernel linux;       linux-firmware present (D1: minted both ways)
#   parabola  kernel linux-libre; your-freedom present; no linux-firmware*, no *-ucode
# exit: 0 every present leg keeps its promise - 1 a promise broken - 2 nothing to read
# Copyright 2026 Corwin Brust <corwin@bru.st> and Contributors.  Authored by Mentat (for Corwin).
# SPDX-License-Identifier: GPL-3.0-or-later OR LGPL-3.0-or-later
set -u
if [ "${1:-}" = --prove-red ]; then   # planted images: a clean nofw leg holds, one carrying firmware breaks
  p=$(mktemp -d); trap 'rm -rf "$p"' EXIT; f=0
  plant() { r=$p/$1/root; mkdir -p "$r/var/lib/pacman/local" "$r/usr/lib/firmware" "$p/$1/iso/c4door/x86_64" "$p/$1/out/nofw"
    for k in $2; do mkdir -p "$r/var/lib/pacman/local/$k"; done; [ -z "${3:-}" ] || echo x > "$r/usr/lib/firmware/$3"
    mksquashfs "$r" "$p/$1/iso/c4door/x86_64/airootfs.sfs" -quiet -noappend ${4:-} >/dev/null
    (cd "$p/$1/iso" && bsdtar --format iso9660 -cf "$p/$1/out/nofw/planted.iso" c4door); }
  plant clean "linux-7.2-1" regulatory.db; plant dirty "linux-7.2-1 linux-firmware-20260916-1" amdgpu.bin
  sh "$0" "$p/clean/out" >/dev/null; [ $? = 0 ] && echo "caught: P1 a clean nofw leg holds" || { echo "MISSED: P1"; f=1; }
  sh "$0" "$p/dirty/out" >/dev/null; [ $? = 1 ] && echo "caught: P2 a nofw leg carrying linux-firmware is BROKEN" || { echo "MISSED: P2"; f=1; }
  plant owned "linux-7.2-1" regulatory.db "-force-uid 1014 -force-gid 1014"
  sh "$0" "$p/owned/out" >/dev/null; [ $? = 1 ] && echo "caught: P3 an image whose / is not owned by root is BROKEN (seen 2026-10-13)" || { echo "MISSED: P3"; f=1; }
  exit $f
fi
out=${1:?usage: legs-check.sh OUT}; t=$(mktemp -d); trap 'rm -rf "$t"' EXIT; bad=0; seen=0
say() { printf '%-9s %-6s %s\n' "$1" "$2" "$3"; }
for leg in nofw fw parabola; do
  iso=$(ls "$out/$leg"/*.iso 2>/dev/null | head -1)
  [ -n "$iso" ] || { say "$leg" "-" "no image"; continue; }
  seen=1; d=$t/$leg; mkdir -p "$d"
  sfs=$(bsdtar -tf "$iso" | grep 'airootfs\.sfs$' | head -1)
  bsdtar -xf "$iso" -C "$d" "$sfs" || { say "$leg" FAIL "cannot extract $sfs"; bad=1; continue; }
  unsquashfs -l "$d/$sfs" > "$d/list" 2>/dev/null       # every path, directories too (pacman's record is directories)
  unsquashfs -lc "$d/$sfs" > "$d/files" 2>/dev/null     # files only (for the firmware count)
  pk=$(sed -n 's|^squashfs-root/var/lib/pacman/local/\([^/]*\)$|\1|p' "$d/list" | sed 's/-[^-]*-[^-]*$//' | sort -u)
  printf '%s\n' "$pk" > "$d/packages"
  has() { printf '%s\n' "$pk" | grep -qx "$1"; }
  fwn=$(grep -c '^squashfs-root/usr/lib/firmware/.' "$d/files")
  fwp=$(grep '^squashfs-root/usr/lib/firmware/.' "$d/files" | grep -vc 'regulatory\.db')
  own=$(unsquashfs -lln "$d/$sfs" 2>/dev/null | awk '$NF=="squashfs-root" {print $2; exit}')   # the image's / : owner/group
  kern=$(printf '%s\n' "$pk" | grep -x 'linux\|linux-libre' | tr '\n' ' ')
  nfw=$(printf '%s\n' "$pk" | grep -c '^linux-firmware\|-ucode$')
  say "$leg" info "$(printf '%s\n' "$pk" | wc -l) packages; kernel: ${kern:-none}; firmware packages: $nfw; files under usr/lib/firmware: $fwn (not regulatory.db: $fwp); / owned by $own"
  ok=1; [ "$own" = 0/0 ] || { say "$leg" BROKEN "/ in the image is owned by ${own:-unknown}, not root (0/0)"; ok=0; }
  case $leg in
    nofw)     has linux || ok=0; [ "$nfw" = 0 ] || ok=0; [ "$fwp" = 0 ] || ok=0 ;;
    fw)       has linux || ok=0; has linux-firmware || ok=0 ;;
    parabola) has linux-libre || ok=0; has your-freedom || ok=0; [ "$nfw" = 0 ] || ok=0; has linux && ok=0 ;;
  esac
  if [ $ok = 1 ]; then say "$leg" held "$(basename "$iso")"; else say "$leg" BROKEN "$(basename "$iso")"; bad=1; fi
  cp "$d/packages" "$out/$leg/PACKAGES" 2>/dev/null
done
[ $seen = 1 ] || exit 2
exit $bad
