//
//  PopAnimator.swift
//  BasicCustomVCAnimation
//
//  Created by George Mapaya on 2023-03-15.
//

import UIKit

class FromBottomPushTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let duration: TimeInterval = 0.5
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.view(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
        let bounds = containerView.bounds
        toView.alpha = 0.0
        toView.frame = bounds.offsetBy(dx: 0, dy: bounds.height)
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: .curveEaseInOut) {
            toView.alpha = 1.0
            toView.frame = bounds
        } completion: { position in
            let finished = !transitionContext.transitionWasCancelled
            transitionContext.completeTransition(finished)
        }
    }
    
}
