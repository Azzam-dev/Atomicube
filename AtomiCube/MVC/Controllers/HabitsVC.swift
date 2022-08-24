//
//  HabitsVC.swift
//  AtomiCube
//
//  Created by atomcube on 26/01/1444 AH.
//

import UIKit

class HabitsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //غير لون الخلفيه الى احمر
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    

    @IBAction func didChangeHabit1(_ sender: Any) {
        view.backgroundColor = .blue
    }
    

    
    @IBAction func didChangeHabit2(_ sender: Any) {
        view.backgroundColor = .green
    }
  
    
    @IBAction func didChangeHabit3(_ sender: Any) {
        view.backgroundColor = .orange
    }

    
}

