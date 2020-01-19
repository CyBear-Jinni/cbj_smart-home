#!/bin/bash

cd ../cScripts

for fileName in *.c; do
	fileNameWithoutEnding=${fileName/.c/}
	gcc -Wall ${fileName} -o ${fileNameWithoutEnding} -lwiringPi -lpthread
	rm ${fileName}
done

cd snowboy/examples/C/

make -f Makefile

mv demo ../../../

mv resources ../../../

cd ../../../..

echo "Removing snowboy directory now"

rm -rf snowboy/