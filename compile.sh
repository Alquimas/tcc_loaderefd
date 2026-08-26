#!/usr/bin/env bash
#
# Compiles slides/main.tex and src/tcc.tex inside the texlive/texlive:latest
# Docker image. PDFs land in pdfs/, compilation artifacts in output/.
#
# Usage:
#   ./compile.sh [slides|tcc|all]   (default: all)
#
set -euo pipefail

IMAGE="texlive/texlive:latest"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PDFS="$ROOT/pdfs"
OUT="$ROOT/output"

usage() {
    echo "Usage: $0 [slides|tcc|all]"
    echo "  slides  - compile slides/main.tex -> pdfs/slides.pdf"
    echo "  tcc     - compile src/tcc.tex     -> pdfs/tcc.pdf"
    echo "  all     - compile both (default)"
    exit 1
}

TARGET="${1:-all}"
case "$TARGET" in
    slides|tcc|all) ;;
    *) usage ;;
esac

command -v docker >/dev/null 2>&1 || { echo "ERROR: docker not found in PATH" >&2; exit 1; }
docker image inspect "$IMAGE" >/dev/null 2>&1 \
    || { echo "ERROR: image $IMAGE not available - run: docker pull $IMAGE" >&2; exit 1; }

mkdir -p "$PDFS" "$OUT"

# Runs latexmk in the container; the PDF is produced at
# output/<name>/<doc>.pdf and copied to pdfs/<dest>.pdf.
compile() {
    local name="$1" src="$2" dest="$3"
    echo "==> Compiling $name ($src)"
    # -cd makes latexmk run from the document's directory, so tcc.cls and
    # relative \input/\include paths resolve correctly.
    docker run --rm \
        --user "$(id -u):$(id -g)" \
        -e HOME=/tmp \
        -v "$ROOT:/work" \
        -w /work \
        "$IMAGE" \
        latexmk -cd -pdf -interaction=nonstopmode -halt-on-error \
            -outdir="/work/output/$name" "/work/$src"
    cp "$OUT/$name/$dest.pdf" "$PDFS/$dest.pdf" \
        || { echo "ERROR: no PDF produced for $name (see $OUT/$name/$dest.log)" >&2; return 1; }
    echo "==> OK: $PDFS/$dest.pdf"
}

FAILED=0
if [[ "$TARGET" == "all" || "$TARGET" == "slides" ]]; then
    compile slides "slides/main.tex" main || FAILED=1
fi
if [[ "$TARGET" == "all" || "$TARGET" == "tcc" ]]; then
    compile tcc "src/tcc.tex" tcc || FAILED=1
fi

if [[ "$FAILED" -ne 0 ]]; then
    echo "ERROR: one or more compilations failed" >&2
    exit 1
fi
