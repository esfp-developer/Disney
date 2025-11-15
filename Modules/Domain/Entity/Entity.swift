import Foundation

// MARK: - Entity
// 도메인 엔티티들을 정의합니다.
// 완전히 독립적이며 외부 의존성이 없습니다.

public struct User {
    public let id: String
    public let name: String
    public let email: String
    
    public init(id: String, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}

public struct Product {
    public let id: String
    public let name: String
    public let price: Int
    
    public init(id: String, name: String, price: Int) {
        self.id = id
        self.name = name
        self.price = price
    }
}
