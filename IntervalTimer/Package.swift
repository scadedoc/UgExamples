// swift-tools-version:5.3

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "IntervalTimer",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "IntervalTimer",
            type: .static,
            targets: [
                "IntervalTimer"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "IntervalTimer",
            dependencies: [],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)