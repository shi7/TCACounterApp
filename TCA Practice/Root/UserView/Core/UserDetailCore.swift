//
//  UserListCore.swift
//  TCA Practice
//
//  Created by xiangmu shi on 2022/7/19.
//

import ComposableArchitecture
import Foundation

struct UserDetailState: Equatable {
    var isActiveEditUserView: Bool
    var user: UserState
}

enum UserDetailAction: Equatable {
    case setEditUserViewActive(Bool)
    case userDidUpdate(UserAction)
}

struct UserDetailEnvironment {}


let userDetailReducer = Reducer<UserDetailState, UserDetailAction, UserDetailEnvironment> {
    state, action, environment in
    switch action {
        case let .setEditUserViewActive(active):
            state.isActiveEditUserView = active
            return .none
        case .userDidUpdate:
            return .none
    }
}
