//
//  RadarView.swift
//  03-RadarAnimation
//
//  Created by 冯志浩 on 16/11/3.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class RadarView: UIView {

    override func draw(_ rect: CGRect) {
        let radius: CGFloat = 40
        let startAngle: CGFloat = 0
        let centerFrame: CGRect = UIScreen.main.bounds
        let frameX = centerFrame.size.width - 60
        let arcCenter = CGPoint(x: frameX/2, y: frameX/2)
        let endAngle: CGFloat = 2 * CGFloat(M_PI)
        
        let path = UIBezierPath.init(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.init(red: 0, green: 191/255, blue: 255/255, alpha: 1).cgColor
        shapeLayer.fillColor = UIColor.init(red: 0, green: 191/255, blue: 255/255, alpha: 1).cgColor
        layer.addSublayer(shapeLayer)
    }

}
