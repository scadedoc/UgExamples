// swift-tools-version:5.3

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

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
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)