//
//  ReceiveDismissToAgree.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/6.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  显示同意、不同意

import UIKit

class ReceiveDismissToAgree: UIView {

    
    /// 同意
    lazy var cancelBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: self.Height * 0.6, width: self.Width * 0.5, height: self.Height * 0.3))
        d.setImage(#imageLiteral(resourceName: "alert_02"), for: .normal)
        d.isUserInteractionEnabled = true
        let tapGes = UITapGestureRecognizer.init(target: self, action: #selector(cancelSEL))
        d.addGestureRecognizer(tapGes)
        return d
    }()
    
    // MARK: - 玩家退出
    lazy var userExitLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x:self.Width * 0.315 , y: self.Height * 0.15, width: self.Width * 0.35, height: self.Height * 0.2))
        
        
        d.font = UIFont(name: "SimHei", size: 12 * screenScale)
        return d
    }()
    
    // MARK: - descImg
    lazy var descImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.2, y: self.Height * 0.3, width: self.Width * 0.6, height: self.Height * 0.5))
        d.contentMode = UIViewContentMode.scaleAspectFit
        d.image = #imageLiteral(resourceName: "applyToDismissDesc")
        return d
    }()
    
    /// 不同意
    lazy var confirmBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.Width * 0.5, y: self.Height * 0.6, width: self.Width * 0.5, height: self.Height * 0.3))
        d.setImage(#imageLiteral(resourceName: "alert_03"), for: .normal)
        
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
    
    // MARK: - 不解散
    func cancelSEL() -> Void {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        disagreeToDismiss()
        
        isHidden = true
    }
    
    // MARK: - 解散
    func confirmSEL() -> Void {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        /// 提出解散申请
        agreeToDismiss()
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgVImg)
        DispatchQueue.main.async {
            self.addSubview(self.confirmBtn)
            self.addSubview(self.cancelBtn)
            self.addSubview(self.descImg)
            self.addSubview(self.userExitLabel)

        }
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
