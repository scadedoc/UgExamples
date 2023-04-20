// swift-tools-version:5.3

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "UgAsyncHttpClientExample",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "UgAsyncHttpClientExample",
            type: .static,
            targets: [
                "UgAsyncHttpClientExample"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.9.0")
    ],
    targets: [
        .target(
            name: "UgAsyncHttpClientExample",
            dependencies: [
                .product(name: "AsyncHTTPClient", package: "async-http-client")
            ],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)
