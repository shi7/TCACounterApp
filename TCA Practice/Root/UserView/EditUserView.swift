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

    private enum Constants {
        static let leftTextWidth: CGFloat = 85
        static let rightTextWidth: CGFloat = 120
        static let rightTextMaxWidth: CGFloat = 180
    }

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack(alignment: .leading) {
                HStack {
                    Text("Edit User")
                        .font(.largeTitle)
                    Spacer()
                    Button("Done") {
                        viewStore.send(.isShowEditUserView(false))
                    }
                }.padding()

                HStack {
                    Text("FirstName: ").frame(width: Constants.leftTextWidth)
                    VStack {
                        TextField("firstName", text: viewStore.binding(
                            get: \.firstName,
                            send: UserAction.updateFirstName
                        ))
                        .frame(width: Constants.rightTextWidth).padding()
                    }.border(.gray)
                }
                HStack {
                    Text("LastName: ").frame(width: Constants.leftTextWidth)
                    VStack {
                        TextField("lastName", text: viewStore.binding(
                            get: \.lastName,
                            send: UserAction.updateLastName
                        ))
                        .frame(width: Constants.rightTextWidth).padding()
                    }.border(.gray)
                }
                HStack {
                    Text("Email: ").frame(width: Constants.leftTextWidth)

                    VStack {
                        TextField("email", text: viewStore.binding(
                            get: \.email,
                            send: UserAction.updateEmail
                        ))
                        .frame(minWidth:  Constants.rightTextWidth, maxWidth:  Constants.rightTextMaxWidth).padding()
                    }.border(.gray)
                }

                HStack {
                    Text("Job: ").frame(width: Constants.leftTextWidth)
                    VStack {
                        TextField("job", text: viewStore.binding(
                            get: \.job,
                            send: UserAction.updateJob
                        ))
                        .frame(width: Constants.rightTextWidth).padding()
                    }.border(.gray)
                }

                HStack {
                    Text("Age: ").frame(width: Constants.leftTextWidth)
                    VStack {
                        TextField("age", text: viewStore.binding(
                            get: \.ageString,
                            send: UserAction.updateAge
                        )).keyboardType(.numberPad)
                            .frame(width: Constants.rightTextWidth).padding()
                    }.border(.gray)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            .onDisappear {
                viewStore.send(.isShowEditUserView(false))
            }
        }
    }
}
