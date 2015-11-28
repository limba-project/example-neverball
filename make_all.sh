#!/bin/bash
set -e

LB_CHROOT_NAME="$1"
if [ -z "$1" ]; then
  LB_CHROOT_NAME="none"
fi

LB_ARGS="--chroot=$LB_CHROOT_NAME"

LB_ARGS="$LB_ARGS --user=`id -u` --group=`id -g`"

export LIMBA_FULLNAME="Matthias Klumpp"
export LIMBA_EMAIL="mak@debian.org"
export LIMBA_TARGET_REPO="master"

function build {
  sudo -E limba-build run $LB_ARGS
}

cd libjpeg-turbo
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building libJPEG-Turbo"
build
cd ..

cd libpng
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building libpng"
build
cd ..

cd physfs
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building PhysFS"
build
cd ..

cd freetype
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building FreeType"
build
cd ..

cd SDL2
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building SDL2"
build
cd ..

cd SDL2-ttf
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building SDL2-ttf"
build
cd ..

cd libogg
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building libogg"
build
cd ..

cd libvorbis
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building libvorbis"
build
cd ..

cd libXScrnSaver
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building libXScrnSaver"
build
cd ..

cd neverball
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building Neverball"
build
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
