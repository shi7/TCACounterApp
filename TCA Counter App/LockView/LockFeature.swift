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
        return lhs.counters == rhs.counters
    }
    var counters: IdentifiedArrayOf<CounterState> = []
    var isPresent: Bool = false
    var unlockAlert: AlertState<LockAction>?
}


enum LockAction {
    case counter(id: CounterState.ID, action: CounterAction)
}

struct LockEnvironment {
    var tryToUnlock: (IdentifiedArrayOf<CounterState>) -> Bool

    static func defaultEnv() -> LockEnvironment {
        LockEnvironment(tryToUnlock: { counters in
            counters.count == 3
            && counters[0].count == 9
            && counters[1].count == 5
            && counters[2].count == 7
        })
    }
}

let lockReducer: Reducer<LockState, LockAction, LockEnvironment> =
counterReducer.forEach(
    state: \.counters,
    action: /LockAction.counter(id:action:),
    environment: {_ in  LockEnvironment() }
).combined(with: Reducer { state, action, env in
    switch action {
        case let .setSheet(isPresented):
            state.isPresent = isPresented
            return .none

        case let .counter(id: id, action: .counterResponse(.success(value))):
            if env.tryToUnlock(state.counters) {
                state.unlockAlert = .init(title: .init("Unlocked!"))
            }
            return .none

        case .alertDismissed:
            state.unlockAlert = nil
            return .none

        default:
            return .none
    }
})
