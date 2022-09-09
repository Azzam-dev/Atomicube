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
    
    func getMoodEmoji(for view: AnimationView, with mood: MoodType) {
        switch mood {
        case .sad:
            lottileAnimation(view: view, type: "sad")
        case .bored:
            lottileAnimation(view: view, type: "sulked")
        case .normal:
            lottileAnimation(view: view, type: "poker")
        case .good:
            lottileAnimation(view: view, type: "smiley")
        case .happy:
            lottileAnimation(view: view, type: "lovelyKiss")
        }
    }
    
    func getMoodEmoji(with mood: MoodType) -> (emoji: String, feeling: String, description: String, color: UIColor) {
        
        switch mood {
        case .sad:
            return ("😩", "Sad", "Sad!", .systemRed)
        case .bored:
            return ("😒", "Bored", "Boring..", .systemBrown)
        case .normal:
            return ("😐", "Normal", "Nothing", .label)
        case .good:
            return ("🙂", "Good", "Joyful", .systemBlue)
        case .happy:
            return ("😊", "Happy", "Happy!" , .systemGreen)
        }
    }
}
