//
//  CounterEnvionment.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import Foundation
import ComposableArchitecture

struct CounterEnvironment {
//    static let Max = 9
//    static let Min = 0
    var increment: (Int, Int) -> Effect<Int, ServiceError>
    var decrement: (Int, Int) -> Effect<Int, ServiceError>
    var setCountEffect: (String, Int, Int) -> Effect<Int, ServiceError>
}
