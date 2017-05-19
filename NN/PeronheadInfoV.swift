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
    
    
    /// 波形图片
    fileprivate lazy var showWave: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.25, y: 0, width: self.Width * 0.25, height: self.Height * 0.5))
        d.image = #imageLiteral(resourceName: "peopleTalk")
        d.layer.borderWidth = 1
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
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
    
    /// 纸牌
    var cardCards = [0,0,0,0,0]
    
    /// 摆放纸牌
    private func addCards(cardsArray : [String]) -> Void {
        var dixName = [Int : String]()
        
        var index : Int = 0
        
        for aaa in cardsArray {
            print(index)
            
            dixName.updateValue(aaa, forKey: index)
            
            backCardsLayout = UIImageView.init(frame: CGRect.init(x: self.Width * CGFloat(self.samllCardsShowLeftOrRight) + CGFloat(index) * self.Width * 0.15 , y: 2 * screenScale, width: self.Width * 0.3, height: self.Height - screenScale * 3))
            print(dixName[index] as Any)
            
            backCardsLayout.image = UIImage.init(named: dixName[index]!)
            
            index += 1
            addSubview(backCardsLayout)
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headImg)
        addSubview(hhhh)
        addSubview(nameLabel)
        addSubview(coinsLabel)
        addSubview(showWave)
        
    
    }

    /// 拼接
    ///
    /// - Parameter prefix: 图片前缀
    private func contactName(prefix : String) -> [String] {
        let names = cardCards.map {
            prefix + String($0)
        }
        return names
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if showPrepareMark {
            addSubview(prepareImg)
        }
        
        if showCompleteMark {
            addSubview(finishImg)
        }
        
        self.samllCardsShowLeftOrRight = -1
        addCards(cardsArray: contactName(prefix: "pa"))

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
