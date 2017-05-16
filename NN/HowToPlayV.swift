//
//  HowToPlayV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/16.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  玩法

import UIKit

class HowToPlayV: UIView {
    
    
    /// 玩法背景视图
    lazy var imgView: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.frame)
        d.image = #imageLiteral(resourceName: "playbgv")
        return d
    }()
    
    /// 标题
    lazy var titleLabel: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: commonMargin * screenScale, width: self.Width, height: self.Height * 0.1))
        d.image = #imageLiteral(resourceName: "playTypeTitle")
        d.contentMode = .scaleAspectFit
        return d
    }()
    
    lazy var titleGV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: commonMargin, y: self.titleLabel.BottomY + commonMargin, width: self.Width - 2 * commonMargin, height: SH * 0.6))
        d.image = #imageLiteral(resourceName: "titleBgV")
        return d
    }()
    
    lazy var contentView: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.68, height: SH * 0.85))
        d.image = #imageLiteral(resourceName: "playTypeCOntext")
        return d
    }()
    
    lazy var scrollView: UIScrollView = {
        let d : UIScrollView = UIScrollView.init(frame: CGRect.init(x: 3 * commonMargin, y: self.titleLabel.BottomY + 2 * commonMargin, width: self.Width - 6 * commonMargin, height: self.Height * 0.6))
        d.contentSize = CGSize(width: self.titleLabel.BottomY + 2 * commonMargin, height: SH * 0.85)
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imgView)
        addSubview(titleLabel)
        
        addSubview(titleGV)
        
        addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
