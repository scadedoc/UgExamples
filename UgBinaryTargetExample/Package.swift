// swift-tools-version:5.8

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "UgBinaryTargetExample",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "UgBinaryTargetExample",
            type: .static,
            targets: [
                "UgBinaryTargetExample"
            ]
        )
    ],
    dependencies: [
        .package(name: "SPMSubproject", path: "SPMSubproject")
    ],
    targets: [
        .target(
            name: "UgBinaryTargetExample",
            dependencies: [
                .product(name: "SPMSubproject", package: "SPMSubproject")
            ],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)
