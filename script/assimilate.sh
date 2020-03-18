#!/usr/bin/env bash

set -uo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$SCRIPT_DIR/lib/cecho"

if [ "$(uname)" != "Darwin" ]; then
  cecho "Skipping osx-automation assimilation because not on macOS" $red
  exit 2
fi

cecho "---- osx-automation: assimilate scripts/binaries ----" $white
echo ""

cd "$SCRIPT_DIR/.." || exit 1
echo "Working in $(pwd) ..."

DIRS=(
  "Library/Application Scripts"
  "Library/Scripts"
  "Library/Services"
  "opt"
)

command -v ksdiff >/dev/null || (cecho "Requires Kaliedoscope & ksdiff CLI tool to be installed." $red; exit 1)
command -v fork >/dev/null && fork

for DIR in "${DIRS[@]}"; do
  ksdiff "$(pwd)/$DIR" "$HOME/$DIR"
done
