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
            HStack(alignment: .center, spacing: 20) {
                Button("Dec"){ viewStore.send(.decrement) }.padding().buttonStyle(BorderlessButtonStyle())

                Text("\(viewStore.countString)").padding()

                Button("Inc"){ viewStore.send(.increment) }.padding().buttonStyle(BorderlessButtonStyle())

            }.alert(self.store.scope(state: \.alert),dismiss: .alertCancelTapped)
        }
    }
}
