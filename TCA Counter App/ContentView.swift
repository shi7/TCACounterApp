//
//  ContentView.swift
//  TCA Counter App
//
//  Created by xiangmu.shi on 2022/7/6.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: Store<Counter, CounterAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView{
                VStack {
                    Text("\(viewStore.count)")
                    HStack {
                        Button("Inc"){ viewStore.send(.increment) }
                        Button("Dec"){ viewStore.send(.decrement) }
                    }
                    VStack(alignment:.trailing ) {
                        NavigationLink("Edit Count", destination: {
                            EditContentView(store:store)
                        })
                    }.padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store(initialState: Counter(), reducer: counterReducer, environment: CounterEnvironment()))
    }
}
