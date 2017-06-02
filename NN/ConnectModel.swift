//
//  ConnectModel.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/2.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  链接工具

import UIKit

class ConnectModel: NSObject {
    static let shared = ConnectModel()
    
    func connectSEL() -> Void {
        /// 开始上报用户信息,传socket
        AvdioTool.shared.creatSession()
        
        /// 开启链接服务器
        DispatchQueue.global(qos: .default).async {
            testServer()
        }
    }
}
