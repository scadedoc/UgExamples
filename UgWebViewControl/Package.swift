// swift-tools-version:5.3

import PackageDescription
import Foundation

let package = Package(
    name: "UgWebViewControl",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "UgWebViewControl",
            type: .static,
            targets: [
                "UgWebViewControl"
            ]
        )
    ],
    dependencies: [
      
    ],
    targets: [
        .binaryTarget(name: "ScadeKit",
                      url: "https://github.com/scade-platform/ScadeKit/releases/download/2.4.0/ScadeKit.xcframework.zip",
                      checksum: "4bef943aa45155d3d25cad539710dec0c489d3ede287f8acdc5d5b4bc0f2d783"),
        .target(
            name: "UgWebViewControl",
            dependencies: ["ScadeKit"],
            exclude: ["main.page"]
        )
    ]
)