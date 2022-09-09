//
//  MoodService.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 07/09/2022.
//

import UIKit
import Lottie

class MoodService {
    static let shared = MoodService()
    
    fileprivate func lottileAnimation(view: AnimationView, type: String) {
        view.animation = Animation.named(type)
        view.contentMode = .scaleAspectFit
        view.play()
    }
    
     func getMoodEmoji(for view: AnimationView, with moodValue: Float?) {
        guard let moodValue = moodValue else {
            print("getMoodEmoji() received nil value")
            lottileAnimation(view: view, type: "poker")
            return
        }

        switch moodValue.rounded() {
        case 0...25:
            lottileAnimation(view: view, type: "sad")
        case 26...45:
            lottileAnimation(view: view, type: "sulked")
        case 46...55:
            lottileAnimation(view: view, type: "poker")
        case 56...75:
            lottileAnimation(view: view, type: "smiley")
        case 76...100:
            lottileAnimation(view: view, type: "lovelyKiss")
        default:
            print("getMoodEmoji() received out of range value")
            lottileAnimation(view: view, type: "poker")
        }
    }
    
    func getMoodEmoji(with value: Int) -> (emoji: String, feeling: String) {
        switch value {
        case 0...25:
            return ("😩", "Sad")
        case 26...45:
            return ("😒", "Bad Mood")
        case 46...55:
            return ("😐", "Good")
        case 56...75:
            return ("🙂", "Good Mood")
        case 76...100:
            return ("😊", "Happy")
        default:
            print("unexpected value for the mood cell")
            return ("😐", "Good")
        }
    }
}
