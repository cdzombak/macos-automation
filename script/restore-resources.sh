#!/usr/bin/env bash

set -uo pipefail
IFS=$'\n\t'

if [ "$(uname)" != "Darwin" ]; then
  cecho "Skipping osx-automation resource restoration because not on macOS" $red
  exit 2
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$SCRIPT_DIR/lib/cecho"
cd "$SCRIPT_DIR/.." || exit 1

DIRS=(
  "Library/Application Scripts"
  "Library/Scripts"
  "Library/Services"
)

for DIR in "${DIRS[@]}"; do
  find "$(pwd)/$DIR" -iname '*.scpt' -type f -print0 | while read -r -d $'\0' file
  do
    if [[ $(xattr "$file") == *"com.apple.ResourceFork"* ]]; then
      if [ -f "$file.rsrc" ]; then
        echo "$file ..."
        Rez "$file.rsrc" -append -o "$file"
        SetFile -a C "$file"
      fi
    fi
  done
done
