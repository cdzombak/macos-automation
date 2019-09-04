#!/usr/bin/env bash

# set env var FORCE={anything non-empty} to replace whatever's at the destination directory
FORCE=${FORCE:-}

set -uo pipefail
IFS=$'\n\t'
source ./lib/cecho

if [ "$(uname)" != "Darwin" ]; then
  cecho "Skipping osx-automation installation because not on macOS" $red
  exit 2
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$SCRIPT_DIR/.." || exit 1
echo "Working from $(pwd) ..."

show_force_message() {
  echo ""
  echo -e "${white}To resolve conflicts by replacing destination files by those from this repo, run this script with the environment variable ${yellow}FORCE${white} set to anything non-empty, eg. ${yellow}FORCE=true $0${_reset}"
}

# Install files under ~/opt, assumed to all be single files
find opt -type f | grep --color=never -v -e "\.gitkeep" | while IFS="" read -r FILE; do
  echo ""
  cecho "$FILE  ..." $cyan
  SRC="$(pwd)/$FILE"
  DEST="$HOME/$FILE"
  mkdir -p "$HOME/$(dirname "$FILE")"

  if [[ -r "$DEST" ]]; then
    if [[ -n "$FORCE" ]]; then
      echo "  Removing extant file at $DEST (FORCE='$FORCE')"
      rm -f "$DEST"
    else
      if diff -q "$SRC" "$DEST" > /dev/null; then
        cecho "✔ Already installed at $DEST" $green
      else
        cecho "ERROR: $DEST differs from repository version." $red
        cecho "       Manually resolve and assimilate:" $red
        diff "$SRC" "$DEST"
        show_force_message
      fi
    fi
  fi

  if [[ ! -r "$DEST" ]]; then
    cp "$SRC" "$DEST"
    cecho "✔ Installed at $DEST" $green
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
  cecho "$FILE  ..." $cyan
  SRC="$(pwd)/$FILE"
  DEST="$HOME/$FILE"
  mkdir -p "$HOME/$(dirname "$FILE")"

  if [[ -r "$DEST" ]]; then
    if [[ -n "$FORCE" ]]; then
      echo "  Removing extant file at $DEST (FORCE='$FORCE')"
      rm -f "$DEST"
    else
      if diff -q "$SRC" "$DEST" > /dev/null; then
        cecho "✔ Already installed at $DEST" $green
      else
        cecho "ERROR: $DEST differs from repository version." $red
        cecho "       Manually resolve and assimilate:" $red
        diff "$SRC" "$DEST"
        show_force_message
      fi
    fi
  fi

  if [[ ! -r "$DEST" ]]; then
    cp "$SRC" "$DEST"
    cecho "✔ Installed at $DEST" $green
  fi
done

# Install .workflow bundles in ~/Library/...:
find Library -type d | grep --color=never "\.workflow$" | while IFS="" read -r FILE; do
  echo ""
  cecho "$FILE  ..." $cyan
  SRC="$(pwd)/$FILE"
  DEST="$HOME/$FILE"
  mkdir -p "$HOME/$(dirname "$FILE")"

  if [[ -d "$DEST" ]]; then
    if [[ -n "$FORCE" ]]; then
      echo "  Removing extant .workflow directory at $DEST (FORCE='$FORCE')"
      rm -rf "$DEST"
    else
      if diff -qrN "$SRC" "$DEST" > /dev/null; then
        cecho "✔ Already installed at $DEST" $green
      else
        cecho "ERROR: $DEST differs from repository version." $red
        cecho "       Manually resolve and assimilate:" $red
        diff -rN "$SRC" "$DEST"
        show_force_message
      fi
    fi
  fi

  if [[ ! -r "$DEST" ]]; then
    cp -R "$SRC" "$DEST"
    cecho "✔ Installed at $DEST" $green
  fi
done
