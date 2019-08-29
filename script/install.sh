#!/usr/bin/env bash

# set env var FORCE={anything non-empty} to replace whatever's at the destination directory
FORCE=${FORCE:-}

set -uo pipefail
IFS=$'\n\t'

if [ "$(uname)" != "Darwin" ]; then
  echo "Skipping osx-automation installation because not on macOS"
  exit 2
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$SCRIPT_DIR/.." || exit 1
echo "Working from $(pwd) ..."

# Install files under ~/opt, assumed to all be single files
find opt -type f | grep --color=never -v -e "\.gitkeep" | while IFS="" read -r FILE; do
  echo ""
  echo "$FILE  ..."
  SRC="$(pwd)/$FILE"
  DEST="$HOME/$FILE"
  mkdir -p "$HOME/$(dirname "$FILE")"

  if [[ -r "$DEST" ]]; then
    if [[ -n "$FORCE" ]]; then
      echo "  Removing extant file at $DEST"
      rm -f "$DEST"
    else
      if diff -q "$SRC" "$DEST" > /dev/null; then
        echo "✔ Already installed at $DEST"
      else
        echo "ERROR: $DEST differs from repository version."
        echo "       Manually resolve and assimilate:"
        diff "$SRC" "$DEST"
      fi
    fi
  fi

  if [[ ! -r "$DEST" ]]; then
    cp "$SRC" "$DEST"
    echo "✔ Installed at $DEST"
  fi

  if [[ "$(dirname "$FILE")" == "opt/bin" || "$(dirname "$FILE")" == "opt/sbin" ]]; then
    if [[ ! -x "$DEST" ]]; then
      chmod +x "$DEST"
      echo "  Made $DEST executable."
    fi
  fi
done

# Install non-.workflow files in ~/Library/...:
find Library -type f | grep --color=never -v -e "\.workflow$" -e "\.workflow/" -e "\.gitkeep" -e "\.DS_Store" | while IFS="" read -r FILE; do
  echo ""
  echo "$FILE  ..."
  SRC="$(pwd)/$FILE"
  DEST="$HOME/$FILE"
  mkdir -p "$HOME/$(dirname "$FILE")"

  if [[ -r "$DEST" ]]; then
    if [[ -n "$FORCE" ]]; then
      echo "  Removing extant file at $DEST"
      rm -f "$DEST"
    else
      if diff -q "$SRC" "$DEST" > /dev/null; then
        echo "✔ Already installed at $DEST"
      else
        echo "ERROR: $DEST differs from repository version."
        echo "       Manually resolve and assimilate:"
        diff "$SRC" "$DEST"
      fi
    fi
  fi

  if [[ ! -r "$DEST" ]]; then
    cp "$SRC" "$DEST"
    echo "✔ Installed at $DEST"
  fi
done

# Install .workflow bundles in ~/Library/...:
find Library -type d | grep --color=never "\.workflow$" | while IFS="" read -r FILE; do
  echo ""
  echo "$FILE  ..."
  SRC="$(pwd)/$FILE"
  DEST="$HOME/$FILE"
  mkdir -p "$HOME/$(dirname "$FILE")"

  if [[ -d "$DEST" ]]; then
    if [[ -n "$FORCE" ]]; then
      echo "  Removing extant .workflow directory at $DEST"
      rm -rf "$DEST"
    else
      if diff -qrN "$SRC" "$DEST" > /dev/null; then
        echo "✔ Already installed at $DEST"
      else
        echo "ERROR: $DEST differs from repository version."
        echo "       Manually resolve and assimilate:"
        diff -rN "$SRC" "$DEST"
      fi
    fi
  fi

  if [[ ! -r "$DEST" ]]; then
    cp -R "$SRC" "$DEST"
    echo "✔ Installed at $DEST"
  fi
done
