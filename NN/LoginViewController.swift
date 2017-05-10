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
        d.image = UIImage.init(named: "LoginBG")

        return d
    }()
    
    /// 微信登陆按钮
    lazy var wxloginBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: SW * 0.5 - (100 * screenScale) * 0.5, y: SH * 0.7, width: 100, height: 100))
        d.addTarget(self, action: #selector(wxloginSEL(sender:)), for: .touchUpInside)
        d.backgroundColor = UIColor.blue
        d.setTitle("微信登陆", for: .normal)
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
            print("撒大声地")
            /// 获取微信的openid、accesstoken
            if WXApi.isWXAppInstalled() == false {
                CustomAlertView.shared.alertWithTitle(strTitle: "未安装微信或版本不支持")
            } else {
                wxTool.clickAuto()
            }
            
            
            return
        }
        
        guard let waccess = localSave.object(forKey: WX_ACCESS_TOKEN) as? String else {
            
            print("wacess")
            return
        }
        
        
        
        if woid.isEmpty == false && waccess.isEmpty == false {
            print("===")
            
            LoginRequestTool.shared.getUserInfo(woid, waccess, finished: { (userDta) in
                print("userData",userDta)
                
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
                    
                    print("ddd")
                    self.present(MainGameViewController(), animated: true, completion: nil)
                }
                
            })
        }

    }
    
    func wxloginSEL(sender : UIButton) -> Void {
        
        /// 取出本地的微信授权信息opendi、accesstoken
        guard let woid = localSave.object(forKey: wx_openID) as? String else {
            print("撒大声地")
            /// 获取微信的openid、accesstoken
            if WXApi.isWXAppInstalled() == false {
                CustomAlertView.shared.alertWithTitle(strTitle: "未安装微信或版本不支持")
            } else {
                wxTool.clickAuto()
            }

            
            return
        }
        
        guard let waccess = localSave.object(forKey: WX_ACCESS_TOKEN) as? String else {
            
            print("wacess")
            return
        }
        

        
        if woid.isEmpty == false && waccess.isEmpty == false {
            print("===")
            
            LoginRequestTool.shared.getUserInfo(woid, waccess, finished: { (userDta) in
                print("userData",userDta)
                
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
                    
                    print("ddd")
                    self.present(MainGameViewController(), animated: true, completion: nil)
                }
                
            })
        }
    }
}