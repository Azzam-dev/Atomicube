//
//  journeyMoodVC.swift
//  AtomiCube
//
//  Created by omar alzhrani on 28/01/1444 AH.
//

import UIKit

class JourneyMoodVC: UIViewController {
    
    var playVC = PlayVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension JourneyMoodVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playVC.allMood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! JourneyCell
        cell.config(numberOfMood: Int(playVC.allMood[indexPath.row]))
        return cell
    }
}
