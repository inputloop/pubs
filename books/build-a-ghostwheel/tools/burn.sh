#!/bin/sh
# burn.sh -- the same captions, burned into a second copy of the video.
# Copyright 2026 Corwin Brust; GPL-3.0-or-later
# Reads $GW_OUT/pilot<-take>.mp4 and pilot<-take>.vtt; writes pilot<-take>-captioned.mp4.
# The captions sit in the dark band below the pages, white on a soft box.
set -eu
OUT=${GW_OUT:-.}
TAKE=${GW_TAKE:-}
SUF=${TAKE:+-$TAKE}
cd "$OUT"
STYLE="FontName=DejaVu Sans,FontSize=11,PrimaryColour=&H00FFFFFF,OutlineColour=&H80201A16,BorderStyle=3,Outline=4,Shadow=0,MarginV=8"
ffmpeg -hide_banner -loglevel error -y -i "pilot$SUF.mp4" \
  -vf "subtitles=pilot$SUF.vtt:force_style='$STYLE'" -map 0:v -map 0:a -map_chapters 0 -map_metadata 0 \
  -c:v libx264 -preset "${GW_PRESET:-veryfast}" -crf "${GW_CRF:-20}" -c:a copy -movflags +faststart \
  "pilot$SUF-captioned.mp4"
echo "burn: $OUT/pilot$SUF-captioned.mp4"
