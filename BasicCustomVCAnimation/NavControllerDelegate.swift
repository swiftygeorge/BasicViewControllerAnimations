//
//  NavControllerDelegate.swift
//  BasicCustomVCAnimation
//
//  Created by George Mapaya on 2023-03-16.
//

import UIKit

class NavControllerDelegate: NSObject, UINavigationControllerDelegate {

    var interactiveTransition: UIPercentDrivenInteractiveTransition?
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if UIAccessibility.isReduceMotionEnabled {
            return nil
        }
        
        let transition: UIViewControllerAnimatedTransitioning?
        
        switch(fromVC, toVC) {
        case (_, is SecondViewController):
            transition = FromBottomPushTransition()
        case (is SecondViewController, _):
            transition = ToBottomPopTransition()
        default:
            transition = nil
        }
        
        return transition
        
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition
    }
    
}
