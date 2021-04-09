// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "UgListControlDemo2",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgListControlDemo2",
            type: .static,
            targets: [
                "UgListControlDemo2"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "UgListControlDemo2",
            dependencies: [],
            swiftSettings: [
                .unsafeFlags(["-F", "/Users/juliabulantseva/Library/Developer/Xcode/DerivedData/ScadeIDE-eapqctpaagnimndymxsgtstfvthc/Build/Products/Debug/Scade.app/Contents/Plugins/ScadeSDK.plugin/Contents/Resources/Libraries/ScadeSDK/lib/macos"])
            ]
        )
    ]
)