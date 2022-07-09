//
//  TCA_Counter_AppApp.swift
//  TCA Counter App
//
//  Created by xiangmu.shi on 2022/7/6.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_Counter_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(
                initialState: RootState(),
                reducer: rootReducer,
                environment: .live(environment: RootEnvironment())))
        }
    }
}
