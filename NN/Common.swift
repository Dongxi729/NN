//
//  Common.swift
//  WX
//
//  Created by 郑东喜 on 2017/1/5.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit



//本地存储
let localSave = UserDefaults.standard

//非uiviewcontroller控制器
let nav = UIApplication.shared.keyWindow?.rootViewController

//微信应用app iD

//let WXPatient_App_ID = "wx72ef50bd213b7232"
//let WXPatient_App_Secret = "fca39841591b0823da05b59bfb77f0a1"

let WXPatient_App_ID = "wxd6870b76bf49dd4c"
let WXPatient_App_Secret = "f12aff3e2c7b83c848b81ae79f54595c"


let WX_ACCESS_TOKEN = "access_token"
let WX_OPEN_ID = "openid"
let WX_REFRESH_TOKEN = "refresh_token"
let WX_UNION_ID = "unionid"
let WX_BASE_URL = "https://api.weixin.qq.com/sns"

///商户ID
let wxPartnerId = "1435473602"

// MARK:- 微信请求的参数、openID 、头像地址、昵称
let wid = "wxopenID"
let wHUrl = "wxheadImgUrl"
let wNickName = "wNickName"

// MARK:- 屏幕放大比例
let screenScale = UIScreen.main.bounds.width / 320

// MARK:- 通用边距
let commonMargin : CGFloat = 10


//POST请求
func postWithPath(path: String,paras: Dictionary<String,Any>?,success: @escaping ((_ result: Any) -> ()),failure: @escaping ((_ error: NSError) -> ())) {
    
    //(1）设置请求路径
    let url:NSURL = NSURL(string:path)!//不需要传递参数
    
    //(2) 创建请求对象
    let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL) //默认为get请求
    request.timeoutInterval = 5.0 //设置请求超时为5秒
    
    request.httpMethod = "POST"  //设置请求方法
    
    //设置请求体
    //拼接URL
    var i = 0
    var address: String = ""
    
    if let paras = paras {
        
        for (key,value) in paras {
            
            if i == 0 {
                
                address += "\(key)=\(value)"
            }else {
                
                address += "&\(key)=\(value)"
            }
            
            i += 1
        }
    }
    
    //把拼接后的字符串转换为data，设置请求体
    request.httpBody = address.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
    
    //(3) 发送请求
    NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue:OperationQueue()) { (res, data, error)in

        
        if let resDic : [AnyHashable : Any] = ((res as? HTTPURLResponse)?.allHeaderFields) {
            
            if let _ = resDic["Expires"] as? String {
                
            } else {
                
            }
        }
        
        //返回主线程执行
        DispatchQueue.main.sync {
            
            if let data = data {
                
                if let result = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    
                    success(result)
                }
                
            } else {
                
                failure(error! as NSError)
            }
            
        }
    }
    
}

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


/// 控制器上添加视图
///
/// - Parameter ios: 添加的子视图
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



/// 添加到主控制器(附带动画效果)
///
/// - Parameter ios: 添加的子视图
func addToRootView(_ ios: UIView) {
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
    
    UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(ios)
}


/// 添加到主控制器(附带动画效果)
///
/// - Parameter ios: 添加的子视图
func addToView(_ ios: UIView) {
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
    
    UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(ios)
}


/// 弹簧效果
///
/// - Parameters:
///   - addToV: 添加的视图
///   - tovalue: 结束的点坐标
func spring(addToV : UIView,tovalue : CGPoint) -> Void {
    let anim = POPSpringAnimation(propertyNamed: kPOPViewCenter)
    
    let centerX: CGFloat = UIScreen.main.bounds.width * 0.5
    let centerY: CGFloat = UIScreen.main.bounds.height * 0.5
    anim?.fromValue = CGPoint.init(x: centerX, y: centerY)
    anim?.toValue = NSValue(cgPoint: tovalue)
    anim?.springBounciness = 16
    anim?.springSpeed = 6
    
    addToV.pop_add(anim, forKey: "center")
}



/// 异步下载图片
///
/// - Parameters:
///   - url: 链接
///   - toView: 添加到的视图
func downImgWith(url : String,toView : UIImageView) {
    //创建URL对象
    let url = URL(string:url)!
    //创建请求对象
    let request = URLRequest(url: url)
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request, completionHandler: {
        (data, response, error) -> Void in
        if error != nil{
            print(error.debugDescription)
        }else{
            //将图片数据赋予UIImage
            let img = UIImage(data:data!)
            
            DispatchQueue.main.async {
                toView.image = img
            }
        }
    }) as URLSessionTask
    
    //使用resume方法启动任务
    dataTask.resume()
}


/// 获取时间
///
/// - Returns: 返回时间
func getTime() -> String {
    
    //获取当前时间
    let now = Date()
    
    // 创建一个日期格式器
    let dformatter = DateFormatter()
    dformatter.dateFormat = "HH:mm"
    return dformatter.string(from: now)
}


func customLabel(label : UILabel,withSize : CGFloat) -> Void {
    
    let attributedString = NSMutableAttributedString(string: label.text!, attributes: [NSKernAttributeName: (withSize)])
    let paragraphStyle = NSMutableParagraphStyle()
    
    attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: (label.text?.characters.count)!))
    label.attributedText = attributedString
//    label.numberOfLines = 0
//    label.sizeToFit()
}
