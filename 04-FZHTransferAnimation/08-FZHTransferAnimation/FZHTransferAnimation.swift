//
//  FZHTransferAnimation.swift
//  08-FZHTransferAnimation
//
//  Created by 冯志浩 on 2016/11/24.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class FZHTransferAnimation: NSObject,UIViewControllerAnimatedTransitioning {
    
    //MARK:UIViewControllerAnimatedTransitioning
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 1. Get controllers from transition context
        let fromVC = transitionContext.viewController(forKey: .from)
        let toVC = transitionContext.viewController(forKey: .to)

        // 2. Add toVC's view to containerView
        let containerView = transitionContext.containerView
        containerView.addSubview((toVC?.view)!)
        
        
        // 3. Add a perspective transform
        var transform = CATransform3DIdentity
        containerView.layer.sublayerTransform = transform
        transform.m34 = -0.002

        // 4. Set init frame for toVC
        let initialFrame = transitionContext.initialFrame(for: fromVC!)
        toVC?.view.frame = initialFrame
        
        toVC?.view.layer.transform = rotate(angle: CGFloat(M_PI_2))
        
        // animate
        let duration = transitionDuration(using: transitionContext)        
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .layoutSubviews, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                    fromVC?.view.layer.transform = self.rotate(angle: -CGFloat(M_PI_2))
                })
                
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                    toVC?.view.layer.transform = self.rotate(angle: 0)
                })
        }, completion: {(true) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
        
    }
    
    func rotate(angle: CGFloat) -> CATransform3D {
        var transform = CATransform3D()
        transform = CATransform3DMakeRotation(angle, 0.0, 1.0, 0.0)
        return transform
    }
}
