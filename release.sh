#!/usr/bin/env bash
set -euo pipefail

ADDON_NAME="FontChanger"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VERSION=$(grep -oP '## Version: \K.*' "$SCRIPT_DIR/FontChanger.txt" | tr -d '[:space:]')
OUT_DIR="$SCRIPT_DIR/releases"
ZIP_NAME="${ADDON_NAME}-${VERSION}.zip"

mkdir -p "$OUT_DIR"

cd "$SCRIPT_DIR"

zip -r "$OUT_DIR/$ZIP_NAME" \
  FontChanger.txt \
  Constants.lua \
  CustomFontOptions.lua \
  Menu.lua \
  FontChanger.lua \
  Compatibility.lua \
  CREDIT.txt \
  README.md \
  CHANGELOG.md \
  fonts/LICENSING.txt \
  fonts/slug.bat \
  fonts/slug.sh \
  fonts/slugs/FC*.slug \
  fonts/ttfs/FC*.ttf \
  -x '*.DS_Store'

echo ""
echo "Created: $OUT_DIR/$ZIP_NAME"
echo "Contents:"
unzip -l "$OUT_DIR/$ZIP_NAME"
