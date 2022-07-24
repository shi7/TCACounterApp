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
    var name: String { String(firstName + " " + lastName) }

    var ageString: String {
        get { String(age) }
        set { age = Int(newValue) ?? 0 }
    }

    init(user: UserState) {
        self.init(id: user.id, firstName: user.firstName, lastName: user.lastName, email: user.email, age: user.age, job: user.job)
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
    state, action, _ in
    switch action {
    case .itemTaped:
        return .none
    case let .isShowEditUserView(active):
        state.isActiveEditUserView = active
        return .none
    case let .updateFirstName(name):
        state.firstName = name
        return .none
    case let .updateLastName(lastName):
        state.lastName = lastName
        return .none
    case let .updateEmail(email):
        state.email = email
        return .none
    case let .updateJob(job):
        state.job = job
        return .none
    case let .updateAge(age):
        state.age = Int(age) ?? 0
        return .none
    }
}
