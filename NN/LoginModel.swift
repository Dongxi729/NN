//
//  LoginModel.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/9.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  登陆回来的模型

import UIKit

class LoginModel: NSObject {
    
    /// 头像地址
    var headImgURL : String?
    
    /// 登陆状态消息
    var msg : String?
    
    /// 昵称
    var nickname : String = "JohnConna"
    
    var serviceip : String?
    
    var serviceport : String?
    
    /// 在线状态
    var status : String?
    
    /// 用户ID
    var uid : String = "542967"
    
    /// 砖石数量
    var wealth : String?
    
    /// token
    var token : String = "acfef98fb0f54786bab454612f92b6bb"

    static let shared = LoginModel()
    
    func iinit(headImgURL : String,msg : String,nickname :String,serviceip : String,serviceport : String,status : String,uid : String,wealth : String,token:String) {
        
        self.headImgURL = headImgURL
        self.msg = msg
        self.nickname = nickname
        self.serviceip = serviceip
        self.serviceport = serviceport
        self.status = status
        self.uid = uid
        self.wealth = wealth
        self.token = token
    }
}
