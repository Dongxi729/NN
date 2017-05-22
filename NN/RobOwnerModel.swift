//
//  RobOwnerModel.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/22.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class RobOwnerModel: NSObject {
    /// xml 当前游戏(还未开始的游戏房间的数据)
    var robReceiveStr : String = "" {
        didSet {
            print(robReceiveStr)
        }
    }
}
