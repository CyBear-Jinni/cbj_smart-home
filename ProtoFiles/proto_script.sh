#!/bin/sh

# You mast have pub and protoc inside the path 
# Example PATH=$PATH:~/Programmes/flutter/bin/cache/dart-sdk/bin

pub global activate protoc_plugin

export PATH="$PATH":"$HOME/.pub-cache/bin"

mkdir protoc_as_dart

protoc --dart_out=grpc:protoc_as_dart/ -Iprotos protos/smart_connection.proto


cp -r protoc_as_dart/ ../SmartDevice/SmartDeviceDart/bin/shered/server/	#   # copy to smart device protoc folder

cp -r protoc_as_dart/ ../FlutterApp/smart_home_flutter/lib/objects/smart_device/client/	# Copy to Flutter protoc folder 

rm -r protoc_as_dart
