import Foundation
import ComposableArchitecture

// MARK: - Interface
// Repository 인터페이스를 정의합니다.
// @DependencyClient를 사용하여 자동으로 unimplemented 처리

@DependencyClient
public struct UserRepository {
    public var fetchUsers: @Sendable () async throws -> [User]
    public var fetchUser: @Sendable (_ id: String) async throws -> User
    public var save: @Sendable (_ user: User) async throws -> Void
    public var delete: @Sendable (_ id: String) async throws -> Void
}

@DependencyClient
public struct ProductRepository {
    public var fetchProducts: @Sendable () async throws -> [Product]
    public var fetchProduct: @Sendable (_ id: String) async throws -> Product
    public var save: @Sendable (_ product: Product) async throws -> Void
}
