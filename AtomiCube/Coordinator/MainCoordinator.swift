//
//  MainCoordinator.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 03/09/2022.
//

import UIKit
import SwiftUI

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
        let pagesVC = PagesVC.instantiate()
        
        let moodVC = MoodVC.instantiate()
        let tasksVC = TasksVC.instantiate()
        let habitsVC = HabitsVC.instantiate()
        let dayRatingVC = DayRatingVC.instantiate()
        
        moodVC.coordinator = self
        tasksVC.coordinator = self
        habitsVC.coordinator = self
        dayRatingVC.coordinator = self
        
        
        chartsVC.viewControllers = [UIHostingController(rootView: DashboardView())]
        pagesVC.viewControllers = [moodVC, tasksVC, habitsVC, dayRatingVC]
        pagesVC.controlbackgroundColor = .clear
        
        navigationVC.coordinator = self
        navigationVC.viewControllers = [pagesVC, chartsVC]
        navigationController.pushViewController(navigationVC, animated: false)
    }
    
    func viewSettings() {
        let vc = SettingsVC.instantiate()
        navigationController.present(vc, animated: true)
    }
    
    func viewLibrary() {
        let vc = LibraryVC.instantiate()
        navigationController.present(vc, animated: true)
    }
    
    func viewMoodJourney(with mood: Mood) {
        let vc = MoodJourneyVC.instantiate()
        vc.mood = mood
        navigationController.present(vc, animated: true)
    }
}
