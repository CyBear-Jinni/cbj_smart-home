#!/bin/bash


echo "Compiling all C files"
echo
echo "Compiling snowboy C file"

cd snowboy/examples/C/

make

mv demo ../../../

mv ../../resources ../../../

cd ../../../..

echo "Removing snowboy directory now"

rm -rf snowboy/