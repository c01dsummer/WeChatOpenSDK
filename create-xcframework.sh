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

echo "➡️  iphoneos slice"
xcrun lipo -i "build/iphoneos.xcarchive/Products/Library/Frameworks/WeChatOpenSDK.framework/WeChatOpenSDK"

echo "⚠️  iphonesimulator slice"
xcrun lipo -i "build/iphonesimulator.xcarchive/Products/Library/Frameworks/WeChatOpenSDK.framework/WeChatOpenSDK"

echo "⚠️  remove arm64 for iphonesimulator slice"
xcrun lipo -remove arm64 "build/iphonesimulator.xcarchive/Products/Library/Frameworks/WeChatOpenSDK.framework/WeChatOpenSDK" -o "build/iphonesimulator.xcarchive/Products/Library/Frameworks/WeChatOpenSDK.framework/WeChatOpenSDK"

echo "➡️  iphonesimulator slice"
xcrun lipo -i "build/iphonesimulator.xcarchive/Products/Library/Frameworks/WeChatOpenSDK.framework/WeChatOpenSDK"

echo "✅ create xcframework"
xcodebuild -create-xcframework \
-framework "build/iphoneos.xcarchive/Products/Library/Frameworks/WeChatOpenSDK.framework" \
-framework "build/iphonesimulator.xcarchive/Products/Library/Frameworks/WeChatOpenSDK.framework" \
-output "build/WeChatOpenSDK.xcframework"

zip -r WeChatOpenSDK.xcframework.zip build/WeChatOpenSDK.xcframework

swift package compute-checksum WeChatOpenSDK.xcframework.zip
