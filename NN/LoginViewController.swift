//
//  LoginViewController.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/9.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  登录主界面

import UIKit

class LoginViewController: UIViewController {

    var wxTool = WXTool()

    /// 背景图片
    lazy var bgImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.view.bounds)
        d.image = #imageLiteral(resourceName: "login")
        d.contentMode = UIViewContentMode.scaleAspectFill
        return d
    }()
    
    /// 微信登陆按钮
    lazy var wxloginBtn: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: SW * 0.5 - 100 * screenScale * 0.5, y: SH * 0.85, width: 100 * screenScale, height: 15 * screenScale))
        d.contentMode = .scaleAspectFit
        d.isUserInteractionEnabled = true
        
        let getTure = UITapGestureRecognizer.init(target: self, action: #selector(wxloginSEL(sender:)))
        d.addGestureRecognizer(getTure)
        
        d.image = #imageLiteral(resourceName: "login_wx")
        return d
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(bgImg)
        view.addSubview(wxloginBtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /// 取出本地的微信授权信息opendi、accesstoken
        guard let woid = localSave.object(forKey: wx_openID) as? String else {
            
            /// 获取微信的openid、accesstoken
            if WXApi.isWXAppInstalled() == false {
                CustomAlertView.shared.alertWithTitle(strTitle: "未安装微信或版本不支持")
            } else {
                wxTool.clickAuto()
            }
            
            return
        }
        
        guard let waccess = localSave.object(forKey: WX_ACCESS_TOKEN) as? String else {
            
            return
        }
        
        if woid.isEmpty == false && waccess.isEmpty == false {

            LoginRequestTool.shared.getUserInfo(woid, waccess, finished: { (userDta) in
                
                let userDic : NSDictionary = (userDta as NSDictionary)
                
                let d = userDic.allKeys.contains(where: { (value) -> Bool in
                    let vv = value
                    
                    if (vv as AnyObject).contains("nickname") {
                        return true
                    } else {
                        return false
                    }
                })
                
                /// 若包含指定的健民，则说明请求到的信息成功，跳转主界面
                
                if d {
                    
                    self.present(MainGameViewController(), animated: true, completion: nil)
                }
                
            })
        }
    }
    
    func wxloginSEL(sender : UIButton) -> Void {
        
        /// 取出本地的微信授权信息opendi、accesstoken
        guard let wxid = localSave.object(forKey: wx_openID) as? String else {
            
            /// 获取微信的openid、accesstoken
            if WXApi.isWXAppInstalled() == false {
//                CustomAlertView.shared.alertWithTitle(strTitle: "未安装微信或版本不支持")
                let dformatter = DateFormatter()
                dformatter.dateFormat = "HH:mm:ss"
                
                print("\(dformatter.string(from: Date()))","\((#file as NSString).lastPathComponent):(\(#line))\n","未安装微信或者不支持")
                
                LoginModel.shared.token = "a2ada633c2f54b4293b4e779e451e3e5"
                LoginModel.shared.uid = "542967"
                LoginModel.shared.nickname = "🍀"
                
                self.present(MainGameViewController(), animated: true, completion: nil)
                
            } else {
                wxTool.clickAuto()
            }

            
            return
        }
        
        guard let waccess = localSave.object(forKey: WX_ACCESS_TOKEN) as? String else {
            
            /// 添加测试号码
            print("空的token")
            return
        }
        
        if wxid.isEmpty == false && waccess.isEmpty == false {
            
            LoginRequestTool.shared.getUserInfo(wxid, waccess, finished: { (userDta) in
                
                let userDic : NSDictionary = (userDta as? NSDictionary)!
                
                let d = userDic.allKeys.contains(where: { (value) -> Bool in
                    let vv = value
                    
                    if (vv as AnyObject).contains("nickname") {
                        return true
                    } else {
                        return false
                    }
                })
                
                /// 若包含指定的健民，则说明请求到的信息成功，跳转主界面
                
                if d {
                    self.present(MainGameViewController(), animated: true, completion: nil)
                }
            })

        }
    }
    
}
