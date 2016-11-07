//
//  ViewController.swift
//  02-HumburgerButton
//
//  Created by 冯志浩 on 16/10/21.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var button: HamburgerButton! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 38.0 / 255, green: 151.0 / 255, blue: 68.0 / 255, alpha: 1)
        
        self.button = HamburgerButton(frame: CGRect(x: 133, y: 133, width: 100, height: 100))
        self.button.backgroundColor = UIColor.black
        self.button.addTarget(self, action: #selector(ViewController.toggle(_:)), for:.touchUpInside)
        
        self.view.addSubview(button)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle  {
        return .lightContent
    }
    
    func toggle(_ sender: AnyObject!) {
        self.button.showsMenu = !self.button.showsMenu
    }


}

