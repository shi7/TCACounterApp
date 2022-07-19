//
//  AppView.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import SwiftUI
import ComposableArchitecture


struct AppView: View {
    let store: Store<AppState, AppAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                RootView(store: store.scope(
                    state: \.root,
                    action: AppAction.rootView
                ))
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(store: Store(initialState: AppState(), reducer: appReducer, environment: AppEnvironment()))
    }
}
