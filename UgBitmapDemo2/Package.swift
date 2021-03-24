// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "UgBitmapDemo2",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgBitmapDemo2",
            type: .static,
            targets: [
                "UgBitmapDemo2"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "UgBitmapDemo2",
            dependencies: [],
            swiftSettings: [
                .unsafeFlags(["-F", "/Users/juliabulantseva/Library/Developer/Xcode/DerivedData/ScadeIDE-eapqctpaagnimndymxsgtstfvthc/Build/Products/Debug/Scade.app/Contents/Plugins/ScadeSDK.plugin/Contents/Resources/Libraries/ScadeSDK/lib/macos"])
            ]
        )
    ]
)