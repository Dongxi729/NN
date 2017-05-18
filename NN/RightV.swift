//
//  RightV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/18.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit
// MARK: - 右上角视图绘制
/// 右上角按钮代理方法
protocol RightVDelegate {
    /// 设置
    func rightSetSEL(sender : UIButton)
    
    /// 退出
    func righExitSEL(sender : UIButton)
}

/// 右上角视图
class RightV: UIView {
    
    var delegate : RightVDelegate?
    
    fileprivate lazy var setBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: self.Width * 0.5, height: self.Height))
        d.addTarget(self, action: #selector(rightSetSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    fileprivate lazy var exitBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.Width * 0.5, y: 0, width: self.Width * 0.5, height: self.Height))
        d.addTarget(self, action: #selector(rightExitSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    @objc fileprivate func rightExitSEL(sender : UIButton) {
        self.delegate?.righExitSEL(sender: sender)
    }
    
    @objc fileprivate func rightSetSEL(sender : UIButton) {
        self.delegate?.rightSetSEL(sender: sender)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(setBtn)
        addSubview(exitBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
