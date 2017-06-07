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
    
    /// 发送心跳包
    class func startSendAliveMsg() -> Void {
        TImerTool.shared.timerCount(seconds: 5)
    }
    
    /// 检查是否收到心跳包正确信息
    class func checkreceiveHeartInfo() {
        TImerTool.shared.checkTimerStart()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window?.rootViewController = ViewController()
        
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.white
        
        WXApi.registerApp(WXPatient_App_ID)
        
        //        playMusic()
        return true
    }
    
    fileprivate var musicMark : Int = 1
    
    /// 播放音乐
    private func playMusic() -> Void {
        if localSave.object(forKey: "musicOpen") != nil {
            musicMark = localSave.object(forKey: "musicOpen") as! Int
        }
        
        if musicMark % 2 == 1 {
            
            MusicTool.shared.backgroundMusic(soundName: "nn_bg_music", withType: "mp3")
        }
    }
    
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        let wxUrl = String(format: "%@", arguments: [WXPatient_App_ID])
        
        if url.absoluteString.hasPrefix(wxUrl) {
            return WXApi.handleOpen(url, delegate: tool)
            
        }
        return true
    }
    
    
}


