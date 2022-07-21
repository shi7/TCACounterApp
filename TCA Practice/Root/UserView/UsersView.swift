//
//  UserView.swift
//  TCA Practice
//
//  Created by xiangmu shi on 2022/7/19.
//

import ComposableArchitecture
import SwiftUI

struct UsersView: View {
    let store: Store<UserListState, UserListAction> = Store(initialState: UserListEnvironment().live, reducer: userListReducer, environment: UserListEnvironment())

    var body: some View {
        WithViewStore(store) { viewStore in
            List {
                ForEachStore(self.store.scope(state: \.listData, action: UserListAction.itemUpdate(id:action:)), content: { user in
                    UserItemView(store: user)
                })
            }.navigationBarTitle("UsersView")
            .onAppear {
                viewStore.send(.startTimerSchedule(true))
            }
            .onDisappear{
                viewStore.send(.startTimerSchedule(false))
            }
        }
    }
}

struct UserItemView: View {
    let store: Store<UserState, UserAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationLink(destination:
                UserDetailView(store: store)
            ) {
                VStack(alignment: .leading) {
                    Text("NAME: \(viewStore.name)").padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    Text("EMAIL: \(viewStore.email)")
                }.padding()
            }
        }
    }
}
