#!/bin/sh

dir="out/"

if [ -d "$dir" ] ; then
    rm -r $dir
fi

mkdir -p $dir/MG/{Binaries/Win64/,Content/Paks/~mods}

cp -r ue4ss $dir/MG/Binaries/Win64
cp MG/Build/Windows/MG/Content/Paks/pakchunk1-Windows.pak $dir/MG/Content/Paks/~mods/MGFix_P.pak
cp MG/Build/Windows/MG/Content/Paks/pakchunk1-Windows.utoc $dir/MG/Content/Paks/~mods/MGFix_P.utoc
cp MG/Build/Windows/MG/Content/Paks/pakchunk1-Windows.ucas $dir/MG/Content/Paks/~mods/MGFix_P.ucas

retoc to-zen extra $dir/MG/Content/Paks/~mods/MGFixExtra_P.utoc --version UE5_5
