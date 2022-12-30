// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "LPMapView",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "LPMapView",
            targets: ["LPMapView"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/lukepistrol/SwiftLintPlugin", from: "0.2.2")
    ],
    targets: [
        .target(
            name: "LPMapView",
            dependencies: [],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin")
            ]
        )
    ]
)
