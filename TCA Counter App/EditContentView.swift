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
                TextField("TextField", text: viewStore.binding(
                        get: { String($0.count) },
                        send: { CounterAction.setCount($0) }
                    ))
                    .frame(width: 60)
            }
        }
    }
}

struct EditContentView_Previews: PreviewProvider {
    static var previews: some View {
        EditContentView(store:Store(initialState: Counter(), reducer: counterReducer, environment: CounterEnvironment()))
    }
}
