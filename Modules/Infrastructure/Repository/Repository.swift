import Foundation
import Domain
import Network
import DB

// MARK: - Repository Module
// Interface의 구현을 제공합니다.
// Network 또는 DB를 사용하여 실제 데이터 처리를 수행합니다.

extension UserRepository {
    public static func live(
        networkClient: NetworkClient = DefaultNetworkClient(),
        localStorage: LocalStorage = UserDefaultsStorage()
    ) -> Self {
        Self(
            fetchUsers: {
                // Network를 통해 데이터 가져오기
                // 또는 DB에서 캐시된 데이터 가져오기
                return []
            },
            fetchUser: { id in
                // Network 또는 DB에서 특정 User 가져오기
                fatalError("Implement fetch user by id")
            },
            save: { user in
                // Network로 서버에 저장하거나
                // DB에 로컬 저장
            },
            delete: { id in
                // Network 또는 DB에서 삭제
            }
        )
    }
}

extension ProductRepository {
    public static func live(
        networkClient: NetworkClient = DefaultNetworkClient()
    ) -> Self {
        Self(
            fetchProducts: {
                // Network를 통해 제품 목록 가져오기
                return []
            },
            fetchProduct: { id in
                // Network를 통해 특정 제품 가져오기
                fatalError("Implement fetch product by id")
            },
            save: { product in
                // Network로 서버에 저장
            }
        )
    }
}

