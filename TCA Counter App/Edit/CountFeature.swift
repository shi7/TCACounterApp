//
//  CountFeature.swift
//  TCA Counter App
//
//  Copyright © 2022 compass.com. All rights reserved.
//

import Foundation
import ComposableArchitecture

struct CounterState: Equatable {
    var count: Int = 0
}

extension CounterState {
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

struct CounterEnvironment {
    static let Max = 99
    static let Min = -99
    var increment: (Int, Int) -> Effect<Int, ServiceError>
    var decrement: (Int, Int) -> Effect<Int, ServiceError>
}

let counterReducer = Reducer<CounterState, CounterAction, SystemEnvironment<CounterEnvironment> > {
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

struct ServiceError: Error, Equatable {
    var msg: String = "service error"
}

