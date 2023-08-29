# WeChatOpenSDK

## What's it?

* Rebuild libWeChatSDK.a to WeChatOpenSDK.xcframework.
* Modules support and easy for Swift/SPM to use.
* Support ios-arm64/ios-x86_64-simulator.
* No support ios-arm64-simulator as libWeChatSDK.a does not support it.
* Require iOS 13+/Xcode 13+

## Installation

### Swift Package Manager

```
dependencies: [
    .package(url: "https://github.com/c01dsummer/WeChatOpenSDK.git", .upToNextMajor(from: "2.0.2"))
]
```

### Manually Build

* Download the latest WeChatOpenSDK from **[developers.weixin.qq.com](https://developers.weixin.qq.com/doc/oplatform/Downloads/iOS_Resource.html)**
* unzip and move files to `WeChatOpenSDK/Library/`
* run `create-xcframework.sh`
