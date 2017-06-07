//
//  WXTool.swift
//  DollarBuy
//
//  Created by 郑东喜 on 2016/11/4.
//  Copyright © 2016年 郑东喜. All rights reserved.
//  微信工具类

import UIKit


//第三方openID
var thirdOpenID : String = ""
//第三方昵称
var thirdNickName : String = ""
//第三方头像地址
var thirdHeadImgURL : String = ""
// 微信accesstoken
var wxAccessToken : String = ""

/// 请求获取参数
typealias WXAuthBack = (_ openID : String,_ nickName : String,_ accessToken : String) ->()

/// 微信支付回调
var pay:((_ _data:String)->Void)?

///微信验证结果回调
var comfun:((_ _data : String) -> Void)?

protocol WXToolDelegate {
    
    //微信登陆回调
    func WXLoginCallBack()
}

class WXTool : UIView,WXApiDelegate,NSURLConnectionDelegate {
    
    // MARK:- 将类设计成单例
    static let shared = WXTool()
    
    //微信登陆回调
    var delegate : WXToolDelegate?
    
    
    //外部闭包变量,请求用户信息
    var requestForUserInfoBlock:(()->Void)?
    
    ///支付结果
    var payResult : String?
    
    func setupWX() -> Void {
        
    }
    
    //收到请求信息
    func onReq(_ req: BaseReq!) {
        
    }
    
    //收到回应信息
    func onResp(_ resp: BaseResp!) {
        _ = "支付结果"
        var strMsg = "\(resp.errCode)"
        
        if resp.isKind(of: PayResp.self) {
            
            /**
             case 0:支付结果：成功！;
             break;
             case -1:支付结果：失败！;
             break;
             case -2:用户已经退出支付！;
             break;
             */
            
            switch resp.errCode {
            case 0:
                strMsg = "支付结果：成功！"
                
                payResult = "0"
                
                pay!("0")
                
                break
            case -1:
                strMsg = "支付结果：失败！"
                pay!("-1")
                
                break
            case -2:
                
                payResult = "-2"
                strMsg = "用户已经退出支付！"
                pay!("-2")
                
                break
            default:
                strMsg = "支付失败,请您重新支付!"
                
            }
            
            
        }
        
        //分享
        if resp.isKind(of: SendMessageToWXResp.self) {
            switch resp.errCode {
            case 0:
                let alertController = UIAlertController(title: "提示", message: "分享成功", preferredStyle: UIAlertControllerStyle.alert)
                
                
                alertController.addAction(UIAlertAction(title: "确认", style: UIAlertActionStyle.default, handler: nil))
                
                UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
                
                break
            default:
                
                let alertController = UIAlertController(title: "提示", message: "分享失败", preferredStyle: UIAlertControllerStyle.alert)
                
                
                alertController.addAction(UIAlertAction(title: "确认", style: UIAlertActionStyle.default, handler: nil))
                
                UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
                break;
            }
        }
        
        //登陆
        if resp.isKind(of: SendAuthResp.self) {
            
            let temp = (resp as! SendAuthResp)
            
            switch temp.errCode {
            case 0:
                
                
                let accessUrlStr = NSString.init(format: "%@/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code", WX_BASE_URL, WXPatient_App_ID, WXPatient_App_Secret, temp.code) as String
                
                
                print(accessUrlStr)
                
                //网络请求
                getWithPath(path: accessUrlStr, paras: nil, success: { (responseObject) in
                    //判读返回值是否为空
                    guard let wxInfoData = responseObject as? NSDictionary else {
                        return
                    }
                    
                    //                    print("微信个人信息",wxInfoData)
                    
                    
                    
                    let accessDict = responseObject as! NSDictionary
                    
                    /// 鉴别是否鉴权成功
                    let isValueCorrect = accessDict.allKeys.contains(where: { (value) -> Bool in
                        let vvv = value
                        if (vvv as AnyObject).contains(WX_ACCESS_TOKEN) {
                            return true
                        } else {
                            return false
                        }
                        
                    })
                    
                    
                    if isValueCorrect {
                        print("----",isValueCorrect)
                        
                        let accessToken = accessDict[WX_ACCESS_TOKEN] as! String
                        var openID = accessDict[WX_OPEN_ID] as! String
                        let refreshToken = accessDict[WX_REFRESH_TOKEN] as! String
                        
                        
                        // 本地持久化，以便access_token的使用、刷新或者持续
                        
                        if (accessToken.characters.count != 0) && !(accessToken == "") && (openID.characters.count != 0) && !(openID == "") {
                            UserDefaults.standard.set(accessToken, forKey: WX_ACCESS_TOKEN)
                            UserDefaults.standard.set(openID, forKey: WX_OPEN_ID)
                            UserDefaults.standard.set(refreshToken, forKey: WX_REFRESH_TOKEN)
                            UserDefaults.standard.synchronize()
                        }
                        self.wechatLoginByRequestForUserInfo()
                        
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                            self.payBackMsg(msg: "授权成功")
                        })
                        
                    } else {
                        print("授权s失败")
                    }
                    
                    
                }, failure: { (error) in
                    print("获取access_token时出错 = \(error)")
                })
                
                break
            case -2:
                print("用户取消了登陆操作")
                
                self.payBackMsg(msg: "用户取消了登陆操作")
                break
            default:
                print("授权失败")
                self.payBackMsg(msg: "授权失败")
                break
            }
            
            
        }
        
        
        //支付
        if resp.isKind(of: PayResp.self) {
            
            var strMsg = "支付结果"
            
            switch resp.errCode {
            case WXSuccess.rawValue:
                strMsg = "支付结果：成功"
                
                self.payBackMsg(msg: "支付成功")
                
            default:
                strMsg = ("支付结果：失败！,retcode=\(resp.errCode)retstr=\(resp.errStr)")
                
                self.payBackMsg(msg: "支付失败")
            }
            
        }
    }
    
    
    /// 获取用户信息
    func wechatLoginByRequestForUserInfo() -> Void {
        let accessToken = UserDefaults.standard.object(forKey: WX_ACCESS_TOKEN) as? String
        let openID = UserDefaults.standard.object(forKey: WX_OPEN_ID) as? String
        
        let userUrlStr = NSString.init(format: "%@/userinfo?access_token=%@&openid=%@", WX_BASE_URL, accessToken!, openID!) as String
        
        //网络请求
        getWithPath(path: userUrlStr, paras: nil, success: { (responseObject) in
            //判读返回值是否为空
            guard let wxInfoData = responseObject as? NSDictionary else {
                return
            }
            
            //判断返回信息是否正确
            if wxInfoData.count == 0 {
                return
            } else {
                //微信openID
                let wxOPENID = wxInfoData["openid"] as! String
                
                
                
                //微信头像地址
                let wxHeadImgURL = wxInfoData["headimgurl"] as! String
                
                //微信昵称
                let wxNickName = wxInfoData["nickname"] as! String
                
                
                //写入运行内存中
                
                thirdHeadImgURL = wxHeadImgURL
                thirdOpenID = wxOPENID
                thirdNickName = wxNickName
                
                
                //写入缓存，方便下次同步信息的时候用
                localSave.set(wxOPENID, forKey: wx_openID)
                localSave.set(wxHeadImgURL, forKey: wHUrl)
                localSave.set(wxNickName, forKey: wNickName)
                localSave.synchronize()
                
                //FIXME:微信登陆成功跳转
                //跳转工具类执行
                
                //                WXLogin.shared.wxLogin(_com: {[weak self] (result) in
                //
                //                    XFLog(message: result)
                //
                //                    comfun!(result)
                //                    if result == "授权成功" {
                //
                //                        self?.delegate?.WXLoginCallBack()
                //                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "123"), object: nil)
                //
                //                    }
                //
                //                })
                
                //                print("微信ID-微信头像-微信昵称",wxOPENID,wxHeadImgURL,wxNickName)
                
            }
            
            
        }, failure: { (error) in
            print("获取用户信息时出错 = \(error)")
        })
    }
}

// MARK:- 微信分享，
extension WXTool {
    
    
    /// 自定义微信分享
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - desc: 描述
    ///   - link: 链接
    ///   - imgUrl: 图片链接
    ///   - shareType: 分享类型
    func shareText(title : String,desc : String,link : String,imgUrl : String,shareType : Int) -> Void {
        
        if WXApi.isWXAppInstalled() == false {
            
            CustomAlertView.shared.alertWithTitle(strTitle: "未安装微信或版本不支持")
            
        } else {
            
            let message =  WXMediaMessage()
            
            //标题
            message.title = title
            
            //描述
            message.description = desc
            
            
            do {
                let img = try UIImage.init(data: Data.init(contentsOf: URL.init(string:imgUrl)!))
                
                let compresImage = UIImageJPEGRepresentation(img!, 0.1) as Data!
                
                message.setThumbImage(UIImage.init(data: compresImage!))
                
            } catch {
                
                return
            }
            
            
            let ext =  WXWebpageObject()
            ext.webpageUrl = imgUrl
            
            message.mediaObject = ext
            
            let req =  SendMessageToWXReq()
            req.bText = false
            req.message = message
            req.scene = Int32(WXScene(rawValue: UInt32(shareType)).rawValue)
            WXApi.send(req)
        }
    }
    
    /// 自定义微信分享
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - desc: 描述
    ///   - link: 链接
    ///   - imgUrl: 图片链接
    ///   - shareType: 分享类型
    //    WXSceneSession  = 0,        /**< 聊天界面    */
    //    WXSceneTimeline = 1,        /**< 朋友圈      */
    //    WXSceneFavorite = 2,        /**< 收藏       */
    func shareText(title : String,desc : String,shareType : Int) -> Void {
        
        if WXApi.isWXAppInstalled() == false {
            
            CustomAlertView.shared.alertWithTitle(strTitle: "未安装微信或版本不支持")
            
        } else {
            
            let message =  WXMediaMessage()
            
            //标题
            message.title = title
            
            //描述
            message.description = desc
            
            message.setThumbImage(UIImage.init(named: "shareImg"))
            
            //            let ext =  WXWebpageObject()
            //            ext.webpageUrl = imgUrl
            
            //            message.mediaObject = ext
            
            let req =  SendMessageToWXReq()
            req.bText = false
            req.message = message
            req.scene = Int32(WXScene(rawValue: UInt32(shareType)).rawValue)
            WXApi.send(req)
        }
    }
    
    
    ///UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
    //    layer.render(in: UIGraphicsGetCurrentContext()!)
    //    let image = UIGraphicsGetImageFromCurrentImageContext()
    //    UIGraphicsEndImageContext()
    
    func xxxxxx(title : String,desc : String,link : String,imgUrl : String,shareType : Int) -> Void {
        
        if WXApi.isWXAppInstalled() == false {
            
            CustomAlertView.shared.alertWithTitle(strTitle: "未安装微信或版本不支持")
            
        } else {
            
            let message =  WXMediaMessage()
            
            //标题
            message.title = title
            
            //描述
            message.description = desc
            ///  屏幕宽度、高度不为0
            guard frame.size.height > 0 && frame.size.width > 0 else {
                
                return
            }
            
            UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
            layer.render(in: UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            
            message.setThumbImage(image)
            
            
            let ext =  WXWebpageObject()
            ext.webpageUrl = imgUrl
            
            message.mediaObject = ext
            
            let req =  SendMessageToWXReq()
            req.bText = false
            req.message = message
            req.scene = Int32(WXScene(rawValue: UInt32(shareType)).rawValue)
            WXApi.send(req)
        }
    }
}



// MARK:- 单机授权登陆
extension WXTool {
    /// 单机验证
    ///
    /// - Parameter _com: 回调
    func clickAuto() -> Void {
        
        let accessToken = UserDefaults.standard.object(forKey: WX_ACCESS_TOKEN) as? String
        let openID = UserDefaults.standard.object(forKey: WX_OPEN_ID) as? String
        
        
        // 如果已经请求过微信授权登录，那么考虑用已经得到的access_token
        if (accessToken != nil) && (openID != nil) {
            let refreshToken = UserDefaults.standard.object(forKey: WX_REFRESH_TOKEN)!
            
            let refreshUrlStr = NSString.init(format: "%@/oauth2/refresh_token?appid=%@&grant_type=refresh_token&refresh_token=%@", WX_BASE_URL, WXPatient_App_ID, refreshToken as! CVarArg) as String
            
            //网络请求
            getWithPath(path: refreshUrlStr, paras: nil, success: { (responsObject) in
                print("\((#file as NSString).lastPathComponent):(\(#line))")
                
                //判读返回值是否为空
                guard let refreshDict = responsObject as? NSDictionary else {
                    return
                }
                
                print(refreshDict)
                
                
                /// 鉴别是否鉴权成功
                let isValueCorrect = refreshDict.allKeys.contains(where: { (value) -> Bool in
                    let vvv = value
                    if (vvv as AnyObject).contains(WX_ACCESS_TOKEN) {
                        return true
                    } else {
                        return false
                    }
                    
                })
                
                /// 返回信息正确进行下一步操作
                if isValueCorrect {
                    let reAccessToken = refreshDict[WX_ACCESS_TOKEN] as! String
                    
                    wxAccessToken = refreshDict["access_token"] as! String
                    
                    
                    print("wxAccessToken:",wxAccessToken)
                    
                    
                    // 如果reAccessToken为空,说明reAccessToken也过期了,反之则没有过期
                    if (reAccessToken.characters.count == 0) {
                        
                        UserDefaults.standard.set(refreshToken, forKey: WX_ACCESS_TOKEN)
                        UserDefaults.standard.set(refreshDict[WX_OPEN_ID], forKey: WX_OPEN_ID)
                        UserDefaults.standard.set(refreshDict[WX_REFRESH_TOKEN], forKey: WX_REFRESH_TOKEN)
                        UserDefaults.standard.synchronize()
                        // 当存在reAccessToken不为空时直接执行AppDelegate中的
                    } else {
                        //没获取相关微信授权信息，则进行获取
                        self.wechatLogin()
                    }
                    
                    
                } else {
                    print("请求鉴权信息出错")
                }
                
            }, failure: { (error) in
                
            })
        } else {
            wechatLogin()
        }
    }
    
    
    /// 微信登陆
    func wechatLogin() {
        
        if WXApi.isWXAppInstalled() == false {
            self.payBackMsg(msg: "未安装微信")
        } else {
            let req = SendAuthReq()
            req.scope = "snsapi_userinfo"
            req.state = "GSTDoctorApp"
            WXApi.send(req)
        }
        
    }
    
    
    
    //提示未安装微信
    func setupAlertController() {
        let alert = UIAlertController(title: "温馨提示", message: "请先安装微信客户端", preferredStyle: .alert)
        let actionConfirm = UIAlertAction(title: "确定", style: .default, handler: nil)
        alert.addAction(actionConfirm)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: { _ in })
    }
    
    
}

// MARK:- 支付
extension WXTool {
    
    /**
     
     微信支付方法
     
     :param: wxDict 从服务器返回来的字典数据
     
     */
    
    /// 微信支付
    ///
    /// - Parameter wxDict: 支付所需的信息
    func sendWXPay(wxDict: NSDictionary,_com:@escaping (_ _data:String)->Void) -> Void {
        pay = _com
        
        if !WXApi.isWXAppInstalled()  {//检查一下是否可以使用微信
            
            CustomAlertView.shared.alertWithTitle(strTitle: "未安装微信")
            return
            
        } else if !WXApi.isWXAppSupport() {
            
            CustomAlertView.shared.alertWithTitle(strTitle: "当前版本微信不支持微信支付")
            
            return
        }
        
        let req = PayReq()
        
        req.openID = WXPatient_App_ID
        //
        req.partnerId = wxPartnerId
        
        req.package = "Sign=WXPay"
        
        req.prepayId = wxDict["prepayid"] as! String
        
        let temp   = wxDict["timestamp"] as! NSString
        
        let temInt : Int = Int(temp as String)!
        
        req.timeStamp = UInt32(temInt)
        
        req.nonceStr = wxDict["noncestr"] as! String
        
        req.sign = wxDict["sign"] as! String
        
        WXApi.send(req) //调起微信
    }
    
}


extension WXTool {
    /// 警告框
    ///
    /// - Parameter msg: 警告信息
    func payBackMsg(msg : String) -> Void {
        let alertVC = UIAlertController.init(title: "提示信息", message: msg, preferredStyle: .alert)
        
        alertVC.addAction(UIAlertAction.init(title: "好的", style: .default, handler: nil))
        nav?.present(alertVC, animated: true, completion: nil)
    }
}

extension WXTool {
    /// 登陆
    func wxLoginSEL(autoCallback : WXAuthBack) -> Void {
        
        if WXApi.isWXAppInstalled() == false {
            CustomAlertView.shared.alertWithTitle(strTitle: "未安装微信或版本不支持")
        } else {
            self.clickAuto()
            
            if thirdNickName.characters.count == 0 {
                print(":还没执行到这呢")
            }
        }
    }
}

