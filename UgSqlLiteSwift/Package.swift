// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "UgSqlLiteSwift",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgSqlLiteSwift",
            type: .static,
            targets: [
                "UgSqlLiteSwift"
            ]
        )
    ],
    dependencies: [
      .package(url: "https://github.com/scadedoc/SQLite.swift", .branch("master"))
    ],
    targets: [
        .target(
            name: "UgSqlLiteSwift",
            dependencies: [.product(name: "SQLite", package: "SQLite.swift")],
            swiftSettings: [
                .unsafeFlags(["-I", "/Users/juliabulantseva/Library/Developer/Xcode/DerivedData/ScadeIDE-eapqctpaagnimndymxsgtstfvthc/Build/Products/Debug/Scade.app/Contents/Plugins/ScadeSDK.plugin/Contents/Resources/Libraries/ScadeSDK/lib/android-x86_64/include"])
            ]
        )
    ]
)