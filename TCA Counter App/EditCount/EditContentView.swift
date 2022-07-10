    //
    //  EditContentView.swift
    //  TCA Counter App
    //
    //  Copyright © 2022 compass.com. All rights reserved.
    //

import SwiftUI
import ComposableArchitecture

struct EditContentView: View {
    let store: Store<CounterState, CounterAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                VStack {
                    TextField("count", text: viewStore.binding(
                        get:  \.countString,
                        send: CounterAction.setCount
                    )).keyboardType(.numberPad)
                        .frame(width: 120).padding()
                }.border(.gray)
                HStack {
                    Button("Inc"){ viewStore.send(.increment) }
                    Button("Dec"){ viewStore.send(.decrement) }
                }
            }.alert(self.store.scope(state: \.alert),dismiss: .alertCancelTapped)
        }
    }
}
