// swift-tools-version:5.3

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "UgGestureDemo",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgGestureDemo",
            type: .static,
            targets: [
                "UgGestureDemo"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "UgGestureDemo",
            dependencies: [],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)