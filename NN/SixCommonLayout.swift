//
//  SixCommonLayout.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/14.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  通比牛牛布局

import UIKit

/// 通比牛牛创建视图
class SixCommonLayout: UIView {
    
    
    /// 创建房间消耗砖石
    fileprivate lazy var diammandLabel: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: commonMargin, y: self.Height * 0.8, width: self.Width * 0.6, height: 30))
        d.text = "创建房间消耗砖石"
        return  d
    }()
    
    
    /// 玩法选项
    fileprivate lazy var _playTypeChoose: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: commonMargin, y: self._payType.BottomY + commonMargin, width: self.Width / 4, height: 30))
        d.text = "固定分数 :"
        return  d
    }()
    

    /// 创建房间(通比牛牛)
    lazy var _createRoomBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x:self.Width * 0.5 - 25 , y: self.Height * 0.8, width: self.Width / 4, height: 50))
        
        d.setTitle("创建房间", for: .normal)
        return d
    }()
    
    /// 通比牛牛
    var commupView : CommonCowUpV!
    var commdownView : CommCowDownV!
    
    
    /// 局数选组
    fileprivate lazy var roundsChoose: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: commonMargin, y: commonMargin, width: self.Width / 4, height: 30))
        d.text = "局数选择 :"
        return  d
    }()
    
    
    /// 计算方式
    fileprivate lazy var _payType: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: commonMargin , y: self.commdownView.TopY, width: self.Width / 4, height: 30))
        d.text = "结算方式 :"
        return  d
    }()
    
    /// 玩法人数
    fileprivate lazy var playTypePlayers: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: commonMargin, y: self.roundsChoose.BottomY + commonMargin + commonMargin, width: self.Width / 4, height: 30))
        d.text = "玩法人数 :"
        return  d
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareUI()
    }
    
    private func prepareUI() {
        commupView = CommonCowUpV.init(frame: CGRect.init(x: self.roundsChoose.RightX + commonMargin, y: commonMargin, width: self.Width * 0.65, height: self.frame.height * 0.4))
        commdownView = CommCowDownV.init(frame: CGRect.init(x: self.roundsChoose.RightX + commonMargin, y: commupView.BottomY + commonMargin, width: self.Width * 0.65, height: self.frame.height * 0.3))
        addSubview(commupView)
        addSubview(commdownView)
        addSubview(diammandLabel)
        addSubview(_createRoomBtn)
        addSubview(roundsChoose)
        addSubview(_payType)
        addSubview(playTypePlayers)
        addSubview(_playTypeChoose)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
