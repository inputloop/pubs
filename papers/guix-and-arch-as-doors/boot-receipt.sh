#!/bin/sh
# boot-receipt.sh -- boot a C4 door ISO in QEMU with no screen and keep what it said: the receipt that
#   an image boots.  Two looks: (1) the image's own kernel and initramfs, with the boot line its own
#   menu carries plus a serial console, read until a login prompt; (2) the whole ISO from its own
#   boot loader (BIOS), with the screen saved after a wait, so the menu itself is seen to come up.
#   Works without KVM (software emulation), only slower; --kvm-off is the default when /dev/kvm is absent.
# usage: sh boot-receipt.sh ISO OUTDIR [SECONDS]      (needs: qemu-system-x86_64, sudo mount -o loop)
# exit: 0 a login prompt was seen - 1 none within SECONDS - 2 usage or setup
# Copyright 2026 Corwin Brust <corwin@bru.st> and Contributors.  Authored by Mentat (for Corwin).
# SPDX-License-Identifier: GPL-3.0-or-later OR LGPL-3.0-or-later
set -u
iso=${1:-}; out=${2:-}; secs=${3:-1500}
[ -f "$iso" ] && [ -n "$out" ] || { sed -n '2,9p' "$0"; exit 2; }
mkdir -p "$out"; mnt=$(mktemp -d); trap 'sudo -n umount "$mnt" 2>/dev/null; rmdir "$mnt"' EXIT
sudo -n mount -o loop,ro "$iso" "$mnt" || { echo "boot-receipt: cannot mount $iso" >&2; exit 2; }
cfg=$(find "$mnt" -path '*syslinux*' -name '*sys-linux.cfg' | head -1)
k=$(awk '/^ *LINUX /{print $2; exit}' "$cfg"); i=$(awk '/^ *INITRD /{print $2; exit}' "$cfg" | tr ',' '\n' | tail -1)
args=$(awk '/^ *APPEND /{sub(/^ *APPEND /,""); print; exit}' "$cfg")
[ -n "$k" ] && [ -n "$i" ] && [ -n "$args" ] || { echo "boot-receipt: no boot entry in $cfg" >&2; exit 2; }
cp "$mnt$k" "$out/kernel"; cp "$mnt$i" "$out/initramfs"
accel=tcg; [ -w /dev/kvm ] && accel=kvm
{ echo "iso: $iso"; echo "sha256: $(sha256sum "$iso" | cut -d' ' -f1)"; echo "entry: $cfg"
  echo "kernel: $k"; echo "initrd: $i"; echo "append: $args console=ttyS0"; echo "accel: $accel"
  echo "start: $(date -u +%FT%TZ)"; } > "$out/RECEIPT"
sudo -n umount "$mnt"
# look 1: its kernel, its boot line, a serial console; stop at the first login prompt
timeout "$secs" qemu-system-x86_64 -accel "$accel" -m 2048 -smp 2 -no-reboot -display none \
  -cdrom "$iso" -kernel "$out/kernel" -initrd "$out/initramfs" -append "$args console=ttyS0" \
  -serial "file:$out/serial.log" -monitor none &
q=$!; seen=1; n=0
while kill -0 $q 2>/dev/null; do
  if grep -q 'login:' "$out/serial.log" 2>/dev/null; then seen=0; break; fi
  sleep 10; n=$((n+10))
done
kill $q 2>/dev/null; wait $q 2>/dev/null
echo "look 1 (kernel, serial): $([ $seen = 0 ] && echo "login prompt after about ${n}s" || echo "NO login prompt within ${secs}s")" >> "$out/RECEIPT"
grep -m1 'login:' "$out/serial.log" >> "$out/RECEIPT" 2>/dev/null
# look 2: the whole ISO from its own boot loader; the screen at 90 s, as the menu should stand
sock=$out/mon.sock; rm -f "$sock"
qemu-system-x86_64 -accel "$accel" -m 2048 -smp 2 -no-reboot -display none -boot d -cdrom "$iso" \
  -monitor "unix:$sock,server,nowait" &
q=$!; sleep 90
timeout 15 python3 -c 'import socket,sys,time
s=socket.socket(socket.AF_UNIX); s.connect(sys.argv[1]); time.sleep(1)
s.sendall(("screendump %s\n" % sys.argv[2]).encode()); time.sleep(3)' "$sock" "$out/menu.ppm" 2>/dev/null
sleep 2; kill $q 2>/dev/null; wait $q 2>/dev/null
echo "look 2 (boot loader, screen at 90s): $([ -s "$out/menu.ppm" ] && echo "saved menu.ppm ($(wc -c < "$out/menu.ppm") bytes)" || echo "no screen saved")" >> "$out/RECEIPT"
echo "end: $(date -u +%FT%TZ)" >> "$out/RECEIPT"
cat "$out/RECEIPT"
exit $seen
