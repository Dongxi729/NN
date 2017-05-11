//
//  AppDelegate.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/24.
//  Copyright © 2017年 郑东喜. All rights reserved.
//
import UIKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let tool = WXTool()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window?.rootViewController = LoginViewController()
//        window?.rootViewController = GamingVC()
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.white
        
        WXApi.registerApp(WXPatient_App_ID)

        print(getTime())
        
        return true
    }

    
    

  
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        let wxUrl = String(format: "%@", arguments: [WXPatient_App_ID])
        
        if url.absoluteString.hasPrefix(wxUrl) {
            return WXApi.handleOpen(url, delegate: tool)
            
        }
        return true
    }
    
}


