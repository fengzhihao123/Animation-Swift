//
//  ViewController.swift
//  01-ClocksAnimation
//
//  Created by 冯志浩 on 16/10/20.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let secondAngle = 6
    let minuteAngle = 6
    let hourAngle = 6
    let hourMinuteAngle = 0.5
    
    var hourLayer = CALayer()
    var minuteLayer = CALayer()
    var secondLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addClock()
        addHourLayer()
        addMinuteLayer()
        addSecondLayer()
        startRun()
    }

    //1.添加表盘
    func addClock() -> Void {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        imageView.image = UIImage.init(named: "clock")
        view.addSubview(imageView)
        imageView.center = view.center
    }
    //2.添加时针
    func addHourLayer() -> Void {
        hourLayer.bounds = CGRect(x: 0, y: 0, width: 16, height: 160)
        //注意:需要把layer显示在屏幕的中心位置
        hourLayer.position = view.center
         //自身位置 因为宽窄高长 x轴是0.5 Y轴是1
        hourLayer.anchorPoint = CGPoint(x: 0.5, y: 1)
        hourLayer.backgroundColor = UIColor.black.cgColor
        view.layer.addSublayer(hourLayer)
    }
    //3.添加分针
    func addMinuteLayer() -> Void {
        minuteLayer.bounds = CGRect(x: 0, y: 0, width: 10, height: 180)
        //注意:需要把layer显示在屏幕的中心位置
        minuteLayer.position = view.center
        //自身位置 因为宽窄高长 x轴是0.5 Y轴是1
        minuteLayer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minuteLayer.backgroundColor = UIColor.yellow.cgColor
        view.layer.addSublayer(minuteLayer)
        
    }
    //4.添加秒针
    func addSecondLayer() -> Void {
        secondLayer.bounds = CGRect(x: 0, y: 0, width: 6, height: 200)
        //注意:需要把layer显示在屏幕的中心位置
        secondLayer.position = view.center
        //自身位置 因为宽窄高长 x轴是0.5 Y轴是1
        secondLayer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secondLayer.backgroundColor = UIColor.orange.cgColor
        view.layer.addSublayer(secondLayer)
    }
    //start
    func startRun() -> Void {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(rotationLine), userInfo: nil, repeats: true)
    }
    
    func rotationLine() -> Void {
        let calender = NSCalendar.current
        var currentHour = calender.component(.hour, from: Date())
        currentHour = currentHour % 12
        
        let currentMinute = calender.component(.minute, from: Date())
        let currentSecond = calender.component(.second, from: Date())
        /*
         需求:角度转弧度
         弧度 = angle * M_PI / 180
         */
        //计算当前要旋转的角度
        let angleSecond = currentSecond * secondAngle
        //角度转弧度
        let secondArc = angleToArc(angle: CGFloat(angleSecond))
        //需要围绕Z轴旋转 -- 不累加
        //angle 是弧度
        secondLayer.transform = CATransform3DMakeRotation(secondArc, 0, 0, 1)
       
        // 旋转分针
        let angleMinute = currentMinute * minuteAngle
        let minuteArc = angleToArc(angle: CGFloat(angleMinute))
        minuteLayer.transform = CATransform3DMakeRotation(minuteArc, 0, 0, 1)
        //旋转时针
        var angleHour = CGFloat(currentHour) * CGFloat(30)
        //分针带动时针旋转的角度
        angleHour = CGFloat(angleHour) + CGFloat(angleMinute/12)
        //角度转弧度
        let hourArc = angleToArc(angle: angleHour)
        //旋转分针
        hourLayer.transform = CATransform3DMakeRotation(hourArc, 0, 0, 1)
    }
    
    func angleToArc(angle: CGFloat) -> CGFloat {
        return angle * CGFloat(M_PI) / 180
    }
}

