# WeChatOpenSDK

## What's it?

- Rebuilds the official WeChat iOS SDK (`libWeChatSDK.a`) into `WeChatOpenSDK.xcframework`.
- Adds module support to make integration easier for Swift and Swift Package Manager.
- Supports `ios-arm64` and `ios-x86_64-simulator`.
- Does **not** support `ios-arm64-simulator` because the upstream `libWeChatSDK.a` does not provide that slice.
- Requires iOS 13+ and Xcode 15+ (Swift 5.9 toolchain).

## Version Mapping

| WeChatOpenSDK | WeChat SDK |
|---------------|------------|
| 2.0.5         | 2.0.5      |

> Source of truth for distributed binaries is `Package.swift` (`binaryTarget` URL + checksum).

## Installation

### Swift Package Manager

#### Recommended (pin a release tag)

```swift
dependencies: [
    .package(url: "https://github.com/c01dsummer/WeChatOpenSDK.git", exact: "2.0.5")
]
```

#### Alternative (track main)

```swift
dependencies: [
    .package(url: "https://github.com/c01dsummer/WeChatOpenSDK.git", branch: "main")
]
```

### Build Locally (Manual)

#### Prerequisites

- Xcode 15+ (Swift 5.9)
- Swift toolchain available in terminal (`swift`)
- WeChat iOS SDK package downloaded from WeChat Open Platform

#### Steps

1. Download the latest **WeChat iOS SDK** from **[developers.weixin.qq.com](https://developers.weixin.qq.com/doc/oplatform/Downloads/iOS_Resource.html)**.
2. Unzip and move required SDK files to `Library/`.
3. Run:

```bash
./create-xcframework.sh
```

4. The script outputs `WeChatOpenSDK.xcframework.zip` and prints the checksum.

### CI Build

A GitHub Actions workflow is available for building on macOS runners:

1. Go to **Actions** > **Build XCFramework**
2. Click **Run workflow**
3. Provide the required `version` input (e.g. `2.0.5`)
4. If building a non-default SDK version, also provide:
   - `sdk_url` — an HTTPS `.zip` URL on `dldir1.qq.com`
   - `sdk_checksum` — SHA-256 checksum of the SDK zip
5. The workflow builds the xcframework, creates a GitHub release, and auto-updates `Package.swift` with the correct URL and checksum

## Updating to a New SDK Version

### Via CI workflow

1. Run the **Build XCFramework** workflow with the new version, SDK URL, and checksum
2. The workflow automatically builds, creates/updates the release, and commits the updated `Package.swift`

### Via local/manual build

1. Build locally with `create-xcframework.sh`
2. Create a new GitHub release with the built `WeChatOpenSDK.xcframework.zip`
3. Update the URL and checksum in `Package.swift`:

```bash
swift package compute-checksum WeChatOpenSDK.xcframework.zip
```

## Troubleshooting

- **Apple Silicon simulator issue (`ios-arm64-simulator`)**: this is an upstream SDK limitation; prefer using a real iPhone device for local debug when needed.
- **Checksum mismatch**: recompute with `swift package compute-checksum WeChatOpenSDK.xcframework.zip` and update `Package.swift`.
- **CI download failure**: verify `sdk_url` uses HTTPS, points to `dldir1.qq.com`, and ends with `.zip`, and ensure `sdk_checksum` matches the downloaded zip.

## Quick Verification

After package integration, verify that your app target can `import WeChatOpenSDK` and reference a WeChat API symbol such as `WXApi`.
