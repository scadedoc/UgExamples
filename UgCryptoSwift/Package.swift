// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "UgCryptoSwift",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgCryptoSwift",
            type: .static,
            targets: [
                "UgCryptoSwift"
            ]
        )
    ],
    dependencies: [
      .package(url: "git@github.com:krzyzanowskim/CryptoSwift.git", from: "0.11.0")
    ],
    targets: [
        .target(
            name: "UgCryptoSwift",
            dependencies: ["CryptoSwift"],
            swiftSettings: [
                .unsafeFlags(["-F", "/Users/juliabulantseva/Library/Developer/Xcode/DerivedData/ScadeIDE-eapqctpaagnimndymxsgtstfvthc/Build/Products/Debug/Scade.app/Contents/Plugins/ScadeSDK.plugin/Contents/Resources/Libraries/ScadeSDK/lib/macos"])
            ]
        )
    ]
)