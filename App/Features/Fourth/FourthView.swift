//
//  FourthView.swift
//  Disney
//
//  Created by hyogeon.kim on 11/16/25.
//

import SwiftUI
import ComposableArchitecture

struct FourthView: View {
    @Bindable var store: StoreOf<FourthReducer>
    
    var body: some View {
        NavigationView {
            Form {
                Section("Toggle") {
                    Toggle("Switch", isOn: $store.isOn.sending(\.toggleChanged))
                }
                
                Section("Slider") {
                    VStack {
                        Slider(
                            value: $store.sliderValue.sending(\.sliderChanged),
                            in: 0...100
                        )
                        Text("Value: \(Int(store.sliderValue))")
                            .foregroundColor(.secondary)
                    }
                }
                
                Section("Segment") {
                    Picker("Options", selection: $store.selectedSegment.sending(\.segmentChanged)) {
                        Text("First").tag(0)
                        Text("Second").tag(1)
                        Text("Third").tag(2)
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle(store.title)
            .onAppear {
                store.send(.onAppear)
            }
        }
    }
}



