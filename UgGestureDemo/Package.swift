// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "UgGestureDemo",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgGestureDemo",
            type: .static,
            targets: [
                "UgGestureDemo"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "UgGestureDemo",
            dependencies: [],
            swiftSettings: [
                .unsafeFlags(["-I", "/Users/juliabulantseva/Library/Developer/Xcode/DerivedData/ScadeIDE-eapqctpaagnimndymxsgtstfvthc/Build/Products/Debug/Scade.app/Contents/Plugins/ScadeSDK.plugin/Contents/Resources/Libraries/ScadeSDK/lib/android-x86_64/include"])
            ]
        )
    ]
)