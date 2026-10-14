#!/bin/sh
# lens-traction-probe.sh -- the H2 "traction" probe for LENS-2026-09-27-written-against-open.md
# Stranger-replayable: needs only a POSIX shell, find, grep, awk, sort over a copy of the C4 tree.
# Usage: sh lens-traction-probe.sh CORPUS_DIR > traction.txt
#
# For every work unit of four kinds it counts
#   cites  = distinct OTHER files in the tree whose text names the unit
#   his    = how many of those files are his prompts (q/PROMPT-*, q/*/PROMPT*.md, q/*.txt, q/TAG/*)
# Kinds and the name searched for:
#   formal : any *.md named PAPER-/DISS-/ESSAY-/LENS-/GUIDE-/REVIEW-, plus analysis/**/*.md (not INDEX).
#            strict name = file stem (with date); loose name = the slug after the date (>= 8 chars).
#   deck   : decks/*.deck.md ; strict = "<slug>.deck", loose = "<slug>"
#   spell  : spells/<name>/  ; strict = "spells/<name>", loose = "<name>"
#   tool   : onward-readiness/review-2026-09-26-onward/names.txt, names with a digit only
#            (coded names such as pb1ck; plain-word names like "door" are left out because they
#            would match ordinary prose); strict = loose = the name.
# Files ending .sha256/.asc/.sig are never counted as citing files.
# What the count CANNOT show: see the LENS paper, board H2 (it counts mentions, mostly written by
# the instrument; it does not see readers outside the tree, e.g. comments on a Google Doc).
set -eu
C=${1:?corpus dir}
cd "$C"
LIST=$(mktemp); trap 'rm -f "$LIST"' EXIT
find . -type f ! -name '*.sha256' ! -name '*.asc' ! -name '*.sig' | sed 's|^\./||' | sort > "$LIST"
isprompt() { case "$1" in q/PROMPT-*|q/*/PROMPT*.md|q/*.txt|q/TAG/*) return 0;; esac; return 1; }
count() { # $1 name  $2 self-path-prefix-to-exclude
  n=0; h=0
  for f in $(xargs grep -lF -- "$1" < "$LIST" 2>/dev/null || true); do
    case "$f" in "$2"*) continue;; esac
    n=$((n+1)); if isprompt "$f"; then h=$((h+1)); fi
  done
  printf '%s\t%s' "$n" "$h"
}
printf 'kind\tunit\tstrict_cites\tstrict_his\tloose_cites\tloose_his\n'
# formal
{ find . -type f -name '*.md' \( -name 'PAPER-*' -o -name 'DISS-*' -o -name 'ESSAY-*' -o -name 'LENS-*' -o -name 'GUIDE-*' -o -name 'REVIEW-*' \);
  find ./analysis -type f -name '*.md' ! -name 'INDEX.md'; } | sed 's|^\./||' | sort -u |
while read -r p; do
  stem=$(basename "$p" .md)
  slug=$(printf '%s' "$stem" | sed -E 's/^[A-Z]+-([0-9]{4}-[0-9]{2}-[0-9]{2}|[0-9]{8}T[0-9]{4}Z)-?//; s/^[0-9-]+//')
  s=$(count "$stem" "${p%.md}")
  if [ ${#slug} -ge 8 ]; then l=$(count "$slug" "${p%.md}"); else l="NA	NA"; fi
  printf 'formal\t%s\t%s\t%s\n' "$p" "$s" "$l"
done
# decks
for p in decks/*.deck.md; do
  slug=$(basename "$p" .deck.md)
  printf 'deck\t%s\t%s\t%s\n' "$p" "$(count "$slug.deck" "${p%.deck.md}")" "$(count "$slug" "${p%.deck.md}")"
done
# spells
for d in spells/*/; do
  n=$(basename "$d")
  printf 'spell\t%s\t%s\t%s\n' "spells/$n" "$(count "spells/$n" "spells/$n/")" "$(count "$n" "spells/$n/")"
done
# tools (coded names only)
grep '[0-9]' onward-readiness/review-2026-09-26-onward/names.txt | while read -r t; do
  r=$(count "$t" "onward-readiness/review-2026-09-26-onward/")
  printf 'tool\t%s\t%s\t%s\n' "$t" "$r" "$r"
done
