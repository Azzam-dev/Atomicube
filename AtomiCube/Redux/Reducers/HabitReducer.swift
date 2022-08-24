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
        state.habits[action.completedHabit.rawValue] = true
    case let action as HabitActionUncomplete:
        state.habits[action.uncompletedHabit.rawValue] = false
    default:
        break
    }

    return state
}

