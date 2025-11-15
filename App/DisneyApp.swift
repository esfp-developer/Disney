import SwiftUI
import ComposableArchitecture
import Domain
import Repository

@main
struct DisneyApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(
                store: Store(initialState: HomeReducer.State()) {
                    HomeReducer()
                } withDependencies: {
                    $0.userRepository = .live()
                    $0.productRepository = .live()
                }
            )
        }
    }
}
