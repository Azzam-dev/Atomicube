//
//  PagesVC.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 04/09/2022.
//

import UIKit

class PagesVC: UIViewController, Storyboarded {
    
    var pagesContainer = UIView(frame: .zero)
    @IBOutlet weak var pageControl: UIPageControl!
    var pages = [UIViewController]()
    var transitionSpeed = 0.25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = pages.count
        didChangePage(pageControl)
        initializeGestureRecognizers()
        initializePages()
    }
    
    fileprivate func initializePages() {
        pagesContainer.frame = view.bounds
        pagesContainer.frame.size.width = CGFloat(pages.count) * view.frame.width
        for (index, page) in pages.enumerated() {
            page.view.frame = view.bounds
            page.view.frame.origin.x = CGFloat(index) * view.frame.width
            pagesContainer.addSubview(page.view)
            addChild(page)
            page.didMove(toParent: self)
        }
        view.insertSubview(pagesContainer, at: 0)
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
            self.pagesContainer.frame.origin.x = CGFloat(-sender.currentPage) * self.view.frame.width
        }
    }
}
