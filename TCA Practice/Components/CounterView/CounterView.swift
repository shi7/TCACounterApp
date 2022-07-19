//
//  CounterView.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import ComposableArchitecture
import SwiftUI

struct ConterView: View {
    let store: Store<CounterState, CounterAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            HStack(alignment: .center, spacing: 20) {
                Button("Dec") { viewStore.send(.decrement) }.padding().buttonStyle(BorderlessButtonStyle())

                Text("\(viewStore.countString)").padding()

                Button("Inc") { viewStore.send(.increment) }.padding().buttonStyle(BorderlessButtonStyle())

            }.alert(self.store.scope(state: \.alert), dismiss: .alertCancelTapped)
        }
    }
}
