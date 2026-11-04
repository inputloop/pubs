#!/bin/sh
# mp3.sh -- narration to mp3, tagged with the title, credit and chapters.
# Copyright 2026 Corwin Brust; GPL-3.0-or-later
# Reads $GW_BUILD/<take>/narration.wav and chapters.txt; writes $GW_OUT/pilot<-take>.mp3.
set -eu
BUILD=${GW_BUILD:-build}
OUT=${GW_OUT:-.}
TAKE=${GW_TAKE:-}
D="$BUILD/${TAKE:-default}"
SUF=${TAKE:+-$TAKE}
ffmpeg -hide_banner -loglevel error -y -i "$D/narration.wav" -i "$D/chapters.txt" \
  -map 0:a -map_metadata 1 -map_chapters 1 \
  -c:a libmp3lame -q:a 4 -id3v2_version 3 "$OUT/pilot$SUF.mp3"
echo "mp3: $OUT/pilot$SUF.mp3"
