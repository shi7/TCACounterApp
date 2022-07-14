//
//  LockFeature.swift
//  TCA Counter App
//
//  Created by Xiangmu Shi on 2022/7/13.
//  Copyright © 2022 compass.com. All rights reserved.
//

import ComposableArchitecture
import Foundation

struct LockState: Equatable {
    static func == (lhs: LockState, rhs: LockState) -> Bool {
        return lhs.countersData == rhs.countersData
    }
    var lockAlert: AlertState<LockAction>?
    var countersData: IdentifiedArrayOf<CounterState> = []
}


enum LockAction {
    case alertTapped
    case countStateUpdate(id: CounterState.ID, action: CounterAction)
}

struct LockEnvironment {
    static func live() -> LockEnvironment {
        LockEnvironment(verifyLockNumber: { dataArray in
            dataArray.map{ $0.count } == [9, 5, 7]
        })
    }
    var verifyLockNumber: (IdentifiedArrayOf<CounterState>) -> Bool
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
            if environment.verifyLockNumber(state.countersData) {
                state.lockAlert = AlertState(title: .init("Unlocked!"))
            }
            return .none
        default:
            return .none
    }
})
