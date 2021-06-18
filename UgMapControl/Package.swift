// swift-tools-version:5.3

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "UgMapControl",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgMapControl",
            type: .static,
            targets: [
                "UgMapControl"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "UgMapControl",
            dependencies: [],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)