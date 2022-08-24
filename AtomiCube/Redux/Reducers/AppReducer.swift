//
//  AppReducer.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 25/08/2022.
//
/*
 
 Reducers provide pure functions,
 that based on the current action and the current app state,
 create a new app state.
 
 In order to have a predictable app state,
 it is important that the reducer is always free of side effects,
 it receives the current app state and an action and returns the new app state.
 
*/

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()

    switch action {
    case _ as CounterActionIncrease:
        state = counterReducer(action: action, state: state)
    case _ as CounterActionDecrease:
        state = counterReducer(action: action, state: state)
    case _ as HabitActionComplete:
        state = habitReducer(action: action, state: state)
    case _ as HabitActionUncomplete:
        state = habitReducer(action: action, state: state)
    default:
        break
    }

    return state
}
