// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "ESFeature",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "ESFeature",
            targets: [
                "ESFlashCard"
            ]
        ),
        .library(
            name: "ESFlashCard",
            targets: ["ESFlashCard"]
        ),
        .library(name: "ESLogin", targets: ["ESLogin"])
    ],
    dependencies: [
        .package(path: "ESFoundation"),
        .package(path: "ESDataLayer"),
        .package(path: "ESModule")
    ],
    targets: [
        .target(
            name: "ESLogin",
            dependencies: [
                .product(name: "ESDataStructure", package: "ESFoundation"),
                .product(name: "ESInjector", package: "ESFoundation"),
                .product(name: "ESLiveData", package: "ESFoundation"),
                .product(name: "ESDataModel", package: "ESDataLayer"),
                .product(name: "ESDataSource", package: "ESDataLayer"),
                .product(name: "ESDataTransport", package: "ESDataLayer"),
                .product(name: "ESAppleSignIn", package: "ESModule"),
            ],
            path: "Login",
            resources: [.process("Resources")],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "ESFlashCard",
            dependencies: [
                .product(name: "ESDataStructure", package: "ESFoundation"),
                .product(name: "ESInjector", package: "ESFoundation"),
                .product(name: "ESLiveData", package: "ESFoundation"),
                .product(name: "ESDataModel", package: "ESDataLayer"),
                .product(name: "ESDataSource", package: "ESDataLayer"),
                .product(name: "ESDataTransport", package: "ESDataLayer"),
                .product(name: "ESLocalNotification", package: "ESModule"),
                .product(name: "ESReusableUI", package: "ESModule"),
            ],
            path: "FlashCard",
            resources: [.process("Resources")],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        
//--------------------------------------------------//
//
        .testTarget(
            name: "ESFeatureTests",
            dependencies: [
                "ESLogin",
                "ESFlashCard",
                .product(name: "ESTestTool", package: "ESFoundation")
            ],
            resources: [.process("Resources")],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
    ]
)
