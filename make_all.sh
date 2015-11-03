#!/bin/bash
set -e

LB_CHROOT_NAME="$1"
if [ -z "$1" ]; then
  LB_CHROOT_NAME="none"
fi

LB_ARGS="--chroot=$LB_CHROOT_NAME"

export LIMBA_FULLNAME="Matthias Klumpp"
export LIMBA_EMAIL="mak@debian.org"
export LIMBA_TARGET_REPO="master"

cd libjpeg-turbo
echo "Building libJPEG-Turbo"
limba-build run $LB_ARGS
cd ..

cd libpng
echo "Building libpng"
limba-build run $LB_ARGS
cd ..

cd physfs
echo "Building PhysFS"
limba-build run $LB_ARGS
cd ..

cd freetype
echo "Building FreeType"
limba-build run $LB_ARGS
cd ..

cd SDL2
echo "Building SDL2"
limba-build run $LB_ARGS
cd ..

cd SDL2-ttf
echo "Building SDL2-ttf"
limba-build run $LB_ARGS
cd ..

cd libogg
echo "Building libogg"
limba-build run $LB_ARGS
cd ..

cd libvorbis
echo "Building libvorbis"
limba-build run $LB_ARGS
cd ..

cd libXScrnSaver
echo "Building libXScrnSaver"
limba-build run $LB_ARGS
cd ..

cd neverball
echo "Building Neverball"
limba-build run $LB_ARGS
cd ..

echo ""
echo "____________________"
echo ""
echo "Creating repository..."

function add_to_repo {
  for file in $1/*.ipk
  do
    limba-build repo-add $file
  done
}

rm -rf out_lirepo
mkdir -p out_lirepo
cd out_lirepo

#limba-build repo-init .
add_to_repo ../libjpeg-turbo/lipkg
add_to_repo ../libpng/lipkg
add_to_repo ../physfs/lipkg
add_to_repo ../freetype/lipkg
add_to_repo ../SDL2/lipkg
add_to_repo ../SDL2-ttf/lipkg
add_to_repo ../libogg/lipkg
add_to_repo ../libvorbis/lipkg
add_to_repo ../libXScrnSaver/lipkg
add_to_repo ../neverball/lipkg

cd ..
chmod -R 777 out_lirepo

echo "All done."
