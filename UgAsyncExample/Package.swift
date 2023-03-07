// swift-tools-version:5.3

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "UgAsyncExample",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "UgAsyncExample",
            type: .static,
            targets: [
                "UgAsyncExample"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "UgAsyncExample",
            dependencies: [],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)