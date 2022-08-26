//
//  DayRatingVC.swift
//  AtomiCube
//
//  Created by atomcube on 26/01/1444 AH.
//

import UIKit
import ReSwift

class DayRatingVC: UIViewController, StoreSubscriber {

    @IBOutlet weak var averageRating: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        mainStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        mainStore.unsubscribe(self)
    }
    
    func newState(state: AppState) {
        var totalRatingsValue = 0.0
        let dayRatings = state.dayRatings
        for rating in dayRatings {
            totalRatingsValue += Double(rating)
        }
        
        if dayRatings.count > 0 {
            
            let average = totalRatingsValue / Double(dayRatings.count)
            averageRating.text = String(format: "%.1f", average)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didPreesStare1(_ sender: Any) {
        mainStore.dispatch(DayRatingActionAdd(rating: 1))
    }
    
    
    @IBAction func didPreesStare2(_ sender: Any) {
        mainStore.dispatch(DayRatingActionAdd(rating: 2))
    }
    
    @IBAction func didPreesStare3(_ sender: Any) {
        mainStore.dispatch(DayRatingActionAdd(rating: 3))
    }
    
    
    @IBAction func didPreesStare4(_ sender: Any) {
        mainStore.dispatch(DayRatingActionAdd(rating: 4))
    }
    
    
    @IBAction func didPreesStare5(_ sender: Any) {
        mainStore.dispatch(DayRatingActionAdd(rating: 5))
    }
    
    
    
    

    
    
    
    
}
