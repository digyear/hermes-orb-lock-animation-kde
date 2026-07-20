#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_URL="https://hermes-agent.nousresearch.com/img/desktop/portal-figure-orb.webm"
SOURCE="$ROOT/source-assets/portal-figure-orb.webm"
OUTPUT="$ROOT/package/contents/assets/hermes-orb.gif"

mkdir -p "$(dirname "$SOURCE")" "$(dirname "$OUTPUT")"
curl -fsSL --retry 3 -o "$SOURCE" "$SOURCE_URL"

ffmpeg -hide_banner -loglevel error -y -i "$SOURCE" \
  -filter_complex 'fps=15,split[s0][s1];[s0]palettegen=max_colors=128:stats_mode=diff[p];[s1][p]paletteuse=dither=bayer:bayer_scale=3:diff_mode=rectangle' \
  -loop 0 "$OUTPUT"

ffprobe -v error \
  -show_entries format=duration,size:stream=codec_name,width,height,avg_frame_rate,nb_frames \
  -of json "$OUTPUT"
