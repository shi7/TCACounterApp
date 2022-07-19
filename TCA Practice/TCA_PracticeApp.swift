//
//  TCA_PracticeApp.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import ComposableArchitecture
import SwiftUI

@main
struct TCA_PracticeApp: App {
    let store = Store(initialState: AppState(), reducer: appReducer, environment: AppEnvironment())

    var body: some Scene {
        WindowGroup {
            AppView(store: store)
        }
    }
}
