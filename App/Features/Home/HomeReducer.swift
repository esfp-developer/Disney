//
//  HomeReducer.swift
//  Disney
//
//  Created by hyogeon.kim on 11/15/25.
//

import ComposableArchitecture
import Domain

@Reducer
struct HomeReducer: Sendable {
    @ObservableState
    struct State {
        var users: [User] = []
        var isLoading = false
        var errorMessage: String?
    }
    
    enum Action {
        case onAppear
        case loadUsers
        case usersLoaded([User])
        case usersFailed(String)
    }
    
    @Dependency(\.userRepository) var userRepository
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .send(.loadUsers)
                
            case .loadUsers:
                state.isLoading = true
                state.errorMessage = nil
                
                return .run { send in
                    do {
                        let users = try await userRepository.fetchUsers()
                        await send(.usersLoaded(users))
                    } catch {
                        await send(.usersFailed(error.localizedDescription))
                    }
                }
                
            case .usersLoaded(let users):
                state.users = users
                state.isLoading = false
                return .none
                
            case .usersFailed(let error):
                state.isLoading = false
                state.errorMessage = error
                return .none
            }
        }
    }
}
