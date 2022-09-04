//
//  MoodReducer.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 02/09/2022.
//

import ReSwift

func moodReducer(action: Action, state: AppState?) -> AppState {
    let state = state ?? AppState()

    switch action {
    case let action as UpdateMoodAction:
        print("UpdateMoodAction:\(action.newMoodValue)")
        RealmRepository.shared.addMoodValue(with: action.newMoodValue)
    case let action as DeleteMoodAction:
        print("DeleteMoodAction")
    default:
        break
    }

    return state
}
