//
//  CountFeature.swift
//  TCA Counter App
//
//  Copyright © 2022 compass.com. All rights reserved.
//

import Foundation
import ComposableArchitecture

struct Counter: Equatable {
    var count: Int = 0
}

extension Counter {
  var countString: String {
    get { String(count) }
    set { count = Int(newValue) ?? 0 }
  }
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
            state.countString = text
            return .none
    }
}
