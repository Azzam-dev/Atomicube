//
//  MoodVC.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 20/08/2022.
//

import UIKit
import ReSwift

class MoodVC: UIViewController {

    @IBOutlet weak var progressMood: UIProgressView!
    @IBOutlet weak var sliderMood: UISlider!
    @IBOutlet weak var moodEmoji: UILabel!
    
    var mood: Mood = RealmRepository.shared.getMood()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let moodJourneyVC = segue.destination as? MoodJourneyVC {
            moodJourneyVC.allMood = mood.values.reversed()
        }
    }

    @IBAction func sliderEventDidChange(_ sender: UISlider, forEvent event: UIEvent) {
        let todaysMoodValue = sender.value
        moodEmoji.text = getMoodEmoji(with: todaysMoodValue)
        if let eventPhase = event.allTouches?.first?.phase {
            if eventPhase == .ended {
                mainStore.dispatch(UpdateMoodAction(newMoodValue: todaysMoodValue))
            }
        }
    }
    
    fileprivate func getMoodEmoji(with moodValue: Float?) -> String {
        guard let moodValue = moodValue else {
            print("getMoodEmoji() received nil value")
            return "😐"
        }

        switch moodValue.rounded() {
        case 0...25:
             return "😩"
        case 26...45:
            return "😒"
        case 46...55:
            return "😐"
        case 56...75:
            return "🙂"
        case 76...100:
            return "😊"
        default:
            print("getMoodEmoji() received out of range value")
            return "😐"
        }
    }
    
    fileprivate func getAverageMood(from mood: Mood) -> Float {
        let last30DayMood = mood.values.suffix(30)
        var totalMoodValues: Float = 0
        for dayMoodValue in last30DayMood {
            totalMoodValues += dayMoodValue
        }
        let averageMood = (totalMoodValues / Float(last30DayMood.count)) / 100
        return averageMood
    }
}


extension MoodVC: StoreSubscriber {
    
    override func viewWillAppear(_ animated: Bool) {
        mainStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        mainStore.unsubscribe(self)
    }
    
    func newState(state: AppState) {
        sliderMood.value = mood.values.last ?? 50.0
        moodEmoji.text = getMoodEmoji(with: mood.values.last)
        progressMood.progress = getAverageMood(from: mood)
    }
}
