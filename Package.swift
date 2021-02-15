// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftSpellBook",
    products: [
        .library(
            name: "SwiftSpellBook",
            targets: ["SwiftSpellBook"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftSpellBook",
            dependencies: []),
        .testTarget(
            name: "SwiftSpellBookTests",
            dependencies: ["SwiftSpellBook"]),
    ]
)
