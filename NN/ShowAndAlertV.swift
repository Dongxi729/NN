//
//  ShowAndAlertV.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/2.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

protocol ShowAndAlertVDelegate {
    func showSEL()
    func alertSEL()
}

/// 提示和亮牌的视图
class  ShowAndAlertV: UIView {
    
    var delegate : ShowAndAlertVDelegate?
    
    /// 亮牌
    fileprivate lazy var alertBtn: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: self.Width, height: self.Height * 0.5))

        d.isUserInteractionEnabled = true
        let tapGes = UITapGestureRecognizer.init(target: self, action: #selector(alertSEL))
        d.addGestureRecognizer(tapGes)
        return d
    }()
    
    /// 提示
    fileprivate lazy var showCardBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: self.Height * 0.5, width: self.Width, height: self.Height * 0.5))
        
        d.addTarget(self, action: #selector(showSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    ///////交互事件
    /// 提示
    @objc fileprivate func alertSEL() {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
//        CardNameModel.shared.isShowP1Front = true
        self.delegate?.alertSEL()
        
    }
    
    /// 显示
    @objc fileprivate func showSEL(sender : UIButton) {
        self.delegate?.showSEL()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.red
        self.addSubview(self.alertBtn)
        self.addSubview(self.showCardBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
