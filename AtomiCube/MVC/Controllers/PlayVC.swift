//
//  PlayVC.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 20/08/2022.
//

import UIKit
import RealmSwift

class PlayVC: UIViewController {

    @IBOutlet weak var progressMood: UIProgressView!
    @IBOutlet weak var sliderMood: UISlider!
    @IBOutlet weak var moodEmoji: UILabel!
    
    var allMood: [Float] = UserDefaults.standard.array(forKey: "allMood") as? [Float] ?? [Float]()
    let lastSliderMoodPosition = UserDefaults.standard.float(forKey: "lastSliderMoodPosition")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        sliderMood.value = lastSliderMoodPosition
        sliderChanged(sliderMood)
        
    }
    
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        UserDefaults.standard.set(sender.value, forKey: "lastSliderMoodPosition")
        
        
        allMood.append(sender.value)
        UserDefaults.standard.set(allMood , forKey: "allMood")
        
        
        //edje cases
        switch sender.value {
        case 0...25.9999:
            moodEmoji.text = "😩"
        case 26...45.9999:
            moodEmoji.text = "😒"
        case 46...55.9999:
            moodEmoji.text = "😐"
        case 56...75.9999:
            moodEmoji.text = "🙂"
        case 76...100:
            moodEmoji.text = "😊"
        default:
            print("unexpected value for the mood slider")
        }
        
        
        updateProgressMood(withDay: 30)
        
        
    }
    
    fileprivate func updateProgressMood(withDay day: Int) {
        let last30DayMood = allMood.suffix(day)
        var totalMoodValues: Float = 0
        
        for dayMoodValue in last30DayMood {
            totalMoodValues += dayMoodValue
        }
        
        let averageMood = (totalMoodValues / Float(last30DayMood.count)) / 100
        
        progressMood.progress = averageMood
        
    }
    
    
}
