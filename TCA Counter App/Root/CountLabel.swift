//
//  CountLabel.swift
//  TCA Counter App
//
//  Created by Xiangmu Shi on 2022/7/11.
//  Copyright © 2022 compass.com. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct CountLabel: View {
    let store: Store<CounterState, CounterAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            Text("\( viewStore.countString)")
        }
    }
}
