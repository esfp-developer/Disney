//
//  HomeView.swift
//  Disney
//
//  Created by hyogeon.kim on 11/15/25.
//

import SwiftUI
import ComposableArchitecture
import Domain

struct HomeView: View {
    @Bindable var store: StoreOf<HomeReducer>
    
    var body: some View {
        NavigationView {
            ZStack {
                if store.isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                } else if let errorMessage = store.errorMessage {
                    VStack(spacing: 16) {
                        Text("오류가 발생했습니다")
                            .font(.headline)
                        Text(errorMessage)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Button("다시 시도") {
                            store.send(.loadUsers)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    List(store.users, id: \.id) { user in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Users")
            .onAppear {
                store.send(.onAppear)
            }
        }
    }
}
