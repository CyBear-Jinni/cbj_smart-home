#!/bin/bash

echo "Making native executable of the project"

scripts/bashScripts/dartSdkDownload.sh  # Downloading dart-sdk for the correct architecture.

unzip dartsdk-*.zip

cd SmartDeviceDart
sudo ../dart-sdk/bin/pub get --no-precompile
cd ..
#chmod -R +rx dart-sdk/
dart-sdk/bin/dart2native SmartDeviceDart/bin/main.dart

mv SmartDeviceDart/bin/main.exe .


rm dartsdk-*.zip
rm -r dart-sdk/
