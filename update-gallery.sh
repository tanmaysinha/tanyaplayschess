#!/usr/bin/env bash
# Regenerates images/gallery/manifest.json from whatever image files are in
# images/gallery/. Only needed for static hosts that DON'T list directories
# (e.g. GitHub Pages). Local previews with `python3 -m http.server` don't need it.
#
# Usage:  ./update-gallery.sh

set -euo pipefail
cd "$(dirname "$0")"

DIR="images/gallery"
OUT="$DIR/manifest.json"

# Collect .jpg/.jpeg/.png/.webp (case-insensitive), sorted naturally.
files=$(find "$DIR" -maxdepth 1 -type f \
  \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) \
  -exec basename {} \; | sort -V)

{
  echo "["
  first=1
  while IFS= read -r f; do
    [ -z "$f" ] && continue
    if [ $first -eq 0 ]; then echo ","; fi
    printf '  "%s"' "$f"
    first=0
  done <<< "$files"
  echo ""
  echo "]"
} > "$OUT"

count=$(printf '%s\n' "$files" | grep -c . || true)
echo "Wrote $OUT with $count image(s)."
