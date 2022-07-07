//
//  EditContentView.swift
//  TCA Counter App
//
//  Copyright © 2022 compass.com. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct EditContentView: View {
    let store: Store<Counter, CounterAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack{
                TextField("count", text: viewStore.binding(
                    get:  \.countString,
                        send: CounterAction.setCount
                )).keyboardType(.numberPad)
                    .frame(width: 120).padding()
            }.border(.gray)
        }
    }
}

struct EditContentView_Previews: PreviewProvider {
    static var previews: some View {
        EditContentView(store:Store(initialState: Counter(), reducer: counterReducer, environment: CounterEnvironment()))
    }
}
