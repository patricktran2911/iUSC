// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "ESModule",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "ESModule",
            targets: [
                "ESModuleDevTool",
                "ESGoogleSignIn",
                "ESAppleSignIn",
                "ESLocalNotification",
                "ESReusableUI"
            ]
        ),
        .library(
            name: "ESModuleDevTool",
            targets: ["ESModuleDevTool"]
        ),
        .library(
            name: "ESAppleSignIn",
            targets: ["ESAppleSignIn"]
        ),
        .library(
            name: "ESGoogleSignIn",
            targets: ["ESGoogleSignIn"]
        ),
        .library(
            name: "ESLocalNotification",
            targets: ["ESLocalNotification"]
        ),
        .library(
            name: "ESReusableUI",
            targets: ["ESReusableUI"]
        ),
        
    ],
    dependencies: [
        .package(path: "ESFoundation"),
        .package(path: "ESDataLayer"),
        .package(url: "https://github.com/google/GoogleSignIn-iOS", exact: "7.0.0"),
        .package(url: "https://github.com/lucaszischka/BottomSheet", exact: "3.1.1")
    ],
    targets: [
        .target(
            name: "ESModuleDevTool",
            dependencies: [
                .product(name: "ESFoundationDevTool", package: "ESFoundation"),
                .product(name: "ESDataLayerDevTool", package: "ESDataLayer"),
                
                "ESGoogleSignIn",
                "ESAppleSignIn"
            ],
            path: "DevTool",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "ESAppleSignIn",
            dependencies: [
                .product(name: "ESDataStructure", package: "ESFoundation"),
                .product(name: "ESInjector", package: "ESFoundation"),
                .product(name: "ESLiveData", package: "ESFoundation"),
                
                .product(name: "ESDataModel", package: "ESDataLayer"),
                .product(name: "ESDataSource", package: "ESDataLayer"),
                .product(name: "ESDataTransport", package: "ESDataLayer"),
            ],
            path: "AppleSignIn",
            resources: [.process("Resources")],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "ESGoogleSignIn",
            dependencies: [
                .product(name: "ESDataStructure", package: "ESFoundation"),
                .product(name: "ESInjector", package: "ESFoundation"),
                .product(name: "ESLiveData", package: "ESFoundation"),
                
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS"),
                .product(name: "GoogleSignInSwift", package: "GoogleSignIn-iOS")
            ],
            path: "GoogleSignIn",
            resources: [.process("Resources")],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "ESLocalNotification",
            dependencies: [
                .product(name: "ESDataStructure", package: "ESFoundation"),
                .product(name: "ESInjector", package: "ESFoundation"),
                .product(name: "ESDataModel", package: "ESDataLayer"),
                .product(name: "ESDataSource", package: "ESDataLayer"),
            ],
            path: "LocalNotification",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "ESReusableUI",
            dependencies: [
                .product(name: "ESDataStructure", package: "ESFoundation"),
                .product(name: "ESLiveData", package: "ESFoundation"),
                .product(name: "BottomSheet", package: "BottomSheet"),
            ],
            path: "ReusableUI",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        
//--------------------------------------------------//
//
        .testTarget(
            name: "ESModuleTests",
            dependencies: [
                "ESModuleDevTool",
                "ESAppleSignIn",
                "ESGoogleSignIn",
                "ESLocalNotification",
                "ESReusableUI",
                .product(name: "ESTestTool", package: "ESFoundation")
            ],
            resources: [.process("Resources")],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
    ]
)
