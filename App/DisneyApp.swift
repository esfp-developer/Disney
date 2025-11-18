import SwiftUI
import ComposableArchitecture
import Domain
import Repository

@main
struct DisneyApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(
                store: Store(initialState: RootReducer.State()) {
                    RootReducer()
                } withDependencies: {
                    $0.userRepository = .live()
                    $0.productRepository = .live()
                }
            )
        }
    }
}

