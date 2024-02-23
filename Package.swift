// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "ccwc",
  products: [
    .executable(name: "ccwc", targets: ["ccwc"])
  ],
  dependencies: [
    // Add your dependencies here, if any.
  ],
  targets: [
    .target(
      name: "ccwc",
      dependencies: [])
  ]
)
