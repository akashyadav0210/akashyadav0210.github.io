#!/usr/bin/env bash
# Regenerate the CV shown on /cv/ from the LaTeX master.
#
# The CV page displays rendered page images rather than an embedded PDF viewer,
# because embedded viewers scroll into dead grey space and behave badly on
# mobile. That means the images must be regenerated whenever the CV changes.
#
# Usage:  ./scripts/update_cv.sh
set -euo pipefail

SITE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="$SITE/../AkashYadavCV"
SRC_TEX="AY_CV_2_pages.tex"
DPI=150

command -v pdflatex >/dev/null || { echo "pdflatex not found (try: export PATH=~/texlive/2026/bin/x86_64-linux:\$PATH)"; exit 1; }
command -v pdftoppm >/dev/null || { echo "pdftoppm not found (poppler-utils)"; exit 1; }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# Compile in a temp dir so the read-only master and its directory stay untouched.
cp "$SRC_DIR/$SRC_TEX" "$SRC_DIR/resume.cls" "$TMP/"
( cd "$TMP" && for _ in 1 2; do pdflatex -interaction=nonstopmode -halt-on-error "$SRC_TEX" >/dev/null; done )

cp "$TMP/${SRC_TEX%.tex}.pdf" "$SITE/images/pub/Akash_Yadav_CV_web.pdf"

rm -f "$SITE"/images/pub/cv/page-*.png
mkdir -p "$SITE/images/pub/cv"
pdftoppm -png -r "$DPI" "$SITE/images/pub/Akash_Yadav_CV_web.pdf" "$SITE/images/pub/cv/page"

# Palette-quantise: roughly halves the file size with no visible loss on text.
python3 - "$SITE" <<'PY'
from PIL import Image
import glob, os, sys
site = sys.argv[1]
for f in sorted(glob.glob(os.path.join(site, 'images/pub/cv/page-*.png'))):
    before = os.path.getsize(f)
    Image.open(f).convert('RGB').quantize(colors=128, method=Image.MEDIANCUT).save(f, optimize=True)
    print(f"  {os.path.basename(f)}: {before//1024} KB -> {os.path.getsize(f)//1024} KB")
PY

echo
echo "Updated PDF and $(ls "$SITE"/images/pub/cv/page-*.png | wc -l) page image(s)."
echo "If the page count changed, update the <img> list in _pages/CV.md."
