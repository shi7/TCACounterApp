//
//  UserListView.swift
//  TCA Practice
//
//  Created by xiangmu shi on 2022/7/19.
//

import ComposableArchitecture
import SwiftUI

struct UserDetailView: View {
    let store: Store<UserState, UserAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack(alignment: .leading) {
                Text("NAME: \(viewStore.name)").padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing:0))
                Spacer().frame(height: 10)
                Text("EMAIL: \(viewStore.email)")
                Spacer().frame(height: 10)
                Text("AGE: \(viewStore.age)")
                Spacer().frame(height: 10)
                Text("JOB: \(viewStore.job)").padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing:0))
            }.padding()
                .navigationBarItems(
                    trailing:
                        Button("Edit") {

                        }
                )
        }
    }
}
