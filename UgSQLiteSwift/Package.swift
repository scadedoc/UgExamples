// swift-tools-version:5.3

import PackageDescription
import Foundation

let package = Package(
    name: "UgSqlLiteSwift",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgSqlLiteSwift",
            type: .static,
            targets: [
                "UgSqlLiteSwift"
            ]
        )
    ],
    dependencies: [
      .package(url: "https://github.com/scadedoc/SQLite.swift", .branch("master"))
    ],
    targets: [
    	.binaryTarget(name: "ScadeKit",
                      url: "https://github.com/scade-platform/ScadeKit/releases/download/2.4.0/ScadeKit.xcframework.zip",
                      checksum: "4bef943aa45155d3d25cad539710dec0c489d3ede287f8acdc5d5b4bc0f2d783"),
        .target(
            name: "UgSqlLiteSwift",
            dependencies: [.product(name: "SQLite", package: "SQLite.swift")],
            exclude: ["main.page"]
        )
    ]
)