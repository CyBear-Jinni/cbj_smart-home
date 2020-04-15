#!/bin/bash


echo "Compiling all C files"
echo
echo "Compile C scripts"

cd ../cScripts

cd phisicalComponents/gettingSignals/
for fileName in *.c; do
	fileNameWithoutEnding=${fileName/.c/}
	gcc -Wall ${fileName} -o ${fileNameWithoutEnding} -lwiringPi -lpthread
	rm ${fileName}
done

cd ../..

cd phisicalComponents/sendingSignals/offSignal/

for fileName in *.c; do
	fileNameWithoutEnding=${fileName/.c/}
	gcc -Wall ${fileName} -o ${fileNameWithoutEnding} -lwiringPi -lpthread
	rm ${fileName}
done

cd ../../..

cd phisicalComponents/sendingSignals/onSignal/

for fileName in *.c; do
	fileNameWithoutEnding=${fileName/.c/}
	gcc -Wall ${fileName} -o ${fileNameWithoutEnding} -lwiringPi -lpthread
	rm ${fileName}
done

cd ../../../


echo "Done C scripts"

echo "Compiling snowboy C file"

cd snowboy/examples/C/

make

mv demo ../../../

mv ../../resources ../../../

cd ../../../..

echo "Removing snowboy directory now"

rm -rf snowboy/