//
//  PagesVC.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 04/09/2022.
//

import UIKit

class PagesVC: ContainerVC, Storyboarded {
    
    @IBOutlet weak var controlView: DesignableView!
    @IBOutlet weak var pageControl: UIPageControl!
    var controlbackgroundColor: UIColor = .separator
    var transitionSpeed = 0.25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = viewControllers.count
        controlView.backgroundColor = controlbackgroundColor
        didChangePage(pageControl)
        initializeGestureRecognizers()
    }
    
    override func addSubViewControllers() {
        super.addSubViewControllers()
        container.frame.size.width = CGFloat(viewControllers.count) * view.frame.width
        for (index, page) in viewControllers.enumerated() {
            page.view.frame.origin.x = CGFloat(index) * view.frame.width
        }
    }
        
    fileprivate func initializeGestureRecognizers() {
        // Initialize Swipe Gesture Recognizer
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        
        // Configure Swipe Gesture Recognizer
        swipeRightGesture.direction = .right
        swipeLeftGesture.direction = .left
        
        // Add Swipe Gesture Recognizer
        view.addGestureRecognizer(swipeRightGesture)
        view.addGestureRecognizer(swipeLeftGesture)
    }
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .right:
            pageControl.currentPage -= 1
            didChangePage(pageControl)
        case .left:
            pageControl.currentPage += 1
            didChangePage(pageControl)
        default:
            print("PagesVC didSwipe out of rage direction")
        }
    }

    @IBAction func didChangePage(_ sender: UIPageControl) {
        UIView.animate(withDuration: transitionSpeed) {
            self.container.frame.origin.x = CGFloat(-sender.currentPage) * self.view.frame.width
        }
    }
}
