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

enum MoodType {
    case sad
    case bored
    case normal
    case good
    case happy
    
    
    var range: ClosedRange<Int> {
        switch self {
        case .sad:    return   0 ... 20
        case .bored:  return  21 ... 40
        case .normal: return  41 ... 60
        case .good:   return  61 ... 80
        case .happy:  return  81 ... 100
        }
    }
    
    init(_ value: Int) {
        switch value {
        case MoodType.sad.range:    self = .sad
        case MoodType.bored.range:  self = .bored
        case MoodType.normal.range: self = .normal
        case MoodType.good.range:   self = .good
        case MoodType.happy.range:  self = .happy
        default:
            self = value < 0 ? .sad : .happy
        }
    }
    
    init(_ value: Float) {
        switch Int(value) {
        case MoodType.sad.range:    self = .sad
        case MoodType.bored.range:  self = .bored
        case MoodType.normal.range: self = .normal
        case MoodType.good.range:   self = .good
        case MoodType.happy.range:  self = .happy
        default:
            self = value < 0 ? .sad : .happy
        }
    }
    
    init(_ value: Double) {
        switch Int(value) {
        case MoodType.sad.range:    self = .sad
        case MoodType.bored.range:  self = .bored
        case MoodType.normal.range: self = .normal
        case MoodType.good.range:   self = .good
        case MoodType.happy.range:  self = .happy
        default:
            self = value < 0 ? .sad : .happy
        }
    }
}
