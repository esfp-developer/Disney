//
//  RootReducer.swift
//  Disney
//
//  Created by hyogeon.kim on 11/16/25.
//

import ComposableArchitecture

@Reducer
struct RootReducer {
    @ObservableState
    struct State {
        var selectedTab: Tab = .home
        var homeState = HomeReducer.State()
        var secondState = SecondReducer.State()
        var thirdState = ThirdReducer.State()
        var fourthState = FourthReducer.State()
    }
    
    enum Action {
        case tabSelected(Tab)
        case home(HomeReducer.Action)
        case second(SecondReducer.Action)
        case third(ThirdReducer.Action)
        case fourth(FourthReducer.Action)
    }
    
    enum Tab: Hashable {
        case home
        case second
        case third
        case fourth
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .tabSelected(let tab):
                state.selectedTab = tab
                return .none
                
            default:
                return .none
            }
        }
        
        Scope(state: \.homeState, action: \.home) {
            HomeReducer()
        }
        
        Scope(state: \.secondState, action: \.second) {
            SecondReducer()
        }
        
        Scope(state: \.thirdState, action: \.third) {
            ThirdReducer()
        }
        
        Scope(state: \.fourthState, action: \.fourth) {
            FourthReducer()
        }
    }
}



