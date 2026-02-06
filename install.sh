#!/bin/sh

set -e

[[ -z "$GAME_PATH" ]] && { echo "GAME_PATH not set" ; exit 1; }

cp -r "out/MG" "$GAME_PATH"
