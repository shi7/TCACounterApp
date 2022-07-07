//
//  ContentView.swift
//  TCA Counter App
//
//  Created by xiangmu.shi on 2022/7/6.
//

import SwiftUI
import ComposableArchitecture

struct Counter: Equatable {
    var count: Int = 0
}

enum CounterAction {
    case increment
    case decrement
    case setCount(String)
}

struct CounterEnvironment { }

let counterReducer = Reducer<Counter, CounterAction, CounterEnvironment> {
    state, action, _ in
    switch action {
        case .increment:
            state.count += 1
            return .none
        case .decrement:
            state.count -= 1
            return .none
        case .setCount(let text):
            state.count = Int(text)!
            return .none
    }
}

struct ContentView: View {
    let store: Store<Counter, CounterAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView{
                VStack {
                    VStack(alignment:.trailing ) {
                        NavigationLink("Edit Page", destination: {
                            EditContentView(store:store)
                        })
                    }.padding()
                    Text("\(viewStore.count)")
                    HStack {
                        Button("Inc"){ viewStore.send(.increment) }
                        Button("Dec"){ viewStore.send(.decrement) }
                    }
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
