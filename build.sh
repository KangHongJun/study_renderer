#!/data/data/com.termux/files/usr/bin/bash

if [ -z "$1" ]; then
    echo "Error: source file is required."
    echo "Usage: ./build.sh <source.cpp>"
    exit 1
fi

SOURCE="$1"

clang++ "$SOURCE" tgaimage.cpp -o main || exit 1
./main || exit 1

magick framebuffer.tga framebuffer.png || exit 1
cp framebuffer.png ~/storage/downloads/

echo "Saved: ~/storage/downloads/framebuffer.png"
