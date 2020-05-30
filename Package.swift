// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "FSCheckoutSheet",
    platforms: [
        .macOS(.v10_13),
    ],
    products: [
        .library(name: "FSCheckoutSheet", targets: ["FSCheckoutSheet"])
    ],
    targets: [
        .target(name: "FSCheckoutSheet")
    ]
)
