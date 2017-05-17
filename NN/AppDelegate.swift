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
        
        window?.rootViewController = MainGameViewController()
//        window?.rootViewController = LoginViewController()
        
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.white
        
        WXApi.registerApp(WXPatient_App_ID)
        
        return true
    }

    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //  Converted with Swiftify v1.0.6341 - https://objectivec2swift.com/
//        let touch: UITouch? = touches.first
//        let touchPoint: CGPoint? = touch?.location(in: UIApplication.shared.keyWindow?.rootViewController?.view)
//        print("\(String(describing: touchPoint?.x))==\(String(describing: touchPoint?.y))")
//        let stringFloat = Int((touchPoint?.x)!)
//        let stringFloat1 = Int((touchPoint?.y)!)
//        print("\(stringFloat)\(stringFloat1)")
//
//    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("applicationDidBecomeActive")
    }
    

  
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        let wxUrl = String(format: "%@", arguments: [WXPatient_App_ID])
        
        if url.absoluteString.hasPrefix(wxUrl) {
            return WXApi.handleOpen(url, delegate: tool)
            
        }
        return true
    }
    
}


