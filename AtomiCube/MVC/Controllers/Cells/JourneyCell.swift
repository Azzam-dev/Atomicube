//
//  JourneyCellTableViewCell.swift
//  AtomiCube
//
//  Created by omar alzhrani on 28/01/1444 AH.
//

import UIKit
import Lottie

class JourneyCell: UITableViewCell {
    
//    All this IBOutlet for Mood
    @IBOutlet weak var emoji: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var progressMood: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func config(numberOfMood: Int) {
        switch numberOfMood {
        case 0...25:
            emoji.text = "😩"
            type.text = "Sad"
        case 26...45:
            emoji.text = "😒"
            type.text = "Bad Mood"
        case 46...55:
            emoji.text = "😐"
            type.text = "Good"
        case 56...75:
            emoji.text = "🙂"
            type.text = "Good Mood"
        case 76...100:
            emoji.text = "😊"
            type.text = "Happy"
        default:
            print("unexpected value for the mood cell")
        }
        rate.text = String(numberOfMood) + "%"
        progressMood.progress = Float(numberOfMood) / 100
        
    }
    
}
