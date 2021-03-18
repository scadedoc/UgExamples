// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Kyle1",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "Kyle1",
            type: .static,
            targets: [
                "Kyle1"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "Kyle1",
            dependencies: [],
            swiftSettings: [
                .unsafeFlags(["-I", "/Users/juliabulantseva/Library/Developer/Xcode/DerivedData/ScadeIDE-eapqctpaagnimndymxsgtstfvthc/Build/Products/Debug/Scade.app/Contents/Plugins/ScadeSDK.plugin/Contents/Resources/Libraries/ScadeSDK/lib/android-x86_64/include"])
            ]
        )
    ]
)