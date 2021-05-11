// swift-tools-version:5.3

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "UgListControlDemo2",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgListControlDemo2",
            type: .static,
            targets: [
                "UgListControlDemo2"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "UgListControlDemo2",
            dependencies: [],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)