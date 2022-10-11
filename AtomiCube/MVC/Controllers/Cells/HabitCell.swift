//
//  HabitCell.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 11/10/2022.
//

import UIKit

class HabitCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet var starts: [UIImageView]!
    
    func configure(title: String, counter: Int) {
        titleLabel.text = title
        counterLabel.text = "\(counter)/60"
        
        for (index, star) in starts.enumerated() {
            if counter >= (index + 1)*10  {
                star.image = UIImage(systemName: "checkmark.seal.fill")
            } else {
                break
            }
        }
    }
    
}
