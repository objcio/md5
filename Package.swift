// swift-tools-version:5.0

import PackageDescription

#if os(Linux)
let cmd5 = Target.systemLibrary(name: "Cmd5", pkgConfig: "openssl")
#else
let cmd5 = Target.systemLibrary(name: "Cmd5")
#endif

let package = Package(
    name: "md5",
    products: [
        .library(
            name: "md5",
            targets: ["md5"]),
    ],
    dependencies: [
    ],
    targets: [
	    cmd5,
        .target(
            name: "md5",
            dependencies: ["Cmd5"]),
        .testTarget(
            name: "md5Tests",
            dependencies: ["md5"]),
    ]
)
