//
//  MusicTool.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/17.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit
import UIKit
import AVFoundation

class MusicTool: NSObject {
    // MARK:- 音效
    /// 音效文件字典
    static var soundIDs = [String: Any]()
    
    /// 通过不同的音效文件名播放不同的音效
    ///
    /// - Parameter fileName: 音效文件名
    static func playSound(fileName: String) {
        // 1.通过音效文件名为key到字典中获取对应soundID
        var soundID = soundIDs[fileName] as? SystemSoundID ?? 0
        
        // 2.判断soundID是否有值,如果没有值则创建,之后保存到字典中
        if soundID == 0 {
            // 生成soundID
            // 参数1: 音效文件的URL
            // 参数2: 通过参数1生成的soundID
//            guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else { return }
            guard let url = Bundle.main.path(forResource: fileName, ofType: ".mp3") else {
                return
            }
            AudioServicesCreateSystemSoundID(url as! CFURL, &soundID)
            
            // 保存到字典中
            soundIDs[fileName] = soundID
        }
        
        // 3.播放音效
        // 播放的时候伴随着手机震动效果
        AudioServicesPlayAlertSound(soundID)
        // 没有震动效果
        //        AudioServicesPlaySystemSound(soundID)
    }
    
    // MARK:- 音乐
    /// 播放器字典
    static var players = [String : Any]()
    /// 播放音乐
    ///
    /// - Parameter file: 音乐文件名
    static func playMusic(filename: String) {
        
        // 1.从字典中通过音乐文件名作为key取出对应的播放器
        var player = players[filename] as? AVAudioPlayer
        
        // 2.判断播放器是否为nil,如果为nil那么,通过音乐文件名创建播放器,保存到字典中
        if player == nil {
            // 1.创建音乐的URL
            guard let url = Bundle.main.url(forResource: filename, withExtension: "mp3") else { return }
            
            // 2.创建播放器
            do {
                player = try AVAudioPlayer(contentsOf: url)
                
                // 准备播放
                player?.prepareToPlay()
                
                // 将播放器保存到字典中
                players[filename] = player
                
            } catch {
                print(error)
                return
            }
            
        }
        
        // 3.播放音乐
        player?.play()
    }
    
    /// 暂停播放音乐
    ///
    /// - Parameter file: 音乐文件名
    static func pauseMusic(filename: String) {
        // 1.从字典中通过音乐文件名作为key取出对应的播放器
        let player = players[filename] as? AVAudioPlayer
        
        // 2.暂停播放音乐
        player?.pause()
    }
    
    /// 停止播放音乐
    ///
    /// - Parameter file: 音乐文件名
    static func stopMusic(filename: String) {
        
        // 1.从字典中通过音乐文件名作为key取出对应的播放器
        var player = players[filename] as? AVAudioPlayer
        
        // 2.停止播放音乐
        player?.stop()
        player = nil
        
        // 3.从字典中移除
        players.removeValue(forKey: filename)
    }
    
    
}
