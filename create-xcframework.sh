#!/bin/bash
set -euo pipefail

rm -rf build

xcodebuild archive \
-project WeChatOpenSDK.xcodeproj \
-scheme WeChatOpenSDK \
-destination "generic/platform=iOS" \
-archivePath "build/iphoneos" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-project WeChatOpenSDK.xcodeproj \
-scheme WeChatOpenSDK \
-destination "generic/platform=iOS Simulator" \
-archivePath "build/iphonesimulator" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

SIM_BINARY="build/iphonesimulator.xcarchive/Products/Library/Frameworks/WeChatOpenSDK.framework/WeChatOpenSDK"

echo "➡️  iphoneos slice"
xcrun lipo -i "build/iphoneos.xcarchive/Products/Library/Frameworks/WeChatOpenSDK.framework/WeChatOpenSDK"

echo "⚠️  iphonesimulator slice"
xcrun lipo -i "$SIM_BINARY"

if xcrun lipo -info "$SIM_BINARY" | grep -q "arm64"; then
  echo "⚠️  remove arm64 for iphonesimulator slice"
  xcrun lipo -remove arm64 "$SIM_BINARY" -o "$SIM_BINARY"
else
  echo "ℹ️  no arm64 in iphonesimulator slice, skipping removal"
fi

echo "➡️  iphonesimulator slice"
xcrun lipo -i "$SIM_BINARY"

echo "✅ create xcframework"
xcodebuild -create-xcframework \
-framework "build/iphoneos.xcarchive/Products/Library/Frameworks/WeChatOpenSDK.framework" \
-framework "build/iphonesimulator.xcarchive/Products/Library/Frameworks/WeChatOpenSDK.framework" \
-output "build/WeChatOpenSDK.xcframework"

zip -r WeChatOpenSDK.xcframework.zip build/WeChatOpenSDK.xcframework

swift package compute-checksum WeChatOpenSDK.xcframework.zip
