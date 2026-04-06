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
            checksum: "6d4f3c22ccd13a3e1f81c5ed9db713b8d27b15a8c679fc7a0a5d6ad2359a60e1"
        )
    ]
)
