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
    
    
    // MARK: - Mood
    
    // MARK: Create
    func createNewMood() -> Mood {
        let mood = Mood()
        do {
            try localRealm.write { localRealm.add(mood) }
        } catch {
            print("Error: createNewMood(), with error message: \(error)")
        }
        
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
        do {
            try localRealm.write { mood.values.append(value) }
        } catch {
            print("Error: addMoodValue(), with error message: \(error)")
        }
    }
    
    // MARK: Delete
    func deleteMood() -> Mood? {
        if let mood = localRealm.object(ofType: Mood.self, forPrimaryKey: "Mood") {
            do {
                try localRealm.write { localRealm.delete(mood) }
                return mood
            } catch {
                print("Error: deleteMood(), with error message: \(error)")
                return nil
            }
        }
        return nil
    }
    
    
    // MARK: - Tasks
    
    // MARK: Create
    func createNewTask() -> Tasks {
        let tasks = Tasks()
        do {
            try localRealm.write { localRealm.add(tasks) }
        } catch {
            print("Error: createNewTask(), with error message: \(error)")
        }
        return tasks
    }
    
    
    // MARK: Read
    func getTasks() -> Tasks {
        if let tasks = localRealm.object(ofType: Tasks.self, forPrimaryKey: "Tasks") {
            return tasks
        } else {
            return createNewTask()
        }
    }
    
    // MARK: Update
    func add(task: Task) {
        let tasks = getTasks()
        do {
            try localRealm.write { tasks.values.append(task) }
        } catch {
            print("Error: addTaskValue(), with error message: \(error)")
        }
    }
    
    func edit(task: Task, newTitle: String) {
        do {
            try localRealm.write { task.title = newTitle}
        } catch {
            print("Error: edit(task,newTitle), with error message: \(error)")
        }
    }
    
    func toggle(task: Task) {
        do {
            try localRealm.write { task.isCompleted.toggle() }
        } catch {
            print("Error: toggle(task), with error message: \(error)")
        }
    }
    
    
    // MARK: Delete
    func deleteAllTasks() -> Tasks? {
        if let tasks = localRealm.object(ofType: Tasks.self, forPrimaryKey: "Tasks") {
            do {
                try localRealm.write { localRealm.delete(tasks) }
                return tasks
            } catch {
                print("Error: deleteAllTasks(), with error message: \(error)")
                return nil
            }
        }
        return nil
    }
}

