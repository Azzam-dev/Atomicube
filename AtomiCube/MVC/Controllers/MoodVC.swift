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
        moodEmojiView = getMoodEmoji(with: todaysMoodValue)
        if let eventPhase = event.allTouches?.first?.phase {
            if eventPhase == .ended {
                mainStore.dispatch(UpdateMoodAction(newMoodValue: todaysMoodValue))
            }
        }
    }
    
    func lottileAnimation(type: String) -> AnimationView {
        moodEmojiView.animation = Animation.named(type)
        moodEmojiView.contentMode = .scaleAspectFit
        moodEmojiView.play()
        return moodEmojiView
    }
    
    fileprivate func getMoodEmoji(with moodValue: Float?) -> AnimationView {
        guard let moodValue = moodValue else {
            print("getMoodEmoji() received nil value")
            return lottileAnimation(type: "poker")
        }

        switch moodValue.rounded() {
        case 0...25:
             return lottileAnimation(type: "sad")
        case 26...45:
            return lottileAnimation(type: "sulked")
        case 46...55:
            return lottileAnimation(type: "poker")
        case 56...75:
            return lottileAnimation(type: "smiley")
        case 76...100:
            return lottileAnimation(type: "lovelyKiss")
        default:
            print("getMoodEmoji() received out of range value")
            return lottileAnimation(type: "poker")
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
        moodEmojiView = getMoodEmoji(with: mood.values.last)
        progressMood.progress = getAverageMood(from: mood)
    }
}
