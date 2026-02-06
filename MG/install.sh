#!/bin/sh

set -e

[[ -z "$GAME_PATH" ]] && { echo "GAME_PATH not set" ; exit 1; }

MODS_PATH="$GAME_PATH/MG/Content/Paks/~mods"

cd "${0%/*}/Build/Windows/MG/Content/Paks/"
[ -d "$MODS_PATH" ] || mkdir "$MODS_PATH"

PAK_NAME="pakchunk1-Windows"
MOD_NAME="MGFix"
cp "$PAK_NAME.pak" "$MODS_PATH/${MOD_NAME}_P.pak"
cp "$PAK_NAME.ucas" "$MODS_PATH/${MOD_NAME}_P.ucas"
cp "$PAK_NAME.utoc" "$MODS_PATH/${MOD_NAME}_P.utoc"

echo "Done"
