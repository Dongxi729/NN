//
//  TimerTest.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/27.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class TimerTest: UIViewController {

    var timer : Timer?
    
    var timerArray = [1]
    
    var userArray : [Int : Timer] = [:]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addMultiTimer()
    }
    
    func addMultiTimer() -> Void {
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        
        
        /// 倒计时
        timer = Timer.init(timeInterval: 1.0, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        userArray[0] = timer
        
        /// 发心跳包
        timer = Timer.init(timeInterval: 1.0, target: self, selector: #selector(headrtPacket), userInfo: nil, repeats: true)
        
        userArray[1] = timer
        
        
        RunLoop.main.add(userArray[0]!, forMode: RunLoopMode.commonModes)
        RunLoop.main.add(userArray[1]!, forMode: RunLoopMode.commonModes)
        timer?.fire()
    }
    
    
    func countDown() -> Void {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n","倒计时")
        
        
        userArray[0]?.invalidate()
        
    }
    
    func headrtPacket() -> Void {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n","心跳包")
    }
    
}
