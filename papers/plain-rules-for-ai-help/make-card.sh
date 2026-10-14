#!/bin/sh
# make-card.sh -- write the one-page card for a Plain Rules model: head lines, then make-card.awk's body.
# usage: sh make-card.sh MODEL.md > CARD.md     The model governs; the card is regenerated, never hand-edited.
# Copyright (C) 2026 Corwin Brust <corwin@bru.st>.  SPDX-License-Identifier: GPL-3.0-or-later
# Answers: 0 written · 2 usage · 77 NOT CHECKED (model missing or empty, or no sha256 tool).
m=${1:?usage: sh make-card.sh MODEL.md > CARD.md}
[ -s "$m" ] || { echo "NOT CHECKED: $m is missing or empty" >&2; exit 77; }
here=$(dirname "$0")
if command -v sha256sum >/dev/null 2>&1; then h=$(sha256sum "$m" | cut -c1-64)
elif command -v shasum >/dev/null 2>&1; then h=$(shasum -a 256 "$m" | cut -c1-64)
else echo "NOT CHECKED: no sha256 tool" >&2; exit 77; fi
b=$(basename "$m")
printf '<!-- SPDX-License-Identifier: CC-BY-4.0 -->\n# Plain Rules for AI Help: the one-page card\n\n'
printf 'Derived by `make-card.awk` from `%s` (sha256 `%s`). The model governs, and this card is never edited by hand. Owner: no person yet. Every check answers OK, RED, or NOT CHECKED (it could not look).\n\n' "$b" "$h"
printf '**Before any work:** who is harmed if this is wrong, and are they in the room?\n\n'
awk -f "$here/make-card.awk" "$m"
