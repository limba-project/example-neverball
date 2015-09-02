#!/bin/sh
set -e

LB_ARGS=""

cd libjpeg-turbo
limba-build run $LB_ARGS
cd ..

cd libpng
limba-build run $LB_ARGS
cd ..

cd physfs
limba-build run $LB_ARGS
cd ..

cd freetype
limba-build run $LB_ARGS
cd ..

cd SDL2
limba-build run $LB_ARGS
cd ..

cd SDL2-ttf
limba-build run $LB_ARGS
cd ..

cd libogg
limba-build run $LB_ARGS
cd ..

cd libvorbis
limba-build run $LB_ARGS
cd ..

cd libXScrnSaver
limba-build run $LB_ARGS
cd ..

cd neverball
limba-build run $LB_ARGS
cd ..

echo ""
echo "____________________"
echo ""
echo "Creating repository..."

rm -rf out_lirepo
mkdir -p out_lirepo
cd out_lirepo

#lirepo init .
lirepo add ../libjpeg-turbo/lipkg/*.ipk
lirepo add ../libpng/lipkg/*.ipk
lirepo add ../physfs/lipkg/*.ipk
lirepo add ../freetype/lipkg/*.ipk
lirepo add ../SDL2/lipkg/*.ipk
lirepo add ../SDL2-ttf/lipkg/*.ipk
lirepo add ../libogg/lipkg/*.ipk
lirepo add ../libvorbis/lipkg/*.ipk
lirepo add ../libXScrnSaver/lipkg/*.ipk
lirepo add ../neverball/lipkg/*.ipk

cd ..
echo "All done."
