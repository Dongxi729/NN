//
//  CreateRoomModel.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/10.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  记录创建房间信息模型
/// <M><ty gt = "游戏类型" ii ="局数" rn="人数" py="付费方式" /> </M>
//  <M><ty gt = "1" ii ="30" rn="6" py="2" /> </M>

//  返回
//  <M><ty su="false" ms="房间失败"/></M>
//  <M> <ty su="true" ms="房间创建成功"/></M>

import UIKit

/// 付费方式
///
/// - share: 房费平摊
/// - ownerTake: 房主结算
//enum PaymentType: Int {
//    
//    case share = 0
//    case ownerTake = 1
//}

class CreateRoomModel: NSObject {
    
    static let shared = CreateRoomModel()
    
    /// 房间类型 
    /// 1:六人牛牛
    /// 2:通比牛牛
    var roomType : String = "1"
    
    /// 局数(10、20、30)
    var rounds : String = "10"
    
    /// 局数玩法人数(3/6)
    var players : String = "3"
    
    /// 结算方式
    var payType : String = "1"
    
    /// 接收服务器传回的字符串
    var getServerCreateInfo : String = "" {
        didSet {
            print("收到创建房间",getServerCreateInfo)
        }
    }
    
}
