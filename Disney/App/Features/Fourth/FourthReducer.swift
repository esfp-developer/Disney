//
//  FourthReducer.swift
//  Disney
//
//  Created by hyogeon.kim on 11/16/25.
//

import ComposableArchitecture
import Domain

@Reducer
struct FourthReducer: Sendable {
    @ObservableState
    struct State {
        var title = "Fourth"
        var isOn = false
        var sliderValue: Double = 50
        var selectedSegment = 0
    }
    
    enum Action {
        case onAppear
        case toggleChanged(Bool)
        case sliderChanged(Double)
        case segmentChanged(Int)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
                
            case .toggleChanged(let isOn):
                state.isOn = isOn
                return .none
                
            case .sliderChanged(let value):
                state.sliderValue = value
                return .none
                
            case .segmentChanged(let segment):
                state.selectedSegment = segment
                return .none
            }
        }
    }
}



