#!/bin/bash


echo
echo "Compiling snowboy C file"

cd ../cScripts/snowboy/examples/C/

make

mv demo ../../../

mv ../../resources ../../../

cd ../../../..

echo "Removing snowboy directory now"

rm -rf snowboy/