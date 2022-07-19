//
//  CounterCore.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import ComposableArchitecture
import Foundation

struct CounterState: Equatable, Identifiable {
    var id = UUID()
    var count: Int = 0
    var alert: AlertState<CounterAction>?
    var min: Int
    var max: Int
}

extension CounterState {
    var countString: String {
        get { String(count) }
        set { count = Int(newValue) ?? 0 }
    }
}

enum CounterAction: Equatable {
    case increment
    case decrement
    case setCount(String)
    case counterResponse(Result<Int, ServiceError>)
    case alertCancelTapped
    case alertConfirmTapped
}

struct ServiceError: Error, Equatable {
    var message: String = ""
}

func incrementEffect(value: Int, max: Int) -> Effect<Int, ServiceError> {
    if value < max {
        return Effect(value: value + 1)
    } else {
        return Effect(error: ServiceError(message: "increment failed: greater than max \(max)"))
    }
}

func decrementEffect(value: Int, min: Int) -> Effect<Int, ServiceError> {
    if value > min {
        return Effect(value: value - 1)
    } else {
        return Effect(error: ServiceError(message: "decrement falied: lower than min \(min)"))
    }
}

func setCountEffect(value: String, max: Int, min: Int) -> Effect<Int, ServiceError> {
    guard let count = Int(value) else {
        return Effect(value: 0)
    }
    if count >= min, count <= max {
        return Effect(value: count)
    } else {
        return Effect(error: ServiceError(message: "count need between \(min) and \(max) "))
    }
}

let counterReducer = Reducer<CounterState, CounterAction, CounterEnvironment> {
    state, action, environment in
    switch action {
    case .increment:
        return environment.increment(state.count, state.max).receive(on: DispatchQueue.main.eraseToAnyScheduler())
            .catchToEffect(CounterAction.counterResponse)
    case .decrement:
        return environment.decrement(state.count, state.min).receive(on: DispatchQueue.main.eraseToAnyScheduler())
            .catchToEffect(CounterAction.counterResponse)
    case let .setCount(text):
        return environment.setCountEffect(text, state.max, state.min).receive(on: DispatchQueue.main.eraseToAnyScheduler())
            .catchToEffect(CounterAction.counterResponse)
    case let .counterResponse(result):
        switch result {
        case let .success(repositories):
            state.count = repositories
        case let .failure(error):
            state.alert = AlertState(title: TextState("\(error.message)"), dismissButton: .cancel(TextState("Sure")))
        }
        return .none
    case .alertCancelTapped,
         .alertConfirmTapped:
        state.alert = nil
        return .none
    }
}
