//
//  Mood.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 26/08/2022.
//

import Foundation
import RealmSwift



class Mood: Object {
    @Persisted(primaryKey: true) var _id = "Mood"
    @Persisted var values = List<Float>()
    
    convenience init(values: List<Float>) {
        self.init()
        self.values = values
    }
}
