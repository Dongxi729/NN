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
        let d : UIButton = UIButton.init(frame: CGRect.init(x: commonMargin, y: commonMargin, width: 80, height: 30))
        d.setTitle("六人牛牛", for: .normal)
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(addSixV), for: .touchUpInside)
        return d
    }()
    
    /// 通比牛牛
    lazy var commBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: commonMargin, y: self.liubtnChange.BottomY + commonMargin, width: 80, height: 30))
        d.setTitle("通比牛牛", for: .normal)
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(commonSixV), for: .touchUpInside)
        return d
    }()
    
    /// 六人牛牛
    var upView : SixCowV!
    var downView : SixCowDownV!
    
    /// 通比牛牛
    var commupView : CommonCowUpV!
    var commdownView : CommCowDownV!
    
    /// 创建房间消耗砖石
    fileprivate lazy var diammandLabel: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: self.Width * 0.3, y: SH * 0.7, width: self.Width * 0.6, height: 30))
        d.text = "创建房间消耗砖石"
        return  d
    }()
    
    
    /// 创建房间
    lazy var createRoomBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x:self.Width * 0.5 - 25 , y: self.Height * 0.8, width: 100, height: 50))
        d.setTitle("创建房间", for: .normal)
        return d
    }()
    
    /// 局数选组
    fileprivate lazy var roundsChoose: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: self.liubtnChange.RightX + commonMargin, y: 50, width: 100, height: 30))
        d.text = "局数选择 :"
        return  d
    }()
    
    /// 玩法人数
    fileprivate lazy var playTypePlayers: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: self.liubtnChange.RightX + commonMargin, y: self.roundsChoose.BottomY + commonMargin, width: 100, height: 30))
        d.text = "玩法人数 :"
        return  d
    }()
    
    /// 计算方式
    fileprivate lazy var payType: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: self.liubtnChange.RightX + commonMargin, y: self.downView.TopY, width: 100, height: 30))
        d.text = "结算方式 :"
        return  d
    }()
    
    /// 计算方式
    fileprivate lazy var _payType: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: self.liubtnChange.RightX + commonMargin, y: self.commdownView.TopY, width: 100, height: 30))
        d.text = "结算方式 :"
        return  d
    }()
    
    /// 玩法选项
    fileprivate lazy var playTypeChoose: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: self.liubtnChange.RightX + commonMargin, y: self.payType.BottomY + commonMargin, width: 100, height: 30))
        d.text = "玩法选项 :"
        return  d
    }()
    
    /// 玩法选项
    fileprivate lazy var _playTypeChoose: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: self.liubtnChange.RightX + commonMargin, y: self._payType.BottomY + commonMargin, width: 100, height: 30))
        d.text = "玩法选项 :"
        return  d
    }()
    
    /// 固定分数
    fileprivate lazy var dieCount: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: self.liubtnChange.RightX + commonMargin, y: self._payType.BottomY + commonMargin, width: 100, height: 30))
        d.text = "固定分数 :"
        return  d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(liubtnChange)
        addSubview(commBtn)
    }
    
    /// 六人牛牛
    @objc fileprivate func addSixV() {
        upView = SixCowV.init(frame: CGRect.init(x: self.Width * 0.3, y: 25, width: self.Width * 0.55, height: self.frame.height * 0.4))
        addSubview(upView)
        
        downView = SixCowDownV.init(frame: CGRect.init(x: self.Width * 0.3, y: upView.BottomY + commonMargin, width: self.Width * 0.55, height: self.frame.height * 0.3))
        addSubview(downView)
        
        addSubview(diammandLabel)
        
        addSubview(createRoomBtn)
        
        addSubview(roundsChoose)
        
        addSubview(playTypePlayers)
        
        addSubview(payType)
        
        addSubview(playTypeChoose)
    }
    
    /// 通比牛牛
    @objc fileprivate func commonSixV() {
        commupView = CommonCowUpV.init(frame: CGRect.init(x: self.Width * 0.3, y: 25, width: self.Width * 0.55, height: self.frame.height * 0.4))
        addSubview(commupView)
        
        commdownView = CommCowDownV.init(frame: CGRect.init(x: self.Width * 0.3, y: commupView.BottomY + commonMargin, width: self.Width * 0.55, height: self.frame.height * 0.3))
        addSubview(commdownView)

        addSubview(diammandLabel)

        addSubview(createRoomBtn)

        addSubview(roundsChoose)

        addSubview(dieCount)

        addSubview(_payType)

        addSubview(_playTypeChoose)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class CommonLabell : UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont.systemFont(ofSize: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
