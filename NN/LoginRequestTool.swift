//
//  LoginRequestTool.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/9.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  登陆请求工具

import UIKit

typealias UserInfo = (_ receiveData : [String : String]) -> ()

class LoginRequestTool: NSObject {
    
    static let shared = LoginRequestTool()
    
    
    func getUserInfo(_ wxopenid : String,_ wxtoken : String,finished : @escaping UserInfo) -> Void {
        let requestParam = ["openid" : wxopenid,"accesstoken" : wxtoken]
        
        getWithPath(path: loginURL, paras: requestParam, success: { (responseData) in
            print("response",responseData)
            
            finished(responseData as! [String : String])
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
