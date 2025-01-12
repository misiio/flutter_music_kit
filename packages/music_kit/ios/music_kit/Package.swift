// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "music_kit",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(name: "music-kit", targets: ["music_kit"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "music_kit",
            dependencies: [],
            resources: [
            ]
        )
    ]
)