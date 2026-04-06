#!/usr/bin/env bash
set -euo pipefail

ADDON_NAME="FontChanger"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VERSION=$(grep -oP '## Version: \K.*' "$SCRIPT_DIR/FontChanger.txt" | tr -d '[:space:]')
OUT_DIR="$SCRIPT_DIR/releases"
ZIP_NAME="${ADDON_NAME}-${VERSION}.zip"

mkdir -p "$OUT_DIR"

STAGE_DIR=$(mktemp -d)
trap 'rm -rf "$STAGE_DIR"' EXIT

ADDON_DIR="$STAGE_DIR/$ADDON_NAME"
mkdir -p "$ADDON_DIR/fonts/slugs" "$ADDON_DIR/fonts/ttfs"

cp "$SCRIPT_DIR/FontChanger.txt" \
   "$SCRIPT_DIR/Constants.lua" \
   "$SCRIPT_DIR/CustomFontOptions.lua" \
   "$SCRIPT_DIR/Menu.lua" \
   "$SCRIPT_DIR/FontChanger.lua" \
   "$SCRIPT_DIR/Compatibility.lua" \
   "$SCRIPT_DIR/CREDIT.txt" \
   "$SCRIPT_DIR/README.md" \
   "$SCRIPT_DIR/CHANGELOG.md" \
   "$ADDON_DIR/"

cp "$SCRIPT_DIR/fonts/LICENSING.txt" \
   "$SCRIPT_DIR/fonts/slug.bat" \
   "$SCRIPT_DIR/fonts/slug.sh" \
   "$ADDON_DIR/fonts/"

cp "$SCRIPT_DIR"/fonts/slugs/FC*.slug "$ADDON_DIR/fonts/slugs/" 2>/dev/null || true
cp "$SCRIPT_DIR"/fonts/ttfs/FC*.ttf "$ADDON_DIR/fonts/ttfs/" 2>/dev/null || true

cd "$STAGE_DIR"

zip -r "$OUT_DIR/$ZIP_NAME" "$ADDON_NAME" -x '*.DS_Store'

echo ""
echo "Created: $OUT_DIR/$ZIP_NAME"
echo "Contents:"
unzip -l "$OUT_DIR/$ZIP_NAME"
