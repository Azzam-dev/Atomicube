//
//  journeyMoodVC.swift
//  AtomiCube
//
//  Created by omar alzhrani on 28/01/1444 AH.
//

import UIKit

class MoodJourneyVC: UIViewController, Storyboarded {
    
    var mood: Mood?
    var moodValues = [Float]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let mood = mood {
            moodValues = mood.values.reversed()
        }
        
    }
    
}

extension MoodJourneyVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moodValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! JourneyCell
        cell.config(moodValue: Int(moodValues[indexPath.row]))
        return cell
    }
}
