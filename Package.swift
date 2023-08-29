// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WeChatOpenSDK",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "WeChatOpenSDK",
            targets: ["WeChatOpenSDK"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "WeChatOpenSDK",
            url: "https://github.com/c01dsummer/WeChatOpenSDK/releases/download/2.0.2/WeChatOpenSDK.xcframework.zip",
            checksum: "3be12103dc8a206d4c7e2cbe1b69102193d4ad3e9b8d002c2cc82a261b0c10b9"
        )
    ]
)
