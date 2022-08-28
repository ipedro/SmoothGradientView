// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "UIGradientView",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "UIGradientView",
            targets: ["UIGradientView"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UIGradientView",
            dependencies: []),
        .testTarget(
            name: "UIGradientViewTests",
            dependencies: ["UIGradientView"]),
    ]
)
