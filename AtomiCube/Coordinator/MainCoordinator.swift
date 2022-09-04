//
//  MainCoordinator.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 03/09/2022.
//

import UIKit

final class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    //MARK: Initial View Controller
    func start() {
        let vc = PagesVC.instantiate()
        
        let moodVC = MoodVC.instantiate()
        let habitsVC = HabitsVC.instantiate()
        let dayRatingVC = DayRatingVC.instantiate()
        
        moodVC.coordinator = self
        habitsVC.coordinator = self
        dayRatingVC.coordinator = self
        
        vc.pages = [moodVC , habitsVC, dayRatingVC]
        navigationController.pushViewController(vc, animated: false)
    }
    
    func viewMoodJourney(with mood: Mood) {
        let vc = MoodJourneyVC.instantiate()
        vc.mood = mood
        navigationController.present(vc, animated: true)
    }
}
