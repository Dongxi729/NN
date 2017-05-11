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
        
        
        let contactStr = loginURL + "?wxid=\(wxopenid)" + "&accesstoken=\(wxtoken)"
        
        /**
         {
         headimg = "http://wx.qlogo.cn/mmopen/Q3auHgzwzM4EuPypAO1AOqUGphnT4ib440hE6M9vtiaUqicYP5nG4Gn6Xwo4fbAyLGMql0ibeohovdEsVwVVqPqzPzZzJicxrnz65CnicQIiaIeSJo/0";
         msg = "\U767b\U9646\U6210\U529f";
         nickname = "\U963f\U4e1c^_^^_^^_^";
         openid = oSnAyv3LraZ8QOzAQYfjoPQJYZLE;
         serviceip = "192.168.1.10";
         serviceport = 8885;
         sex = 1;
         status = true;
         token = 3bd96e03f60a4fa5ad56ec44e6591a51;
         uid = 47607836;
         wealth = 20000;
         }
         */
        
        postWithPath(path: contactStr, paras: nil, success: { (res) in
            print(res)
            
            
            let res = res as! [String : String]
            
            let headIgURl = res["headimg"]
            
            let msg = res["msg"]
            
            let name = res["nickname"]
            
            let status = res["status"]
            
            let token = res["token"]
            
            let uid = res["uid"]
            
            let wealth = res["wealth"]
            
            let port = res["serviceport"]
            
            let ip = res["serviceip"]

            
            LoginModel.shared.headImgURL = headIgURl
            LoginModel.shared.msg = msg
            LoginModel.shared.nickname = name
            LoginModel.shared.status = status
            LoginModel.shared.token = token
            LoginModel.shared.uid = uid
            LoginModel.shared.wealth = wealth
            LoginModel.shared.serviceip = ip
            LoginModel.shared.serviceport = port
            
            finished(res)
        }) { (error) in
            print(error.localizedDescription)
            print("请求异常")
        }
    }
}
