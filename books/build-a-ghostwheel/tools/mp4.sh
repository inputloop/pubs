#!/bin/sh
# mp4.sh -- frames plus audio to mp4: crossfades between shots, H.264.
# Copyright 2026 Corwin Brust; GPL-3.0-or-later
#
# Reads $GW_BUILD/<take>/segments.txt (from the frames stage), narration.wav and
# chapters.txt; writes $GW_OUT/pilot<-take>.mp4. Each shot's frames overlap the
# next by one crossfade, centred on the moment the narration turns the page,
# so the joined picture is exactly as long as the narration.
# GW_PRESET (veryfast) and GW_CRF (20) tune the encoder.
set -eu
BUILD=${GW_BUILD:-build}
OUT=${GW_OUT:-.}
TAKE=${GW_TAKE:-}
D="$BUILD/${TAKE:-default}"
SUF=${TAKE:+-$TAKE}
SEG="$D/segments.txt"
[ -s "$SEG" ] || { echo "mp4: no $SEG; run the frames stage first" >&2; exit 1; }

read -r _ FPS _ XF _ FRAMES _rest < "$SEG"
set --
FILTER=""
PREV=""
N=0
while read -r KIND DIR COUNT OFFSET ID; do
  [ "$KIND" = seg ] || continue
  set -- "$@" -framerate "$FPS" -start_number 0 -i "$DIR/f%05d.jpg"
  if [ "$N" -eq 0 ]; then
    PREV="[0:v]"
  else
    FILTER="$FILTER${PREV}[$N:v]xfade=transition=fade:duration=$XF:offset=$OFFSET[x$N];"
    PREV="[x$N]"
  fi
  N=$((N + 1))
done < "$SEG"
FILTER="$FILTER${PREV}format=yuv420p[vout]"

ffmpeg -hide_banner -loglevel error -y "$@" -i "$D/narration.wav" -i "$D/chapters.txt" \
  -filter_complex "$FILTER" -map "[vout]" -map "$N:a" -map_metadata $((N + 1)) -map_chapters $((N + 1)) \
  -c:v libx264 -preset "${GW_PRESET:-veryfast}" -crf "${GW_CRF:-20}" -r "$FPS" -frames:v "$FRAMES" \
  -c:a aac -b:a 160k -movflags +faststart "$OUT/pilot$SUF.mp4"
echo "mp4: $OUT/pilot$SUF.mp4 ($N shots, $FRAMES frames at $FPS fps)"
