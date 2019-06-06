#!/usr/bin/env bash

set -uo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$SCRIPT_DIR/.." || exit 1

DIRS=(
  "Library/Application Scripts"
  "Library/Scripts"
  "Library/Services"
  "opt"
)

command -v ksdiff >/dev/null || (echo "Requires Kaliedoscope & ksdiff CLI tool to be installed."; exit 2)
command -v fork && fork

for DIR in "${DIRS[@]}"; do
  ksdiff "$(pwd)/$DIR" "$HOME/$DIR"
done
