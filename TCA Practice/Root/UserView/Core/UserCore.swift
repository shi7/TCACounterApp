//
//  UserCore.swift
//  TCA Practice
//
//  Created by xiangmu shi on 2022/7/19.
//

import ComposableArchitecture
import Foundation

struct UserState: Equatable, Identifiable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var email: String
    var age: Int
    var job: String
}

extension UserState {
    var name: String {
        get { String( firstName + " " + lastName ) }
    }
}

enum UserAction: Equatable {
    case itemTaped
}

struct UserEnvironment {}


let userReducer = Reducer<UserState, UserAction, UserEnvironment> {
    state, action, environment in
    switch action {
        case .itemTaped:
            return .none
    }
}


