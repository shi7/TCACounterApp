//
//  Rootfeature.swift
//  TCA Counter App
//
//  Created by xiangmu.shi on 2022/7/9.
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
        increment: { value, max in
            if value < max {
                return Effect(value: value + 1)
            } else {
                return Effect(error: ServiceError(message: "increment failed: greater than max \(max)"))
            }
        },
        decrement: { value, min -> Effect <Int, ServiceError> in
            if value > min {
                return Effect(value: value - 1)
            } else {
                return Effect(error: ServiceError(message: "increment falied: lower than min \(min)"))
            }
        }))
    }))

@dynamicMemberLookup
struct SystemEnvironment<Environment> {
    var environment: Environment

    subscript<Dependency>(
      dynamicMember keyPath: WritableKeyPath<Environment, Dependency>
    ) -> Dependency {
      get { self.environment[keyPath: keyPath] }
      set { self.environment[keyPath: keyPath] = newValue }
    }

    var mainQueue: () -> AnySchedulerOf<DispatchQueue>

    static func live(environment: Environment) -> Self {
      Self(environment: environment, mainQueue: { .main })
    }

    static func dev(environment: Environment) -> Self {
      Self(environment: environment, mainQueue: { .main })
    }
}
