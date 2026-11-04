#!/bin/sh
# site.sh -- give the ghostlights.theater source (site/) this book as its show page.
# Copyright 2026 Corwin Brust; GPL-3.0-or-later
#
# Reads $GW_OUT/book.html; writes $GW_SITE/public/build-a-ghostwheel/index.html (GW_SITE defaults
# to site/ beside this folder's run). A copy of the book plucked without site/ has nothing to do here,
# and says so. checks/run.sh site is the promise that the two stay byte for byte the same.
set -eu
HERE=$(cd "$(dirname "$0")/.." && pwd)
out=${GW_OUT:-.}; site=${GW_SITE:-$HERE/site}
case $site in /*) ;; *) site=$HERE/$site ;; esac
[ -s "$out/book.html" ] || { echo "site: no book.html in $out; run the book stage first" >&2; exit 1; }
if [ ! -d "$site/public" ]; then echo "site: no site here ($site/public); nothing to copy"; exit 0; fi
mkdir -p "$site/public/build-a-ghostwheel"
cp "$out/book.html" "$site/public/build-a-ghostwheel/index.html"
echo "site: $site/public/build-a-ghostwheel/index.html is book.html ($(wc -c < "$out/book.html" | tr -d ' ') bytes)"
