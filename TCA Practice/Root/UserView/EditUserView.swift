//
//  EditUserView.swift
//  TCA Practice
//
//  Created by xiangmu shi on 2022/7/19.
//

import ComposableArchitecture
import SwiftUI

struct EditUserView: View {
    let store: Store<UserState, UserAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack(alignment: .leading) {
                HStack() {
                    Text("Edit User")
                        .font(.largeTitle)
                    Spacer()
                    Button("Done") {
                        viewStore.send(.isShowEditUserView(false))
                    }
                }.padding()


                HStack {
                    Text("FirstName: ").frame(width:70)
                    VStack {
                        TextField("firstName", text: viewStore.binding(
                            get:  \.firstName,
                            send: UserAction.updateFirstName
                        ))
                            .frame(width: 120).padding()
                    }.border(.gray)
                }
                HStack {
                    Text("LastName: ").frame(width:70)
                    VStack {
                        TextField("lastName", text: viewStore.binding(
                            get: \.lastName,
                            send: UserAction.updateLastName
                        ))
                            .frame(width: 120).padding()
                    }.border(.gray)
                }
                HStack {
                    Text("Email: ").frame(width:70)

                    VStack {
                        TextField("email", text: viewStore.binding(
                            get:  \.email,
                            send: UserAction.updateEmail
                        ))
                            .frame(minWidth: 120,  maxWidth: 180).padding()
                    }.border(.gray)
                }

                HStack {
                    Text("Job: ").frame(width:70)
                    VStack {
                        TextField("job", text: viewStore.binding(
                            get:  \.job,
                            send: UserAction.updateJob
                        ))
                            .frame(width: 120).padding()
                    }.border(.gray)
                }

                HStack {
                    Text("Age: ").frame(width:70)
                    VStack {
                        TextField("age", text: viewStore.binding(
                            get:  \.ageString,
                            send: UserAction.updateAge
                        )).keyboardType(.numberPad)
                            .frame(width: 120).padding()
                    }.border(.gray)
                }
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing:0))
        }
    }
}
