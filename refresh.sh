#!/bin/sh
# refresh.sh -- make this repository's tree a copy of the pub shelf's travelling files, then review
#               with git status and commit.
# usage: sh refresh.sh [--dry] [SRC]     (default SRC: /h/pub)
#   Copies everything under SRC except: sites/, every .c4/ folder, .git/, and each path listed in
#   SRC/.c4/pubs-hold (one shelf-relative path per line, a TAB and the bound that holds it; # starts
#   a comment). That list lives in .c4/ on the shelf, so the names of held items never travel.
#   Then removes any file here that the shelf no longer carries (a withdrawn or held item must not
#   stay public), except this repository's own files: REPO.md, refresh.sh, COPYING, tests/, .github/.
#   --dry prints what would be added, changed and removed, and writes nothing.
#   Exit 0 done · 2 usage or no folder.
# Copyright 2026 Corwin Brust <corwin@bru.st> and Contributors.  Authored by Mentat (for Corwin).
# SPDX-License-Identifier: GPL-3.0-or-later OR LGPL-3.0-or-later
set -eu
dry=0
case ${1:-} in --dry) dry=1; shift ;; -h|--help) sed -n '2,12p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;; esac
here=$(cd "$(dirname "$0")" && pwd); src=${1:-/h/pub}
[ -d "$src" ] || { echo "refresh: no folder $src" >&2; exit 2; }
src=$(cd "$src" && pwd)
tmp=$(mktemp -d "${TMPDIR:-/tmp}/refresh.XXXXXX"); trap 'rm -rf "$tmp"' EXIT INT TERM
ex="$tmp/exclude"
{ printf '%s\n' ./sites ./.git ./.c4 '*/.c4'
  if [ -f "$src/.c4/pubs-hold" ]; then
    sed -e 's/\r$//' -e 's/\t.*$//' -e '/^[[:space:]]*#/d' -e '/^[[:space:]]*$/d' -e 's#^\./##' -e 's#/*$##' \
      "$src/.c4/pubs-hold" | while IFS= read -r p; do
        [ -e "$src/$p" ] || echo "refresh: note: held path not on the shelf: $p" >&2
        printf './%s\n' "$p"; done
  fi; } > "$ex"
mkdir "$tmp/stage"
(cd "$src" && tar cf - --exclude-from="$ex" .) | tar xf - -C "$tmp/stage"
(cd "$tmp/stage" && find . -type f | sort) > "$tmp/want"
(cd "$here" && find . \( -path ./.git -o -path ./.github -o -path ./tests \) -prune -o -type f -print | sort) \
  | grep -v -x -e ./REPO.md -e ./refresh.sh -e ./COPYING > "$tmp/have" || true
comm -13 "$tmp/want" "$tmp/have" > "$tmp/gone"
added=0; changed=0
while IFS= read -r f; do
  if [ ! -f "$here/$f" ]; then added=$((added+1)); [ $dry = 1 ] && echo "add     $f"
  elif ! cmp -s "$tmp/stage/$f" "$here/$f"; then changed=$((changed+1)); [ $dry = 1 ] && echo "change  $f"; fi
done < "$tmp/want"
removed=$(wc -l < "$tmp/gone" | tr -d ' ')
if [ $dry = 1 ]; then
  sed 's/^/remove  /' "$tmp/gone"
  echo "refresh (dry): from $src would add $added, change $changed, remove $removed; nothing written"
  exit 0
fi
while IFS= read -r f; do rm -f "$here/$f"; done < "$tmp/gone"
(cd "$tmp/stage" && tar cf - .) | tar xf - -C "$here"
# drop folders the removals left empty (never .git, .github or tests)
(cd "$here" && find . -mindepth 1 -depth -type d -empty ! -path './.git*' ! -path './tests*' -print) \
  | while IFS= read -r d; do rmdir "$here/$d" 2>/dev/null || true; done
echo "refresh: copied $src: added $added, changed $changed, removed $removed; now: git -C \"$here\" status --short"
