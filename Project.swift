import ProjectDescription

let project = Project(
    name: "Disney",
    targets: [
        // MARK: - Main App
        .target(
            name: "Disney",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.Disney",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["App/**"],
            resources: ["App/Resources/**"],
            dependencies: [
                .target(name: "Domain"),
                .target(name: "Repository"),
                .target(name: "DesignSystem"),
                .external(name: "ComposableArchitecture")
            ],
            settings: .settings(
                base: [
                    "SWIFT_VERSION": "6.0",
                    "SWIFT_STRICT_CONCURRENCY": "complete"
                ],
                configurations: [],
                defaultSettings: .recommended
            )
        ),
        
        // MARK: - Domain Layer
        .target(
            name: "Domain",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Disney.Domain",
            infoPlist: .default,
            sources: ["Modules/Domain/**"],
            dependencies: [
                .external(name: "ComposableArchitecture")
            ]
        ),
        
        // MARK: - Infrastructure Layer
        .target(
            name: "DNetwork",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Disney.DNetwork",
            infoPlist: .default,
            sources: ["Modules/Infrastructure/Network/**"],
            dependencies: []
        ),
        .target(
            name: "DB",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Disney.DB",
            infoPlist: .default,
            sources: ["Modules/Infrastructure/DB/**"],
            dependencies: []
        ),
        .target(
            name: "Repository",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Disney.Repository",
            infoPlist: .default,
            sources: ["Modules/Infrastructure/Repository/**"],
            dependencies: [
                .target(name: "Domain"),
                .target(name: "DNetwork"),
                .target(name: "DB")
            ]
        ),
        
        // MARK: - Presentation Layer
        .target(
            name: "DesignSystem",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Disney.DesignSystem",
            infoPlist: .default,
            sources: ["Modules/UI/DesignSystem/**"],
            resources: ["Modules/UI/DesignSystem/Resources/**"],
            dependencies: []
        ),
    ]
)
