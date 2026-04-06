# WeChatOpenSDK

## What's it?

* Rebuild libWeChatSDK.a to WeChatOpenSDK.xcframework.
* Modules support and easy for Swift/SPM to use.
* Support ios-arm64/ios-x86_64-simulator.
* No support ios-arm64-simulator as libWeChatSDK.a does not support it.
* Require iOS 13+/Xcode 13+

## Version

| WeChatOpenSDK | WeChat SDK |
|---------------|------------|
| 2.0.5         | 2.0.5      |
| 2.0.2         | 2.0.2      |

## Installation

### Swift Package Manager

```
dependencies: [
    .package(url: "https://github.com/c01dsummer/WeChatOpenSDK.git", branch: "main")
]
```

### Manually Build

* Download the latest WeChatOpenSDK from **[developers.weixin.qq.com](https://developers.weixin.qq.com/doc/oplatform/Downloads/iOS_Resource.html)**
* unzip and move files to `Library/`
* run `create-xcframework.sh`

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
   ```
   swift package compute-checksum WeChatOpenSDK.xcframework.zip
   ```
