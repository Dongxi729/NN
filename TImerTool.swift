//
//  TImerTool.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/6.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

/// 全局定时器
fileprivate var timer : Timer?

class TImerTool: NSObject {
    

    static let shared = TImerTool.init()
    
    func timerCount(seconds : Int) -> Void {
        timer = Timer.init(timeInterval: TimeInterval(seconds), target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        timer?.fire()
        
        RunLoop.main.add(timer!, forMode: RunLoopMode.commonModes)
    }
    
    func timerFunc() -> Void {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
    }
    
    func invalidTimer() -> Void {
        timer?.invalidate()
    }
    
    func timerIsValid() -> Bool {
        return (timer?.isValid)!
    }
    
}
