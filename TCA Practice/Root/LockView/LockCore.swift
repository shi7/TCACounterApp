//
//  LockCore.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import Foundation
import ComposableArchitecture

struct LockState: Equatable {
    var countersData: IdentifiedArrayOf<CounterState> = []
    var unlocked: Bool = false
    var lockAlert: AlertState<LockAction>?
}

enum LockAction: Equatable{
    case alertTapped
    case countStateUpdate(id: CounterState.ID, action: CounterAction)
}

struct LockEnvironment {

}

let lockViewReducer: Reducer<LockState, LockAction, LockEnvironment> =
counterReducer.forEach(
    state: \.countersData,
    action: /LockAction.countStateUpdate(id:action:),
    environment: {_ in  CounterEnvironment(
        increment: incrementEffect,
        decrement: decrementEffect,
        setCountEffect: setCountEffect
    )}
).combined(with: Reducer { state, action, environment in
    switch action {
        case .alertTapped:
            state.lockAlert = nil
            return .none
        case let .countStateUpdate(id: id, action: .counterResponse(.success(value))):
            let dataArray = state.countersData.map{ $0.count }
            guard dataArray == [9, 5, 7] else {
                return .none
            }
            state.lockAlert = AlertState(title: .init("Unlocked!"))
            return .none
        default:
            return .none
    }
})
