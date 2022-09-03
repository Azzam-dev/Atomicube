//
//  Coordinator.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 03/09/2022.
//
/*
 
 Using the coordinator pattern lets us remove the job of app navigation
 from viewControllers, helping make them more manageable and more reusable.
 
 */

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
