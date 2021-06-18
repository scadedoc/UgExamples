// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "UgProgrammaticUIDev",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgProgrammaticUIDev",
            type: .static,
            targets: [
                "UgProgrammaticUIDev"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "UgProgrammaticUIDev",
            dependencies: [],
            swiftSettings: [
                .unsafeFlags(["-F", "/Users/juliabulantseva/Library/Developer/Xcode/DerivedData/ScadeIDE-eapqctpaagnimndymxsgtstfvthc/Build/Products/Debug/Scade.app/Contents/Plugins/ScadeSDK.plugin/Contents/Resources/Libraries/ScadeSDK/lib/macos"])
            ]
        )
    ]
)