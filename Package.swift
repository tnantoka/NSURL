import PackageDescription

let package = Package(
    name: "NSURL",
    targets: [
        Target(name: "AppTests", dependencies: ["NSURLFramework"]),
        Target(name: "App", dependencies: ["NSURLFramework"]),
    ],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1, minor: 3)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
    ]
)

