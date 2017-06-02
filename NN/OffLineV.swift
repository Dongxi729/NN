//
//  OffLineV.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/2.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  离线视图

import UIKit

protocol OffLineVDelegate {
    func OffLineConfirmDelegateSEL()
    func OffLineCancelDelegateSEL()
}

class OffLineV : UIView {
    
    var delegate : OffLineVDelegate?
    
    /// 取消事件
    @objc fileprivate func cancelSEL() -> Void {
        self.delegate?.OffLineCancelDelegateSEL()
        print("\((#file as NSString).lastPathComponent):(\(#line))\n","OffLineVcancelSEL")
    }
    
    /// 确定事件
    @objc fileprivate func confirmSEL() -> Void {
        self.delegate?.OffLineConfirmDelegateSEL()
        print("\((#file as NSString).lastPathComponent):(\(#line))\n","OffLineVconfirmSEL")
        
        self.removeFromSuperview()
        
        /// 断线重连操作
    }
    
    
    
    /// 确定按钮
    lazy var cancelBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: self.Height * 0.6, width: self.Width * 0.5, height: self.Height * 0.3))
        d.setImage(#imageLiteral(resourceName: "alert_02"), for: .normal)
        d.isUserInteractionEnabled = true
        let tapGes = UITapGestureRecognizer.init(target: self, action: #selector(cancelSEL))
        d.addGestureRecognizer(tapGes)
        d.layer.borderWidth = 1
        return d
    }() 
    
    /// 取消按钮
    lazy var confirmBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.Width * 0.5, y: self.Height * 0.6, width: self.Width * 0.5, height: self.Height * 0.3))
        d.setImage(#imageLiteral(resourceName: "alert_03"), for: .normal)
        d.layer.borderWidth = 1
        
        d.isUserInteractionEnabled = true
        let tapGes = UITapGestureRecognizer.init(target: self, action: #selector(confirmSEL))
        d.addGestureRecognizer(tapGes)
        return d
    }()
    
    /// 背景视图
    lazy var bgVImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "alert_01")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgVImg)
        
        addSubview(confirmBtn)
        addSubview(cancelBtn)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
