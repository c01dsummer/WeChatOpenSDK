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
            checksum: "3be12103dc8a206d4c7e2cbe1b69102193d4ad3e9b8d002c2cc82a261b0c10b9"
        )
    ]
)
