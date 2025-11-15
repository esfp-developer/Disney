import ComposableArchitecture

// MARK: - Dependency Keys
// @DependencyClient 덕분에 자동으로 unimplemented 처리됨

extension DependencyValues {
    public var userRepository: UserRepository {
        get { self[UserRepositoryKey.self] }
        set { self[UserRepositoryKey.self] = newValue }
    }
}

public enum UserRepositoryKey: DependencyKey {
    public static let liveValue = UserRepository()
}

extension DependencyValues {
    public var productRepository: ProductRepository {
        get { self[ProductRepositoryKey.self] }
        set { self[ProductRepositoryKey.self] = newValue }
    }
}

public enum ProductRepositoryKey: DependencyKey {
    public static let liveValue = ProductRepository()
}

