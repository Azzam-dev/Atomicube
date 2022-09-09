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
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var feelingLabel: UILabel!
    @IBOutlet weak var moodProgress: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func config(moodValue: Int) {
        let (emoji, feeling, _, _) = MoodService.shared.getMoodEmoji(with: MoodType(moodValue))
        emojiLabel.text = emoji
        feelingLabel.text = feeling
        rateLabel.text = String(moodValue) + "%"
        moodProgress.progress = Float(moodValue) / 100
        
    }
    
}
