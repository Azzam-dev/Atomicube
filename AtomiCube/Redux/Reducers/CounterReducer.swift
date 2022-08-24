//
//  counterReducer.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 25/08/2022.
//

import ReSwift

func counterReducer(action: CounterAction, state: AppState?) -> AppState {
    var state = state ?? AppState()

    switch action {
    case _ as CounterActionIncrease:
        state.counter += 1
    case _ as CounterActionDecrease:
        state.counter -= 1
    default:
        break
    }

    return state
}
