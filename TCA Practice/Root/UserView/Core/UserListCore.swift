//
//  UserListCore.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/19.
//
import ComposableArchitecture
import Foundation


struct UserListState: Equatable {
    var listData: IdentifiedArrayOf<UserState> = []
    var isTimerActive = false
    var secondsElapsed = 0
}

enum UserListAction {
    case itemTaped
    case itemUpdate(id: UserState.ID, action: UserAction)
    case startTimerSchedule
    case timerTicked
}

struct UserListEnvironment {
    var live = UserListState(listData: [
        UserState(firstName: Randoms.randomFakeFirstName(), lastName: Randoms.randomFakeLastName(), email: "\(String.random(ofLength: 8))@compass.com", age: Int.random(), job: Randoms.randomFakeTag()),
        UserState(firstName: Randoms.randomFakeFirstName(), lastName: Randoms.randomFakeLastName(), email: "\(String.random(ofLength: 8))@compass.com", age: Int.random(), job: Randoms.randomFakeTag()),
        UserState(firstName: Randoms.randomFakeFirstName(), lastName: Randoms.randomFakeLastName(), email: "\(String.random(ofLength: 8))@compass.com", age: Int.random(), job: Randoms.randomFakeTag()),
        UserState(firstName: Randoms.randomFakeFirstName(), lastName: Randoms.randomFakeLastName(), email: "\(String.random(ofLength: 8))@compass.com", age: Int.random(), job: Randoms.randomFakeTag()),
        UserState(firstName: Randoms.randomFakeFirstName(), lastName: Randoms.randomFakeLastName(), email: "\(String.random(ofLength: 8))@compass.com", age: Int.random(), job: Randoms.randomFakeTag()),
    ])
}



let userListReducer: Reducer<UserListState, UserListAction, UserListEnvironment> =
userReducer.forEach(
    state: \.listData,
    action: /UserListAction.itemUpdate,
    environment: { _ in UserEnvironment() }
).combined(with: Reducer { state, action, _ in
    enum TimerId {}
    switch action {
        case .timerTicked:
          state.secondsElapsed += 1
            if state.secondsElapsed % 5 == 0 {
                print("good job\(state.listData[0].age)")
//                state.listData[0].age = 20
            }
            print("timerTicked")
          return .none
        case .startTimerSchedule:
            state.isTimerActive.toggle()
            return state.isTimerActive
              ? Effect.timer(
                id: TimerId.self,
                every: 1,
                tolerance: .zero,
                on: DispatchQueue.main.eraseToAnyScheduler()
              ).map { _ in UserListAction.timerTicked }
              : .cancel(id: TimerId.self)
        default:
            return .none
    }
})
