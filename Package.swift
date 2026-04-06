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
            checksum: "89b310677977874cb2327f72312b5aa15be9cd4a2872c6cca6bf36f3bdb0a011"
        )
    ]
)
