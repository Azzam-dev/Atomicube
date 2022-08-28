//
//  JourneyCellTableViewCell.swift
//  AtomiCube
//
//  Created by omar alzhrani on 28/01/1444 AH.
//

import UIKit

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
    func setupCurvedView() {
            let width = progressMood.frame.width
            let height = progressMood.frame.height
            
            let path = UIBezierPath(rect: progressMood.frame)
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: (width / 2 ) - 62.5, y: 0))
            
            //before Center curve
            path.addArc(withCenter: CGPoint(x: (width / 2 ) - 52.5, y: 17.5), radius: 17.5,
                        startAngle: 3 * .pi/2 , endAngle: 11 * .pi / 6 , clockwise: true)
            
            //Center curve
            path.addArc(withCenter: CGPoint(x: (width / 2 ) , y: 5), radius: 35,
                        startAngle: 5 * .pi / 6  , endAngle:  .pi / 6 , clockwise: false)
            
            //after Center curve
            path.addArc(withCenter: CGPoint(x: (width / 2 ) + 52.5, y: 17.5), radius: 17.5,
                        startAngle: 7 * .pi / 6  , endAngle: 3 * .pi/2 , clockwise: true)
            
            path.addLine(to: CGPoint(x: width , y: 0))
            path.addLine(to: CGPoint(x: width , y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.fillColor = UIColor.white.cgColor
            
        progressMood.layer.insertSublayer(shapeLayer, at: 0)
    }
    
}
