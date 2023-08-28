// swift-tools-version:5.7

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "UgAsyncURLSessionExample",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "UgAsyncURLSessionExample",
            type: .static,
            targets: [
                "UgAsyncURLSessionExample"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .target(
            name: "UgAsyncURLSessionExample",
            dependencies: [],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)