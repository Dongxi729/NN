//
//  RightDownV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/18.
//  Copyright © 2017年 郑东喜. All rights reserved.
// 右下角视图

import UIKit

// MARK: - 右下角事件
protocol RightDownVDelegate {
    /// 声音
    func voiceSEL(gesture : UILongPressGestureRecognizer)
    
    /// 信息
    func msgSEL(sender : UIButton)
}

class RightDownV: UIView {
    /// 长按录音
    lazy var lpButton: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.Width * 0.5, y: 0, width: self.Width * 0.5, height: self.Height * 0.5))
        //
        let longTap = UILongPressGestureRecognizer.init(target: self, action: #selector(longSEL(gesture:)))
        
        d.addGestureRecognizer(longTap)
        
        //        d.addTarget(self, action: #selector(voiceControl(sender:)), for: .touchUpInside)
        d.backgroundColor = UIColor.gray
        return d
    }()
    
    
    @objc fileprivate func longSEL(gesture : UILongPressGestureRecognizer) -> Void {
        
        self.delegate?.voiceSEL(gesture: gesture)
        
        
    }
    
    /// 消息按钮
    fileprivate lazy var msgBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: self.Height * 0.5, width: self.Width , height: self.Height * 0.5))
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(sendMsg(sender:)), for: .touchUpInside)
        
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(lpButton)
        addSubview(msgBtn)
    }
    
    var delegate : RightDownVDelegate?
    
    
    /// 消息事件
    @objc fileprivate func sendMsg(sender : UIButton) {
        self.delegate?.msgSEL(sender: sender)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
