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
3. Optionally provide a custom SDK download URL
4. Download the built xcframework from the workflow artifacts

## Updating to a New SDK Version

1. Run the CI workflow (or build locally) with the new SDK
2. Create a new GitHub release with the built `WeChatOpenSDK.xcframework.zip`
3. Update the URL and checksum in `Package.swift`:
   ```
   swift package compute-checksum WeChatOpenSDK.xcframework.zip
   ```
