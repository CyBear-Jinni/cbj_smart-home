#!/bin/sh

# You mast have pub and protoc inside the path 
# Example PATH=$PATH:~/Programs/flutter/bin/cache/dart-sdk/bin

pub global activate protoc_plugin

export PATH="$PATH":"$HOME/.pub-cache/bin"



# Connection between Smart Device and the App

mkdir protoc_as_dart

protoc --dart_out=grpc:protoc_as_dart/ -Iprotos protos/smart_connection.proto


rm -r ../CBJ_Smart-Device/SmartDeviceDart/lib/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart
cp -r -p protoc_as_dart/ ../CBJ_Smart-Device/SmartDeviceDart/lib/features/smart_device/infrastructure/datasources/smart_server_d/	#   # copy to smart device protoc folder

rm -r ../CBJ_App/lib/objects/smart_device/client/protoc_as_dart
cp -r protoc_as_dart/ ../CBJ_App/lib/objects/smart_device/client/	# Copy to Flutter protoc folder

rm -r protoc_as_dart



# Connection between Security Bear and the App

mkdir protoc_as_dart

protoc --dart_out=grpc:protoc_as_dart/ -Iprotos protos/security_bear_connections.proto


rm -r ../Security-Bear/SecurityBearDart/lib/features/security_bear/infrastructure/datasources/security_bear_server_d/protoc_as_dart
cp -r protoc_as_dart/ ../Security-Bear/SecurityBearDart/lib/features/security_bear/infrastructure/datasources/security_bear_server_d # Copy to Security Bear protoc folder

rm -r ../CBJ_App/lib/objects/security_bear/client/protoc_as_dart
cp -r protoc_as_dart/ ../CBJ_App/lib/objects/security_bear/client	# Copy to Flutter protoc folder

rm -r protoc_as_dart
