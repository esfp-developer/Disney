import Foundation

// MARK: - DB Module
// 로컬 데이터베이스를 담당합니다. (CoreData, Realm, UserDefaults 등)

public protocol LocalStorage {
    func save<T: Encodable>(_ data: T, forKey key: String) throws
    func load<T: Decodable>(forKey key: String) throws -> T?
    func delete(forKey key: String)
}

public final class UserDefaultsStorage: LocalStorage {
    private let userDefaults: UserDefaults
    
    public init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    public func save<T: Encodable>(_ data: T, forKey key: String) throws {
        let encoded = try JSONEncoder().encode(data)
        userDefaults.set(encoded, forKey: key)
    }
    
    public func load<T: Decodable>(forKey key: String) throws -> T? {
        guard let data = userDefaults.data(forKey: key) else { return nil }
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    public func delete(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
}


