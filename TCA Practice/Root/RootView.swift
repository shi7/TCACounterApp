//
//  RootView.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import ComposableArchitecture
import SwiftUI

struct RootView: View {
    let store: Store<RootState, RootAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                RootLabel(store: store.scope(
                    state: \.countState, action: RootAction.counterAction
                ))
                VStack(alignment: .trailing) {
                    NavigationLink("Edit Count", destination: {
                        CounterDetail(store: store.scope(
                            state: \.counterDetail, action: RootAction.counterDetailAction
                        ))
                    })
                }.padding()

                Button(action: {
                    viewStore.send(.setLockActive(true))
                }) {
                    Text("LockView")
                }
            }.sheet(isPresented: viewStore.binding(
                get: \.isActiveLockView,
                send: RootAction.setLockActive
            )) {
                LockView()
            }
        }
    }
}
