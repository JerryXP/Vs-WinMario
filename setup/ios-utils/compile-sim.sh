lime build ios -nosign
./setup/ios-utils/simforge convert ./export/release/ios/build/Release-iphoneos/WinMario.app
codesign -f -s - ./export/release/ios/build/Release-iphoneos/WinMario.app