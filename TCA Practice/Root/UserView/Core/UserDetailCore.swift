//
//  UserListCore.swift
//  TCA Practice
//
//  Created by xiangmu shi on 2022/7/19.
//

import ComposableArchitecture
import Foundation

struct UserDetailState: Equatable {}

enum UserDetailAction: Equatable {}

struct UserDetailEnvironment {}

let userDetailReducer = Reducer<UserDetailState, UserDetailAction, UserDetailEnvironment> {
    _, action, _ in
    switch action {
    default:
        return .none
    }
}
