//
//  UIViewExtensions.swift
//  FindAMovie
//
//  Created by Paul on 08/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func slideInFromLeft(duration: NSTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        
        // Create a CATransition animation
        let slideInFromLeftTransition = CATransition()
        
        // Set its callback delegate to the completionDelegate that was provided (if any)
        if let delegate: AnyObject = completionDelegate {
            slideInFromLeftTransition.delegate = delegate
        }
        
        // Customize the animation's properties
        slideInFromLeftTransition.type = kCATransitionPush
        slideInFromLeftTransition.subtype = kCATransitionFromLeft
        slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromLeftTransition.fillMode = kCAFillModeRemoved
        
        // Add the animation to the View's layer
        self.layer.addAnimation(slideInFromLeftTransition, forKey: "slideInFromLeftTransition")
        
    }
    
    func slideInFromRight(duration: NSTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        
        // Create a CATransition animation
        let slideInFromRight = CATransition()
        
        // Set its callback delegate to the completionDelegate that was provided (if any)
        if let delegate: AnyObject = completionDelegate {
            slideInFromRight.delegate = delegate
        }
        
        // Customize the animation's properties
        slideInFromRight.type = kCATransitionPush
        slideInFromRight.subtype = kCATransitionFromRight
        slideInFromRight.duration = duration
        slideInFromRight.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromRight.fillMode = kCAFillModeRemoved
        
        // Add the animation to the View's layer
        self.layer.addAnimation(slideInFromRight, forKey: "slideInFromRightTransition")
        
    }

    
}