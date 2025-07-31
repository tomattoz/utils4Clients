// swift-tools-version:5.9.2

import PackageDescription

let package = Package(
    name: "Utils9Client",
    defaultLocalization: "en",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(name: "Utils9Client", targets: ["Utils9Client"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tomattoz/utils", branch: "master"),
    ],
    targets: [
        .target(name: "Utils9Client",
                dependencies: [
                    .product(name: "Utils9", package: "utils"),
                ],
                path: "Sources")
    ]
)
