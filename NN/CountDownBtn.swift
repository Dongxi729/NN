//
//  CountDownBtn.swift
//  DollBuy
//
//  Created by 郑东喜 on 2016/11/27.
//  Copyright © 2016年 郑东喜. All rights reserved.
//  倒计时按钮

import UIKit
//发送几秒
var  NUMSS : Int = 30

class CountDownBtn: UIButton {
    
    
    
    //触发倒计时事件
    var countYES = ""
    
    //秒数
    var i = 0
    
    //定时器
    var timer:Timer?
    
    
    
    /// 是否继续
    var canContinue = false
    
    /// 调用倒计时
    ///
    /// - Parameters:
    ///   - color: 颜色
    ///   - title: 标题
    ///   - superView: 添加到的视图
    ///   - descc: 描述
    func initwith(superView:UIView,descc : Int) -> Void {
        
        canContinue = true
        
        i = descc
        
        self.setTitle("\(descc)", for: UIControlState.normal)
        self.isEnabled=false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tiemrBengin), userInfo: self, repeats: true)
        
        superView.addSubview(self)
        
        self.isUserInteractionEnabled = true
        
    }
    
    
    
    
    func  tiemrBengin() {
        
        if canContinue == false {
            
            timer?.invalidate()
            self.isEnabled = true
            
            return
            
        }
        
        
        if self.i != 0 && self.i > 0 && self.canContinue == true {
            self.i -= 1
            
            
            self.setTitle(String(format: "%d",self.i), for: UIControlState.normal)
            
            print("i = :",self.i)
            
        }
        
        
        
        if i == 0 || canContinue == false {
            
            canContinue = false
            
            self.timer?.invalidate()
            //            self.isEnabled = true
            
            i = NUMSS
        }
    }
    
    func isvalidate() -> Bool {
        print(NUMSS)
        
        if NUMSS > 0 {
            return true
        } else {
            return false
        }
    }
    
    func terminate() -> Void {
        self.timer?.invalidate()
        self.isEnabled = true
        
    }
    
    
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        
        return CGRect.init(x: 0, y: -self.Height * 0.1, width: self.Width, height: self.Height)
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect.init(x: 0, y: 0, width: self.Width, height: self.Height)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel?.font = UIFont(name: "SimHei", size: 10 * screenScale)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.textColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
