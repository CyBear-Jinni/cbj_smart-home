#!/bin/bash

echo "Making native executable of the project"

scripts/bashScripts/dartSdkDownload.sh  # Downloading dart-sdk for the correct architecture.

unzip dartsdk-*.zip

cd NetworkManagerDart
sudo ../dart-sdk/bin/pub get --no-precompile
cd ..

#chmod -R +rx dart-sdk/
dart-sdk/bin/dart2native NetworkManagerDart/bin/main.dart

mv NetworkManagerDart/bin/main.exe .


rm dartsdk-*.zip
rm -r dart-sdk/
