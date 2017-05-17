//
//  CreateV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/10.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  创建房间视图

import UIKit

//@IBDesignable

class CreateV: UIView {
    
    /// 背景视图
    fileprivate lazy var bgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "creatBgV")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 隐藏自身按钮
    fileprivate lazy var dismissSelf: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.Width - 15 * screenScale, y: 0, width: 15 * screenScale, height: 15 * screenScale))
        d.backgroundColor = UIColor.red
        d.addTarget(self, action: #selector(dismissSEL), for: .touchUpInside)
        return d
    }()
    
    /// 六人牛牛、通比牛牛切换图片
    fileprivate lazy var sixCowBtn: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width / 27, y: self.Height * 0.18, width: self.Width * 0.2, height: (131 / 113) * self.Width * 0.2))
        d.image = #imageLiteral(resourceName: "sixCowBtn")
        
        /// 允许交互
        d.isUserInteractionEnabled = true
        d.contentMode = UIViewContentMode.scaleAspectFit

        
        let tapGes = UITapGestureRecognizer.init(target: self, action: #selector(changeCowImg))
        d.addGestureRecognizer(tapGes)
        return d
    }()
    
    /// 添加六人牛牛右边视图
    fileprivate lazy var sicRightLayout: SicCowLayout = {
        let d : SicCowLayout = SicCowLayout.init(frame: CGRect.init(x: self.sixCowBtn.RightX + commonMargin * screenScale, y: self.sixCowBtn.TopY, width: self.Width * 0.65, height: (438 / 350) * self.Width * 0.44))
        
        return d
    }()
    
    /// 添加六人牛牛右边视图
    fileprivate lazy var sicCommonRightLayout: SicComonCowLayout = {
        let d : SicComonCowLayout = SicComonCowLayout.init(frame: CGRect.init(x: self.sixCowBtn.RightX + commonMargin * screenScale, y: self.sixCowBtn.TopY, width: self.Width * 0.65, height: (438 / 350) * self.Width * 0.44))
        
        return d
    }()
    
    /// 切换六人牛牛和通比牛牛的按钮
    @objc fileprivate func changeCowImg() -> Void {
        if sixCowBtn.image == #imageLiteral(resourceName: "sixCowBtn") {
            sixCowBtn.image = #imageLiteral(resourceName: "commBtn")
            sicCommonRightLayout.isHidden = false
            sicRightLayout.isHidden = true
        } else {
            sixCowBtn.image = #imageLiteral(resourceName: "sixCowBtn")
            
            sicCommonRightLayout.isHidden = true
            sicRightLayout.isHidden = false
        }
    }
    
    /// 隐藏本身
    @objc fileprivate func dismissSEL() -> Void {
        self.removeFromSuperview()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bgV)
        
        addSubview(dismissSelf)
        addSubview(sixCowBtn)
        
        addSubview(sicRightLayout)
        addSubview(sicCommonRightLayout)
        
        sicCommonRightLayout.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


/// 六人牛牛的布局
class SicCowLayout: UIView {
    
    /// 六人牛牛右边背景
    fileprivate lazy var bgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "sixCowBgv")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(bgV)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/// 六人牛牛的布局
class SicComonCowLayout: UIView {
    
    /// 六人牛牛右边背景
    fileprivate lazy var bgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "commonBgv")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bgV)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
