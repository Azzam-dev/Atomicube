//
//  JourneyCellTableViewCell.swift
//  AtomiCube
//
//  Created by omar alzhrani on 28/01/1444 AH.
//

import UIKit

class JourneyCell: UITableViewCell {
    
//    All this IBOutlet for Mood
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var moodProgress: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(numberOfMood: Int) {
        let (emoji, feeling) = MoodService.shared.getMoodEmoji(with: numberOfMood)
        emojiLabel.text = emoji
        typeLabel.text = feeling
        rateLabel.text = String(numberOfMood) + "%"
        moodProgress.progress = Float(numberOfMood) / 100
        
    }
    
}
