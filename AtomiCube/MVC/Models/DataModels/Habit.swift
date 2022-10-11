//
//  Habit.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 11/10/2022.
//

import Foundation
import RealmSwift

class Habits: Object {
    @Persisted(primaryKey: true) var _id = "Habits"
    @Persisted var values = List<Habit>()
    
    convenience init(values: List<Habit>) {
        self.init()
        self.values = values
    }
}

class Habit: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var isCompleted = false
    
    convenience init(title: String) {
        self.init()
        self.title = title
    }
}

