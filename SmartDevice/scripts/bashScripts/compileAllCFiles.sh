#!/bin/bash


echo "Compiling all C files"
echo
echo "Compile C scripts"

cd ../cScripts

for fileName in *.c; do
	fileNameWithoutEnding=${fileName/.c/}
	gcc -Wall ${fileName} -o ${fileNameWithoutEnding} -lwiringPi -lpthread
	rm ${fileName}
done

echo "Compiling snowboy C file"

cd snowboy/examples/C/

make

mv demo ../../../

mv ../../resources ../../../

cd ../../../..

echo "Removing snowboy directory now"

rm -rf snowboy/