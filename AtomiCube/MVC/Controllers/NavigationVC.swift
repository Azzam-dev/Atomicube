//
//  NavigationVC.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 14/09/2022.
//

import UIKit

class NavigationVC: ContainerVC, Storyboarded {

    @IBOutlet var navigationButtons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigate(to: 0)
        
        for (index, button) in navigationButtons.enumerated() {
            button.tag = index
        }
    }
    
    func navigate(to selectedIndex: Int) {
        var views = viewControllers.map(\.view)
        let selectedView = views.remove(at: selectedIndex)
        for unselectedView in views { unselectedView?.isHidden = true }
        selectedView?.isHidden = false
    }
    
    @IBAction func didPressNavigationButton(_ sender: UIButton) {
        if sender.tag < viewControllers.count {
            navigate(to: sender.tag)
        }
    }
    
}
