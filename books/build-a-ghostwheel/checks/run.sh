#!/bin/sh
# checks/run.sh -- one check per promise. With --prove-red, plant a fault for
# each promise in a scratch copy and require that check to turn red.
# Copyright 2026 Corwin Brust; GPL-3.0-or-later
#
#   sh checks/run.sh                  the book edition's checks (below): what this folder carries
#   sh checks/run.sh book             the same, less site and sources (for a project that plucks the book alone)
#   sh checks/run.sh pilot            every check of the pilot, media included (needs sh run first)
#   sh checks/run.sh words captions   only those checks
#   sh checks/run.sh --prove-red      every planted fault for the book edition must turn its check red
#   sh checks/run.sh --prove-red pilot          the pilot's planted faults, media included
#   sh checks/run.sh --prove-red words book     only those groups of planted faults
#
# The book edition (the folder as published in pubs: no narration, no video) checks words,
# inventory, current, site, sources, bookoffline and bookread; the pilot adds outputs, length, captions,
# offline and keys, which read the media and the deck that sh run makes.
#
# The checks are written in POSIX sh and awk (and JavaScript where a browser is
# needed), so they read the sources and outputs with different hands from the
# Python tools that wrote them. GW_TAKE limits them to one take.
set -u
HERE=${GW_HOME:-$(cd "$(dirname "$0")/.." && pwd)}
cd "$HERE"
SRC=${GW_SRC:-src}
SRCA=$(cd "$SRC" && pwd)   # the sources, as an absolute path
OUT=${GW_OUT:-.}
TOL=${GW_TOL:-0.20}          # seconds the video and its narration may differ
PMAX=${GW_PICTURE_MAX:-40}   # words on a picture page
FMAX=${GW_FULLER_MAX:-250}   # words on a fuller page

if [ -n "${GW_TAKE:-}" ]; then TAKES=$GW_TAKE
else TAKES=$(awk '/^take:/{print $2}' "$SRC/book"); fi
[ -n "$TAKES" ] || TAKES="-"

fdur() { ffprobe -v error -show_entries format=duration -of csv=p=0 "$1" 2>/dev/null; }
vdur() { ffprobe -v error -select_streams v:0 -show_entries stream=duration -of csv=p=0 "$1" 2>/dev/null; }
sfx() { [ "$1" = "-" ] && echo "" || echo "-$1"; }
# A request-log sentence file (lo1re render ... notefile): line 1 a stamp ending "sha256 HEX", line 2 the
# sentence. stamp_ok: the sentence is the one its stamp names. html_line: the sentence as a page carries it.
stamp_ok() { [ -s "$1" ] || return 1
  st=$(sed -n '1s/.*sha256 \([0-9a-f]\{64\}\) *$/\1/p' "$1"); [ -n "$st" ] || return 1
  [ "$(sed -n 2p "$1" | tr -d '\n' | sha256sum | cut -c1-64)" = "$st" ]; }
html_line() { sed -n 2p "$1" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g'; }

# --- promise 1: every output exists ------------------------------------------
check_outputs() {  # DIR TAKE...
  d=$1; shift; bad=0
  for f in slides.html book.html README.md COLOPHON.md; do
    [ -s "$d/$f" ] || { echo "  missing or empty: $f"; bad=1; }
  done
  for t in "$@"; do
    s=$(sfx "$t")
    for f in "pilot$s.mp4" "pilot$s-captioned.mp4" "pilot$s.mp3" "pilot$s.vtt" "transcript$s.txt"; do
      [ -s "$d/$f" ] || { echo "  missing or empty: $f"; bad=1; }
    done
    for f in "pilot$s.mp4" "pilot$s-captioned.mp4"; do
      [ -s "$d/$f" ] || continue
      kinds=$(ffprobe -v error -show_entries stream=codec_type -of csv=p=0 "$d/$f" | sort -u | tr '\n' ' ')
      case $kinds in *audio*video*) ;; *) echo "  $f has streams: $kinds(wants audio and video)"; bad=1 ;; esac
    done
    if [ -s "$d/pilot$s.mp3" ]; then
      ffprobe -v error -show_entries stream=codec_name -of csv=p=0 "$d/pilot$s.mp3" | grep -q mp3 ||
        { echo "  pilot$s.mp3 holds no mp3 audio"; bad=1; }
    fi
    n=$(ls "$d/stills/${t#-}"-*.png 2>/dev/null | wc -l)
    [ "$n" -ge 3 ] || { echo "  stills for take $t: $n (wants 3 or more)"; bad=1; }
  done
  return $bad
}

# --- promise 2: the video is as long as its narration ------------------------
check_length() {  # MP4 MP3
  v=$(vdur "$1"); a=$(fdur "$2")
  [ -n "$v" ] && [ -n "$a" ] || { echo "  cannot read the length of $1 or $2"; return 1; }
  awk -v v="$v" -v a="$a" -v tol="$TOL" -v f="$1" 'BEGIN{
    d=v-a; if(d<0)d=-d
    printf "  %s: video %.2f s, narration %.2f s, apart %.2f s (allowed %.2f)\n", f, v, a, d, tol
    exit (d>tol)}'
}

# --- promise 3: every caption cue lies inside the audio ----------------------
check_captions() {  # VTT AUDIO
  a=$(fdur "$2")
  [ -n "$a" ] || { echo "  cannot read the length of $2"; return 1; }
  awk -v max="$a" -v f="$1" '
    function sec(s,  p, n) { n = split(s, p, ":"); return n == 3 ? p[1]*3600 + p[2]*60 + p[3] : p[1]*60 + p[2] }
    / --> / { n++; st = sec($1); en = sec($3)
      if (st < 0 || en <= st || en > max + 0.05) { printf "  cue %d (%s --> %s) is outside 0 .. %.3f s\n", n, $1, $3, max; bad = 1 } }
    END { if (n == 0) { print "  " f ": no cues"; bad = 1 } else printf "  %s: %d cues inside %.2f s\n", f, n, max; exit bad }' "$1"
}

# --- promise 4: the page word limits hold (and picture pages use easy words) --
check_words() {  # SRCDIR
  sd=$1
  files=""
  for n in $(awk '/^spread:/{print $2}' "$sd/book"); do files="$files $sd/$n"; done
  [ -n "$files" ] || { echo "  $sd/book names no spreads"; return 1; }
  awk -v pmax="$PMAX" -v fmax="$FMAX" -v easyf="$sd/easy" '
    BEGIN { while ((getline ln < easyf) > 0) { sub(/#.*/, "", ln); k = split(ln, w, /[ \t]+/)
              for (i = 1; i <= k; i++) if (w[i] != "") easy[tolower(w[i])] = 1 } }
    function report() {
      if (file == "") return
      printf "  %-14s picture page %3d words (max %d)   fuller page %3d words (max %d)\n", name, pic, pmax, ful, fmax
      if (pic > pmax) { printf "  %s: picture page has %d words, over %d\n", name, pic, pmax; bad = 1 }
      if (ful > fmax) { printf "  %s: fuller page has %d words, over %d\n", name, ful, fmax; bad = 1 }
    }
    function count(line, which,   w) {
      gsub(/ ?\[[a-z][a-z0-9_-]*\]/, "", line)
      while (match(line, /[A-Za-z0-9][A-Za-z0-9'\''-]*/)) {
        w = substr(line, RSTART, RLENGTH); line = substr(line, RSTART + RLENGTH)
        if (which == "picture") {
          pic++
          if (kind != "card" && !(tolower(w) in easy)) { printf "  %s: picture-page word not on the easy list: %s\n", name, w; bad = 1 }
        } else ful++
      }
    }
    FNR == 1 { report(); file = FILENAME; name = FILENAME; sub(/.*\//, "", name); kind = "spread"; sec = ""; pic = 0; ful = 0 }
    sec == "" && /^kind:/ { kind = $2 }
    /^== .* ==[ \t]*$/ { s = $0; gsub(/^== *| *==[ \t]*$/, "", s); sec = tolower(s); next }
    sec != "picture" && /^[ \t]*#/ { next }
    sec == "picture page" { count($0, "picture") }
    sec == "fuller page" { count($0, "fuller") }
    END { report(); exit bad }' $files
}

# --- promises 5 and 6: the deck (offline; keyboard and reduced motion) --------
strip_code() { awk 'BEGIN{IGNORECASE=1} /<script/{s=1} /<style/{s=1} !s{print} /<\/script>/{s=0} /<\/style>/{s=0}' "$1"; }
check_offline() {  # HTML
  bad=0
  if strip_code "$1" | grep -Eiq '(src|href|action|poster|data|srcset|xlink:href)[[:space:]]*=[[:space:]]*["'\'']?[[:space:]]*(https?:|//|ftp:)'; then
    echo "  the markup points at another host:"; strip_code "$1" | grep -Eio '(src|href|action|poster|data|srcset|xlink:href)[[:space:]]*=[[:space:]]*["'\'']?[[:space:]]*(https?:|//|ftp:)[^"'\'' >]*' | head -3 | sed 's/^/    /'; bad=1
  fi
  if grep -Eiq 'url\([[:space:]]*["'\'']?[[:space:]]*(https?:|//)|@import' "$1"; then echo "  the style loads from another host"; bad=1; fi
  if grep -Eq '(fetch\(|XMLHttpRequest|WebSocket|EventSource|sendBeacon|import\()' "$1"; then echo "  the script can reach the network"; bad=1; fi
  if strip_code "$1" | grep -Eiq '<[^>]*[[:space:]]on[a-z]+[[:space:]]*='; then
    echo "  an inline event handler:"; strip_code "$1" | grep -Eio '[[:space:]]on[a-z]+[[:space:]]*=[^ >]*' | head -3 | sed 's/^/    /'; bad=1
  fi
  grep -q "Content-Security-Policy\" content=\"default-src 'none'" "$1" || { echo "  no Content-Security-Policy with default-src 'none'"; bad=1; }
  node checks/deck.js offline "$1" || bad=1
  return $bad
}
check_keys() { node checks/deck.js keys "$1"; }

# --- promise 16: goodnight's inventory is current ------------------------------
# Recomputes, in sh, the sha256 over the spread files goodnight read (book order, goodnight left
# out) and compares it with goodnight's list row; then looks for every fact id on its fuller page.
check_inventory() {  # SRCDIR
  sd=$1; bad=0; files=""
  for n in $(awk '/^spread:/{print $2}' "$sd/book"); do
    [ "$n" = goodnight ] && continue
    k=$(awk '/^kind:/{print $2; exit}' "$sd/$n"); [ -n "$k" ] || k=spread
    [ "$k" = spread ] && files="$files $sd/$n"
  done
  want=$(cat $files | sha256sum | cut -d' ' -f1)
  have=$(awk '/^fact: list$/{f=1} f && /^sha:/{sub(/^sha: *sha256:/, ""); print; exit}' "$sd/goodnight")
  if [ "$want" = "$have" ]; then echo "  goodnight's list row matches the $(echo $files | wc -w) spreads it read ($(printf '%.16s' "$want"))"
  else echo "  goodnight's list is stale: its sha256 $(printf '%.16s' "$have") is not the spreads' $(printf '%.16s' "$want"); run tools/inventory.py"; bad=1; fi
  fuller=$(awk '/^== fuller page ==/{f=1; next} /^== /{f=0} f' "$sd/goodnight")
  n_ids=0
  for f in $files; do
    for id in $(awk '/^== facts ==/{f=1; next} /^== /{f=0} f && /^fact:/{print $2}' "$f" | sort -u); do
      n_ids=$((n_ids+1))
      printf '%s\n' "$fuller" | grep -qwF -- "$id" || { echo "  goodnight does not name $(basename "$f")'s atom '$id'"; bad=1; }
    done
  done
  echo "  goodnight names $n_ids atoms from those spreads"
  return $bad
}

# --- promises 7 to 15: the picture book (tools/book.py) -----------------------
# facing pages, the title once, keys and the map, the lost reader, motion, one page on a phone,
# no word on a figure, every fuller page fits. checks/book.js says each in words.
check_bookoffline() { [ -s "$1" ] || { echo "  missing or empty: $1"; return 1; }; check_offline "$1"; }
check_bookread() { node checks/book.js read "$@"; }

# --- promise 17: the published book is what its sources make -------------------
# Builds the book afresh from SRCDIR with the real tools/book.py into a scratch folder, then compares
# byte for byte (cmp) with the book.html and book-hosted.html in OUTDIR. A spread edited without a
# rebuild, or a hand edit to book.html, turns it red.
check_current() {  # SRCDIR OUTDIR
  sd=$(cd "$1" && pwd); od=$2; bad=0
  ct=$(mktemp -d "${TMPDIR:-/tmp}/gw-current.XXXXXX")
  if ! GW_SRC="$sd" GW_OUT="$ct" python3 -B "$HERE/tools/book.py" >/dev/null 2>"$ct/err"; then
    echo "  tools/book.py failed:"; sed 's/^/    /' "$ct/err" | head -3; rm -rf "$ct"; return 1
  fi
  for f in book.html book-hosted.html; do
    if [ ! -s "$od/$f" ]; then echo "  missing or empty: $f"; bad=1
    elif cmp -s "$ct/$f" "$od/$f"; then echo "  $f is what tools/book.py makes from the sources ($(sha256sum "$od/$f" | cut -c1-16))"
    else echo "  $f is not what tools/book.py makes from the sources now; rebuild: sh run -p book.pipeline"; bad=1; fi
  done
  rm -rf "$ct"; return $bad
}

# --- promise 18: the site serves this book ---------------------------------------
# The ghostlights.theater source kept beside the book (site/) must carry this book.html, byte for
# byte, as its show page: deploy/install.sh mirrors site/public/ with --delete, so a stale or missing
# copy there would go live as it stands.
check_site() {  # SITEDIR BOOKHTML
  sp="$1/public/build-a-ghostwheel/index.html"; bad=0
  [ -s "$1/public/index.html" ] || { echo "  missing or empty: the site's front page, $1/public/index.html"; bad=1; }
  for f in install.sh nginx-ghostlights.theater.conf ghostlights.theater.interim.conf logrotate-ghostlights.theater; do
    [ -s "$1/deploy/$f" ] || { echo "  missing or empty: $1/deploy/$f"; bad=1; }
  done
  if [ ! -s "$sp" ]; then echo "  missing or empty: the site's show page, $sp"; bad=1
  elif cmp -s "$sp" "$2"; then echo "  the site's show page is this book.html, byte for byte ($(sha256sum "$sp" | cut -c1-16))"
  else echo "  the site's show page is not this book.html: cp book.html site/public/build-a-ghostwheel/index.html"; bad=1; fi
  # The house pages store nothing: no script and no inline handler in any of them, and the front page
  # says so with a link to the book's note on what the book remembers.
  for f in "$1"/public/*.html; do
    [ -f "$f" ] || continue
    if grep -Eiq '<script|[[:space:]]on[a-z]+[[:space:]]*=' "$f"; then echo "  $(basename "$f") carries a script or an inline handler"; bad=1; fi
  done
  if grep -q 'href="/build-a-ghostwheel/#privacy"' "$1/public/index.html" 2>/dev/null; then
    echo "  the house pages carry no script; the front page links to the book's privacy note"
  else echo "  the front page does not link to the book's privacy note (/build-a-ghostwheel/#privacy)"; bad=1; fi
  # The front page's request-log sentence is site/privacy-log's (rendered from the logreq register), and
  # that file is the one its stamp names: one home for the words, never edited by hand.
  if ! stamp_ok "$1/privacy-log"; then
    echo "  site/privacy-log: the sentence is not the one its stamp names (render it again from the register)"; bad=1
  elif grep -qF -- "$(html_line "$1/privacy-log")" "$1/public/index.html" 2>/dev/null; then
    echo "  the front page carries site/privacy-log's sentence, which matches its stamp"
  else echo "  the front page does not carry site/privacy-log's sentence"; bad=1; fi
  return $bad
}

# --- promise 20: the privacy note names exactly the keys the book writes -----------------------
# Reads the page's own script for every localStorage or sessionStorage write (a key that is not a
# quoted literal cannot be read, and fails), refuses any cookie, then requires the note
# (<p class="privacy" id="privacy">) to name each written key in <code> and to name no other.
check_privacy() {  # HTML
  h=$1; bad=0
  [ -s "$h" ] || { echo "  missing or empty: $h"; return 1; }
  pt=$(mktemp -d "${TMPDIR:-/tmp}/gw-privacy.XXXXXX")
  grep -o '[A-Za-z]*Storage\.setItem([^,)]*' "$h" | sed 's/^[A-Za-z]*Storage\.setItem(//' > "$pt/args"
  awk -v q="'" '{ a = $0; gsub(/^[ \t]+|[ \t]+$/, "", a)
         if (a ~ "^" q "[^" q "]*" q "$" || a ~ /^"[^"]*"$/) { print substr(a, 2, length(a) - 2) }
         else print "?" a }' "$pt/args" | sort -u > "$pt/written"
  if grep -q '^?' "$pt/written"; then sed -n 's/^?/  a storage key the check cannot read: /p' "$pt/written"; bad=1; fi
  if grep -q 'document\.cookie' "$h"; then echo "  the page touches document.cookie"; bad=1; fi
  awk '{ while ((i = index($0, "<p class=\"privacy\" id=\"privacy\"")) > 0) {
           r = substr($0, i); j = index(r, "</p>"); print substr(r, 1, j); $0 = substr(r, j + 4) } }' "$h" > "$pt/note"
  if [ ! -s "$pt/note" ]; then echo "  no privacy note (<p class=\"privacy\" id=\"privacy\">) in the page"; rm -rf "$pt"; return 1; fi
  grep -o '<code>[^<]*</code>' "$pt/note" | sed 's/<[^>]*>//g' | sort -u > "$pt/named"
  grep -v '^?' "$pt/written" > "$pt/w" || true
  comm -23 "$pt/w" "$pt/named" | sed 's/^/  written and not named in the note: /' > "$pt/miss"
  comm -13 "$pt/w" "$pt/named" | sed 's/^/  named in the note and not written: /' >> "$pt/miss"
  [ -s "$pt/miss" ] && { cat "$pt/miss"; bad=1; }
  grep -q 'id="forget"' "$pt/note" || { echo "  the note has no Forget my settings button (id=\"forget\")"; bad=1; }
  # The request-log sentence is src/privacy-log's (rendered from the logreq register), matching its stamp,
  # and tools/book.py types none of its own. A planted book beside its own src/ and tools/ is read there.
  d=$(dirname "$h"); pl=$SRCA/privacy-log; [ -f "$d/src/privacy-log" ] && pl=$d/src/privacy-log
  bp=$HERE/tools/book.py; [ -f "$d/tools/book.py" ] && bp=$d/tools/book.py
  if ! stamp_ok "$pl"; then echo "  src/privacy-log: the sentence is not the one its stamp names (render it again from the register)"; bad=1
  elif ! grep -qF -- "$(html_line "$pl")" "$pt/note"; then echo "  the note does not carry src/privacy-log's sentence"; bad=1; fi
  if grep -q 'web server' "$bp"; then echo "  tools/book.py types a request-log sentence of its own; the words live in src/privacy-log"; bad=1; fi
  [ $bad -eq 0 ] && echo "  the note names the $(wc -l < "$pt/w" | tr -d ' ') key(s) the script writes ($(tr '\n' ' ' < "$pt/w" | sed 's/ $//')), no cookie, and offers to forget"
  rm -rf "$pt"; return $bad
}

# --- promise 19: the cited C4 files are here, byte for byte, and the index tells the truth --------
# sources/INDEX.org lists every C4 file the witness rows cite: the hash the book recorded, the hash
# when it was copied here, and where it is here (or that it was held back). This reads the rows in
# src/ and the files in sources/ with sh and awk and requires: every C4 path a row cites has an
# entry; each entry's recorded hash is the sha: of every row citing it; each copy here hashes to its
# entry; and no file sits in sources/ without an entry.
check_sources() {  # SOURCESDIR SRCDIR
  d=$1; sd=$2; bad=0
  [ -s "$d/INDEX.org" ] || { echo "  missing or empty: $d/INDEX.org"; return 1; }
  st=$(mktemp -d "${TMPDIR:-/tmp}/gw-sources.XXXXXX")
  awk 'function flush() { if (p != "") print p, h, r, t }
       /^\*\* =c4\// { flush(); p = $2; gsub(/=/, "", p); h = "-"; r = "-"; t = "-" }
       /^- here: =sources\// { h = $3; gsub(/=/, "", h) }
       /^- sha256 the book recorded: / { r = $6; gsub(/=/, "", r) }
       /^- sha256 on [0-9-]+: / { t = $5; gsub(/=/, "", t) }
       END { flush() }' "$d/INDEX.org" > "$st/index"
  for n in $(awk '/^spread:/{print $2}' "$sd/book"); do
    awk '/^== facts ==/{f=1; next} /^== /{f=0}
         f && /^from: c4\// { p = $2; sub(/[,;(].*$/, "", p); sub(/\.$/, "", p) }
         f && /^from: / && !/^from: c4\// { p = "" }
         f && /^sha: sha256:/ && p != "" { s = $2; sub(/^sha256:/, "", s); print p, s; p = "" }' "$sd/$n"
  done | sort -u > "$st/rows"
  ne=$(wc -l < "$st/index" | tr -d ' '); nr=$(cut -d' ' -f1 "$st/rows" | sort -u | wc -l | tr -d ' ')
  [ "$ne" -gt 0 ] || { echo "  the index lists no files"; bad=1; }
  while read -r p s; do
    r=$(awk -v p="$p" '$1 == p {print $3}' "$st/index")
    if [ -z "$r" ]; then echo "  a row cites $p and the index has no entry for it"; bad=1
    elif [ "$r" != "$s" ]; then echo "  a row cites $p with sha256 $(printf '%.16s' "$s"), the index says the book recorded $(printf '%.16s' "$r")"; bad=1; fi
  done < "$st/rows"
  here=0
  while read -r p h r t; do
    [ "$h" = "-" ] && continue
    here=$((here+1)); f="$d/${h#sources/}"
    if [ ! -f "$f" ]; then echo "  $h is in the index and not in the folder"; bad=1; continue; fi
    a=$(sha256sum "$f" | cut -d' ' -f1)
    [ "$a" = "$t" ] || { echo "  $h hashes to $(printf '%.16s' "$a"), not the index's $(printf '%.16s' "$t")"; bad=1; }
  done < "$st/index"
  (cd "$d" && find . -type f ! -name INDEX.org | sed 's|^\./|sources/|' | sort) > "$st/files"
  awk '$2 != "-" {print $2}' "$st/index" | sort > "$st/listed"
  comm -23 "$st/files" "$st/listed" | sed 's/^/  in the folder and not in the index: /' > "$st/extra"
  [ -s "$st/extra" ] && { cat "$st/extra"; bad=1; }
  [ $bad -eq 0 ] && echo "  $nr C4 files cited, $ne in the index, $here here; every copy hashes to its entry, every row's sha: to its file's"
  rm -rf "$st"; return $bad
}

# --- running them -------------------------------------------------------------
run_one() {  # NAME, then the check's own arguments
  name=$1; shift
  if out=$("check_$name" "$@" 2>&1); then
    printf 'ok    %s\n%s\n' "$name" "$out" | sed '/^$/d'; return 0
  else
    printf 'RED   %s\n%s\n' "$name" "$out" | sed '/^$/d'; return 1
  fi
}

BOOK_CHECKS="words inventory current privacy bookoffline bookread"
EDITION_CHECKS="words inventory current privacy site sources bookoffline bookread"
PILOT_CHECKS="outputs length captions words inventory offline keys bookoffline bookread"
SITE=${GW_SITE:-site}
SOURCES=${GW_SOURCES:-sources}
all_checks() {
  want=""
  for a in ${*:-edition}; do
    case $a in
      edition) want="$want $EDITION_CHECKS" ;;
      book)    want="$want $BOOK_CHECKS" ;;
      pilot)   want="$want $PILOT_CHECKS" ;;
      *)       want="$want $a" ;;
    esac
  done
  fails=0; n=0
  for c in $want; do
    case $c in
      outputs)  n=$((n+1)); run_one outputs "$OUT" $TAKES || fails=$((fails+1)) ;;
      length)   for t in $TAKES; do s=$(sfx "$t"); for v in "pilot$s.mp4" "pilot$s-captioned.mp4"; do
                  n=$((n+1)); run_one length "$OUT/$v" "$OUT/pilot$s.mp3" || fails=$((fails+1)); done; done ;;
      captions) for t in $TAKES; do s=$(sfx "$t"); n=$((n+1)); run_one captions "$OUT/pilot$s.vtt" "$OUT/pilot$s.mp3" || fails=$((fails+1)); done ;;
      words)    n=$((n+1)); run_one words "$SRC" || fails=$((fails+1)) ;;
      inventory) n=$((n+1)); run_one inventory "$SRC" || fails=$((fails+1)) ;;
      offline)  n=$((n+1)); run_one offline "$OUT/slides.html" || fails=$((fails+1)) ;;
      keys)     n=$((n+1)); run_one keys "$OUT/slides.html" || fails=$((fails+1)) ;;
      bookoffline) n=$((n+1)); run_one bookoffline "$OUT/book.html" || fails=$((fails+1)) ;;
      bookread) n=$((n+1)); run_one bookread "$OUT/book.html" || fails=$((fails+1)) ;;
      current)  n=$((n+1)); run_one current "$SRC" "$OUT" || fails=$((fails+1)) ;;
      site)     n=$((n+1)); run_one site "$SITE" "$OUT/book.html" || fails=$((fails+1)) ;;
      sources)  n=$((n+1)); run_one sources "$SOURCES" "$SRC" || fails=$((fails+1)) ;;
      privacy)  n=$((n+1)); run_one privacy "$OUT/book.html" || fails=$((fails+1)) ;;
      *) echo "checks: no check named '$c'"; fails=$((fails+1)) ;;
    esac
  done
  if [ $fails -eq 0 ]; then echo "CHECKS GREEN ($n of $n)"; else echo "CHECKS RED ($fails of $n failed)"; fi
  [ $fails -eq 0 ]
}

# --- prove-red: a planted fault for every promise ------------------------------
expect_red() {  # LABEL, then the check and its arguments
  label=$1; shift
  if out=$("$@" 2>&1); then
    echo "STILL GREEN  $label"; echo "$out" | sed 's/^/      /'; PR_FAIL=$((PR_FAIL+1))
  else
    echo "red (good)   $label"; echo "$out" | grep -v '^ *[a-z0-9_.-]*: video\|^  [a-z]* *picture page\|cues inside' | head -2 | sed 's/^/      /'
  fi
}
# build a deck with a planted fault, through the real tool, so its hashes are honest
planted_deck() {  # NAME SED-SCRIPT  -> prints the path of the planted deck
  pd="$TMP/deck-$1"; mkdir -p "$pd/tools"
  cp tools/slides.py tools/spread.py "$pd/tools/"
  sed -i "$2" "$pd/tools/slides.py"
  GW_SRC="$SRCA" GW_OUT="$pd" python3 "$pd/tools/slides.py" >/dev/null
  echo "$pd/slides.html"
}

# build a book with a planted fault, through the real tools: a sed on book.py, and/or a command
# run on a copy of the sources (in $D)
planted_book() {  # NAME TOOL-SED [SRC-COMMAND]  -> prints the path of the planted book
  pb="$TMP/book-$1"; mkdir -p "$pb/tools"
  cp tools/book.py tools/slides.py tools/spread.py "$pb/tools/"
  [ -n "$2" ] && sed -i "$2" "$pb/tools/book.py"
  s="$SRCA"
  if [ -n "${3:-}" ]; then cp -rL "$SRCA" "$pb/src"; D="$pb/src"; eval "$3"; s="$pb/src"; fi
  GW_SRC="$s" GW_OUT="$pb" python3 "$pb/tools/book.py" >/dev/null
  echo "$pb/book.html"
}
want_pr() { case " $PR_WANT " in *" $1 "*) return 0 ;; *) return 1 ;; esac; }

prove_red() {
  PR_FAIL=0
  # groups: the book edition's by default; "pilot" is the pilot's (media and deck included)
  pr=""
  for g in ${PR_WANT:-edition}; do
    case $g in
      edition) pr="$pr words inventory book current privacy site sources" ;;
      pilot)   pr="$pr media words inventory deck book" ;;
      *)       pr="$pr $g" ;;
    esac
  done
  PR_WANT=$pr
  TMP=$(mktemp -d "${TMPDIR:-/tmp}/gw-prove-red.XXXXXX")
  trap 'rm -rf "$TMP"' EXIT INT TERM
  t=$(echo $TAKES | awk '{print $1}'); s=$(sfx "$t")

  if want_pr media; then
  # 1 outputs: one output missing, then one empty
  mkdir -p "$TMP/out1" "$TMP/out2"
  for f in "$OUT"/*; do ln -s "$(cd "$(dirname "$f")" && pwd)/$(basename "$f")" "$TMP/out1/"; ln -s "$(cd "$(dirname "$f")" && pwd)/$(basename "$f")" "$TMP/out2/"; done
  rm -f "$TMP/out1/pilot$s.mp3"
  expect_red "outputs: pilot$s.mp3 removed" check_outputs "$TMP/out1" $TAKES
  rm -f "$TMP/out2/transcript$s.txt"; : > "$TMP/out2/transcript$s.txt"
  expect_red "outputs: transcript$s.txt empty" check_outputs "$TMP/out2" $TAKES

  # 2 length: the video cut 1.5 s short of its narration
  v=$(vdur "$OUT/pilot$s.mp4")
  short=$(awk -v v="$v" 'BEGIN{printf "%.3f", v-1.5}')
  ffmpeg -hide_banner -loglevel error -y -i "$OUT/pilot$s.mp4" -t "$short" -c copy "$TMP/short.mp4"
  expect_red "length: video cut 1.5 s short" check_length "$TMP/short.mp4" "$OUT/pilot$s.mp3"

  # 3 captions: one cue after the audio ends, one that ends before it starts
  a=$(fdur "$OUT/pilot$s.mp3")
  late=$(awk -v a="$a" 'BEGIN{t=a+4; printf "%02d:%02d:%06.3f", t/3600, (t%3600)/60, t-int(t/60)*60}')
  { cat "$OUT/pilot$s.vtt"; printf '999\n%s --> %s\nToo late.\n\n' "00:00:01.000" "$late"; } > "$TMP/late.vtt"
  expect_red "captions: a cue ends after the audio" check_captions "$TMP/late.vtt" "$OUT/pilot$s.mp3"
  { cat "$OUT/pilot$s.vtt"; printf '998\n00:00:05.000 --> 00:00:04.000\nBackwards.\n\n'; } > "$TMP/back.vtt"
  expect_red "captions: a cue ends before it starts" check_captions "$TMP/back.vtt" "$OUT/pilot$s.mp3"
  fi

  if want_pr words; then
  # 4 words: picture page over 40, fuller page over 250, a word not on the easy list
  for k in pic ful easy; do cp -rL "$SRC" "$TMP/src-$k"; done   # -L: copies, never links back to the real sources
  awk '{print} /^== picture page ==/ && !d {print "a a a a a a a a a a a a a a a a a a a a"; d=1}' "$SRC/door" > "$TMP/src-pic/door"
  expect_red "words: twenty words added to door's picture page" check_words "$TMP/src-pic"
  awk '{print} /^== fuller page ==/ && !d {for(i=0;i<8;i++) print "the shop the shop the shop the shop the shop"; d=1}' "$SRC/letters" > "$TMP/src-ful/letters"
  expect_red "words: eighty words added to letters' fuller page" check_words "$TMP/src-ful"
  sed -i 's/^Pin keeps the list\.$/Pin keeps the inventory./' "$TMP/src-easy/letters"
  expect_red "words: 'inventory' on a picture page, not on the easy list" check_words "$TMP/src-easy"
  fi

  if want_pr inventory; then
  # 16 inventory: a spread edited after goodnight was made; an atom missing from goodnight's page
  for k in stale gone; do cp -rL "$SRC" "$TMP/src-$k"; done
  printf '# a later edit\n' >> "$TMP/src-stale/door"
  expect_red "inventory: door edited after goodnight was made" check_inventory "$TMP/src-stale"
  sed -i '/^== fuller page ==/,/^== /s/\bnohits, //' "$TMP/src-gone/goodnight"
  expect_red "inventory: wormholes' atom 'nohits' left off goodnight's page" check_inventory "$TMP/src-gone"
  fi

  if want_pr deck; then
  # 5 offline: an image from another host; an inline event handler; no CSP and a live request
  d1=$(planted_deck img 's#<main aria-label#<img src="https://example.org/x.png" alt=""><main aria-label#')
  expect_red "offline: <img src=https://example.org/...>" check_offline "$d1"
  d2=$(planted_deck onclick 's#<button type="button" id="next">#<button type="button" id="next" onclick="next()">#')
  expect_red "offline: onclick= on a button" check_offline "$d2"
  d3=$(planted_deck nocsp 's#<meta http-equiv="Content-Security-Policy" content="{csp}">#<link rel="stylesheet" href="https://example.org/a.css">#')
  expect_red "offline: CSP removed and a stylesheet from another host" check_offline "$d3"

  # 6 keys and motion: no keyboard handler; the reduced-motion rule removed
  d4=$(planted_deck nokeys "s#document.addEventListener('keydown'#document.addEventListener('keydown-unheard'#")
  expect_red "keys: the keydown listener renamed away" check_keys "$d4"
  d5=$(planted_deck nomotionrule 's#@media (prefers-reduced-motion:reduce)#@media (prefers-reduced-motion:no-such-value)#')
  expect_red "keys: the prefers-reduced-motion rule disabled" check_keys "$d5"
  fi

  if want_pr book; then
  # 7-15 the picture book
  b=$(planted_book img 's#<main aria-label#<img src="https://example.org/x.png" alt=""><main aria-label#')
  expect_red "book offline: <img src=https://example.org/...>" check_bookoffline "$b"
  b=$(planted_book onepage 's#return narrow() ? \[cur\] : \[cur - (cur % 2), cur - (cur % 2) + 1\];#return [cur];#')
  expect_red "book facing: a wide screen shows one page at a time" check_bookread "$b" facing
  b=$(planted_book title '' 'sed -i "s/^Come in!\$/So You Want To Build A Ghostwheel?\\n\\nCome in!/" "$D/cover"; sed -i "/^words: scatter\$/a at: 8 28 84" "$D/cover"')
  expect_red "book title: the title repeated in the title page words" check_bookread "$b" title
  b=$(planted_book nokeys "s#document.addEventListener('keydown'#document.addEventListener('keydown-unheard'#")
  expect_red "book keys: the keydown listener renamed away" check_bookread "$b" keys
  b=$(planted_book nomap "s#var p = firstPageOf(r.getAttribute('data-room'));#var p = -1;#")
  expect_red "book map: choosing a room goes nowhere" check_bookread "$b" map
  b=$(planted_book nolost 's#flips >= 4#flips >= 99#')
  expect_red "book lost: the map is never offered" check_bookread "$b" lost
  b=$(planted_book nomotion 's#@media (prefers-reduced-motion:reduce)#@media (prefers-reduced-motion:no-such-value)#')
  expect_red "book motion: the reduced-motion rule disabled" check_bookread "$b" motion
  b=$(planted_book wideonly "s#window.matchMedia('(max-width:760px),(max-aspect-ratio:1/1)')#window.matchMedia('(max-width:10px)')#")
  expect_red "book narrow: a phone shows two pages at once" check_bookread "$b" narrow
  b=$(planted_book onpin '' 'sed -i "s/^at: 57 77 39\$/at: 74 50 24/" "$D/door"')
  expect_red "book figures: door's words moved onto Pin" check_bookread "$b" figures
  b=$(planted_book nofit 's#lo = fs \* 0.74#lo = fs * 9#; s#data-fs="2.2"#data-fs="3.4"#')
  expect_red "book fit: the fit removed and the type set large" check_bookread "$b" fit
  b=$(planted_book noforget 's#localStorage.removeItem(key); gone++;#gone++;#')
  expect_red "book forget: Forget my settings removes nothing" check_bookread "$b" forget
  b=$(planted_book storeonopen 's#    if (pick) try { localStorage.setItem#    try { localStorage.setItem#')
  expect_red "book forget: opening the map stores the view before any pick" check_bookread "$b" forget
  b=$(planted_book nohash "s#  if (askedPrivacy) { openMap();#  if (false) { openMap();#")
  expect_red "book forget: #privacy no longer opens the map at the note" check_bookread "$b" forget
  fi

  if want_pr current; then
  # 17 current: the cover's words edited after book.html was built; book-hosted.html edited by hand
  cp -rL "$SRC" "$TMP/src-cur"
  sed -i 's/^Come in!$/Come on in!/' "$TMP/src-cur/cover"
  expect_red "current: the cover's words edited after book.html was built" check_current "$TMP/src-cur" "$OUT"
  mkdir -p "$TMP/out-cur"; cp "$OUT/book.html" "$TMP/out-cur/"
  { cat "$OUT/book-hosted.html"; printf '<!-- a hand edit -->\n'; } > "$TMP/out-cur/book-hosted.html"
  expect_red "current: book-hosted.html edited by hand" check_current "$SRC" "$TMP/out-cur"
  fi

  if want_pr site; then
  # 18 site: the show page one byte off the book; the show page missing
  mkdir -p "$TMP/site1" "$TMP/site2"; cp -R "$SITE/." "$TMP/site1/"; cp -R "$SITE/." "$TMP/site2/"
  printf ' ' >> "$TMP/site1/public/build-a-ghostwheel/index.html"
  expect_red "site: the show page one byte longer than book.html" check_site "$TMP/site1" "$OUT/book.html"
  rm -f "$TMP/site2/public/build-a-ghostwheel/index.html"
  expect_red "site: the show page missing" check_site "$TMP/site2" "$OUT/book.html"
  for k in script nolink nolog stamp norot; do mkdir -p "$TMP/site-$k"; cp -R "$SITE/." "$TMP/site-$k/"; done
  sed -i 's#</body>#<script>localStorage.setItem("x", "1")</script></body>#' "$TMP/site-script/public/index.html"
  expect_red "site: a script on the front page" check_site "$TMP/site-script" "$OUT/book.html"
  sed -i 's#href="/build-a-ghostwheel/\#privacy"#href="/build-a-ghostwheel/"#' "$TMP/site-nolink/public/index.html"
  expect_red "site: the front page's link to the book's privacy note gone" check_site "$TMP/site-nolink" "$OUT/book.html"
  sed -i 's# The web server at ghostlights.theater keeps a log of each request: [^<]*##' "$TMP/site-nolog/public/index.html"
  expect_red "site: the front page's request-log sentence gone" check_site "$TMP/site-nolog" "$OUT/book.html"
  sed -i '2s/14 days/15 days/' "$TMP/site-stamp/privacy-log"
  expect_red "site: site/privacy-log edited by hand (its stamp no longer holds)" check_site "$TMP/site-stamp" "$OUT/book.html"
  rm -f "$TMP/site-norot/deploy/logrotate-ghostlights.theater"
  expect_red "site: the site's rotation file missing" check_site "$TMP/site-norot" "$OUT/book.html"
  fi

  if want_pr privacy; then
  # 20 privacy: a second key written that the note does not name; the note names a key nothing writes
  b=$(planted_book newkey "s#if (pick) try { localStorage.setItem('gwbook.look', l); }#if (pick) try { localStorage.setItem('gwbook.look', l); localStorage.setItem('gwbook.seen', '1'); }#")
  expect_red "privacy: a key written (gwbook.seen) that the note does not name" check_privacy "$b"
  b=$(planted_book oldkey "s#(<code>gwbook.look</code>)#(<code>gwbook.look</code>, <code>gwbook.page</code>)#")
  expect_red "privacy: the note names a key (gwbook.page) that nothing writes" check_privacy "$b"
  b=$(planted_book typed "s#{E(book_log, quote=False)} #A web server that serves this book keeps its usual request log. #")
  expect_red "privacy: a request-log sentence typed into tools/book.py" check_privacy "$b"
  b=$(planted_book stamp "" 'sed -i "2s/14 days/15 days/" "$D/privacy-log"')
  expect_red "privacy: src/privacy-log edited by hand (its stamp no longer holds)" check_privacy "$b"
  fi

  if want_pr sources; then
  # 19 sources: a copy a byte off its C4 file; a row whose sha: no longer agrees with the index; a file
  # in sources/ the index does not list
  for k in byte extra; do mkdir -p "$TMP/sources-$k"; cp -R "$SOURCES/." "$TMP/sources-$k/"; done
  printf '\n' >> "$TMP/sources-byte/c4/facts/drift"
  expect_red "sources: c4/facts/drift a byte longer than the file the book read" check_sources "$TMP/sources-byte" "$SRC"
  cp -rL "$SRC" "$TMP/src-sha"
  sed -i 's/^sha: sha256:ae8fef4fd79610775408a7c321754edd8bc3a19a40703812f3389abc231b7df8$/sha: sha256:0000000000000000000000000000000000000000000000000000000000000000/' "$TMP/src-sha/witnesses"
  expect_red "sources: a witnesses row's sha: changed, so it no longer agrees with the index" check_sources "$SOURCES" "$TMP/src-sha"
  printf 'unlisted\n' > "$TMP/sources-extra/c4/unlisted"
  expect_red "sources: a file in sources/ that the index does not list" check_sources "$TMP/sources-extra" "$SRC"
  fi

  if [ $PR_FAIL -eq 0 ]; then echo "PROVE-RED OK"; else echo "PROVE-RED FAILED ($PR_FAIL planted faults stayed green)"; fi
  [ $PR_FAIL -eq 0 ]
}

[ -n "${GW_CHECKS_LIB:-}" ] && return 0  # sourced for its functions only
# --prove-red may be followed by groups to plant: media words inventory deck book current site,
# or edition (the default: words inventory book current site sources) or pilot (media words inventory deck book)
if [ "${1:-}" = "--prove-red" ]; then shift; PR_WANT="$*"; prove_red; else all_checks "$@"; fi
