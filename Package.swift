// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "LPMapView",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "LPMapView",
            targets: ["LPMapView"]
        )
    ],
    targets: [
        .target(
            name: "LPMapView",
            dependencies: []
        )
    ]
)
