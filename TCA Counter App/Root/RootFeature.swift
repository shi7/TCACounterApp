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
    SystemEnvironment<RootEnvironment>
>.combine(
    counterReducer.pullback(
        state: \.countState,
        action: /RootAction.counterAction,
        environment: { _ in .live(environment: CounterEnvironment(
            increment: incrementEffect,
            decrement: decrementEffect,
            setCountEffect: setCountEffect
        ))})
)

//@dynamicMemberLookup
struct SystemEnvironment<Environment> {
    var environment: Environment

    subscript<Dependency>(
        dynamicMember keyPath: WritableKeyPath<Environment, Dependency>
    ) -> Dependency {
        get { self.environment[keyPath: keyPath] }
        set { self.environment[keyPath: keyPath] = newValue }
    }
//
    var mcounterResponseainQueue: () -> AnySchedulerOf<DispatchQueue>

    static func live(environment: Environment) -> Self {
        Self(environment: environment, mcounterResponseainQueue: { .main })
    }

    static func dev(environment: Environment) -> Self {
        Self(environment: environment, mcounterResponseainQueue: { .main })
    }
}
