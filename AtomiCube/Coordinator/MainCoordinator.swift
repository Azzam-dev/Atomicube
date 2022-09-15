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
        let navigationVC = NavigationVC.instantiate()
        
        let chartsVC = ChartsVC.instantiate()
        let someVC = ViewController.instantiate()
        let pagesVC = PagesVC.instantiate()
        
        let moodVC = MoodVC.instantiate()
        let tasksVC = TasksVC.instantiate()
        let habitsVC = HabitsVC.instantiate()
        let dayRatingVC = DayRatingVC.instantiate()
        
        moodVC.coordinator = self
        tasksVC.coordinator = self
        habitsVC.coordinator = self
        dayRatingVC.coordinator = self
        
        pagesVC.viewControllers = [moodVC, tasksVC, habitsVC, dayRatingVC]
        pagesVC.controlbackgroundColor = .clear
        
        navigationVC.viewControllers = [pagesVC, someVC, chartsVC]
        navigationController.pushViewController(navigationVC, animated: false)
    }
    
    func viewMoodJourney(with mood: Mood) {
        let vc = MoodJourneyVC.instantiate()
        vc.mood = mood
        navigationController.present(vc, animated: true)
    }
}
