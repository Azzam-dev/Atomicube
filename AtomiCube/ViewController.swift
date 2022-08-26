//
//  ViewController.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 20/08/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressMood: UIProgressView!
    @IBOutlet weak var sliderMood: UISlider!
    @IBOutlet weak var imageMood: UILabel!
    
    var last30DayMood = [Int]()
    var average = 0
    var num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let savePosition = UserDefaults.standard.value(forKey: "savePosition") {
            num = Int(savePosition as! Float)
            sliderMood.value = Float(num)
            sliderChanged(sliderMood)
            
        }
        
    }
        
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        UserDefaults.standard.set(sender.value, forKey: "savePosition")
        
        
        switch sender.value {
        case 0...25:
            imageMood.text = "😩"
            break
        case 26...45:
            imageMood.text = "😒"
            break
        case 46...55:
            imageMood.text = "😐"
            break
        case 56...75:
            imageMood.text = "🙂"
            break
        case 76...100:
            imageMood.text = "😊"
            break
        default:
            print("error")
        }
    }
    
    @IBAction func saveMood(_ sender: Any) {
        
        if let savePosition = UserDefaults.standard.value(forKey: "savePosition") {
            num = Int(savePosition as! Float)
            sliderMood.value = Float(num)
            sliderChanged(sliderMood)
            
        }
        
        last30DayMood.append(num)
        UserDefaults.standard.set(last30DayMood , forKey: "save")
        if let days = UserDefaults.standard.value(forKey: "save") as? [Int] {
            for day in days {
                average += day
            }
            print(average)
          progressMood.progress = Float(average / last30DayMood.count) / 100
        }
        print(last30DayMood)
    }
}

