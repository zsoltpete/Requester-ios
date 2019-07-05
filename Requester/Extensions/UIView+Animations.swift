//
//  UIView+Animations.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 05..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

extension UIView {
    
    func fadeOut(duration: Double = 0.4, completition: DefaultCompletion? = nil) {
        UIView.animate(withDuration: duration, animations: { [weak self] in
            self?.alpha = 0.0
            }, completion: { _ in
                completition?()
        })
    }
    
    func fadeIn(_ duration: Double = 0.4) {
        UIView.animate(withDuration: duration, animations: { [weak self] in
            self?.alpha = 1.0
            }, completion: nil)
    }
    
    func fadeIn(_ duration: TimeInterval = 0.4, delay: TimeInterval = 0.0, completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: { [weak self] in
            self?.alpha = 1.0
            }, completion: completion) }
    
    func fadeOut(_ duration: TimeInterval = 0.4, delay: TimeInterval = 0.0, completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: { [weak self] in
            self?.alpha = 0.0
            }, completion: completion)
    }
    
    @objc func animate(_ point: CGPoint, removeAfter: Bool = false, immediately: Bool) {
        let delay = immediately ? 0.0 : 1.0
        self.alpha = 1.0
        
        UIView.animate(withDuration: 0.4, delay: delay, options: .allowUserInteraction, animations: { [weak self] in
            self?.center = point
            }, completion: { [weak self] _ in
                if removeAfter {
                    self?.removeFromSuperview()
                    
                }
        })
    }
    
    func pulse(withDuration: TimeInterval = 0.4, scale: CGFloat = 0.5) {
        self.transform = CGAffineTransform(scaleX: scale, y: scale)
        UIView.animate(withDuration: withDuration, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [.allowUserInteraction, .transitionCrossDissolve], animations: { [weak self] in
            self?.transform = .identity
            }, completion: nil)
    }
    
    func fadeInFadeOut(withDuration: TimeInterval = 0.4) {
        UIView.animate(withDuration: withDuration, delay: 0, options: [.repeat, .autoreverse, .curveEaseInOut], animations: { [weak self] in
            self?.alpha = 1.0
            }, completion: nil)
    }
    
    func nukeAllAnimations() {
        self.layer.removeAllAnimations()
        self.superview?.layer.removeAllAnimations()
        self.superview?.layoutIfNeeded()
        
    }
    
}
