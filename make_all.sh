#!/bin/sh
set -e

LB_ARGS=""

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

rm -rf out_lirepo
mkdir -p out_lirepo
cd out_lirepo

#limba-build repo-init .
limba-build repo-add ../libjpeg-turbo/lipkg/*.ipk
limba-build repo-add ../libpng/lipkg/*.ipk
limba-build repo-add ../physfs/lipkg/*.ipk
limba-build repo-add ../freetype/lipkg/*.ipk
limba-build repo-add ../SDL2/lipkg/*.ipk
limba-build repo-add ../SDL2-ttf/lipkg/*.ipk
limba-build repo-add ../libogg/lipkg/*.ipk
limba-build repo-add ../libvorbis/lipkg/*.ipk
limba-build repo-add ../libXScrnSaver/lipkg/*.ipk
limba-build repo-add ../neverball/lipkg/*.ipk

cd ..
echo "All done."
