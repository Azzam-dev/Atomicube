//
//  HabitReducer.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 25/08/2022.
//

import ReSwift

func habitReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()

    switch action {
    case let action as HabitActionComplete:
        print(state.habits) //TODO: HabitActionComplete
    case let action as HabitActionUncomplete:
        print(state.habits) //TODO: HabitActionUncomplete
    default:
        break
    }

    return state
}

