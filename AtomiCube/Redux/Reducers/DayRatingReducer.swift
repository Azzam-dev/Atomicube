//
//  DayRatingReducer.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 26/08/2022.
//

import ReSwift

func dayRatingReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()

    switch action {
    case let action as DayRatingActionAdd:
        state.dayRatings.append(action.rating)
    default:
        break
    }

    return state
}
