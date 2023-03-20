// swift-tools-version:5.3
import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "SimplyE",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "SimplyE",
            type: .static,
            targets: [
                "SimplyE"
            ]
        )
    ],
    dependencies: [
      .package(name: "ScadeExtensions", url: "https://github.com/scade-platform/ScadeExtensions", .branch("main")),  
    ],
    targets: [
        .target(
            name: "SimplyE",
            dependencies: ["ScadeExtensions"],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)