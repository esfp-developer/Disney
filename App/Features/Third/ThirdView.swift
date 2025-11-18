//
//  ThirdView.swift
//  Disney
//
//  Created by hyogeon.kim on 11/16/25.
//

import SwiftUI
import ComposableArchitecture

struct ThirdView: View {
    @Bindable var store: StoreOf<ThirdReducer>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.items, id: \.self) { item in
                    Text(item)
                }
                .onDelete { indexSet in
                    store.send(.deleteItem(indexSet))
                }
            }
            .navigationTitle(store.title)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        store.send(.addItem)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear {
                store.send(.onAppear)
            }
        }
    }
}



