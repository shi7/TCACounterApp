//
//  LockView.swift
//  TCA Counter App
//
//  Created by Xiangmu Shi on 2022/7/13.
//  Copyright © 2022 compass.com. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct LockView: View {
    let store: Store<LockState, LockAction> = Store(initialState: LockState(
        countersData: [
            CounterState(count: 0),
            CounterState(count: 0),
            CounterState(count: 0)
        ]
    ), reducer: lockViewReducer, environment:
            LockEnvironment.live()
    )
    
    var body: some View {
        List(){
            ForEachStore(
                self.store.scope(
                    state: \.countersData,
                    action: LockAction.countStateUpdate(id:action:)
                )
            ) { counterStore in
                EditContentView(store: counterStore)
            }
        }.alert( self.store.scope(state: \.lockAlert),dismiss: .alertTapped)
    }
}
