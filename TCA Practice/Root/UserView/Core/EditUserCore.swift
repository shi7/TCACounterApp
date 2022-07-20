//
//  EditUserCore.swift
//  TCA Practice
//
//  Created by xiangmu shi on 2022/7/19.
//

import ComposableArchitecture
import Foundation

struct EditUserState: Equatable {
    var user: UserState
    
}

enum EditUserAction: Equatable {

}

struct EditUserEnvironment {}


let editUserReducer = Reducer<EditUserState, EditUserAction, EditUserEnvironment> {
    state, action, environment in
    switch action {
        default:
            return .none
    }
}
