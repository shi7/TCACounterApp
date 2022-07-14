    //
    //  Rootfeature.swift
    //  TCA Counter App
    //
    //  Created by xiangmu.shi on 2022/7/11.
    //  Copyright © 2022 compass.com. All rights reserved.
    //

import ComposableArchitecture

struct RootState {
    var countState = CounterState()
}

enum RootAction {
    case counterAction(CounterAction)
}

struct RootEnvironment { }


let rootReducer = Reducer<
    RootState,
    RootAction,
    RootEnvironment
>.combine(
    counterReducer.pullback(
        state: \.countState,
        action: /RootAction.counterAction,
        environment: { _ in CounterEnvironment(
            increment: incrementEffect,
            decrement: decrementEffect,
            setCountEffect: setCountEffect
        )})
)
