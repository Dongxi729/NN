//
//  ViewController.swift
//  WX
//
//  Created by 郑东喜 on 2017/1/5.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  微信登陆、分享、朋友圈

import UIKit

class ViewController: UIViewController {

    //QQ登陆
    var wxLogin = UIButton()
    
    //分享
    var wxShare = UIButton()
    
    //支付
    var wxPay = UIButton()
    
    lazy var centerBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 100 * screenScale, height: 100 * screenScale))
        d.backgroundColor = UIColor.red
        return d
    }()
    
    //QQTool
    var wxTool = WXTool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
        view.addSubview(centerBtn)
        
        
        //支付按钮
        wxLogin = UIButton()
        wxLogin.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        wxLogin.center = view.center
        wxLogin.backgroundColor = UIColor.gray
        wxLogin.addTarget(self, action: #selector(wxLoginSEL), for: .touchUpInside)
        wxLogin.setTitle("微信登陆", for: .normal)
        
        //支付按钮
        wxShare = UIButton()
        wxShare.frame = CGRect(x: wxLogin.Width, y: wxLogin.BottomY + 20, width: 100, height: 30)
        
        wxShare.addTarget(self, action: #selector(wxShareSEL), for: .touchUpInside)
        wxShare.backgroundColor = UIColor.gray
        wxShare.setTitle("微信分享", for: .normal)
        
        //支付按钮
        wxPay = UIButton()
        wxPay.frame = CGRect(x: wxLogin.Width, y: wxShare.BottomY + 20, width: 100, height: 30)
        
        wxPay.addTarget(self, action: #selector(weixinPay), for: .touchUpInside)
        wxPay.backgroundColor = UIColor.gray
        wxPay.setTitle("微信支付", for: .normal)
        
        
        view.addSubview(wxLogin)
        view.addSubview(wxShare)
        view.addSubview(wxPay)
    }
    
    //支付
    
    /// 登陆
    func wxLoginSEL() -> Void {
        
        if WXApi.isWXAppInstalled() == false {
            CustomAlertView.shared.alertWithTitle(strTitle: "未安装微信或版本不支持")
        } else {
            wxTool.clickAuto()
            
            sleep(1)
            
            
        }
    }
    
    
    
    /*! @brief 分享场景
     *
     */
//    enum WXScene {
//        WXSceneSession  = 0,        /**< 聊天界面    */
//        WXSceneTimeline = 1,        /**< 朋友圈      */
//        WXSceneFavorite = 2,        /**< 收藏       */
//    };

    func wxShareSEL() -> Void {
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",thirdNickName)
        
        if WXApi.isWXAppInstalled() == false {
            CustomAlertView.shared.alertWithTitle(strTitle: "未安装微信或版本不支持")
        } else {
            
            let alertVC = UIAlertController.init(title: "提示", message: "分享至", preferredStyle: .actionSheet)
            alertVC.addAction(UIAlertAction.init(title: "好友", style: .default, handler: { (false) in
                self.wxTool.shareText(title: "测试", desc: "就是测试", link: "www.baidu.com", imgUrl: "http://upload-images.jianshu.io/upload_images/906389-1ca000d41787f8f5.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240", shareType: 0)
            }))
            
            alertVC.addAction(UIAlertAction.init(title: "朋友圈", style: .default, handler: { (false) in
                self.wxTool.shareText(title: "测试", desc: "就是测试", link: "www.baidu.com", imgUrl: "http://upload-images.jianshu.io/upload_images/906389-1ca000d41787f8f5.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240", shareType: 1)
            }))
            
            alertVC.addAction(UIAlertAction.init(title: "收藏", style: .default, handler: { (false) in
                self.wxTool.shareText(title: "测试", desc: "就是测试", link: "www.baidu.com", imgUrl: "http://upload-images.jianshu.io/upload_images/906389-1ca000d41787f8f5.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240", shareType: 2)
            }))
            
            alertVC.addAction(UIAlertAction.init(title: "取消", style: .destructive, handler: { (false) in
                
            }))
            
            self.present(alertVC, animated: true, completion: nil)
        }

    }
    

    
    /**
     noncestr = 9a3dd4b8567747a5aa6b949065255d23;
     prepayid = wx201701051710489b60009b730164476901;
     sign = 28B633B390F29F41293EC78D2EC357BE;
     timestamp = 1483607428;
     */
    func weixinPay() -> Void {
        let payDic = ["noncestr" : "9a3dd4b8567747a5aa6b949065255d23",
                      "prepayid" : "wx201701051710489b60009b730164476901",
                      "sign" : "28B633B390F29F41293EC78D2EC357BE",
                      "timestamp" : "1483607428"]
        
        
        if WXApi.isWXAppInstalled() == false {
            CustomAlertView.shared.alertWithTitle(strTitle: "未安装微信或版本不支持")
            
        } else {

            WXTool.shared.sendWXPay(wxDict: payDic as NSDictionary, _com: { (result) in

                /**
                 ## 支付结果返回 result 👆

                -2    用户退出支付
                -1    支付事变
                0     支付成功
                 */
                switch result {
                case "-2":
                    
                    print("用户退出支付")
                    //..执行用户退出支付。。。
                    break
                    
                case "0":
                    //...执行支付成功。。。
                    print("支付成功")
                    break
                    
                case "-1":
                    print("支付失败")
                    //...执行支付失败。。。
                    break
                    
                default:
                    break
                }
                
            })
        }

    }


}

