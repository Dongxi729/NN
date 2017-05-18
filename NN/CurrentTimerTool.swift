//
//  CurrentTimerTool.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/18.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  实时获取系统时间

import UIKit

class CurrentTimerTool: NSObject {
    
    static let shared = CurrentTimerTool()
    
    weak var hous: UILabel?
    var hours: CGFloat = 0.0
    var min: CGFloat = 0.0
    var sec: CGFloat = 0.0
    
    
    /// 创建display时间琪
    func createDisplaylinkTime() -> Void {
        let displayLink = CADisplayLink.init(target: self, selector: #selector(updateTime))
        displayLink.add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)
    }
    
    // MARK: - 每一秒调用60次
    func updateTime() -> String {
        // 获取当前的日期
        let calendar = Calendar.current
        // 获取日历中的组件:秒,分,时,天
        // NSCalendarUnit:获取哪个时间
        let cmp: DateComponents? = calendar.dateComponents([.second, .minute, .hour, .nanosecond], from: Date())
        // 小时
        hours = CGFloat((cmp?.hour)!)
//        let currentTime = String(format: "%02.0lf : %02.0lf", hours, min)
        // 分钟
        min = CGFloat((cmp?.minute)!)
        
        return String(format: "%02.0lf:%02.0lf", hours, min)
    }
}
