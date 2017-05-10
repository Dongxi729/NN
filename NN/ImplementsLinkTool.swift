//
//  ImplementsLinkTool.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/9.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import Foundation

/// 牛牛登陆web接口
/// http://192.168.1.10/ashx/login.ashx?wxid=微信openid&accesstoken=微信授权token

/// http://wx.qlogo.cn/mmopen/Q3auHgzwzM4EuPypAO1AOqUGphnT4ib440hE6M9vtiaUqicYP5nG4Gn6Xwo4fbAyLGMql0ibeohovdEsVwVVqPqzPzZzJicxrnz65CnicQIiaIeSJo/0 阿东^_^^_^^_^ oSnAyv3LraZ8QOzAQYfjoPQJYZLE
var loginURL = "http://192.168.1.10/ashx/login.ashx"


/// 获取成功的值
//{ "status": "true","msg": "注册成功","uid": "47607836","sex": "1","openid": "oSnAyv3LraZ8QOzAQYfjoPQJYZLE","nickname": "阿东^_^^_^^_^","wealth": "20000","headimg": "http://wx.qlogo.cn/mmopen/Q3auHgzwzM4EuPypAO1AOqUGphnT4ib440hE6M9vtiaUqicYP5nG4Gn6Xwo4fbAyLGMql0ibeohovdEsVwVVqPqzPzZzJicxrnz65CnicQIiaIeSJo/0","serviceip": "192.168.1.10","serviceport": "8885","token": "3fc0585c10fd4d1bba88dec9c4d97cef"}
