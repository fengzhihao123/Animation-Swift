//
//  ViewController.swift
//  01-ClocksAnimation
//
//  Created by 冯志浩 on 16/10/20.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let timeAngle:CGFloat = 6
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
        minuteLayer.position = view.center
        minuteLayer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minuteLayer.backgroundColor = UIColor.yellow.cgColor
        view.layer.addSublayer(minuteLayer)
        
    }
    //4.添加秒针
    func addSecondLayer() -> Void {
        secondLayer.bounds = CGRect(x: 0, y: 0, width: 6, height: 200)
        secondLayer.position = view.center
        secondLayer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secondLayer.backgroundColor = UIColor.orange.cgColor
        view.layer.addSublayer(secondLayer)
    }
    //start
    func startRun() -> Void {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(rotationLine), userInfo: nil, repeats: true)
    }
    
    func rotationLine() -> Void {
    
        //获取当前时间的时分秒
        let calender = NSCalendar.current
        let currentHour = calender.component(.hour, from: Date())
        //将24转为12如：13点为1点
//        currentHour = currentHour % 12
        let currentMinute = calender.component(.minute, from: Date())
        let currentSecond = calender.component(.second, from: Date())
       
        let hoursAngle = (CGFloat(currentHour) / 12) * CGFloat(M_PI) * 2
        let minsAngle = (CGFloat(currentMinute) / 60) * CGFloat(M_PI) * 2
        let secondAngle = (CGFloat(currentSecond) / 60) * CGFloat(M_PI) * 2
        
        hourLayer.transform = CATransform3DMakeRotation(hoursAngle, 0, 0, 1)
        minuteLayer.transform = CATransform3DMakeRotation(minsAngle, 0, 0, 1)
        secondLayer.transform = CATransform3DMakeRotation(secondAngle, 0, 0, 1)
        

//        //旋转秒针
//        setupLayerTransform(timeNum: CGFloat(currentSecond), layer: secondLayer)
//        // 旋转分针
//        setupLayerTransform(timeNum: CGFloat(currentMinute), layer: minuteLayer)
//        //旋转时针
//        //将分钟转化为小时,×5因为要统一提取函数。
//        currentHour = (currentHour + (currentMinute/60)) * 5
//        setupLayerTransform(timeNum: CGFloat(currentHour), layer: hourLayer)
    }
    
    func setupLayerTransform(timeNum: CGFloat,layer: CALayer) -> Void {
        //根据时间计算角度
        let angle = timeNum * timeAngle
        //将角度转为弧度
        let arc = angleToArc(angle: angle)
        layer.transform = CATransform3DMakeRotation(arc, 0, 0, 1)
    }
    
    //角度转弧度
    func angleToArc(angle: CGFloat) -> CGFloat {
        return angle * CGFloat(M_PI) / 180
    }
}

