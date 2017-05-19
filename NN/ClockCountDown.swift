//
//  ClockCountDown.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/19.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  倒计时视图

import UIKit

/// 倒计时按钮
class ClockCountDown : UIView {
    
    var countDown : Int = 0
    
    lazy var clockV: CountDownBtn = {
        let d : CountDownBtn = CountDownBtn.init(frame: self.bounds)
        
        d.initwith(superView: self, descc: 33)
        d.setImage(#imageLiteral(resourceName: "countDownImg"), for: .normal)
        d.setTitleColor(UIColor.black, for: .normal)
        return d
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(clockV)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
