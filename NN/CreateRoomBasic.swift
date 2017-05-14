//
//  CreateRoomBasic.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/10.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  创建房间

import UIKit

class CreateRoomBasic: UIView {
    

    /// 六人牛牛
    lazy var liubtnChange: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: commonMargin, y: commonMargin, width: 80, height: 30))
        d.setTitle("六人牛牛", for: .normal)
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(addSixV), for: .touchUpInside)
        return d
    }()
    
    /// 通比牛牛
    lazy var commBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: commonMargin, y: self.liubtnChange.BottomY + commonMargin, width: 80, height: 30))
        d.setTitle("通比牛牛", for: .normal)
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(commonSixV(sender:)), for: .touchUpInside)
        return d
    }()
    
    /// 六人牛牛视图
    fileprivate var sixUpV : SixCowLayout!
    
    /// 通比牛牛视图
    fileprivate var sixDownV : SixCommonLayout!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        /// 六人
        sixUpV = SixCowLayout.init(frame: CGRect.init(x: self.liubtnChange.RightX + commonMargin, y: commonMargin, width: self.Width - self.liubtnChange.Width - 2 * commonMargin, height: self.Height - 2 * commonMargin))
        
        sixDownV = SixCommonLayout.init(frame: CGRect.init(x: self.liubtnChange.RightX + commonMargin, y: commonMargin, width: self.Width - self.liubtnChange.Width - 2 * commonMargin, height: self.Height - 2 * commonMargin))
        
        addSubview(sixUpV)
        
        addSubview(liubtnChange)
        addSubview(commBtn)
        
        addSubview(sixDownV)
        
        sixDownV.isHidden = true
    }

    /// 六人牛牛
    @objc fileprivate func addSixV() {
        /// 隐藏通比牛牛视图
        sixDownV.isHidden = true
        sixUpV.isHidden = false
        
    }
    
    /// 添加六人牛牛的所有控件
    
    /// 通比牛牛
    @objc fileprivate func commonSixV(sender : UIButton) {
        /// 隐藏六人牛牛视图
        sixUpV.isHidden = true
        sixDownV.isHidden = false
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





class CommonLabell : UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont.systemFont(ofSize: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
