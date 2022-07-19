//
//  appCore.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import Foundation
import ComposableArchitecture

struct AppState: Equatable {
    static func == (lhs: AppState, rhs: AppState) -> Bool {
        return true
    }

    var root: RootState = RootState.init(lockActive: true)
}

enum AppAction {
    case rootView(RootAction)
}

let appReducer: Reducer<AppState, AppAction, AppEnvironment> = .combine(
    rootReducer.pullback(
        state: \.root,
        action: /AppAction.rootView,
        environment: \.live
    )
)

struct AppEnvironment {
    var live = RootEnvironment()
}
