//
//  HabitsVC.swift
//  AtomiCube
//
//  Created by atomcube on 26/01/1444 AH.
//

import UIKit
import ReSwift

class HabitsVC: UIViewController, StoreSubscriber {

    override func viewWillAppear(_ animated: Bool) {
           mainStore.subscribe(self)
       }

       override func viewWillDisappear(_ animated: Bool) {
           mainStore.unsubscribe(self)
       }

       func newState(state: AppState) {
           print("the counter value is: \(state.counter)")
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //غير لون الخلفيه الى احمر
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    

    @IBAction func didChangeHabit1(_ sender: Any) {
        view.backgroundColor = .blue
        mainStore.dispatch(CounterActionIncrease())
    }
    

    
    @IBAction func didChangeHabit2(_ sender: Any) {
        view.backgroundColor = .green
        mainStore.dispatch(CounterActionDecrease())
    }
  
    
    @IBAction func didChangeHabit3(_ sender: Any) {
        view.backgroundColor = .orange
    }

    
}

