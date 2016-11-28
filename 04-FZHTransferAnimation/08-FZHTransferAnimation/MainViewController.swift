//
//  MainViewController.swift
//  08-FZHTransferAnimation
//
//  Created by 冯志浩 on 2016/11/24.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UIViewControllerTransitioningDelegate {
    let transferAnimation = FZHTransferAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(transferAnimation)
    }
    
    @IBAction func buttonDidTouch(_ sender: UIButton) {
        let secondVC = SecondViewController()
        secondVC.transitioningDelegate = self
        self.present(secondVC, animated: true, completion: nil)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transferAnimation
    }
   
}
