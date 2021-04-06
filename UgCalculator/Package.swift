// swift-tools-version:5.3

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

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
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)