//
//  Task.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 09/09/2022.
//

import Foundation
import RealmSwift

class Tasks: Object {
    @Persisted(primaryKey: true) var _id = "Tasks"
    @Persisted var values = List<Task>()
    
    convenience init(values: List<Task>) {
        self.init()
        self.values = values
    }
}

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var isCompleted = false
    
    convenience init(title: String) {
        self.init()
        self.title = title
    }
}
