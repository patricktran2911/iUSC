// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "ESDataLayer",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "ESDataLayer",
            targets: [
                "ESDataLayerDevTool",
                "ESDataModel",
                "ESDataSource",
                "ESDataTransport",
            ]
        ),
        .library(
            name: "ESDataLayerDevTool",
            targets: ["ESDataLayerDevTool"]
        ),
        .library(
            name: "ESDataModel",
            targets: ["ESDataModel"]
        ),
        .library(
            name: "ESDataSource",
            targets: ["ESDataSource"]
        ),
        .library(
            name: "ESDataTransport",
            targets: ["ESDataTransport"]
        ),
    ],
    dependencies: [
        .package(path: "ESFoundation")
    ],
    targets: [
        .target(
            name: "ESDataLayerDevTool",
            dependencies: [
                .product(name: "ESFoundationDevTool", package: "ESFoundation"),
                
                "ESDataModel",
                "ESDataSource",
                "ESDataTransport"
            ],
            path: "DevTool",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "ESDataModel",
            dependencies: [
                .product(name: "ESDataStructure", package: "ESFoundation")
            ],
            path: "DataModel",
            resources: [
                .process("Resources")
            ],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "ESDataSource",
            dependencies: [
                .product(name: "ESDataStructure", package: "ESFoundation"),
                "ESDataModel",
                "ESDataTransport"
            ],
            path: "DataSource",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "ESDataTransport",
            dependencies: [
                .product(name: "ESDataStructure", package: "ESFoundation"),
                "ESDataModel"
            ],
            path: "DataTransport",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        
//--------------------------------------------------//
//
        .testTarget(
            name: "ESDataLayerTests",
            dependencies: [
                "ESDataLayerDevTool",
                "ESDataModel",
                "ESDataTransport",
                .product(name: "ESTestTool", package: "ESFoundation")
            ],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
    ]
)
