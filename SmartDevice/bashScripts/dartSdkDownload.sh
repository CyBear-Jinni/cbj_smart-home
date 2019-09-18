#!/bin/bash

architecture="$(uname -p)"

dartSdkPath="https://storage.googleapis.com/dart-archive/channels/stable/release/2.5.0/sdk/dartsdk-linux-"	#	Sdk url: https://dart.dev/tools/sdk/archive

case $architecture in
	( "arm" | "armv7l" )
		wget "${dartSdkPath}arm-release.zip"	#	For arm
   	;; 
   	( "arm64" | "aarch64" )
		wget "${dartSdkPath}arm64-release.zip"	# For arm64
    ;; 
    ( "x64" | "x86_64" )
    	wget "${dartSdkPath}x64-release.zip"	# For linux intel 64
    ;;
esac

