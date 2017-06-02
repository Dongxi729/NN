//
//  TImerTool.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/6.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit
import SwiftSocket

/// 全局定时器
fileprivate var timer : Timer?

class TImerTool: NSObject {
    
    fileprivate var client: TCPClient!
    
    fileprivate var checkTimer : Timer?
    
    
    /// 断线索引
    var reconnectIndex = 0
    
    /// 断线定时器
    var reconnectTimer : Timer?
    
    
    static let shared = TImerTool.init()
    
    func timerCount(seconds : Int) -> Void {
        timer = Timer.init(timeInterval: TimeInterval(seconds), target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        timer?.fire()
        
        RunLoop.main.add(timer!, forMode: RunLoopMode.commonModes)
    }
    
    /// 检查心跳包是否收到
    func checkTimerStart() -> Void {
        checkTimer = Timer.init(timeInterval: 5.0, target: self, selector: #selector(heartCheckSEL), userInfo: nil, repeats: true)
        
        checkTimer?.fire()
        RunLoop.main.add(checkTimer!, forMode: RunLoopMode.commonModes)
    }
    
    /// 第一次心跳不算，程序刚启动不发送
    
    /// 检查心跳包事件
    func heartCheckSEL() -> Void {
        
        if headrtData != [1, 0, 0, 0, 4] {
            
            self.checkTimer?.invalidate()
            
            /// 发送通知
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "offLineSEL"), object: nil)
            
            return
        }
    }
    
    

    func timerFunc() -> Void {
        sendHeart()
    }

    private func invalidTimer() -> Void {
        timer?.invalidate()
    }
    
    func timerIsValid() -> Bool {
        return (timer?.isValid)!
    }
}


// MARK: - 断线重连
extension TImerTool {
    

    func reconnectSEL() -> Void {
        

        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
    }
}
