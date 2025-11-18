import SwiftUI

// DesignSystem Module
// 앱 전체에서 사용하는 디자인 시스템을 정의합니다.

// MARK: - Colors
public extension Color {
    static let primary = Color("Primary", bundle: .module)
    static let secondary = Color("Secondary", bundle: .module)
}

// MARK: - Typography
public enum Typography {
    case title
    case body
    case caption
    
    public var font: Font {
        switch self {
        case .title: return .system(size: 24, weight: .bold)
        case .body: return .system(size: 16, weight: .regular)
        case .caption: return .system(size: 12, weight: .light)
        }
    }
}

// MARK: - Spacing
public enum Spacing {
    public static let small: CGFloat = 8
    public static let medium: CGFloat = 16
    public static let large: CGFloat = 24
}

// MARK: - Components
public struct DSButton: View {
    let title: String
    let action: () -> Void
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(Typography.body.font)
                .foregroundColor(.white)
                .padding()
                .background(Color.primary)
                .cornerRadius(8)
        }
    }
}


