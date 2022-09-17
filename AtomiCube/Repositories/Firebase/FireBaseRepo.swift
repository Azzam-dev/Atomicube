//
//  FireBaseRepo.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 27/08/2022.
//
/*
 
 
 
 */

import Foundation
import Firebase
import FirebaseFirestore

// MARK: - Firebase Repository

let firestoreDB = Firestore.firestore()

class FirebaseRepository {
    static let shared = FirebaseRepository()
    
    func configure() {
        FirebaseApp.configure()
    }
    
    
    
    // MARK: typealias
    
    // MARK: Create
    
    // MARK: Read
#warning("change function name 😤")
    func getMinVersion()  {
        firestoreDB.collection("appData").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
    // MARK: Update
    
    // MARK: Delete
    
}

