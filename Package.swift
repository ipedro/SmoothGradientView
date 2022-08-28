// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "SmoothGradientView",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "SmoothGradientView",
            targets: ["SmoothGradientView"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SmoothGradientView",
            dependencies: []),
        .testTarget(
            name: "SmoothGradientViewTests",
            dependencies: ["SmoothGradientView"]),
    ]
)
