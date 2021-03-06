//
//  RootCore.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import ComposableArchitecture
import Foundation

struct RootState: Equatable {
    var showPresent: Bool
    var countState = CounterState(min: 0, max: 9)
    var counterDetail = CounterDetailState(counter: CounterState(min: 0, max: 9))
}

enum RootAction {
    case counterAction(CounterAction)
    case counterDetailAction(CounterDetailAction)
    case setLockActive(Bool)
}

struct RootEnvironment {}

let rootReducer = Reducer<
    RootState,
    RootAction,
    RootEnvironment
>.combine(
    counterDetailReducer.pullback(
        state: \.counterDetail,
        action: /RootAction.counterDetailAction,
        environment: { _ in CounterDetailEnvironment(counter: CounterEnvironment(
            increment: incrementEffect,
            decrement: decrementEffect,
            setCountEffect: setCountEffect
        )) }
    ),

    Reducer { state, action, _ in
        switch action {
        case let .counterDetailAction(.counterView(.counterResponse(result))):
            switch result {
            case let .success(repositories):
                state.countState.count = repositories
            case let .failure(error):
                break
            }
            return .none
        case let .setLockActive(show):
            state.showPresent = show
            return .none
        default:
            return .none
        }
    }
)
