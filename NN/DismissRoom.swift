//
//  DismissRoom.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/6.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  是否解散房间

import UIKit

class DismissRoom: UIView {

    
    // MARK: - descImg
    lazy var descImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.2, y: self.Height * 0.2, width: self.Width * 0.6, height: self.Height * 0.5))
        d.contentMode = UIViewContentMode.scaleAspectFit
        d.image = #imageLiteral(resourceName: "talkToDismissDesc")
        return d
    }()
    
    
    /// 确定按钮
    lazy var cancelBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: self.Height * 0.6, width: self.Width * 0.5, height: self.Height * 0.3))
        d.setImage(#imageLiteral(resourceName: "alert_02"), for: .normal)
        d.isUserInteractionEnabled = true
        let tapGes = UITapGestureRecognizer.init(target: self, action: #selector(cancelSEL))
        d.addGestureRecognizer(tapGes)
        return d
    }()
    
    /// 取消按钮
    lazy var confirmBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.Width * 0.5, y: self.Height * 0.6, width: self.Width * 0.5, height: self.Height * 0.3))
        d.setImage(#imageLiteral(resourceName: "talkToDismiss"), for: .normal)
        
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
    
    // MARK: - 取消
    func cancelSEL() -> Void {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        disagreeToDismiss()
    }
    
    // MARK: - 解散
    func confirmSEL() -> Void {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        /// 提出解散申请
        applierToDismiss()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgVImg)
        DispatchQueue.main.async {
            self.addSubview(self.confirmBtn)
            self.addSubview(self.cancelBtn)
            self.addSubview(self.descImg)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
