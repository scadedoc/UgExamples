// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "UgLogging",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgLogging",
            type: .static,
            targets: [
                "UgLogging"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "UgLogging",
            dependencies: [],
            swiftSettings: [
                .unsafeFlags(["-I", "/Users/juliabulantseva/Library/Developer/Xcode/DerivedData/ScadeIDE-eapqctpaagnimndymxsgtstfvthc/Build/Products/Debug/Scade.app/Contents/Plugins/ScadeSDK.plugin/Contents/Resources/Libraries/ScadeSDK/lib/android-x86_64/include"])
            ]
        )
    ]
)