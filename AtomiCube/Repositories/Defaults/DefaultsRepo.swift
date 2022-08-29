//
//  DefaultsRepo.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 27/08/2022.
//
/*
 
 Data stored in UserDefaults automatically gets loaded when the app launches.
 Storing too much data in UserDefaults, will slow down app launch.
 Don't store more than 100KB in useing UserDefaults.
 
 */


import Foundation


// MARK: - UserDefaults Repository

class DefaultsRepository {
    static let shared = DefaultsRepository()
    
    
    // TODO: Move Mood Data to Realm Repository
    
    // MARK: typealias
    typealias MoodValues = [Float]
    
    
    // MARK: Create
    func setMood(withValues values: MoodValues) {
        UserDefaults.standard.set(values, forKey: "allMood")
    }
    
    func setMoodSlider(withPosition position: Float) {
        UserDefaults.standard.set(position, forKey: "moodSliderPosition")
    }
    
    
    
    // MARK: Read
    func getAllMood() -> MoodValues {
        return UserDefaults.standard.getFloatArray(forKey: "allMood")
    }
    
    func getMoodSliderPosition() -> Float {
        return UserDefaults.standard.float(forKey: "moodSliderPosition")
    }
    
    
    // MARK: Update
    
    // MARK: Delete
    
    
}



// MARK: - UserDefaults extension
extension UserDefaults {
    
    func getStringArray(forKey key: String) -> [String] {
        return array(forKey: key) as? [String] ?? [String]()
    }
    
    func getIntArray(forKey key: String) -> [Int] {
        return array(forKey: key) as? [Int] ?? [Int]()
    }
    
    func getFloatArray(forKey key: String) -> [Float] {
        return array(forKey: key) as? [Float] ?? [Float]()
    }
    
    func getDoubleArray(forKey key: String) -> [Double] {
        return array(forKey: key) as? [Double] ?? [Double]()
    }

}

