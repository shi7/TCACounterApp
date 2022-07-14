//
//  ContentView.swift
//  TCA Counter App
//
//  Created by xiangmu.shi on 2022/7/6.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: Store<RootState, RootAction>
    @State private var showPresent = false

    var body: some View {
        WithViewStore(self.store.stateless) { viewStore in
            NavigationView{
                VStack {
                    CountLabel(store: store.scope(
                        state: \.countState, action: RootAction.counterAction
                    ))
                    VStack(alignment:.trailing ) {
                        NavigationLink("Edit Count", destination: {
                            EditContentView(store: store.scope(
                                state: \.countState, action: RootAction.counterAction
                            ))
                        })
                    }.padding()

                    VStack(alignment:.trailing ) {
                        NavigationLink("Lock View", destination: {
                            LockView()
                        })
                    }
                }


            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store(
            initialState: RootState(),
            reducer: rootReducer,
            environment: RootEnvironment()))
    }
}
