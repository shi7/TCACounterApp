//
//  CountEffects.swift
//  TCA Counter App
//
//  Created by Xiangmu Shi on 2022/7/11.
//  Copyright © 2022 compass.com. All rights reserved.
//

import Foundation
import ComposableArchitecture

struct ServiceError: Error, Equatable {
    var message: String = ""
}

func incrementEffect(value: Int, max: Int) -> Effect<Int, ServiceError> {
    if value < max {
        return Effect(value: value + 1)
    } else {
        return Effect(error: ServiceError(message: "increment failed: greater than max \(max)"))
    }
}

func decrementEffect(value: Int, min: Int) -> Effect<Int, ServiceError> {
    if value > min {
        return Effect(value: value - 1)
    } else {
        return Effect(error: ServiceError(message: "decrement falied: lower than min \(min)"))
    }
}

func setCountEffect(value: String, max: Int, min: Int) -> Effect<Int, ServiceError> {
    guard let count = Int(value) else {
        return Effect(value: 0)
    }
    if count >= min, count <= max {
        return Effect(value: count)
    } else {
        return Effect(error: ServiceError(message: "count need between \(min) and \(max) "))
    }
}
