//
//  RobRoomOwner.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/22.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

/// 抢装
class RobRoomOwner: UIView {
    
    // MARK: - 抢庄
    lazy var robBtn: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: self.Width * 0.6, y: 0, width: self.Width * 0.4, height: self.Height))
        d.setImage(#imageLiteral(resourceName: "roomRob"), for: .normal)
        d.layer.borderWidth = 1
        d.layer.borderColor = UIColor.red.cgColor
        d.addTarget(self, action: #selector(robSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    
    // MARK: - 不抢庄
    lazy var notRobV: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: 0, y: 0, width: self.Width * 0.4, height: self.Height))

        d.setImage(#imageLiteral(resourceName: "roomNotRob"), for: .normal)
        d.layer.borderWidth = 1
        d.addTarget(self, action: #selector(notRobSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    
    /// events事件
    /// 抢庄事件
    @objc fileprivate func robSEL(sender : UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        
        self.isHidden = true
        
        getRoomPower()
    
    }
    
    @objc fileprivate func notRobSEL(sender : UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        
        self.isHidden = true

        NotgetRoomPower()
    
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderWidth = 1
        
        addSubview(robBtn)
        addSubview(notRobV)
    
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    
    }
}

