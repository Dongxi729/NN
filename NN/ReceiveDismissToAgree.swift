//
//  ReceiveDismissToAgree.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/6.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  显示同意、不同意

import UIKit

class ReceiveDismissToAgree: NSObject {
    
    lazy var descLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        d.text = "是否同意解散房间"
        return d
    }()
    
    /// 同意
    lazy var cancelBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: self.Height * 0.6, width: self.Width * 0.5, height: self.Height * 0.3))
        d.setImage(#imageLiteral(resourceName: "alert_02"), for: .normal)
        d.isUserInteractionEnabled = true
        let tapGes = UITapGestureRecognizer.init(target: self, action: #selector(cancelSEL))
        d.addGestureRecognizer(tapGes)
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
            self.addSubview(self.descLabel)
        }
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
