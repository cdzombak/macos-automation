#!/usr/bin/env bash

# set env var FORCE=true to replace whatever's at the destination directory
FORCE=${FORCE:false}
if [[ "$FORCE" == "true" ]]; then
  FORCE=true
fi

set -uo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$SCRIPT_DIR/lib/cecho"

if [ "$(uname)" != "Darwin" ]; then
  cecho "Skipping osx-automation installation because not on macOS" $red
  exit 2
fi

cecho "----                             ----" $white
cecho "---- osx-automation installation ----" $white
cecho "----                             ----" $white
echo ""

cd "$SCRIPT_DIR/.." || exit 1
echo "Working in $(pwd) ..."

show_force_message() {
  echo ""
  echo -e "${white}To resolve conflicts by replacing destination files by those from this repo, run this script with the environment variable ${yellow}FORCE=true${white}.${_reset}"
}

# Install files under ~/opt, assumed to all be single files
find opt -type f | grep --color=never -v -e "\.gitkeep" -e "\.DS_Store" | while IFS="" read -r FILE; do
  echo ""
  cecho "$FILE  ..." $cyan
  SRC="$(pwd)/$FILE"
  DEST="$HOME/$FILE"
  mkdir -p "$HOME/$(dirname "$FILE")"

  if [[ -r "$DEST" ]]; then
    if [ "$FORCE" = true ]; then
      echo "  Removing extant file at $DEST (FORCE=$FORCE)"
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
find Library -type f | grep --color=never -v -e "\.workflow$" -e "\.rsrc$" -e "\.workflow/" -e "\.gitkeep" -e "\.DS_Store" | while IFS="" read -r FILE; do
  echo ""
  cecho "$FILE  ..." $cyan
  SRC="$(pwd)/$FILE"
  DEST="$HOME/$FILE"
  mkdir -p "$HOME/$(dirname "$FILE")"

  if [[ -r "$DEST" ]]; then
    if [ "$FORCE" = true ]; then
      echo "  Removing extant file at $DEST (FORCE=$FORCE)"
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
    if [ "$FORCE" = true ]; then
      echo "  Removing extant .workflow directory at $DEST (FORCE=$FORCE)"
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

echo ""
cecho "/usr/local/bin/imgcat  ..." $cyan
if [[ ! -e /usr/local/bin/imgcat ]]; then
  sudo ln -s "$HOME/opt/bin/imgcat" /usr/local/bin/imgcat
  cecho "✔ Installed." $green
else
 cecho "✔ Already installed." $green
fi

echo ""
cecho "--- Removing unused scripts/etc. ---" $white
echo ""

if [ -e "$HOME/opt/bin/curie-match" ]; then
  echo "Legacy curie-match script..."
  trash "$HOME/opt/bin/curie-match"
else
  echo "Nothing to do."
fi
