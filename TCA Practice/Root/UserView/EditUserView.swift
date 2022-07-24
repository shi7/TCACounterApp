//
//  EditUserView.swift
//  TCA Practice
//
//  Created by xiangmu shi on 2022/7/19.
//

import ComposableArchitecture
import SwiftUI

private extension HorizontalAlignment {
    struct MidColonPoint: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.leading]
        }
    }
    static let midColonPoint = HorizontalAlignment(MidColonPoint.self)
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}


struct EditUserView: View {
    let store: Store<UserState, UserAction>
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

                VStack(alignment:.midColonPoint) {
                    HStack {
                        Text("FirstName: ")

                        TextField("firstName", text: viewStore.binding(
                            get: \.firstName,
                            send: UserAction.updateFirstName
                        )).padding()
                            .border(.gray)
                            .fixedSize()
                            .alignmentGuide(.midColonPoint) { d in d[HorizontalAlignment.leading] }
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

                    HStack {
                        Text("LastName: ")

                        TextField("lastName", text: viewStore.binding(
                            get: \.lastName,
                            send: UserAction.updateLastName
                        )).padding()
                            .border(.gray)
                            .fixedSize()
                            .alignmentGuide(.midColonPoint) { d in d[HorizontalAlignment.leading] }
                    }

                    HStack {
                        Text("Email: ")
                        TextField("email", text: viewStore.binding(
                            get: \.email,
                            send: UserAction.updateEmail
                        )).padding()
                            .border(.gray)
                            .alignmentGuide(.midColonPoint) { d in d[HorizontalAlignment.leading] }
                            .fixedSize()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)).layoutPriority(1)

                    HStack {
                        Text("Job: ")
                        TextField("job", text: viewStore.binding(
                            get: \.job,
                            send: UserAction.updateJob
                        )).padding()
                            .border(.gray)
                            .fixedSize()
                            .alignmentGuide(.midColonPoint) { d in d[HorizontalAlignment.leading] }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)).layoutPriority(1)
                    }
                    .background(
                        GeometryReader { geometryProxy in
                            Color.clear
                            .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
                        }
                    ).onPreferenceChange(SizePreferenceKey.self) { newSize in
                        print("The new child size is: \(newSize)")
                    }

                    HStack {
                        Text("Age: ")
                        TextField("age", text: viewStore.binding(
                            get: \.ageString,
                            send: UserAction.updateAge
                        )).keyboardType(.numberPad)
                            .padding()
                            .border(.gray)
                            .fixedSize()
                            .alignmentGuide(.midColonPoint) { d in d[HorizontalAlignment.leading] }
                    }
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            .onDisappear {
                viewStore.send(.isShowEditUserView(false))
            }
        }
    }
}
