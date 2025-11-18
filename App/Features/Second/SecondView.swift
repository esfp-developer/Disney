//
//  SecondView.swift
//  Disney
//
//  Created by hyogeon.kim on 11/16/25.
//

import SwiftUI
import ComposableArchitecture

struct SecondView: View {
    @Bindable var store: StoreOf<SecondReducer>
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("\(store.counter)")
                    .font(.system(size: 60, weight: .bold))
                
                HStack(spacing: 20) {
                    Button {
                        store.send(.decrementTapped)
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .font(.largeTitle)
                    }
                    
                    Button {
                        store.send(.incrementTapped)
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                    }
                }
            }
            .navigationTitle(store.title)
            .onAppear {
                store.send(.onAppear)
            }
        }
    }
}



