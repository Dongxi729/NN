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
    
    /// 抢装
    lazy var robBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: self.Width * 0.4, height: self.Height))
        d.setImage(#imageLiteral(resourceName: "roomRob"), for: .normal)
        d.addTarget(self, action: #selector(robSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    ///
    lazy var notRobV: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.robBtn.RightX + self.Width * 0.2, y: 0, width: self.Width * 0.4, height: self.Height))
        d.setImage(#imageLiteral(resourceName: "roomNotRob"), for: .normal)
        d.addTarget(self, action: #selector(notRobSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    /// events事件
    /// 抢庄事件
    @objc fileprivate func robSEL(sender : UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        
        getRoomPower()
    }
    
    @objc fileprivate func notRobSEL(sender : UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        NotgetRoomPower()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderWidth = 1
        
        addSubview(robBtn)
        addSubview(notRobV)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if RoomModel.shared.isGameBegin {
            robBtn.isHidden = true
            notRobV.isHidden = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

