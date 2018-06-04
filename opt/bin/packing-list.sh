#!/usr/bin/env bash

set -eu

cd ~/Dropbox/Documents/Travel/

NEW_UUID=$(gcat /dev/urandom | gtr -dc 'a-zA-Z' | gfold -w 4 | head -n 1)
DS=$(date +%Y-%m)

cp "Packing List Template.ooutline" "$DS $NEW_UUID Packing List.ooutline"
open "$DS $NEW_UUID Packing List.ooutline"
