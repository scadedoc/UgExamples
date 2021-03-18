// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "UgAppInAppDemo",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgAppInAppDemo",
            type: .static,
            targets: [
                "UgAppInAppDemo"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "UgAppInAppDemo",
            dependencies: [],
            swiftSettings: [
                .unsafeFlags(["-F", "/Users/juliabulantseva/Library/Developer/Xcode/DerivedData/ScadeIDE-eapqctpaagnimndymxsgtstfvthc/Build/Products/Debug/Scade.app/Contents/Plugins/ScadeSDK.plugin/Contents/Resources/Libraries/ScadeSDK/lib/macos"])
            ]
        )
    ]
)