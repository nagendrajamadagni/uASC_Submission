#!/usr/bin/env bash
# Run InSpectre SAD analysis on one OpenSSL build variant.
#
# Usage:
#   bash run_openssl_sad.sh [BUILD_NAME]
#
# BUILD_NAME defaults to clang_O0. To run all builds sequentially:
#   for b in clang_O0 clang_O1 clang_O2 clang_O3 clang_Ofast clang_Og clang_Os clang_Oz \
#             gcc_O0 gcc_O1 gcc_O2 gcc_O3 gcc_Ofast gcc_Og gcc_Os; do
#     bash run_openssl_sad.sh "$b"
#   done

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSPECTRE_DIR="$(dirname "$SCRIPT_DIR")"
BUILDS_DIR="/home/njamadagni/gadget_search/openssl/builds"
RESULTS_DIR="/home/njamadagni/gadget_search/openssl/results"
CONFIG="$INSPECTRE_DIR/config_sad_only.yaml"
TEMPLATE="$SCRIPT_DIR/openssl_secret_regs_raw_only.csv"

BUILD="${1:-clang_O0}"
BUILD_DIR="$BUILDS_DIR/$BUILD"
RESULT_DIR="$RESULTS_DIR/$BUILD"

if [[ ! -d "$BUILD_DIR" ]]; then
    echo "ERROR: build directory not found: $BUILD_DIR" >&2
    exit 1
fi

mkdir -p "$RESULT_DIR/asm"
rm -f "$RESULT_DIR/sad.csv"

echo "========================================================"
echo " Build:   $BUILD"
echo " Binary:  $BUILD_DIR/libcrypto.so.3"
echo " Results: $RESULT_DIR"
echo "========================================================"
echo ""

echo "--- Step 1: Resolve function addresses ---"
python3 "$SCRIPT_DIR/gen_build_csv.py" \
    "$BUILD_DIR" \
    --template "$TEMPLATE" \
    --output  "$BUILD_DIR/address_list.csv" \
    --log     "$RESULT_DIR/gen_csv.log"

echo ""
echo "--- Step 2: InSpectre SAD analysis (log -> $RESULT_DIR/run.log) ---"

cd "$INSPECTRE_DIR"
./inspectre analyze \
    "$BUILD_DIR/libcrypto.so.3" \
    --address-list "$BUILD_DIR/address_list.csv" \
    --config       "$CONFIG" \
    --sad-output   "$RESULT_DIR/sad.csv" \
    --asm          "$RESULT_DIR/asm" \
    2>&1 | tee "$RESULT_DIR/run.log"

echo ""
echo "========================================================"
echo " Done: $BUILD"
echo " SAD gadgets : $RESULT_DIR/sad.csv"
echo " Run log     : $RESULT_DIR/run.log"
echo " CSV gen log : $RESULT_DIR/gen_csv.log"
echo "========================================================"
