// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "WeChatOpenSDK",
    products: [
        .library(
            name: "WeChatOpenSDK",
            targets: ["WeChatOpenSDK"]),
    ],
    targets: [
        .binaryTarget(
            name: "WeChatOpenSDK",
            // [CI:URL]
            url: "https://github.com/c01dsummer/WeChatOpenSDK/releases/download/2.0.5/WeChatOpenSDK.xcframework.zip",
            // [CI:CHECKSUM]
            checksum: "2c4de689451d58987b05260d774fcd42c57719e6ce43e933d346d1b400f24409"
        )
    ]
)
