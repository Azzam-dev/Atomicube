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
    
    var tasks = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        celebrationView = CelebrationView(frame: view.bounds)
        view.addSubview(celebrationView)
        
        taskTextField.clearButtonMode = .unlessEditing
        
        hideKeyboardWhenTappedAround()
    }

    @IBAction func didPressAddTask(_ sender: Any, forEvent event: UIEvent) {
        if let task = taskTextField.text {
            tasks.append(task)
            tableView.reloadData()
            taskTextField.text = ""
        }
        
    }
}

extension TasksVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = tasks[indexPath.row]
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath), let task = cell.textLabel?.text {
            cell.textLabel?.attributedText = "✔️ \(task)".strikeThrough(range: NSMakeRange(3, task.length))
            celebrationView.play()
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
