//
//  Common.swift
//  WX
//
//  Created by 郑东喜 on 2017/1/5.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

//第三方openID
var thirdOpenID : String = ""
//第三方昵称
var thirdNickName : String = ""
//第三方头像地址
var thirdHeadImgURL : String = ""

//本地存储
let localSave = UserDefaults.standard

//非uiviewcontroller控制器
let nav = UIApplication.shared.keyWindow?.rootViewController

//微信应用app iD
//wxb4ba3c02aa476ea1
//let WXPatient_App_ID = "wxb4ba3c02aa476ea1"
let WXPatient_App_ID = "wxd6870b76bf49dd4c"
let WXPatient_App_Secret = "8765965abd382bd6216b230b11bc3bb1"
let WX_ACCESS_TOKEN = "access_token"
let WX_OPEN_ID = "openid"
let WX_REFRESH_TOKEN = "refresh_token"
let WX_UNION_ID = "unionid"
let WX_BASE_URL = "https://api.weixin.qq.com/sns"

///商户ID
let wxPartnerId = "1283100701"

// MARK:- 微信请求的参数、openID 、头像地址、昵称
let wid = "wxopenID"
let wHUrl = "wxheadImgUrl"
let wNickName = "wNickName"

// MARK:- 屏幕放大比例
let screenScale = UIScreen.main.bounds.width / 320


// MARK:- uiview分类扩展
extension UIView {
    
    var LeftX: CGFloat {
        get {
            return self.frame.origin.x
        }
    }
    var RightX: CGFloat {
        get {
            return self.frame.origin.x + self.bounds.width
        }
    }
    var TopY: CGFloat {
        get {
            return self.frame.origin.y
        }
    }
    var BottomY: CGFloat {
        get {
            return self.frame.origin.y + self.bounds.height
        }
    }
    var Width: CGFloat {
        get {
            return self.bounds.width
        }
    }
    var Height: CGFloat {
        get {
            return self.bounds.height
        }
    }
}


// MARK:- 通用边距
let commonMargin : CGFloat = 10

// MARK:- get请求
func getWithPath(path: String,paras: Dictionary<String,Any>?,success: @escaping ((_ result: Any) -> ()),failure: @escaping ((_ error: Error) -> ())) {
    
    var i = 0
    var address = path
    if let paras = paras {
        
        for (key,value) in paras {
            
            if i == 0 {
                
                address += "?\(key)=\(value)"
            }else {
                
                address += "&\(key)=\(value)"
            }
            
            i += 1
        }
    }
    
    let url = URL(string: address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
    
    let session = URLSession.shared
    
    let dataTask = session.dataTask(with: url!) { (data, respond, error) in
        
        if let data = data {
            
            if let result = try? JSONSerialization.jsonObject(with: data, options: .allowFragments){
                
                success(result)
            }
        }else { 
            
            failure(error!)
        }
    }
    dataTask.resume()
    
}


func addTarget(_ ios: UIView) {
    // 执行动画 改变透明度
    let alpha = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
    alpha?.toValue = (1.0)
    alpha?.duration = 0.3
    //        UIImageView.pop_add(alpha, forKey: nil)
    // 缩放回弹
    let scale = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
    scale?.fromValue = NSValue(cgSize: CGSize(width: CGFloat(1.75), height: CGFloat(1.75)))
    scale?.toValue = NSValue(cgSize: CGSize(width: CGFloat(1.0), height: CGFloat(1.0)))
    scale?.dynamicsTension = 1000
    scale?.dynamicsMass = 1.3
    scale?.dynamicsFriction = 10.3
    scale?.springSpeed = 20
    scale?.springBounciness = 15.64
    scale?.delegate = UIApplication.shared.keyWindow?.rootViewController
    ios.layer.pop_add(scale, forKey: nil)
}
