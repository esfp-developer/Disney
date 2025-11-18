//
//  RootView.swift
//  Disney
//
//  Created by hyogeon.kim on 11/16/25.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
    @Bindable var store: StoreOf<RootReducer>
    
    var body: some View {
        TabView(selection: $store.selectedTab.sending(\.tabSelected)) {
            // Home Tab
            HomeView(
                store: store.scope(state: \.homeState, action: \.home)
            )
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(RootReducer.Tab.home)
            
            // Second Tab
            SecondView(
                store: store.scope(state: \.secondState, action: \.second)
            )
            .tabItem {
                Label("Second", systemImage: "star.fill")
            }
            .tag(RootReducer.Tab.second)
            
            // Third Tab
            ThirdView(
                store: store.scope(state: \.thirdState, action: \.third)
            )
            .tabItem {
                Label("Third", systemImage: "list.bullet")
            }
            .tag(RootReducer.Tab.third)
            
            // Fourth Tab
            FourthView(
                store: store.scope(state: \.fourthState, action: \.fourth)
            )
            .tabItem {
                Label("Fourth", systemImage: "gear")
            }
            .tag(RootReducer.Tab.fourth)
        }
    }
}



