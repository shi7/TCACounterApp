//
//  RootView.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
    let store: Store<RootState, RootAction>
    @State private var showPresent = false

    var body: some View {
        WithViewStore(self.store.stateless) { viewStore in
                VStack {
                    RootLabel(store: store.scope(
                        state: \.countState, action: RootAction.counterAction
                    ))
                    VStack(alignment:.trailing ) {
                        NavigationLink("Edit Count", destination: {
                            CounterDetail(store: store.scope(
                                state: \.counterDetail, action: RootAction.counterDetailAction
                            ))
                        })
                    }.padding()
                    
                    Button(action: {
                        self.showPresent.toggle()
                    }) {
                        Text("LockView")
                    }.sheet(isPresented: $showPresent) {
                        LockView()
                    }
                }

        }
    }
}




//struct RootView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootView(store: Store(
//            initialState: RootState(),
//            reducer: rootReducer,
//            environment: RootEnvironment()))
//    }
//}
