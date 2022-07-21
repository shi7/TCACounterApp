//
//  EditUserCore.swift
//  TCA Practice
//
//  Created by xiangmu shi on 2022/7/19.
//

import ComposableArchitecture
import Foundation

struct EditUserState: Equatable {}

enum EditUserAction: Equatable {}

struct EditUserEnvironment {}

let editUserReducer = Reducer<EditUserState, EditUserAction, EditUserEnvironment> {
    _, action, _ in
    switch action {
    default:
        return .none
    }
}
