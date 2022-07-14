//
//  LockView.swift
//  TCA Counter App
//
//  Created by Xiangmu Shi on 2022/7/13.
//  Copyright © 2022 compass.com. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct LockView: View {
    let store: Store<LockState, LockAction>
    
    var body: some View {
        List{
            ForEachStore(
                self.store.scope(
                    state: \.counters,
                    action: LockAction.counter(id:action:)
                )
            ) { counterStore in
                EditContentView(store: counterStore)
            }
        }
    }
}

//struct LockView_Previews: PreviewProvider {
//    static var previews: some View {
//        LockView()
//    }
//}
