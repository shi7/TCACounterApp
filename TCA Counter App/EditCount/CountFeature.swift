    //
    //  CountFeature.swift
    //  TCA Counter App
    //
    //  Copyright © 2022 compass.com. All rights reserved.
    //

import Foundation
import ComposableArchitecture

struct CounterState: Equatable, Identifiable {
    var id = UUID()
    static func == (lhs: CounterState, rhs: CounterState) -> Bool {
        return lhs.count == rhs.count
    }

    var count: Int = 0
    var alert: AlertState<CounterAction>?
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
    case counterResponse(Result<Int, ServiceError>)
    case alertCancelTapped
    case alertConfirmTapped
}

struct CounterEnvironment {
    static let Max = 9
    static let Min = 0
    var increment: (Int, Int) -> Effect<Int, ServiceError>
    var decrement: (Int, Int) -> Effect<Int, ServiceError>
    var setCountEffect: (String, Int, Int) -> Effect<Int, ServiceError>
}

let counterReducer = Reducer<CounterState, CounterAction, CounterEnvironment > {
    state, action, environment in
    switch action {
        case .increment:
            return environment.increment(state.count,CounterEnvironment.Max).receive(on: DispatchQueue.main.eraseToAnyScheduler())
                .catchToEffect(CounterAction.counterResponse)
        case .decrement:
            return environment.decrement(state.count,CounterEnvironment.Min).receive(on: DispatchQueue.main.eraseToAnyScheduler())
                .catchToEffect(CounterAction.counterResponse)
        case .setCount(let text):
            return environment.setCountEffect(text, CounterEnvironment.Max, CounterEnvironment.Min).receive(on: DispatchQueue.main.eraseToAnyScheduler())
                .catchToEffect(CounterAction.counterResponse)
        case let .counterResponse(result):
            switch result {
                case .success(let repositories):
                    state.count = repositories
                case .failure(let error):
                    state.alert = AlertState(title: TextState("\(error.message)"),dismissButton: .cancel(TextState("Sure")))
                    break
            }
            return .none
        case .alertCancelTapped,
            .alertConfirmTapped:
            state.alert = nil
            return .none
    }
}

