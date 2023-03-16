//
//  ToBottomPopTransition.swift
//  BasicCustomVCAnimation
//
//  Created by George Mapaya on 2023-03-16.
//

import UIKit

class ToBottomPopTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let duration: TimeInterval = 0.5
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from),
              let toView = transitionContext.view(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }
        
        let containerView = transitionContext.containerView
        containerView.insertSubview(toView, at: 0)
        let bounds = containerView.bounds
        toView.alpha = 0.0
        toView.frame = bounds
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: .curveEaseInOut) {
            toView.alpha = 1.0
            fromView.frame = bounds.offsetBy(dx: 0, dy: bounds.height)
        } completion: { position in
            let finished = !transitionContext.transitionWasCancelled
            transitionContext.completeTransition(finished)
        }
    }

}
