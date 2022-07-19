//
//  RootLabel.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct RootLabel: View {
    let store: Store<CounterState, CounterAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            Text("\(viewStore.countString)")
        }
    }
}
