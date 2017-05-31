//
//  MusicTool.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/17.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  音乐播放器

import UIKit
import AVFoundation
import MediaPlayer
import AVKit
import AudioToolbox  //导入音频工具箱框架，使用系统声音服务

class MusicTool: NSObject {
    //初始化音频播放对象，将音频播放对象，作为试图控制器的类的属性
    
    var audioPlayer:AVAudioPlayer = AVAudioPlayer()
   
    static let shared = MusicTool()
    
    
    /// 播放音乐
    ///
    /// - Parameters:
    ///   - soundName: 音乐名字
    ///   - withType: 音乐类型
    func backgroundMusic(soundName: String,withType:String)  {
        //获取音频会话对象，改对象属于单利模式，也就是说不用开发者写，自行实例化，这个类在各种音频环境中起着非常重要的作用
        let session = AVAudioSession.sharedInstance()
        //在音频播放前，首先创建一个异常捕捉语句
        do{
            //启动音频会话管理，此时会阻断后台音乐播放
            try session.setActive(true)
            //设置音频播放类别，表示该应用仅支持音频播放
            try session.setCategory(AVAudioSessionCategoryPlayback)
            
            //定义一个字符串变量，描述声音文件的路径
            let path = Bundle.main.path(forResource: soundName, ofType: withType)
            //将字符串路径转化为网址路径
            let soundUrl = URL(fileURLWithPath: path!)
            
            try audioPlayer = AVAudioPlayer(contentsOf:soundUrl)
            //为音频播放做好准备
            audioPlayer.prepareToPlay()
            //设置音量
            audioPlayer.volume = 0.2
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
            
        }catch{
            print(error)
        }
        
    }
    
    /// 播放音乐
    ///
    /// - Parameters:
    ///   - soundName: 音乐名字
    ///   - withType: 音乐类型
    func playNiuNiuMusic(soundName: String,withType:String)  {
        //获取音频会话对象，改对象属于单利模式，也就是说不用开发者写，自行实例化，这个类在各种音频环境中起着非常重要的作用
        let session = AVAudioSession.sharedInstance()
        //在音频播放前，首先创建一个异常捕捉语句
        do{
            //启动音频会话管理，此时会阻断后台音乐播放
            try session.setActive(true)
            //设置音频播放类别，表示该应用仅支持音频播放
            try session.setCategory(AVAudioSessionCategoryPlayback)
            
            //定义一个字符串变量，描述声音文件的路径
            let path = Bundle.main.path(forResource: soundName, ofType: withType)
            //将字符串路径转化为网址路径
            let soundUrl = URL(fileURLWithPath: path!)
            
            try audioPlayer = AVAudioPlayer(contentsOf:soundUrl)
            //为音频播放做好准备
            audioPlayer.prepareToPlay()
            //设置音量
//            audioPlayer.volume = 0.2
//            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
            
        }catch{
            print(error)
        }

    }
    
    
    /// 停止音乐
    func pauseMusic(filename: String,withType : String) {
        let session = AVAudioSession.sharedInstance()
        //在音频播放前，首先创建一个异常捕捉语句
        do{
            //启动音频会话管理，此时会阻断后台音乐播放
            try session.setActive(true)
            //设置音频播放类别，表示该应用仅支持音频播放
            try session.setCategory(AVAudioSessionCategoryPlayback)
            
            //定义一个字符串变量，描述声音文件的路径
            let path = Bundle.main.path(forResource: filename, ofType: withType)
            //将字符串路径转化为网址路径
            let soundUrl = URL(fileURLWithPath: path!)
            
            try audioPlayer = AVAudioPlayer(contentsOf:soundUrl)
            //为音频播放做好准备
            audioPlayer.prepareToPlay()
            //设置音量

            audioPlayer.stop()
            
        }catch{
            print(error)
        }
    
    }
    
    
}
