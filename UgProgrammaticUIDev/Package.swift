// swift-tools-version:5.3

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "UgProgrammaticUIDev",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgProgrammaticUIDev",
            type: .static,
            targets: [
                "UgProgrammaticUIDev"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "UgProgrammaticUIDev",
            dependencies: [],
            resources: [
                .copy("Resources/")
            ],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)