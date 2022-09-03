//
//  MainCoordinator.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 03/09/2022.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    //MARK: Initial View Controller
    func start() {
        let vc = MoodVC.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func viewMoodJourney(with mood: Mood) {
        let vc = MoodJourneyVC.instantiate()
        vc.mood = mood
        navigationController.present(vc, animated: true)
    }
}
