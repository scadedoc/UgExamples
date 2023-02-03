// swift-tools-version:5.3

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "UgSwiftNioExample",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgSwiftNioExample",
            type: .static,
            targets: [
                "UgSwiftNioExample"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.46.0")
    ],
    targets: [
        .target(
            name: "UgSwiftNioExample",
            dependencies: [
                .product(name: "NIO", package: "swift-nio")
            ],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)