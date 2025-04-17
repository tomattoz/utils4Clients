// swift-tools-version:5.9.2

import PackageDescription

let package = Package(
    name: "ClientUtils9",
    defaultLocalization: "en",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(name: "ClientUtils9", targets: ["ClientUtils9"]),
    ],
    dependencies: [
        .package(path: "../utils"),
    ],
    targets: [
        .target(name: "ClientUtils9",
                dependencies: [
                    .product(name: "Utils9", package: "utils"),
                ],
                path: "Sources")
    ]
)
