// swift-tools-version:5.3

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "UgCryptoSwift",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgCryptoSwift",
            type: .static,
            targets: [
                "UgCryptoSwift"
            ]
        )
    ],
    dependencies: [
    .package(name: "ScadeExtensions", url: "https://github.com/scade-platform/ScadeExtensions", .branch("main")),
      .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.4.1")
    ],
    targets: [
        .target(
            name: "UgCryptoSwift",
            dependencies: ["CryptoSwift", "ScadeExtensions"],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)