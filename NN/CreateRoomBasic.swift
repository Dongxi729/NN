//
//  CreateRoomBasic.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/10.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  创建房间

import UIKit

class CreateRoomBasic: UIView {

    /// 六人牛牛
    lazy var liubtnChange: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 25, y: 25, width: 100, height: 30))
        d.setTitle("六人牛牛", for: .normal)
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(addSixV), for: .touchUpInside)
        return d
    }()
    
    /// 通比牛牛
    lazy var commBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 25, y: self.liubtnChange.BottomY + commonMargin, width: 100, height: 30))
        d.setTitle("通比牛牛", for: .normal)
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(commonSixV), for: .touchUpInside)
        return d
    }()
    
    var upView : SixCowV!
    var downView : SixCowDownV!
    
    /// 创建房间消耗砖石
    fileprivate lazy var diammandLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: self.Width * 0.3, y: self.downView.BottomY + 2 * commonMargin, width: self.Width * 0.6, height: 30))
        d.text = "创建房间消耗砖石"
        return  d
    }()
    
    /// 创建房间
    lazy var createRoomBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x:self.Width * 0.5 - 25 , y: self.diammandLabel.BottomY + commonMargin, width: 100, height: 50))
        d.setTitle("创建房间", for: .normal)
        return d
    }()
    
    /// 局数选组
    fileprivate lazy var roundsChoose: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: self.liubtnChange.RightX + commonMargin, y: 50, width: 100, height: 30))
        d.text = "局数选择 :"
        return  d
    }()
    
    /// 玩法人数
    fileprivate lazy var playTypePlayers: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: self.liubtnChange.RightX + commonMargin, y: self.roundsChoose.BottomY + commonMargin, width: 100, height: 30))
        d.text = "玩法人数 :"
        return  d
    }()
    
    /// 计算方式
    fileprivate lazy var payType: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: self.liubtnChange.RightX + commonMargin, y: self.downView.TopY, width: 100, height: 30))
        d.text = "结算方式 :"
        return  d
    }()
    
    /// 玩法选项
    fileprivate lazy var playTypeChoose: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: self.liubtnChange.RightX + commonMargin, y: self.payType.BottomY + commonMargin, width: 100, height: 30))
        d.text = "玩法选项 :"
        return  d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(liubtnChange)
        addSubview(commBtn)
        
        
    }
    
    @objc fileprivate func addSixV() {
        upView = SixCowV.init(frame: CGRect.init(x: self.Width * 0.4, y: 25, width: self.Width * 0.5, height: self.frame.height * 0.4))
        addSubview(upView)
        
        downView = SixCowDownV.init(frame: CGRect.init(x: self.Width * 0.4, y: upView.BottomY + commonMargin, width: self.Width * 0.5, height: self.frame.height * 0.3))
        addSubview(downView)
        
        addSubview(diammandLabel)
        
        addSubview(createRoomBtn)
        
        addSubview(roundsChoose)
        
        addSubview(playTypePlayers)
        
        addSubview(payType)
        
        addSubview(playTypeChoose)
        
    }
    
    @objc fileprivate func commonSixV() {
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
