//
//  PeronheadInfoV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/18.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  位置类

import UIKit

/// 个人信息
class PeronheadInfoV: UIView {
    
    /// 准备 尤模型决定
    lazy var prepareImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: self.Height * 0.5, width: self.Width * 0.5, height: self.Height * 0.4))
        d.image = #imageLiteral(resourceName: "prepare")
        d.contentMode = UIViewContentMode.scaleAspectFit
        d.layer.borderWidth = 1
        return d
    }()
    
    
    
    /// 准备 尤模型决定
    lazy var finishImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: self.Height * 0.45, width: self.Width * 0.5, height: self.Height * 0.5))
        d.image = #imageLiteral(resourceName: "complete")
        d.contentMode = UIViewContentMode.scaleAspectFit
        d.layer.borderWidth = 1
        return d
    }()
    
    // MARK: - 抢
    lazy var robImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.finishImg.frame)
        d.image = #imageLiteral(resourceName: "personRob")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    // MARK: - 不抢
    lazy var notRobImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.finishImg.frame)
        d.image = #imageLiteral(resourceName: "personNotRob")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    // MARK: - 名字
    lazy var nameLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: self.Width * 0.5, y: 2 * screenScale, width: self.Width * 0.5, height: self.Height * 0.4))
        
        if !((LoginModel.shared.nickname?.isEmpty)!) {
            d.text = LoginModel.shared.nickname
        } else {
            d.text = "AJJJJJ"
        }
        
        d.textAlignment = .center
        d.font = UIFont(name: "SimHei", size: 8 * screenScale)
        d.textColor = UIColor.white
        
        return d
    }()
    
    // MARK: - 剩余分数
    lazy var coinsLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: self.Width * 0.5, y: self.nameLabel.BottomY + 2 * screenScale, width: self.Width * 0.5, height: self.Height * 0.4))
        
        if LoginModel.shared.wealth != nil {
            d.text = LoginModel.shared.wealth
        } else{
            d.text = "2000  "
        }
        
        d.textAlignment = .center
        d.font = UIFont(name: "SimHei", size: 8 * screenScale)
        d.textColor = UIColor.white
        return d
    }()
    
    
    // MARK: - 头像
    lazy var headImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 3 * screenScale, y: 1 * screenScale, width:  self.Width * 0.43, height: self.Width * 0.42))
        d.backgroundColor = UIColor.gray
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    // MARK: - 整体背景
    fileprivate lazy var hhhh: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "headInfoBgV")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    // MARK: - 显示底部打纸牌
    lazy var bigCardLayout: CardsLayout = {
        let d : CardsLayout = CardsLayout.init(frame: CGRect.init(x: self.hhhh.RightX, y: -self.Height * 0.45, width: self.Width * 3, height: self.Height * 1.45))
        d.isUserInteractionEnabled = true
        return d
    }()
    
    
    // MARK: - 波形图片
    fileprivate lazy var showWave: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.25, y: 0, width: self.Width * 0.25, height: self.Height * 0.5))
        d.image = #imageLiteral(resourceName: "peopleTalk")
        d.layer.borderWidth = 1
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    // MARK: - 离线图标
    fileprivate lazy var offLineImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.25, y: 0, width: self.Width * 0.25, height: self.Height * 0.25))
        d.image = #imageLiteral(resourceName: "offLine")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    // MARK: - 庄主图标
    fileprivate lazy var ownerImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.25, y: 2 * screenScale, width: self.Width * 0.25, height: self.Height * 0.25))
        d.image = #imageLiteral(resourceName: "owner")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 图片名字
    var imgName : String = "" {
        didSet {
            
        }
    }
    
    /// 分数图片
    lazy var scoreImg: ScoreV = {
        let d : ScoreV = ScoreV.init(frame: CGRect.init(x: self.Width * 0.5, y: self.Height, width: self.Width * 0.5, height: self.Height * 0.5))
        
        
        return d
    }()
    
    /// 获取的图片名字
    var imgNames : [String] = []
    
    /// 显示波形的标识
    var showPeopletTalkMark = false
    
    /// 显示准备标识
    var showPrepareMark = false
    
    /// 显示完成标识
    var showCompleteMark = false
    
    /// 小纸牌显示在左边还是右边 --- 默认在右边1
    ////                             左边-1
    var samllCardsShowLeftOrRight = 1
    
    /// 背面纸牌
    var backCardsLayout : UIImageView!
    
    /// 是否显示底部大纸牌
    var isShowBottomCardLayout = false
    
    /// 开关关闭牛牛图片
    var isNinNiuShow = false
    
    // MARK: - 添加分数图片
    func addScoreImg(str : String,type : Int) -> Void {
        scoreImg.abc(abc: str, scoreType: type)
    }
    
    // MARK: - 添加牛牛图片
    func addNNimg(str imgName:String) -> Void {
        self.niuniuImg.image = UIImage.init(named: imgName)
    }
    
    
    // MARK: - 摆放纸牌
    func addCards(cardsArray : [String]) -> Void {
        
        /// 提示的时候
        if CardNameModel.shared.isShowP1Front {
            
            if backCardsLayout != nil {
                backCardsLayout.isHidden = true
            }
            
            var index = 0
            for value in cardsArray {
                
                
                if backCardsLayout != nil {
                    backCardsLayout.image = UIImage.init(named:value)
                    
                    index += 1
                    
                } else {
                    backCardsLayout = UIImageView.init(frame: CGRect.init(x: CGFloat(self.samllCardsShowLeftOrRight) + CGFloat(index) * self.Width * 0.15 , y: 2 * screenScale, width: self.Width * 0.3, height: self.Height - screenScale * 3))
                }
                
                
                DispatchQueue.main.async {
                    self.addSubview(self.backCardsLayout)
                }
            }
            
            /// 重置标识
            CardNameModel.shared.isShowP1Front = false
        } else {
            
            var index = 0
            for value in cardsArray {
                
                if isShowBottomCardLayout == false {
                    backCardsLayout = UIImageView.init(frame: CGRect.init(x: CGFloat(self.samllCardsShowLeftOrRight) + CGFloat(index) * self.Width * 0.15 , y: 2 * screenScale, width: self.Width * 0.3, height: self.Height - screenScale * 3))
                    
                    
                } else if isShowBottomCardLayout == true {
                    backCardsLayout = UIImageView.init(frame: CGRect.init(x: self.Width * CGFloat(self.samllCardsShowLeftOrRight) + CGFloat(index) * self.Width * 0.15 , y: 2 * screenScale, width: self.Width * 0.3, height: self.Height - screenScale * 3))
                    
                    backCardsLayout.image = UIImage.init(named:value)
                    
                    index += 1
                    
                    DispatchQueue.main.async {
                        self.addSubview(self.backCardsLayout)
                    }
                    print("\((#file as NSString).lastPathComponent):(\(#line))\n")
                }
            }
        }
    }
    
    func addrightCards(cardsArray : [String]) -> Void {
//        var index = 0
//        for value in cardsArray {
//            
//        print("当前日期时间：\(dformatter.string(from: Date()))","\((#file as NSString).lastPathComponent):(\(#line))\n",index)
//
//           backCardsLayout = UIImageView.CGFloat(self.samllCardsShowLeftOrRight) + CGFloat(index) * self.Width * 0.15 , y: 2 * screenScale, width: self.Width * 0.3, height: self.Height - screenScale * 3))
//            
//            backCardsLayout.image = UIImage.init(named:value)
//            
//            index += 1
//
//            DispatchQueue.main.async {
//                self.addSubview(self.backCardsLayout)
//            }
//            print("\((#file as NSString).lastPathComponent):(\(#line))\n")
//        }
        
        var indexxxx = 0
        for _ in 0..<5 {
            let d =  UIImageView.init(frame: CGRect.init(x:self.Width * CGFloat(samllCardsShowLeftOrRight) + CGFloat(indexxxx) * self.Width * 0.15 , y: 2 * screenScale, width: self.Width * 0.3, height: self.Height - screenScale * 3))
            d.contentMode = UIViewContentMode.scaleAspectFit
            d.image = UIImage.init(named: cardsArray[indexxxx])
            d.backgroundColor = UIColor.randomColor()
            addSubview(d)
            indexxxx += 1
        }
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    // MARK: - 牛牛图片
    lazy var niuniuImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: self.Width, height: self.Height))
        return d
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        
        addSubview(hhhh)
        addSubview(nameLabel)
        
        
        addSubview(coinsLabel)
        addSubview(showWave)
        /// 抢庄
        addSubview(robImg)
        addSubview(notRobImg)
        
        //离线图标
        addSubview(offLineImg)
        
        
        addSubview(headImg)
        
        
        /// 准备
        addSubview(prepareImg)
        
        ///完成
        addSubview(finishImg)
        
        /// 庄主
        addSubview(ownerImg)
        
        addSubview(scoreImg)
        
        scoreImg.isHidden = true
        
        /// 牛牛图片
        addSubview(niuniuImg)
        
        /// 默认隐藏
        finishImg.isHidden = true
        prepareImg.isHidden = true
        robImg.isHidden = true
        notRobImg.isHidden = true
        showWave.isHidden = true
        offLineImg.isHidden = true
        ownerImg.isHidden = true
        
        
        
        /// 是否开始游戏
        if RoomModel.shared.isGameBegin {
            
            if !isShowBottomCardLayout {
                bigCardLayout.addCards(cardsArray: imgNames)
                addSubview(bigCardLayout)
            }
            /// 尚需修改
            addCards(cardsArray: imgNames)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
