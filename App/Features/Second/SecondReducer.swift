//
//  SecondReducer.swift
//  Disney
//
//  Created by hyogeon.kim on 11/16/25.
//

import ComposableArchitecture
import Domain

@Reducer
struct SecondReducer: Sendable {
    @ObservableState
    struct State {
        var title = "Second"
        var counter = 0
    }
    
    enum Action {
        case onAppear
        case incrementTapped
        case decrementTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
                
            case .incrementTapped:
                state.counter += 1
                return .none
                
            case .decrementTapped:
                state.counter -= 1
                return .none
            }
        }
    }
}



