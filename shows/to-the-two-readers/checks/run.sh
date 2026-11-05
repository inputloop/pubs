#!/bin/sh
# checks/run.sh -- To the Two Readers: one check per promise, in sh and awk (another hand than tools/make.py).
#   C1  every witness that says "seen" is still true: its file is here, its hash is the one recorded, and
#       the words it says were said are on the lines it cites
#   C2  every caption in the show is its source's words: found on the cited lines of its witness's file
#       (a witness held outside this tree, his photographs, is named and not counted as checked)
#   C3  the pages obey the theater's CSP: no script, no <style>, no style= and no on...= attribute, nothing
#       loaded from another host
#   C4  every caption's witness is listed on the page
#
#   sh checks/run.sh               the checks
#   sh checks/run.sh --prove-red   each planted fault, in a scratch copy, must turn its check red
#
# SHOW: the show's folder (default: this one); ROOT: the repository the witnesses' paths start from.
# Copyright 2026 Corwin Brust; GPL-3.0-or-later.  Mentat (for Corwin, claude-opus-5-5)
set -u
HERE=$(cd "$(dirname "$0")/.." && pwd)
SHOW=${SHOW:-$HERE}
ROOT=${ROOT:-$(cd "$HERE/../.." && pwd)}
fail=0 pass=0 held=0
ok()  { pass=$((pass + 1)); [ -n "${QUIET:-}" ] || echo "  ok    $1"; }
bad() { fail=$((fail + 1)); echo "  FAIL  $1"; }

# the witnesses, one per line: fact<TAB>said<TAB>from<TAB>sha<TAB>state
records() {
  awk '
    /^#/ { next }
    /^$/ { if (f != "") print f "\t" s "\t" fr "\t" sh "\t" st; f = s = fr = sh = st = ""; next }
    { k = $0; sub(/: .*/, "", k); v = $0; sub(/^[^:]*: /, "", v)
      if (k == "fact") f = v; else if (k == "said") s = v; else if (k == "from") fr = v
      else if (k == "sha") sh = v; else if (k == "state") st = v }
    END { if (f != "") print f "\t" s "\t" fr "\t" sh "\t" st }' "$SHOW/WITNESSES"
}

# the cited lines of a file, joined, blockquote marks and runs of space taken out
cited() {  # $1 "path, line N" or "path, lines A-B"
  p=${1%%,*}; r=${1#*, }
  case $r in
    "line "*)  a=${r#line }; b=$a ;;
    "lines "*) a=${r#lines }; b=${a#*-}; a=${a%-*} ;;
    *) return 1 ;;
  esac
  [ -f "$ROOT/$p" ] || return 1
  awk -v a="$a" -v b="$b" 'NR >= a && NR <= b { sub(/^> ?/, ""); printf "%s ", $0 }' "$ROOT/$p" | tr -s ' '
}

T=$(printf '\t')
echo "C1 the witnesses"
records > "${TMPDIR:-/tmp}/ttr.$$"
while IFS=$T read -r fact said from sha state; do
  if [ "$state" = held ]; then held=$((held + 1)); continue; fi
  path=${from%%,*}
  if [ ! -f "$ROOT/$path" ]; then bad "$fact: $path is not in this tree"; continue; fi
  got=$(sha256sum "$ROOT/$path" | cut -c1-64)
  if [ "sha256:$got" != "$sha" ]; then bad "$fact: $path has changed since it was read (now $got)"; continue; fi
  text=$(cited "$from") || { bad "$fact: cannot read the lines in \"$from\""; continue; }
  case $text in
    *"$said"*) ok "$fact: \"$said\" ($from)" ;;
    *) bad "$fact: \"$said\" is not on $from" ;;
  esac
done < "${TMPDIR:-/tmp}/ttr.$$"
echo "  ($held held outside this tree, by hash only: not checked here)"

echo "C2 the captions"
grep -o 'data-fact="[^"]*"[^<]*<animate[^>]*/>[^<]*\|data-fact="[^"]*">[^<]*' "$SHOW/public/show.svg" |
  sed 's/^data-fact="\([^"]*\)".*>\([^>]*\)$/\1\t\2/' | sed "s/&#x27;/'/g; s/&amp;/\\&/g" > "${TMPDIR:-/tmp}/ttr-c.$$"
n=$(wc -l < "${TMPDIR:-/tmp}/ttr-c.$$")
[ "$n" -gt 0 ] || bad "no captions found in public/show.svg"
while IFS=$T read -r fact words; do
  from=$(awk -F"$T" -v f="$fact" '$1 == f { print $3 }' "${TMPDIR:-/tmp}/ttr.$$")
  state=$(awk -F"$T" -v f="$fact" '$1 == f { print $5 }' "${TMPDIR:-/tmp}/ttr.$$")
  if [ -z "$from" ]; then bad "caption \"$words\": no witness named $fact"; continue; fi
  if [ "$state" = held ]; then echo "  held  caption \"$words\": its witness ($fact) is held outside this tree"; continue; fi
  text=$(cited "$from") || { bad "caption \"$words\": cannot read $from"; continue; }
  case $text in
    *"$words"*) ok "caption \"$words\" is on $from" ;;
    *) bad "caption \"$words\" is not the words of $from" ;;
  esac
done < "${TMPDIR:-/tmp}/ttr-c.$$"

echo "C3 the theater's CSP"
for f in "$SHOW"/public/*.svg "$SHOW"/public/*.html; do
  if grep -n -i -E '<script|<style|[[:space:]]style=|[[:space:]]on[a-z]+=|(src|srcset)="https?:|<link[^>]*href="https?:' "$f" > /dev/null; then
    bad "$(basename "$f") breaks the CSP: $(grep -n -i -o -E '<script|<style|[[:space:]]style=|[[:space:]]on[a-z]+=|(src|srcset)="https?:|<link[^>]*href="https?:' "$f" | head -1)"
  else ok "$(basename "$f") keeps to the CSP"; fi
done

echo "C4 the page lists each caption's witness"
while IFS=$T read -r fact words; do
  if grep -q "id=\"w-$fact\"" "$SHOW/public/index.html"; then ok "w-$fact is listed"
  else bad "the page does not list the witness $fact"; fi
done < "${TMPDIR:-/tmp}/ttr-c.$$"
rm -f "${TMPDIR:-/tmp}/ttr.$$" "${TMPDIR:-/tmp}/ttr-c.$$"

if [ "${1:-}" = --prove-red ]; then
  red=0 not=0
  plant() {  # $1 what, $2 file under the show, $3 old, $4 new
    w=$(mktemp -d) || exit 2
    cp -R "$SHOW/WITNESSES" "$SHOW/public" "$w/"
    if [ "$(grep -c -F -- "$3" "$w/$2")" -ne 1 ]; then echo "  VOID  $1: its text is not in $2 exactly once"; not=$((not + 1)); rm -rf "$w"; return; fi
    awk -v o="$3" -v n="$4" '{ i = index($0, o); if (i) $0 = substr($0, 1, i - 1) n substr($0, i + length(o)); print }' "$w/$2" > "$w/x" && mv "$w/x" "$w/$2"
    if SHOW=$w ROOT=$ROOT QUIET=1 sh "$0" > "$w/out" 2>&1; then echo "  GREEN $1 was not seen"; not=$((not + 1))
    else echo "  red   $1: $(grep -m1 FAIL "$w/out" | sed 's/^ *FAIL *//')"; red=$((red + 1)); fi
    rm -rf "$w"
  }
  echo "prove-red"
  plant "a witness's words changed" WITNESSES "said: There are never more than two" "said: There are ever more than two"
  plant "a witness's hash changed" WITNESSES "sha256:d5e24b2c" "sha256:d5e24b2d"
  plant "a witness's line moved" WITNESSES "v0.2.md, line 38" "v0.2.md, line 39"
  plant "a caption's words changed" public/show.svg "you are emitting into a channel" "you are sending into a channel"
  plant "a style attribute" public/show.svg '<svg xmlns' '<svg style="x" xmlns'
  plant "a witness not listed" public/index.html 'id="w-wanted"' 'id="w-gone"'
  echo "prove-red: $red red, $not not"
  [ "$not" -eq 0 ] && [ "$fail" -eq 0 ] && echo "PROVE-RED OK"
  [ "$not" -eq 0 ] && [ "$fail" -eq 0 ]; exit $?
fi
echo "checks: $pass ok, $fail failed, $held held"
[ "$fail" -eq 0 ]
