//
//  GameLeftCornerMsg.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/19.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

/// 左上角信息标注
class GameLeftCornerMsg: UIView {
    
    lazy var bgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.frame)
        d.image = #imageLiteral(resourceName: "presonLeftTop")
        return d
    }()
    
    /// 房间号
    lazy var roomNum: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: self.Width, height: 30))
        if CreateRoomModel.shared.roomNo.isEmpty {
            d.text = "模拟三"
        } else {
            d.text = "房号 :" + CreateRoomModel.shared.roomNo
        }
        
        
        return d
    }()
    
    /// 当前局数 / 总局数
    lazy var currentRoundNo: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: self.roomNum.BottomY + commonMargin, width: self.Width, height: 30))
        
        if RoomModel.shared.currentRounds.isEmpty {
            d.text = "aaa"
        } else {
            d.text = RoomModel.shared.currentRounds + "/" + RoomModel.shared.gameRounds
        }
        
        return d
    }()
    
    /// 游戏类型(六人牛牛/通比牛牛)
    lazy var sixLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: self.currentRoundNo.BottomY, width: self.Width, height: 30))
        if RoomModel.shared.gameType.isEmpty {
            d.text = "sdddd"
        } else {
            d.text = RoomModel.shared.gameType
        }
        return d
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(bgV)
        addSubview(roomNum)
        addSubview(currentRoundNo)
        addSubview(sixLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
