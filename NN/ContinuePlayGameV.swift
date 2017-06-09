//
//  ContinuePlayGameV.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/8.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  游戏继续视图

import UIKit

class ContinuePlayGameV: UIView {

    
    // MARK: - descImg
    lazy var descImg: CommonLabel = {
        let d : CommonLabel = CommonLabel.init(frame: CGRect.init(x: self.Width * 0.2, y: self.Height * 0.2, width: self.Width * 0.6, height: self.Height * 0.5))
        d.text = "有玩家不同意解散房间"
        d.textColor = UIColor.brown
        d.font = UIFont(name: "SimHei", size: 12 * screenScale)
        d.textAlignment = .center
        return d
    }()
    
    /// 确定按钮
    lazy var confirmBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: self.Height * 0.6, width: self.Width, height: self.Height * 0.3))
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
    

    
    // MARK: - 解散
    func confirmSEL() -> Void {
        self.removeFromSuperview()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgVImg)
        DispatchQueue.main.async {
            self.addSubview(self.confirmBtn)
            self.addSubview(self.descImg)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
