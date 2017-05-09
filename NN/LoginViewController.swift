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

    
    lazy var wxloginBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        d.addTarget(self, action: #selector(wxloginSEL(sender:)), for: .touchUpInside)
        d.backgroundColor = UIColor.blue
        d.setTitle("微信登陆", for: .normal)
        return d
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(wxloginBtn)
    }
    
    func wxloginSEL(sender : UIButton) -> Void {
        
        /// 取出本地的微信授权信息opendi、accesstoken
        guard let woid = localSave.object(forKey: wx_openID) as? String else {
            return
        }
        
        print(woid)
        
        guard let waccess = localSave.object(forKey: wx_access) as? String else {
            return
        }
        
        print(waccess)
        
        if woid.isEmpty == false && waccess.isEmpty == false {
            LoginRequestTool.shared.getUserInfo(woid, waccess, finished: { (userDta) in
                print("userData",userDta)
            })
        } else {
            /// 获取微信的openid、accesstoken
            if WXApi.isWXAppInstalled() == false {
                CustomAlertView.shared.alertWithTitle(strTitle: "未安装微信或版本不支持")
            } else {
                wxTool.clickAuto()
                
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",thirdHeadImgURL,thirdNickName,thirdOpenID)
            }
        }
        
        
        
        

//        let wxaccess = localSave.object(forKey: WX_ACCESS_TOKEN) as! String
//        let openid = localSave.object(forKey: wx_openID)
//        
//        print("wxaccess",wxaccess)
//        print("openid",openid)
    }
}
