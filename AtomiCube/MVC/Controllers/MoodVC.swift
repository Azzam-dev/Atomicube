//
//  MoodVC.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 20/08/2022.
//

import UIKit
import ReSwift
import Lottie

class MoodVC: UIViewController, Storyboarded {
    var coordinator: MainCoordinator?

    @IBOutlet weak var progressMood: UIProgressView!
    @IBOutlet weak var sliderMood: UISlider!
    @IBOutlet weak var moodEmojiView: AnimationView!
    
    
    var mood: Mood = RealmRepository.shared.getMood()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func didPressMoreButton(_ sender: UIButton) {
        coordinator?.viewMoodJourney(with: mood)
    }
    
    @IBAction func sliderEventDidChange(_ sender: UISlider, forEvent event: UIEvent) {
        let todaysMoodValue = sender.value
        MoodService.shared.getMoodEmoji(for: moodEmojiView, with: todaysMoodValue)
        if let eventPhase = event.allTouches?.first?.phase {
            if eventPhase == .ended {
                mainStore.dispatch(UpdateMoodAction(newMoodValue: todaysMoodValue))
            }
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
        MoodService.shared.getMoodEmoji(for: moodEmojiView, with: mood.values.last)
        progressMood.progress = getAverageMood(from: mood)
    }
}
