// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "ESFoundation",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "ESFoundation",
            targets: [
                "ESFoundationDevTool",
                "ESDataStructure",
                "ESInjector",
                "ESLiveData"
            ]
        ),
        .library(
            name: "ESFoundationDevTool",
            targets: ["ESFoundationDevTool"]
        ),
        .library(
            name: "ESDataStructure",
            targets: ["ESDataStructure"]
        ),
        .library(
            name: "ESInjector",
            targets: ["ESInjector"]
        ),
        .library(
            name: "ESLiveData",
            targets: ["ESLiveData"]
        ),
        .library(
            name: "ESTestTool",
            targets: ["ESTestTool"]
        )
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "ESFoundationDevTool",
            dependencies: [
                "ESDataStructure",
                "ESInjector",
                "ESLiveData",
            ],
            path: "DevTool",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "ESDataStructure",
            dependencies: [],
            path: "DataStructure",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "ESInjector",
            dependencies: [],
            path: "Injector",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "ESLiveData",
            dependencies: [
                "ESDataStructure"
            ],
            path: "LiveData",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        
//--------------------------------------------------//
//
        .target(
            name: "ESTestTool",
            dependencies: [],
            path: "TestTool",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .testTarget(
            name: "ESFoundationTests",
            dependencies: [
                "ESFoundationDevTool",
                "ESDataStructure",
                "ESInjector",
                "ESLiveData",
                "ESTestTool"
            ],
            resources: [.process("Resources")],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
    ]
)
