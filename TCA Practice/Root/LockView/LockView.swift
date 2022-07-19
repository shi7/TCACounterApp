//
//  LockView.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import SwiftUI
import ComposableArchitecture

struct LockView: View {
    let store: Store<LockState, LockAction> = Store(initialState: LockState(
        countersData: [
            CounterState(count: 0, min: 0, max: 9),
            CounterState(count: 0, min: 0, max: 9),
            CounterState(count: 0, min: 0, max: 9),
        ]), reducer: lockViewReducer, environment: LockEnvironment())

    var body: some View {
        List(){
            ForEachStore(
                self.store.scope(
                    state: \.countersData,
                    action: LockAction.countStateUpdate(id:action:)
                )
            ) { counterStore in
                ConterView(store: counterStore)
            }
        }.alert( self.store.scope(state: \.lockAlert),dismiss: .alertTapped)
    }
}


