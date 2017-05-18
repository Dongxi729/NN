//
//  PeronheadInfoV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/18.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

/// 个人信息
class PeronheadInfoV: UIView {
    
    /// 准备 尤模型决定
    fileprivate lazy var prepareImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: self.Height * 0.5, width: self.Width * 0.5, height: self.Height * 0.4))
        d.image = #imageLiteral(resourceName: "prepare")
        d.contentMode = UIViewContentMode.scaleAspectFit
        d.layer.borderWidth = 1
        return d
    }()
    
    
    
    /// 准备 尤模型决定
    fileprivate lazy var finishImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: self.Height * 0.45, width: self.Width * 0.5, height: self.Height * 0.5))
        d.image = #imageLiteral(resourceName: "complete")
        d.contentMode = UIViewContentMode.scaleAspectFit
        d.layer.borderWidth = 1
        return d
    }()
    
    /// 名字
    fileprivate lazy var nameLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: self.Width * 0.5, y: 2 * screenScale, width: self.Width * 0.5, height: self.Height * 0.4))
        d.text = "AJJJJ"
        d.textAlignment = .center
        d.font = UIFont(name: "SimHei", size: 8 * screenScale)
        d.textColor = UIColor.white
        
        return d
    }()
    
    /// coinsLabel
    fileprivate lazy var coinsLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: self.Width * 0.5, y: self.nameLabel.BottomY + 2 * screenScale, width: self.Width * 0.5, height: self.Height * 0.4))
        d.text = "2000"
        d.textAlignment = .center
        d.font = UIFont(name: "SimHei", size: 8 * screenScale)
        d.textColor = UIColor.white
        return d
    }()
    
    
    /// 头像
    fileprivate lazy var headImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 3 * screenScale, y: 1 * screenScale, width:  self.Width * 0.43, height: self.Width * 0.42))
        d.backgroundColor = UIColor.gray
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 整体背景
    fileprivate lazy var hhhh: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "headInfoBgV")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    
    /// 显示准备标识
    var showPrepareMark = false
    
    /// 显示完成标识
    var showCompleteMark = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headImg)
        addSubview(hhhh)
        addSubview(nameLabel)
        addSubview(coinsLabel)
        
        if showPrepareMark {
            addSubview(prepareImg)
        }
        
        if showCompleteMark {
            addSubview(finishImg)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
