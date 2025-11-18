# Disney Project

Clean Architecture + Modular Architecture 기반의 iOS 프로젝트입니다.

## 📁 프로젝트 구조

```
Disney/
├── App/
│   ├── Sources/
│   │   ├── Features/          # 각 Feature별로 구성 (Reducer, View 등)
│   │   ├── DisneyApp.swift
│   │   └── ContentView.swift
│   └── Resources/
│
└── Modules/
    ├── Domain/                # 도메인 레이어
    │   ├── Entity/           # 도메인 엔티티 (독립적)
    │   └── Interface/        # Repository 인터페이스 (프로토콜)
    │
    ├── Infrastructure/        # 인프라 레이어
    │   ├── Network/          # API 통신
    │   ├── DB/               # 로컬 데이터베이스
    │   └── Repository/       # Repository 구현체
    │
    └── UI/                    # 프레젠테이션 레이어
        └── DesignSystem/     # 디자인 시스템
```

## 🏗️ 아키텍처

### 1. Domain Layer
- **Entity** (독립적)
  - 비즈니스 엔티티 정의
  - 외부 의존성 없음
  
- **Interface** (Entity에 의존)
  - Repository 인터페이스 정의
  - 의존성 역전 원칙 적용
  - TCA Dependency 키 정의

### 2. Infrastructure Layer
- **Network**: API 통신 담당 (독립적)
- **DB**: 로컬 저장소 담당 (독립적)
- **Repository**: Interface 구현
  - Entity + Interface + Network + DB를 import

### 3. Presentation Layer
- **DesignSystem**: 디자인 토큰, 컴포넌트 (독립적)

### 4. App Layer
- **Features**: 각 기능별 Reducer/View
  - Entity + Interface를 직접 import
  - Repository 구현체는 의존성 주입

## 🔗 의존성 관계

```
App (Features)
  ↓ import
  Entity + Interface
  
Repository
  ↓ import
  Entity + Interface + Network + DB
  
Interface → Entity + ComposableArchitecture
Network, DB, DesignSystem → 독립적
Entity → 독립적
```

## 📦 모듈별 Import 규칙

### HomeReducer (in App/Features)
```swift
import Entity      // User, Product 같은 엔티티
import Interface   // UserRepository 프로토콜, Dependency 키

struct HomeReducer {
    @Dependency(\.userRepository) var userRepository  // TCA Dependency
    
    func loadUsers() async {
        let users: [User] = try? await userRepository.fetchUsers()
    }
}
```

### DisneyApp (Composition Root)
```swift
import ComposableArchitecture
import Interface  // Dependency 키를 위해
import Repository // 구현체 주입을 위해

@main
struct DisneyApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(
                store: Store(initialState: HomeReducer.State()) {
                    HomeReducer()
                } withDependencies: {
                    $0.userRepository = UserRepositoryImpl()
                }
            )
        }
    }
}
```

### Repository Implementation (in Repository Module)
```swift
import Entity       // Entity 사용
import Interface    // 프로토콜 구현
import Network      // API 호출
import DB           // 로컬 저장

public final class UserRepositoryImpl: UserRepository {
    private let networkClient: NetworkClient
    private let localStorage: LocalStorage
    
    public func fetchUsers() async throws -> [User] {
        // Network를 통해 API 호출
        // DB에 캐싱
    }
}
```

## 🎯 핵심 원칙

1. **의존성 역전 (Dependency Inversion)**
   - App은 Domain(Interface)만 알고, 구현체는 모름
   - Repository 구현체는 의존성 주입으로 제공
   - TCA Dependency 시스템 활용

2. **단일 책임 (Single Responsibility)**
   - Network: API 통신만
   - DB: 로컬 저장만
   - Repository: 데이터 소스 조율

3. **독립성 (Independence)**
   - Domain은 완전히 독립적 (Entity)
   - Interface는 Entity + TCA만 의존
   - Network, DB도 독립적
   - 테스트 가능한 구조

## 🚀 시작하기

### 필수 요구사항
- Xcode 16.4+
- Swift 6.0+
- Tuist

### 설치 및 실행

```bash
# 의존성 설치
tuist install

# 프로젝트 생성
tuist generate

# Xcode에서 실행
open Disney.xcworkspace
```

### ⚠️ 빌드 에러 해결

**"Multiple commands produce" 에러가 발생하는 경우:**

1. Xcode에서 `File` > `Workspace Settings...` 선택
2. `Build System`을 `Legacy Build System`으로 변경
3. 또는 `Derived Data` 삭제 후 재빌드:
   ```bash
   rm -rf ~/Library/Developer/Xcode/DerivedData/Disney-*
   ```

4. 또는 Xcode의 Build Settings에서:
   - `ENABLE_USER_SCRIPT_SANDBOXING` = `NO` 설정

## 📝 모듈 구성

| 모듈 | 역할 | 의존성 |
|------|------|--------|
| Entity | 도메인 엔티티 | 없음 |
| Interface | Repository 인터페이스 | Entity, ComposableArchitecture |
| Network | API 통신 | 없음 |
| DB | 로컬 저장소 | 없음 |
| Repository | Repository 구현 | Entity, Interface, Network, DB |
| DesignSystem | UI 컴포넌트 | 없음 |
| App | Feature 구현 (TCA) | Entity, Interface, Repository, DesignSystem |

## 🛠️ 기술 스택

- **아키텍처**: Clean Architecture + Modular Architecture + TCA
- **프로젝트 관리**: Tuist
- **UI**: SwiftUI
- **상태 관리**: The Composable Architecture (TCA)
- **비동기**: Swift Concurrency (async/await)
- **DI**: TCA Dependencies

## 📄 라이선스

MIT License


