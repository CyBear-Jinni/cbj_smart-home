#!/bin/sh

# You mast have pub and protoc inside the path 
# Example PATH=$PATH:~/Programs/flutter/bin/cache/dart-sdk/bin

pub global activate protoc_plugin

export PATH="$PATH":"$HOME/.pub-cache/bin"

mkdir protoc_as_dart

protoc --dart_out=grpc:protoc_as_dart/ -Iprotos protos/smart_connection.proto


rm -r ../SmartDevice/SmartDeviceDart/lib/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart
cp -r protoc_as_dart/ ../SmartDevice/SmartDeviceDart/lib/features/smart_device/infrastructure/datasources/smart_server_d/	#   # copy to smart device protoc folder

rm -r ../FlutterApp/cybear_jinni_flutter/cybear_jinni_flutter/lib/objects/smart_device/client/protoc_as_dart
cp -r protoc_as_dart/ ../FlutterApp/cybear_jinni_flutter/cybear_jinni_flutter/lib/objects/smart_device/client/	# Copy to Flutter protoc folder 

rm -r protoc_as_dart
