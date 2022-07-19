//
//  CounterDetail.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import ComposableArchitecture
import SwiftUI

struct CounterDetail: View {
    let store: Store<CounterDetailState, CounterDetailAction>

    var body: some View {
        WithViewStore(store) { _ in
            ConterView(store: store.scope(state: \.counter, action: CounterDetailAction.counterView))
        }
    }
}
