//
//  ScorePersonInfoV.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/7.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  用户游戏成绩信息视图

import UIKit

// MARK: - 游戏玩家视图
class ScorePersonInfoV: UIView {
    
    lazy var headImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.33, y: self.Height * 0.08, width: self.Width * 0.35, height: self.Width * 0.35))
        d.image = #imageLiteral(resourceName: "commBtn")
        d.layer.borderWidth = 1
        d.contentMode = UIViewContentMode.scaleAspectFit
        
        return d
    }()
    
    /// 玩家分数label
    lazy var coinsLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: self.headImg.BottomY, width: self.Width, height: 10 * screenScale))
        d.text = "玩家1111"
        d.font = UIFont(name: "SimHei", size: 8 * screenScale)
        d.textColor = UIColor.brown
        d.textAlignment = .center
        return d
    }()
    
    
    /// 玩家ID
    lazy var playerIDLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: self.coinsLabel.BottomY, width: self.Width, height: 10 * screenScale))
        d.text = "asdssd"
        d.font = UIFont(name: "SimHei", size: 8 * screenScale)
        d.textColor = UIColor.brown
        d.textAlignment = .center
        return d
    }()
    
    ///显示大赢家图标
    lazy var showBitWinnerImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.5, y: self.Height - self.Height * 0.2, width: self.Width * 0.6, height: self.Height * 0.2))
        d.layer.borderWidth = 1
        d.image = #imageLiteral(resourceName: "winner")
        return d
    }()
    
    /// 显示分数
    lazy var showCoinsLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: self.Height - self.Height * 0.15, width: self.Width, height: 20 * screenScale))
        d.font = UIFont(name: "SimHei", size: 15)
        d.text = String(0)
        d.textAlignment = .center
        d.textColor = UIColor.red
        return d
    }()
    
    lazy var personV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 5, y: 5, width: self.Width - commonMargin, height: self.Height - commonMargin))
        d.image = #imageLiteral(resourceName: "scoreBgImg")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(personV)
        
        addSubview(headImg)
        
        addSubview(coinsLabel)
        
        addSubview(playerIDLabel)
        addSubview(showBitWinnerImg)
        addSubview(showCoinsLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
