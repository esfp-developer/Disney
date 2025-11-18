//
//  ThirdReducer.swift
//  Disney
//
//  Created by hyogeon.kim on 11/16/25.
//

import ComposableArchitecture
import Domain
import Foundation

@Reducer
struct ThirdReducer: Sendable {
    @ObservableState
    struct State {
        var title = "Third"
        var items: [String] = []
    }
    
    enum Action {
        case onAppear
        case addItem
        case deleteItem(IndexSet)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
                
            case .addItem:
                let newItem = "Item \(state.items.count + 1)"
                state.items.append(newItem)
                return .none
                
            case .deleteItem(let indexSet):
                state.items.remove(atOffsets: indexSet)
                return .none
            }
        }
    }
}



