// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "UgTextLabelDemo",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgTextLabelDemo",
            type: .static,
            targets: [
                "UgTextLabelDemo"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "UgTextLabelDemo",
            dependencies: [],
            swiftSettings: [
                .unsafeFlags(["-I", "/Users/juliabulantseva/Library/Developer/Xcode/DerivedData/ScadeIDE-eapqctpaagnimndymxsgtstfvthc/Build/Products/Debug/Scade.app/Contents/Plugins/ScadeSDK.plugin/Contents/Resources/Libraries/ScadeSDK/lib/android-x86_64/include"])
            ]
        )
    ]
)