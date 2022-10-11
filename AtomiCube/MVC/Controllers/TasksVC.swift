//
//  TasksVC.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 09/09/2022.
//

import UIKit
import ReSwift
import Lottie

class TasksVC: UIViewController, Storyboarded {
    var coordinator: MainCoordinator?
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var celebrationView = CelebrationView(frame: .zero)
    var tasks: Tasks = RealmRepository.shared.getTasks()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        celebrationView = CelebrationView(frame: view.bounds)
        view.addSubview(celebrationView)
        taskTextField.clearButtonMode = .unlessEditing
        hideKeyboardWhenTappedAround()
    }

    @IBAction func didPressAddTask(_ sender: Any, forEvent event: UIEvent) {
        if let taskTitle = taskTextField.text {
            RealmRepository.shared.add(task: Task(title: taskTitle))
            tableView.reloadData()
            taskTextField.text = ""
        }
        
    }
}

extension TasksVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        let task = tasks.values[indexPath.row]
        if task.isCompleted {
            cell.textLabel?.attributedText = "✔️ \(task.title)".strikeThrough(range: NSMakeRange(3, task.title.length))
        } else {
            cell.textLabel?.text = task.title
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks.values[indexPath.row]
        RealmRepository.shared.toggle(task: task)
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if task.isCompleted {
                cell.textLabel?.attributedText = "✔️ \(task.title)".strikeThrough(range: NSMakeRange(3, task.title.length))
                celebrationView.play()
            } else {
                cell.textLabel?.text = task.title
            }
        }
    }
    
    
}

extension TasksVC: StoreSubscriber {
    
    override func viewWillAppear(_ animated: Bool) {
        mainStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        mainStore.unsubscribe(self)
    }
    
    func newState(state: AppState) {
        
    }
}
