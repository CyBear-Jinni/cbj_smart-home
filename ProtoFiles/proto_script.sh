#!/bin/sh

# You mast have pub and protoc inside the path 
# Example PATH=$PATH:~/Programs/flutter/bin/cache/dart-sdk/bin

pub global activate protoc_plugin

export PATH="$PATH":"$HOME/.pub-cache/bin"



# Connection between App to Smart Device

mkdir protoc_as_dart

protoc --dart_out=grpc:protoc_as_dart/ -Iprotos protos/smart_connection.proto


rm -r ../CBJ_Smart-Device/SmartDeviceDart/lib/features/smart_device/infrastructure/datasources/smart_server_d/protoc_as_dart
cp -r -p protoc_as_dart/ ../CBJ_Smart-Device/SmartDeviceDart/lib/features/smart_device/infrastructure/datasources/smart_server_d/	#   # copy to smart device protoc folder

rm -r ../CBJ_App/lib/infrastructure/core/gen/smart_device/client/protoc_as_dart
cp -r protoc_as_dart/ ../CBJ_App/lib/infrastructure/core/gen/smart_device/client/	# Copy to Flutter protoc folder

rm -r protoc_as_dart



# Connection between App to Security Bear

mkdir protoc_as_dart

protoc --dart_out=grpc:protoc_as_dart/ -Iprotos protos/security_bear_connections.proto


rm -r ../Security-Bear/SecurityBearDart/lib/features/security_bear/infrastructure/datasources/security_bear_server_d/protoc_as_dart
cp -r protoc_as_dart/ ../Security-Bear/SecurityBearDart/lib/features/security_bear/infrastructure/datasources/security_bear_server_d # Copy to Security Bear protoc folder

rm -r ../CBJ_App/lib/infrastructure/core/gen/security_bear/client/protoc_as_dart
cp -r protoc_as_dart/ ../CBJ_App/lib/infrastructure/core/gen/security_bear/client	# Copy to CBJ App protoc folder

rm -r protoc_as_dart



# Connection between Security Bear to the App

mkdir protoc_as_dart

protoc --dart_out=grpc:protoc_as_dart/ -Iprotos protos/cbj_app_connections.proto



rm -r ../CBJ_App/lib/infrastructure/core/gen/cbj_app_server/protoc_as_dart
cp -r protoc_as_dart/ ../CBJ_App/lib/infrastructure/core/gen/cbj_app_server	# Copy to CBJ App protoc folder


rm -r ../Security-Bear/SecurityBearDart/lib/data_base/cbj_app/protoc_as_dart
cp -r protoc_as_dart/ ../Security-Bear/SecurityBearDart/lib/data_base/cbj_app # Copy to Security Bear protoc folder


rm -r protoc_as_dart
