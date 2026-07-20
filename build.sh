#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VERSION="1.0.1"
OUT="$ROOT/dist/hermes-orb-animation-$VERSION.plasmoid"

mkdir -p "$ROOT/dist"
rm -f "$OUT"
(
  cd "$ROOT/package"
  zip -q -r "$OUT" metadata.json contents
)
sha256sum "$OUT"
printf 'Built: %s\n' "$OUT"
