// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "ESFeature",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "ESPracticeMode", targets: [
            "ESPracticeMode"
        ]),
        .library(
            name: "ESFeature",
            targets: [
                "ESFlashCard",
                "ESPracticeMode",
                "ESAppPurchased"
            ]
        ),
        .library(
            name: "ESFlashCard",
            targets: ["ESFlashCard"]
        ),
        .library(
            name: "ESLogin",
            targets: ["ESLogin"]
        ),
        .library(
            name: "ESAppPurchased",
            targets: [
                "ESAppPurchased"
            ]
        )
    ],
    dependencies: [
        .package(path: "ESFoundation"),
        .package(path: "ESDataLayer"),
        .package(path: "ESModule"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "11.12.0")
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
                "ESAppPurchased"
            ],
            path: "FlashCard",
            resources: [.process("Resources", localization: .default)],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "ESPracticeMode",
            dependencies: [
                .product(name: "ESDataStructure", package: "ESFoundation"),
                .product(name: "ESInjector", package: "ESFoundation"),
                .product(name: "ESLiveData", package: "ESFoundation"),
                .product(name: "ESDataModel", package: "ESDataLayer"),
                .product(name: "ESDataSource", package: "ESDataLayer"),
                .product(name: "ESDataTransport", package: "ESDataLayer"),
                .product(name: "ESLocalNotification", package: "ESModule"),
                .product(name: "ESReusableUI", package: "ESModule"),
                .product(name: "FirebaseRemoteConfig", package: "firebase-ios-sdk"),
                "ESAppPurchased"
            ],
            path: "PracticeMode",
            resources: [
                .process("Resources", localization: .default)
            ],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]),
        .target(
            name: "ESAppPurchased",
            dependencies: [
                .product(name: "ESDataStructure", package: "ESFoundation"),
                .product(name: "ESInjector", package: "ESFoundation"),
                .product(name: "ESLiveData", package: "ESFoundation"),
                .product(name: "ESDataModel", package: "ESDataLayer"),
                .product(name: "ESDataSource", package: "ESDataLayer")
            ],
            path: "AppPurchased",
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
                    "ESAppPurchased",
                    "ESPracticeMode",
                    .product(name: "ESTestTool", package: "ESFoundation")
                ],
                resources: [.process("Resources")],
                swiftSettings: [
                    .enableExperimentalFeature("StrictConcurrency")
                ]
            ),
    ]
)
