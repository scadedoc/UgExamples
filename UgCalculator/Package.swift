// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "UgCalculator",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgCalculator",
            type: .static,
            targets: [
                "UgCalculator"
            ]
        )
    ],
    dependencies: [
      .package(url: "git@github.com:nicklockwood/Expression.git", from: "0.12.0")
    ],
    targets: [
        .target(
            name: "UgCalculator",
            dependencies: ["Expression"],
            swiftSettings: [
                .unsafeFlags(["-I", "/Users/juliabulantseva/Library/Developer/Xcode/DerivedData/ScadeIDE-eapqctpaagnimndymxsgtstfvthc/Build/Products/Debug/Scade.app/Contents/Plugins/ScadeSDK.plugin/Contents/Resources/Libraries/ScadeSDK/lib/android-x86_64/include"])
            ]
        )
    ]
)