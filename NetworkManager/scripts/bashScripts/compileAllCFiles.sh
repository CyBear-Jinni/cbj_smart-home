#!/bin/bash

cd ../cScripts

for fileName in *.c; do
	fileNameWithoutEnding=${fileName/.c/}
	gcc -Wall ${fileName} -o ${fileNameWithoutEnding} -lwiringPi -lpthread
	rm ${fileName}
done