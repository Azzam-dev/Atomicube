//
//  PlayVC.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 20/08/2022.
//

import UIKit

class PlayVC: UIViewController {

    @IBOutlet weak var sliderMood: UISlider!
    @IBOutlet weak var imageMood: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let savePosition = UserDefaults.standard.value(forKey: "savePosition") {
            sliderMood.value = savePosition as! Float
            sliderChanged(sliderMood)
        }
        
    }
 
    @IBAction func sliderChanged(_ sender: UISlider) {
        UserDefaults.standard.set(sender.value, forKey: "savePosition")
        switch sender.value {
        case 0...25:
            imageMood.text = "😩"
        case 26...45:
            imageMood.text = "😒"
        case 46...55:
            imageMood.text = "😐"
        case 56...75:
            imageMood.text = "🙂"
        case 76...100:
            imageMood.text = "😊"
        default:
            print("error")
        }
    }
    
}

