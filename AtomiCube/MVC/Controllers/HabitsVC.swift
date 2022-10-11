//
//  HabitsVC.swift
//  AtomiCube
//
//  Created by atomcube on 26/01/1444 AH.
//

import UIKit
import ReSwift

class HabitsVC: UIViewController, Storyboarded {
    var coordinator: MainCoordinator?
    
    @IBOutlet weak var tableView: UITableView!
    
    var habits: Habits = RealmRepository.shared.getHabits()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
}

extension HabitsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.values.count + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < habits.values.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HabitCell", for: indexPath) as! HabitCell
            cell.configure(title: habits.values[indexPath.row].title, counter: 40)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddNewHabitCell", for: indexPath) as! AddNewHabitCell
            return cell
        }
        
    }
    
    
}

extension HabitsVC: StoreSubscriber {
    
    override func viewWillAppear(_ animated: Bool) {
        mainStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        mainStore.unsubscribe(self)
    }
    
    func newState(state: AppState) {
        print("list my Habits:", state.habits)
        
    }
    
}
