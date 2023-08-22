// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WeChatOpenSDK",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "WeChatOpenSDK",
                 targets: ["WeChatOpenSDK"])
    ],
    targets: [
        .binaryTarget(name: "WeChatOpenSDK",
                      path: "./Artifacts/WechatOpenSDK-XCFramework.xcframework")
    ]
)
