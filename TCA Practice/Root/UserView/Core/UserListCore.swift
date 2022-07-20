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
}

enum UserListAction {
    case itemTaped
    case itemUpdate(id: UserState.ID, action: UserAction)
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
    switch action {
        default:
            return .none
    }
})
