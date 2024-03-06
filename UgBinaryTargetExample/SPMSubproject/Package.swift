// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SPMSubproject",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SPMSubproject",
            targets: ["SPMSubproject"]
        ),
        .library(
            name: "SPMSubprojectDynamic",
            type: .dynamic,
            targets: ["SPMSubproject"]
        )
    ],
    targets: [
        .binaryTarget(name: "foo", path: "libfoo/build/foo.xcframework"),
        .target(
            name: "SPMSubproject",
            dependencies: [
                .target(name: "foo")
            ]
        )
    ]
)
