// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "stlib",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/Kitura/Kitura", from: "2.9.1"),
        .package(url: "https://github.com/Kitura/HeliumLogger.git", from: "1.9.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.

        .target(name: "stlib", dependencies: [.target(name: "Application"), "Kitura", "HeliumLogger"]),
        .target(name: "Application", dependencies: ["Kitura"]),
        .testTarget(name: "ApplicationTests", dependencies: [.target(name: "Application"), "Kitura"]),
    ]
)
