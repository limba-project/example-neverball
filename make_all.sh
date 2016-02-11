#!/bin/bash
set -e

LB_CHROOT_NAME="$1"
if [ -z "$1" ]; then
  LB_CHROOT_NAME="none"
fi

LB_ARGS="--chroot=$LB_CHROOT_NAME"

LB_ARGS="$LB_ARGS --ignore-foundations --user=`id -u` --group=`id -g`"

export LIMBA_FULLNAME="Matthias Klumpp"
export LIMBA_EMAIL="mak@debian.org"
export LIMBA_TARGET_REPO="master"

mkdir -p _bundlepool

function build {
  sudo -E limba-build run --verbose $LB_ARGS
}

function movetopool {
  mv -f lipkg/*.ipk* ../_bundlepool
}

cd libjpeg-turbo
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building libJPEG-Turbo"
build
movetopool
cd ..

cd libpng
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building libpng"
build
movetopool
cd ..

cd physfs
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building PhysFS"
build
movetopool
cd ..

cd freetype
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building FreeType"
build
movetopool
cd ..

cd SDL2-full
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building SDL2"
build
movetopool
cd ..

cd libogg
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building libogg"
build
movetopool
cd ..

cd libvorbis
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building libvorbis"
build
movetopool
cd ..

#cd libXScrnSaver
#find . -name "*.ipk*" -exec rm -f {} \;
#echo "Building libXScrnSaver"
#build
#movetopool
#cd ..

cd neverball
find . -name "*.ipk*" -exec rm -f {} \;
echo "Building Neverball"
build
movetopool
cd ..

echo ""
echo "____________________"
echo ""
echo "Creating repository..."


rm -rf out_lirepo
mkdir -p out_lirepo
cd out_lirepo

for fname in ../_bundlepool/*.ipk
do
  limba-build repo-add $fname
done

cd ..
chmod -R 0755 out_lirepo

echo "All done."
