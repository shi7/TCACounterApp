//
//  CounterEnvionment.swift
//  TCA Practice
//
//  Created by Xiangmu Shi on 2022/7/18.
//

import ComposableArchitecture
import Foundation

struct CounterEnvironment {
    var increment: (Int, Int) -> Effect<Int, ServiceError>
    var decrement: (Int, Int) -> Effect<Int, ServiceError>
    var setCountEffect: (String, Int, Int) -> Effect<Int, ServiceError>
}
