//
//  DetailCore.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import ComposableArchitecture
import Foundation

struct CounterDetailState: Equatable {
    var counter: CounterState
}

enum CounterDetailAction {
    case counterView(CounterAction)
}

struct CounterDetailEnvironment {
    var counter: CounterEnvironment
}

let counterDetailReducer: Reducer<CounterDetailState, CounterDetailAction, CounterDetailEnvironment> = .combine(
    counterReducer.pullback(
        state: \.counter,
        action: /CounterDetailAction.counterView,
        environment: \.counter
    )
)
