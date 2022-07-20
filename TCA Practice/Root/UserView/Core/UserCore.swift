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
    var isActiveEditUserView: Bool = false
}

extension UserState {
    var name: String {
        get { String( firstName + " " + lastName ) }
    }
    var ageString: String {
        get { String(age) }
        set { age = Int(newValue) ?? 0 }
    }
}

enum UserAction: Equatable {
    case itemTaped
    case isShowEditUserView(Bool)
    case updateFirstName(String)
    case updateLastName(String)
    case updateEmail(String)
    case updateJob(String)
    case updateAge(String)
}

struct UserEnvironment {}


let userReducer = Reducer<UserState, UserAction, UserEnvironment> {
    state, action, environment in
    switch action {
        case .itemTaped:
            return .none
        case .isShowEditUserView(let active):
            state.isActiveEditUserView = active
            return .none
        case .updateFirstName(let name):
            state.firstName = name
            return .none
        case .updateLastName(let lastName):
            state.lastName = lastName
            return .none
        case .updateEmail(let email):
            state.email = email
            return .none
        case .updateJob(let job):
            state.job = job
            return .none
        case .updateAge(let age):
            state.age = Int(age) ?? 0
            return .none
    }
}

