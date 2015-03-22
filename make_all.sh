#!/bin/sh
set -e

LRPB_ARGS="--no-chroot"

cd libjpeg-turbo
lipkbh build $LRPB_ARGS
cd ..

cd libpng
lipkbh build $LRPB_ARGS
cd ..

cd physfs
lipkbh build $LRPB_ARGS
cd ..

cd freetype
lipkbh build $LRPB_ARGS
cd ..

cd SDL2
lipkbh build $LRPB_ARGS
cd ..

cd SDL2-ttf
lipkbh build $LRPB_ARGS
cd ..

cd libogg
lipkbh build $LRPB_ARGS
cd ..

cd libvorbis
lipkbh build $LRPB_ARGS
cd ..

cd libXScrnSaver
lipkbh build $LRPB_ARGS
cd ..

cd neverball
lipkbh build $LRPB_ARGS
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
