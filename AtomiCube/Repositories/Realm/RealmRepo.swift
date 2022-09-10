//
//  RealmRepo.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 27/08/2022.
//
/*
 
 
 
 */

import Foundation
import RealmSwift


// MARK: - Realm Repository

class RealmRepository {
    static let shared = RealmRepository()
    
    private lazy var localRealm:Realm = {
        return try! Realm()
    }()
    
    
    func realmConfiguration() {
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            schemaVersion: 1,
         
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
            })
         
        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
         
        // Now that we've told Realm how to handle the schema change, opening the file
        // will automatically perform the migration
    }
    
    
    // MARK: Create
    func createNewMood() -> Mood {
        let mood = Mood()
        try! localRealm.write { localRealm.add(mood) }
        return mood
    }
    
    // MARK: Read
    func getMood() -> Mood {
        if let mood = localRealm.object(ofType: Mood.self, forPrimaryKey: "Mood") {
            return mood
        } else {
            return createNewMood()
        }
        
    }
    
    // MARK: Update
    func addMoodValue(with value: Float) {
        let mood = getMood()
        try! localRealm.write {
            mood.values.append(value)
        }
    }
    
    // MARK: Delete
    func deleteMood() -> Mood? {
        if let mood = localRealm.object(ofType: Mood.self, forPrimaryKey: "Mood") {
            try! localRealm.write { localRealm.delete(mood) }
            return mood
        }
        return nil
    }
}

