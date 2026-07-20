#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_URL="https://hermes-agent.nousresearch.com/img/desktop/portal-figure-orb.webm"
SOURCE="$ROOT/source-assets/portal-figure-orb.webm"
OUTPUT="$ROOT/package/contents/assets/hermes-orb.webm"

mkdir -p "$(dirname "$SOURCE")" "$(dirname "$OUTPUT")"
curl -fsSL --retry 3 -o "$SOURCE" "$SOURCE_URL"

ffmpeg -hide_banner -loglevel error -y \
  -i "$SOURCE" \
  -f lavfi -i 'color=c=0x0800ff:s=1284x1590:r=15:d=2.8' \
  -filter_complex '[0:v]format=rgba,colorkey=0x000000:0.10:0.04[fg];[1:v]format=rgba[bg];[bg][fg]overlay=shortest=1:format=rgb,format=yuv420p[v]' \
  -map '[v]' -an -c:v libvpx-vp9 -b:v 0 -crf 28 -row-mt 1 -deadline good \
  "$OUTPUT"

ffprobe -v error \
  -show_entries format=duration,size:stream=codec_name,width,height,avg_frame_rate \
  -of json "$OUTPUT"
