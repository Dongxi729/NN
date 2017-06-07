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
    // MARK: - 用户游戏视图头像
    lazy var headImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.33, y: self.Height * 0.05, width: self.Width * 0.35, height: self.Width * 0.35))
        d.layer.borderWidth = 1
        d.contentMode = UIViewContentMode.scaleAspectFit
        
        return d
    }()
    
    // MARK: - 玩家分数label
    lazy var userName: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: self.headImg.BottomY, width: self.Width, height: 10 * screenScale))
        d.text = "玩家1111"
        d.font = UIFont(name: "SimHei", size: 8 * screenScale)
        d.textColor = UIColor.brown
        d.textAlignment = .center
        return d
    }()
    
    
    // MARK: - 玩家ID
    lazy var playerIDLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: self.userName.BottomY, width: self.Width, height: 10 * screenScale))
        d.text = "asdssd"
        d.font = UIFont(name: "SimHei", size: 8 * screenScale)
        d.textColor = UIColor.brown
        d.textAlignment = .center
        return d
    }()
    
    // MARK: - 显示大赢家图标
    lazy var showBigWinner: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.5, y: self.Height - self.Height * 0.2, width: self.Width * 0.6, height: self.Height * 0.2))
        d.layer.borderWidth = 1
        d.image = #imageLiteral(resourceName: "winner")
        return d
    }()
    
    // MARK: - 显示分数
    lazy var showCoinsLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: self.Height - self.Height * 0.15, width: self.Width, height: 20 * screenScale))
        d.font = UIFont(name: "SimHei", size: 15)
        d.text = String(0)
        d.textAlignment = .center
        d.textColor = UIColor.red
        return d
    }()
    
    // MARK: - 房主图标
    lazy var roomIconImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.35, y: self.Height * 0.05, width: self.Width * 0.2, height: self.Width * 0.2))
        d.contentMode = UIViewContentMode.scaleAspectFit
        d.image = #imageLiteral(resourceName: "btn_fx")
        d.layer.borderWidth = 1
        return d
    }()
    
    // MARK: - 成绩用户信息
    lazy var personV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 5, y: 5, width: self.Width - commonMargin, height: self.Height - commonMargin))
        d.image = #imageLiteral(resourceName: "scoreBgImg")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    // MARK: - 通杀次数
    lazy var tsCountLabel: CommonLabel = {
        let d : CommonLabel = CommonLabel.init(frame: CGRect.init(x: self.Width * 0.5, y: self.Height * 0.38, width: self.Width * 0.3, height: self.Height * 0.1))
        d.textAlignment = .right
        d.text = "X0"
        d.textColor = UIColor.colorWithHexString("BF7E15")
        return d
    }()
    
    // MARK: - 通赔次数
    lazy var tpCountLabel: CommonLabel = {
        let d : CommonLabel = CommonLabel.init(frame: CGRect.init(x: self.Width * 0.5, y: self.tsCountLabel.BottomY, width: self.Width * 0.3, height: self.Height * 0.1))
        d.textAlignment = .right
        d.text = "X0"
        d.textColor = UIColor.colorWithHexString("BF7E15")
        return d
    }()

    
    // MARK: - 胜利次数
    lazy var winCountLabel: CommonLabel = {
        let d : CommonLabel = CommonLabel.init(frame: CGRect.init(x: self.Width * 0.5, y: self.tpCountLabel.BottomY, width: self.Width * 0.3, height: self.Height * 0.1))
        d.textAlignment = .right
        d.text = "X0"
        d.textColor = UIColor.colorWithHexString("BF7E15")
        return d
    }()
    
    
    // MARK: - 牛牛次数
    lazy var niuniuCountLabel: CommonLabel = {
        let d : CommonLabel = CommonLabel.init(frame: CGRect.init(x: self.Width * 0.5, y: self.winCountLabel.BottomY, width: self.Width * 0.3, height: self.Height * 0.1))
        d.textAlignment = .right
        d.text = "X0"
        d.textColor = UIColor.colorWithHexString("BF7E15")
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(personV)
        
        addSubview(headImg)
        
        addSubview(userName)
        
        addSubview(playerIDLabel)
        addSubview(showBigWinner)
        addSubview(showCoinsLabel)
        addSubview(roomIconImg)
        
        ////////////////////////////////////////////////
        /// 分数labels
        addSubview(tsCountLabel)
        addSubview(tpCountLabel)
        addSubview(winCountLabel)
        addSubview(niuniuCountLabel)
        
        /// 隐藏大赢家
        showBigWinner.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
