//
//  RootLabel.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct RootLabel: View {
    let store: Store<CounterState, CounterAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            Text("\( viewStore.countString)")
        }
    }
}
