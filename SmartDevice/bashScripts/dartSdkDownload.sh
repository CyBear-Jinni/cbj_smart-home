echo "start"
architecture="$(uname -p)"

case $architecture in
	( "arm" | "armv7l" )
		wget https://storage.googleapis.com/dart-archive/channels/stable/release/2.5.0/sdk/dartsdk-linux-arm-release.zip  # For arm
   	;; 
   	( "arm64" | "aarch64" )
		wget https://storage.googleapis.com/dart-archive/channels/stable/release/2.5.0/sdk/dartsdk-linux-arm64-release.zip  # For arm64
    ;; 
    ( "x64" | "x86_64" )
    	wget https://storage.googleapis.com/dart-archive/channels/stable/release/2.5.0/sdk/dartsdk-linux-x64-release.zip    # For linux intel 64
    ;;
esac

# sdk url: https://dart.dev/tools/sdk/archive
      