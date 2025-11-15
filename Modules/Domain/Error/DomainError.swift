import Foundation

// MARK: - Domain Errors
// 비즈니스 로직 위반 시 발생하는 에러들을 정의합니다.
// 기술적 구현(네트워크, DB)과 무관하며, 순수한 비즈니스 규칙만 표현합니다.

public enum DomainError: Error {
    // MARK: - User Related Errors
    case invalidUser(reason: String)
    case invalidEmail
    case userNotFound
    case duplicateUser
    case userAlreadyExists
    
    // MARK: - Data Integrity
    case invalidData
    case missingRequiredField(field: String)
    case dataCorrupted
    
    // MARK: - Authorization
    case unauthorized
    case forbidden
    case sessionExpired
    
    // MARK: - Business Rules
    case operationNotAllowed
    case limitExceeded
    case invalidOperation(reason: String)
    
    // MARK: - Product Related (예시)
    case productNotFound
    case outOfStock
    case invalidPrice
}

// MARK: - LocalizedError Conformance
extension DomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        // User Related
        case .invalidUser(let reason):
            return "잘못된 사용자 정보: \(reason)"
        case .invalidEmail:
            return "올바르지 않은 이메일 형식입니다"
        case .userNotFound:
            return "사용자를 찾을 수 없습니다"
        case .duplicateUser:
            return "이미 존재하는 사용자입니다"
        case .userAlreadyExists:
            return "해당 이메일로 가입된 계정이 이미 있습니다"
            
        // Data Integrity
        case .invalidData:
            return "데이터가 올바르지 않습니다"
        case .missingRequiredField(let field):
            return "필수 항목이 누락되었습니다: \(field)"
        case .dataCorrupted:
            return "데이터가 손상되었습니다"
            
        // Authorization
        case .unauthorized:
            return "로그인이 필요합니다"
        case .forbidden:
            return "접근 권한이 없습니다"
        case .sessionExpired:
            return "세션이 만료되었습니다. 다시 로그인해주세요"
            
        // Business Rules
        case .operationNotAllowed:
            return "이 작업은 허용되지 않습니다"
        case .limitExceeded:
            return "허용된 한도를 초과했습니다"
        case .invalidOperation(let reason):
            return "작업을 수행할 수 없습니다: \(reason)"
            
        // Product Related
        case .productNotFound:
            return "상품을 찾을 수 없습니다"
        case .outOfStock:
            return "품절된 상품입니다"
        case .invalidPrice:
            return "가격 정보가 올바르지 않습니다"
        }
    }
    
    public var failureReason: String? {
        switch self {
        case .invalidUser, .invalidEmail, .invalidData:
            return "입력된 정보가 올바르지 않습니다"
        case .userNotFound, .productNotFound:
            return "요청한 리소스를 찾을 수 없습니다"
        case .unauthorized, .forbidden, .sessionExpired:
            return "인증 또는 권한 문제가 발생했습니다"
        case .operationNotAllowed, .limitExceeded:
            return "비즈니스 규칙에 위배됩니다"
        case .outOfStock:
            return "재고가 부족합니다"
        default:
            return nil
        }
    }
    
    public var recoverySuggestion: String? {
        switch self {
        case .invalidEmail:
            return "올바른 이메일 형식으로 입력해주세요"
        case .unauthorized, .sessionExpired:
            return "다시 로그인해주세요"
        case .userNotFound:
            return "사용자 정보를 확인하거나 회원가입을 진행해주세요"
        case .duplicateUser, .userAlreadyExists:
            return "다른 이메일을 사용하거나 로그인을 시도해주세요"
        case .missingRequiredField:
            return "모든 필수 항목을 입력해주세요"
        case .outOfStock:
            return "재입고 알림을 신청하거나 다른 상품을 선택해주세요"
        default:
            return "잠시 후 다시 시도해주세요"
        }
    }
}

// MARK: - Error Category
extension DomainError {
    /// 에러의 카테고리를 반환합니다.
    public var category: ErrorCategory {
        switch self {
        case .invalidUser, .invalidEmail, .userNotFound, .duplicateUser, .userAlreadyExists:
            return .user
        case .invalidData, .missingRequiredField, .dataCorrupted:
            return .data
        case .unauthorized, .forbidden, .sessionExpired:
            return .authorization
        case .operationNotAllowed, .limitExceeded, .invalidOperation:
            return .businessRule
        case .productNotFound, .outOfStock, .invalidPrice:
            return .product
        }
    }
}

// MARK: - Error Category Enum
public enum ErrorCategory {
    case user
    case data
    case authorization
    case businessRule
    case product
    case unknown
}

