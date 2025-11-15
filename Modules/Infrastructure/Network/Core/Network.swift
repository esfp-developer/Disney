import Foundation

// MARK: - Network Module
// API 통신을 담당합니다.

public enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
}

public protocol NetworkClient {
    func request<T: Decodable>(_ endpoint: String) async throws -> T
}

public final class DefaultNetworkClient: NetworkClient {
    public init() {}
    
    public func request<T: Decodable>(_ endpoint: String) async throws -> T {
        // 실제 네트워크 요청 구현
        fatalError("Implement network request")
    }
}


