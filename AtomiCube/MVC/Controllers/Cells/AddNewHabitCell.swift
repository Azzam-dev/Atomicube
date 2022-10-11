//
//  AddNewHabitCell.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 11/10/2022.
//

import UIKit

class AddNewHabitCell: UITableViewCell {

    @IBOutlet weak var habitTextField: UITextField!
    
    @IBAction func didPressAddButton(_ sender: UIButton) {
        guard let habitTitle = habitTextField.text, habitTitle != "" else { return }
        RealmRepository.shared.add(habit: Habit(title: habitTitle))
    }
}
