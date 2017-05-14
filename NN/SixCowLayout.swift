//
//  SixCowLayout.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/14.
//  Copyright © 2017年 郑东喜. All rights reserved.
//   六人牛牛布局

import UIKit

/// 六人牛牛创建视图
class SixCowLayout: UIView {
    /// 六人牛牛
    var upView : SixCowV!
    var downView : SixCowDownV!

    /// 创建房间(六人牛牛)
    lazy var createRoomBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x:self.Width * 0.5 - 25 , y: self.Height * 0.8, width: self.Width / 4 , height: 50))
        d.addTarget(self, action: #selector(createSixRequest), for: .touchUpInside)
        d.setTitle("创建房间", for: .normal)
        return d
    }()
    
    /// 局数选组
    fileprivate lazy var roundsChoose: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: commonMargin, y: commonMargin, width: self.Width / 4, height: 30))
        d.text = "局数选择 :"
        return  d
    }()
    
    /// 玩法人数
    fileprivate lazy var playTypePlayers: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: commonMargin , y: self.roundsChoose.BottomY + commonMargin, width: self.Width / 4, height: 30))
        d.text = "玩法人数 :"
        return  d
    }()
    
    /// 计算方式
    fileprivate lazy var payType: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: commonMargin, y: self.downView.TopY, width: self.Width / 4, height: 30))
        d.text = "结算方式 :"
        return  d
    }()
    /// 玩法选项
    fileprivate lazy var playTypeChoose: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: commonMargin, y: self.payType.BottomY + commonMargin, width: self.Width / 4, height: 30))
        d.text = "玩法选项 :"
        return  d
    }()
    
    /// 创建房间消耗砖石
    fileprivate lazy var diammandLabel: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: commonMargin, y: self.Height * 0.8, width: self.Width * 0.6, height: 30))
        d.text = "创建房间消耗砖石"
        return  d
    }()
    
    // MARK: - 创建房间请求
    /// 创建六人牛牛房间请求
    @objc private func createSixRequest() -> Void {
        
        reportCreateRoomType()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderWidth = 1
        
        ldest()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func ldest() -> Void {
        upView = SixCowV.init(frame: CGRect.init(x: self.Width * 0.3, y: 25, width: self.Width * 0.65, height: self.frame.height * 0.4))
        
        downView = SixCowDownV.init(frame: CGRect.init(x: self.Width * 0.3, y: upView.BottomY + commonMargin, width: self.Width * 0.65, height: self.frame.height * 0.3))
        
        addSubview(upView)
        addSubview(downView)
        addSubview(diammandLabel)
        addSubview(createRoomBtn)
        addSubview(roundsChoose)
        addSubview(playTypePlayers)
        addSubview(payType)
        addSubview(playTypeChoose)
    }
    
}
