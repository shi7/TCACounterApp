//
//  appCore.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import ComposableArchitecture
import Foundation

struct AppState: Equatable {
    var root: RootState = .init(showPresent: false)
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
