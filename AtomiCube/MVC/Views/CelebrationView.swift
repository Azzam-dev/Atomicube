//
//  CelebrationView.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 10/09/2022.
//

import UIKit
import Lottie

class CelebrationView: UIView {
    
    enum CelebrationType: String {
        case confetti
        case party
    }
    
    var confettiView = AnimationView(frame: .zero)
    
    //initWithFrame to init view from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        isUserInteractionEnabled = false
        confettiView = AnimationView(frame: self.bounds)
        confettiView.contentMode = .scaleAspectFit
        addSubview(confettiView)
    }
    
    
    /// Plays the animation from its current state to the end.
    ///
    /// - Parameter celebration: An optional CelebrationType to be played.
    func play(_ celebration: CelebrationType = .confetti) {
        confettiView.animation = Animation.named(celebration.rawValue)
        confettiView.play()
    }
}
