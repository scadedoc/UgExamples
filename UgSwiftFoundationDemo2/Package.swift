// swift-tools-version:5.3

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "UgSwiftFoundationDemo2",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgSwiftFoundationDemo2",
            type: .static,
            targets: [
                "UgSwiftFoundationDemo2"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "UgSwiftFoundationDemo2",
            dependencies: [],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)