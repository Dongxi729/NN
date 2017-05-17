//
//  CreateV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/10.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  创建房间视图

import UIKit

//@IBDesignable

// MARK:- 颠三倒四
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


// MARK:- 六人牛牛的布局
class SicCowLayout: UIView {
    /// 圆环按钮
    fileprivate var circleBtn : UIButton!
    
    /// 打钩按钮
    fileprivate var correctBtn : UIButton!
    
    /// 计算按钮
    fileprivate var payBtn : UIButton!
    
    /// 玩法选项按钮
    fileprivate var playTypeBtn : UIButton!
    
    /// 六人牛牛右边背景
    fileprivate lazy var bgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "sixCowBgv")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 圆环显示
    lazy var cirOne: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.28, y: 4.5 * screenScale, width: commonMargin * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "circleChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    lazy var cirTwo: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.513, y: 4.5 * screenScale, width: commonMargin * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "circleChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    lazy var cirThree: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.748, y: 4.5 * screenScale, width: commonMargin * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "circleChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()

    /// 玩法人数打钩图片
    lazy var correctImgOne: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.24, y: self.Height * 0.17, width: 25 * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "correctChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    lazy var correctImgTwo: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.54, y: self.Height * 0.17, width: 25 * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "correctChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 结算方式打钩图片
    lazy var payImgOne: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.24, y: self.Height * 0.3, width: 25 * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "correctChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    lazy var payImgTwo: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.58, y: self.Height * 0.3, width: 25 * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "correctChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /// 玩法选项
    lazy var playTypeImgOne: UIImageView = {
        let f : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.24, y: self.Height * 0.43, width: 25 * screenScale, height: commonMargin * screenScale))
        f.image = #imageLiteral(resourceName: "correctChoose")
        f.contentMode = UIViewContentMode.scaleAspectFit
        return f
    }()
    
    lazy var playTypeImgTwo: UIImageView = {
        let f : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.58, y: self.Height * 0.43, width: 25 * screenScale, height: commonMargin * screenScale))
        f.image = #imageLiteral(resourceName: "correctChoose")
        f.contentMode = UIViewContentMode.scaleAspectFit
        return f
    }()
    
    lazy var playTypeImgThree: UIImageView = {
        let f : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.24, y: self.Height * 0.55, width: 25 * screenScale, height: commonMargin * screenScale))
        f.image = #imageLiteral(resourceName: "correctChoose")
        f.contentMode = UIViewContentMode.scaleAspectFit
        return f
    }()
    
    lazy var playTypeImgFour: UIImageView = {
        let f : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.58, y: self.Height * 0.55, width: 25 * screenScale, height: commonMargin * screenScale))
        f.image = #imageLiteral(resourceName: "correctChoose")
        f.contentMode = UIViewContentMode.scaleAspectFit
        return f
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         addSubview(bgV)

        /// 局数选择
        roundsChoose()
        
        /// 玩法人数
        playersSet()
        
        /// 结算方式
        payTypeSet()
        
        /// 玩法选项
        playType()
        
    }
    
    /// 玩法选项
    private func playType() -> Void {
        let tag : Int = 400
        
        /// 位置标识
        var posIndex : CGFloat = 0.28
        var YIndex : CGFloat = 0.5
        
        
        for index in 1..<5 {
            
            if index == 1 || index == 3 {
                posIndex = 0.28
                
            }
            
            if index == 2 || index == 4 {
                posIndex = 0.62
            }
            
            if index == 1 || index == 2 {
                YIndex = 0.43
            }
            
            if index == 3 || index == 4 {
                YIndex = 0.55
            }

            
            playTypeBtn = UIButton.init(frame: CGRect.init(x: self.Width * posIndex, y: self.Height * YIndex, width: 40 * screenScale, height: commonMargin * screenScale))
            playTypeBtn.tag = index + tag
            playTypeBtn.backgroundColor = UIColor.randomColor()
            playTypeBtn.addTarget(self, action: #selector(playTypeSEL(sender:)), for: .touchUpInside)
            
            addSubview(playTypeBtn)
        }
        
        addSubview(playTypeImgOne)
        addSubview(playTypeImgTwo)
        addSubview(playTypeImgThree)
        addSubview(playTypeImgFour)

        /// 控制图片显示隐藏
        playTypeImgOne.isHidden = false
        playTypeImgTwo.isHidden = true
        playTypeImgThree.isHidden = true
        playTypeImgFour.isHidden = true
    }
    
    @objc fileprivate func playTypeSEL(sender :UIButton) {
        print(sender.tag)
        
        switch sender.tag {
        case 401:
            playTypeImgOne.isHidden = false
            playTypeImgTwo.isHidden = true
            playTypeImgThree.isHidden = true
            playTypeImgFour.isHidden = true
            break
        case 402:
            playTypeImgOne.isHidden = true
            playTypeImgTwo.isHidden = false
            playTypeImgThree.isHidden = true
            playTypeImgFour.isHidden = true
            break
        case 403:
            playTypeImgOne.isHidden = true
            playTypeImgTwo.isHidden = true
            playTypeImgThree.isHidden = false
            playTypeImgFour.isHidden = true
            break
        case 404:
            playTypeImgOne.isHidden = true
            playTypeImgTwo.isHidden = true
            playTypeImgThree.isHidden = true
            playTypeImgFour.isHidden = false
            break
        default:
            break
        }
    }
    
    /// 计算
    private func payTypeSet() -> Void {

        let tag : Int = 300
        
        var posIndex : CGFloat = 0.28
        
        for index in 1..<3 {
            
            if index == 1 {
                posIndex = 0.28
            } else {
                posIndex = 0.62
            }
            
            payBtn = UIButton.init(frame: CGRect.init(x: self.Width * posIndex, y: self.Height * 0.3, width: 40 * screenScale, height: commonMargin * screenScale))
            payBtn.tag = index + tag
            payBtn.addTarget(self, action: #selector(payTypeSEL(sender:)), for: .touchUpInside)
            
            addSubview(payBtn)
        }
        
        addSubview(payImgOne)
        addSubview(payImgTwo)
        
        /// 设置图片显示样式
        payImgOne.isHidden = false
        payImgTwo.isHidden = true
    }
    
    @objc fileprivate func payTypeSEL(sender : UIButton) -> Void {
        print(sender.tag)
        
        switch sender.tag {
        case 301:
            payImgOne.isHidden = false
            payImgTwo.isHidden = true
            break
        case 302:
            payImgOne.isHidden = true
            payImgTwo.isHidden = false
            break
            
        default:
            break
        }
    }
    
    /// 玩法人数
    private func playersSet() -> Void {
        let tag : Int = 200
        
        for index in 1..<3 {
            correctBtn = UIButton.init(frame: CGRect.init(x: self.Width * 0.28 * CGFloat(index), y: self.Height * 0.17, width: 25 * screenScale, height: commonMargin * screenScale))
            correctBtn.tag = index + tag
            correctBtn.addTarget(self, action: #selector(correctChangeImgSEL(sender:)), for: .touchUpInside)

            addSubview(correctBtn)
        }
        
        addSubview(correctImgOne)
        addSubview(correctImgTwo)
        
        /// 设置打钩显示隐藏
        correctImgOne.isHidden = false
        correctImgTwo.isHidden = true
    }
    
    /// 局数选择
    private func roundsChoose() -> Void {
        let tag :Int = 100
        
        /// 局数选择
        for index in 1..<4 {
            circleBtn = UIButton.init(frame: CGRect.init(x: self.Width * 0.25 * CGFloat(index), y: 5 * screenScale, width: 25 * screenScale, height: 10 * screenScale))
            
            circleBtn.tag = tag + index
            circleBtn.addTarget(self, action: #selector(btttn(sender:)), for: .touchUpInside)
            addSubview(circleBtn)
        }
        
        addSubview(cirOne)
        addSubview(cirTwo)
        addSubview(cirThree)
        
        /// 设置默认隐藏2、3
        cirOne.isHidden = false
        cirTwo.isHidden = true
        cirThree.isHidden = true
    }
    
    
    /// 人数玩法切换图片
    func correctChangeImgSEL(sender : UIButton) -> Void {
        print(sender.tag)
        switch sender.tag {
        case 201:
            correctImgOne.isHidden = false
            correctImgTwo.isHidden = true
            break
            
        case 202:
            correctImgOne.isHidden = true
            correctImgTwo.isHidden = false
            break
        default:
            break
        }
    }
    
    /// 圆环选择切换图片事
    @objc fileprivate func btttn(sender : UIButton) -> Void {
        print(sender.tag)
        
        switch sender.tag {
        case 101:
            cirOne.isHidden = false
            cirTwo.isHidden = true
            cirThree.isHidden = true
            break
        case 102:
            cirOne.isHidden = true
            cirTwo.isHidden = false
            cirThree.isHidden = true
            break
        case 103:
            cirOne.isHidden = true
            cirTwo.isHidden = true
            cirThree.isHidden = false
            break
        default:
            break
        }
    }
    
    /// 玩法人数
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- 通比牛牛的布局
class SicComonCowLayout: UIView {
    
    /// 圆环按钮
    fileprivate var circleBtn : UIButton!
    
    /// 打钩按钮
    fileprivate var correctBtn : UIButton!
    
    /// 计算按钮
    fileprivate var payBtn : UIButton!
    
    /// 玩法选项按钮
    fileprivate var counsss : UIButton!
    

    /// 圆环显示
    lazy var cirOne: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.28, y: 4.5 * screenScale, width: commonMargin * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "circleChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    lazy var cirTwo: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.513, y: 4.5 * screenScale, width: commonMargin * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "circleChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    lazy var cirThree: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.748, y: 4.5 * screenScale, width: commonMargin * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "circleChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 玩法人数打钩图片
    lazy var correctImgOne: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.24, y: self.Height * 0.17, width: 25 * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "correctChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    lazy var correctImgTwo: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.54, y: self.Height * 0.17, width: 25 * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "correctChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 结算方式打钩图片
    lazy var payImgOne: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.24, y: self.Height * 0.3, width: 25 * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "correctChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    lazy var payImgTwo: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.58, y: self.Height * 0.3, width: 25 * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "correctChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 玩法选项
    lazy var playTypeImgOne: UIImageView = {
        let f : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.24, y: self.Height * 0.43, width: 25 * screenScale, height: commonMargin * screenScale))
        f.image = #imageLiteral(resourceName: "correctChoose")
        f.contentMode = UIViewContentMode.scaleAspectFit
        return f
    }()
    
    lazy var playTypeImgTwo: UIImageView = {
        let f : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.513, y: self.Height * 0.43, width: commonMargin * screenScale, height: commonMargin * screenScale))
        f.image = #imageLiteral(resourceName: "correctChoose")
        f.contentMode = UIViewContentMode.scaleAspectFit
        return f
    }()
    
    lazy var playTypeImgThree: UIImageView = {
        let f : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.75, y: self.Height * 0.43, width: commonMargin * screenScale, height: commonMargin * screenScale))
        f.image = #imageLiteral(resourceName: "correctChoose")

        f.contentMode = UIViewContentMode.scaleAspectFit
        return f
    }()
    
    lazy var playTypeImgFour: UIImageView = {
        let f : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.24, y: self.Height * 0.55, width: 25 * screenScale, height: commonMargin * screenScale))
        f.image = #imageLiteral(resourceName: "correctChoose")

        f.contentMode = UIViewContentMode.scaleAspectFit
        return f
    }()
    
    lazy var playTypeImgFive: UIImageView = {
        let f : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.513, y: self.Height * 0.55, width: commonMargin * screenScale, height: commonMargin * screenScale))
        f.image = #imageLiteral(resourceName: "correctChoose")
        f.contentMode = UIViewContentMode.scaleAspectFit
        return f
    }()
    
    

    
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
        
        /// 局数选择
        roundsChoose()
        
        /// 玩法人数
        playersSet()
        
        /// 结算方式
        payTypeSet()
        
        /// 玩法选项
        playType()
    }
    
    
    /// 玩法选项
    private func playType() -> Void {
        let tag : Int = 400
        
        /// 位置标识
        var posIndex : CGFloat = 0.28
        var YIndex : CGFloat = 0.5
        
        
        for index in 1..<6 {
            
            if index == 1 {
                posIndex = 0.25
                YIndex = 0.43
            }
            
            if index == 2 {
                posIndex = 0.5
                YIndex = 0.43
            }
            
            if index == 3 {
                posIndex = 0.75
                YIndex = 0.43
            }
            
            if index == 4 {
                posIndex = 0.25
                YIndex = 0.55
            }
            
            if index == 5 {
                posIndex = 0.5
                YIndex = 0.55
            }
            
            
            counsss = UIButton.init(frame: CGRect.init(x: self.Width * posIndex, y: self.Height * YIndex, width: 40 * screenScale, height: commonMargin * screenScale))
            counsss.tag = index + tag
            counsss.addTarget(self, action: #selector(playTypeSEL(sender:)), for: .touchUpInside)
            addSubview(counsss)
        }
        
        addSubview(playTypeImgOne)
        addSubview(playTypeImgTwo)
        addSubview(playTypeImgThree)
        addSubview(playTypeImgFour)
        addSubview(playTypeImgFive)
        
        /// 控制图片显示隐藏
        playTypeImgOne.isHidden = false
        playTypeImgTwo.isHidden = true
        playTypeImgThree.isHidden = true
        playTypeImgFour.isHidden = true
        playTypeImgFive.isHidden = true
    }
    
    @objc fileprivate func playTypeSEL(sender :UIButton) {
        print(sender.tag)
        
        switch sender.tag {
        case 401:
            playTypeImgOne.isHidden = false
            playTypeImgTwo.isHidden = true
            playTypeImgThree.isHidden = true
            playTypeImgFour.isHidden = true
            playTypeImgFive.isHidden = true
            break
        case 402:
            playTypeImgOne.isHidden = true
            playTypeImgTwo.isHidden = false
            playTypeImgThree.isHidden = true
            playTypeImgFour.isHidden = true
            playTypeImgFive.isHidden = true
            break
        case 403:
            playTypeImgOne.isHidden = true
            playTypeImgTwo.isHidden = true
            playTypeImgThree.isHidden = false
            playTypeImgFour.isHidden = true
            playTypeImgFive.isHidden = true
            break
        case 404:
            playTypeImgOne.isHidden = true
            playTypeImgTwo.isHidden = true
            playTypeImgThree.isHidden = true
            playTypeImgFour.isHidden = false
            playTypeImgFive.isHidden = true
            break
        case 405:
            playTypeImgOne.isHidden = true
            playTypeImgTwo.isHidden = true
            playTypeImgThree.isHidden = true
            playTypeImgFour.isHidden = true
            playTypeImgFive.isHidden = false
            break
        default:
            break
        }
    }
    
    /// 计算
    private func payTypeSet() -> Void {
        
        let tag : Int = 300
        
        var posIndex : CGFloat = 0.28
        
        for index in 1..<3 {
            
            if index == 1 {
                posIndex = 0.28
            } else {
                posIndex = 0.62
            }
            
            payBtn = UIButton.init(frame: CGRect.init(x: self.Width * posIndex, y: self.Height * 0.3, width: 25 * screenScale, height: commonMargin * screenScale))
            payBtn.tag = index + tag
            payBtn.addTarget(self, action: #selector(payTypeSEL(sender:)), for: .touchUpInside)
            
            addSubview(payBtn)
        }
        
        addSubview(payImgOne)
        addSubview(payImgTwo)
        
        /// 设置图片显示样式
        payImgOne.isHidden = false
        payImgTwo.isHidden = true
    }
    
    @objc fileprivate func payTypeSEL(sender : UIButton) -> Void {
        print(sender.tag)
        
        switch sender.tag {
        case 301:
            payImgOne.isHidden = false
            payImgTwo.isHidden = true
            break
        case 302:
            payImgOne.isHidden = true
            payImgTwo.isHidden = false
            break
            
        default:
            break
        }
    }
    
    /// 玩法人数
    private func playersSet() -> Void {
        let tag : Int = 200
        
        for index in 1..<3 {
            correctBtn = UIButton.init(frame: CGRect.init(x: self.Width * 0.28 * CGFloat(index), y: self.Height * 0.17, width: 25 * screenScale, height: commonMargin * screenScale))
            correctBtn.tag = index + tag
            correctBtn.addTarget(self, action: #selector(correctChangeImgSEL(sender:)), for: .touchUpInside)
            
            addSubview(correctBtn)
        }
        
        addSubview(correctImgOne)
        addSubview(correctImgTwo)
        
        /// 设置打钩显示隐藏
        correctImgOne.isHidden = false
        correctImgTwo.isHidden = true
    }
    
    /// 局数选择
    private func roundsChoose() -> Void {
        let tag :Int = 100
        
        /// 局数选择
        for index in 1..<4 {
            circleBtn = UIButton.init(frame: CGRect.init(x: self.Width * 0.25 * CGFloat(index), y: 5 * screenScale, width: 25 * screenScale, height: 10 * screenScale))
            
            circleBtn.tag = tag + index
            circleBtn.addTarget(self, action: #selector(btttn(sender:)), for: .touchUpInside)
            addSubview(circleBtn)
        }
        
        addSubview(cirOne)
        addSubview(cirTwo)
        addSubview(cirThree)
        
        /// 设置默认隐藏2、3
        cirOne.isHidden = false
        cirTwo.isHidden = true
        cirThree.isHidden = true
    }
    
    
    /// 人数玩法切换图片
    func correctChangeImgSEL(sender : UIButton) -> Void {
        print(sender.tag)
        switch sender.tag {
        case 201:
            correctImgOne.isHidden = false
            correctImgTwo.isHidden = true
            break
            
        case 202:
            correctImgOne.isHidden = true
            correctImgTwo.isHidden = false
            break
        default:
            break
        }
    }
    
    /// 圆环选择切换图片事
    @objc fileprivate func btttn(sender : UIButton) -> Void {
        print(sender.tag)
        
        switch sender.tag {
        case 101:
            cirOne.isHidden = false
            cirTwo.isHidden = true
            cirThree.isHidden = true
            break
        case 102:
            cirOne.isHidden = true
            cirTwo.isHidden = false
            cirThree.isHidden = true
            break
        case 103:
            cirOne.isHidden = true
            cirTwo.isHidden = true
            cirThree.isHidden = false
            break
        default:
            break
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
