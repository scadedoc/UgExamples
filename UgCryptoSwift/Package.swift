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
      .package(url: "git@github.com:krzyzanowskim/CryptoSwift.git", from: "0.11.0")
    ],
    targets: [
        .target(
            name: "UgCryptoSwift",
            dependencies: ["CryptoSwift"],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)