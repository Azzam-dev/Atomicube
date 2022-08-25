//
//  HabitsVC.swift
//  AtomiCube
//
//  Created by atomcube on 26/01/1444 AH.
//

import UIKit
import ReSwift

class HabitsVC: UIViewController, StoreSubscriber {

    @IBOutlet var habitsProgress: [UIProgressView]!
    @IBOutlet var habitsPercentage: [UILabel]!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
           mainStore.subscribe(self)
       }

       override func viewWillDisappear(_ animated: Bool) {
           mainStore.unsubscribe(self)
       }

       func newState(state: AppState) {
           print("list my Habits:", state.habits)
           for (i, habit) in state.habits.enumerated()  {
               habitsProgress[i].progress = habit ? 1.0 : 0.0
               habitsPercentage[i].text = habit ? "100%" : "0%"
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func didChangeHabit1(_ sender: UISwitch) {
        sender.isOn ?
        mainStore.dispatch(HabitActionComplete(completedHabit: .first)) :
        mainStore.dispatch(HabitActionUncomplete(uncompletedHabit: .first))
    }
    

    
    @IBAction func didChangeHabit2(_ sender: UISwitch) {
        sender.isOn ?
        mainStore.dispatch(HabitActionComplete(completedHabit: .second)) :
        mainStore.dispatch(HabitActionUncomplete(uncompletedHabit: .second))
        
    }
  
    
    @IBAction func didChangeHabit3(_ sender: UISwitch) {
        sender.isOn ?
        mainStore.dispatch(HabitActionComplete(completedHabit: .third)) :
        mainStore.dispatch(HabitActionUncomplete(uncompletedHabit: .third))
        
    }

    
}

