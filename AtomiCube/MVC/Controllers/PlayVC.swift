//
//  PlayVC.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 20/08/2022.
//

import UIKit

class PlayVC: UIViewController {

    @IBOutlet weak var progressMood: UIProgressView!
    @IBOutlet weak var sliderMood: UISlider!
    @IBOutlet weak var moodEmoji: UILabel!
    
    var allMood = DefaultsRepository.shared.getAllMood()
    let moodSliderPosition = DefaultsRepository.shared.getMoodSliderPosition()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderMood.value = moodSliderPosition
        sliderChanged(sliderMood)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let journeyMoodVC = segue.destination as? JourneyMoodVC {
            journeyMoodVC.allMood = allMood.reversed()
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        allMood.append(sender.value)
        DefaultsRepository.shared.setMood(withValues: allMood)
        DefaultsRepository.shared.setMoodSlider(withPosition: sender.value)
        
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
