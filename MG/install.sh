#!/bin/sh

set -e

GAME_PATH="C:/Program Files (x86)/Steam/steamapps/common/FULL METAL SCHOOLGIRL"
PROJ_NAME="MG"
MODS_PATH="$GAME_PATH/$PROJ_NAME/Content/Paks/~mods"

cd "${0%/*}/Build/Windows/$PROJ_NAME/Content/Paks/"
[ -d "$MODS_PATH" ] || mkdir "$MODS_PATH"

PAK_NAME="pakchunk1-Windows"
MOD_NAME="MGFix"
cp "$PAK_NAME.pak" "$MODS_PATH/${MOD_NAME}_P.pak"
cp "$PAK_NAME.ucas" "$MODS_PATH/${MOD_NAME}_P.ucas"
cp "$PAK_NAME.utoc" "$MODS_PATH/${MOD_NAME}_P.utoc"

echo "Done"
