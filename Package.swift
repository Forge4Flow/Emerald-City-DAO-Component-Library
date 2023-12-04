// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ecDAO",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ecDAO",
            targets: ["ecDAO"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Forge4Flow/FlowComponents.git", from: "0.3.0"),
        // .package(name: "FlowComponents", path: "/Users/boiseitguru/Development/Forge4Flow/ecosystem_sdks/FlowComponents"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ecDAO",
            dependencies: [
                .product(name: "FlowComponents", package: "FlowComponents"),
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "ecDAOTests",
            dependencies: ["ecDAO"]),
    ]
)
