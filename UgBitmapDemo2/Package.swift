// swift-tools-version:5.3

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "UgBitmapDemo2",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgBitmapDemo2",
            type: .static,
            targets: [
                "UgBitmapDemo2"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "UgBitmapDemo2",
            dependencies: [],
            exclude: ["main.page"],
            resources: [.copy("Assets")],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)