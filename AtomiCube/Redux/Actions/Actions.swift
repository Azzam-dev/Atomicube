//
//  Actions.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 25/08/2022.
//
/*
 
 Actions are a declarative way of describing a state change.
 Actions don't contain any code, they are consumed by the store and forwarded to reducers.
 Reducers will handle the actions by implementing a different state change for each action.
 
*/


import ReSwift


// MARK: actions for Counter
struct CounterActionIncrease: Action {}
struct CounterActionDecrease: Action {}

// MARK: actions for Mood
struct UpdateMoodAction: Action { let newMoodValue: Float }
struct DeleteMoodAction: Action { }

// MARK: actions for Habits
enum Habit: Int {
    case first
    case second
    case third
}

struct HabitActionComplete: Action { let completedHabit: Habit }
struct HabitActionUncomplete: Action { let uncompletedHabit: Habit }


// MARK: actions for DayRating
struct DayRatingActionAdd: Action { let rating: Int }
