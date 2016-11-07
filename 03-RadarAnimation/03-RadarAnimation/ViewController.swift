//
//  ViewController.swift
//  03-RadarAnimation
//
//  Created by 冯志浩 on 16/11/3.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(startAnimation), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func startAnimation() -> Void {
        let radarView = RadarView()
        radarView.frame = CGRect(x: 30, y: 150, width: SCREEN_WIDTH - 60, height: SCREEN_WIDTH - 60)
        radarView.backgroundColor = UIColor.white
        view.addSubview(radarView)
        UIView.animate(withDuration: 2, animations: {
            radarView.transform = CGAffineTransform().scaledBy(x: 4, y: 4)
//            radarView.alpha = 0
        }, completion: {_ in
//            radarView.removeFromSuperview()
        })
    }
}

