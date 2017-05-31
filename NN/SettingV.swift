//
//  SettingV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/16.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  设置界面

import UIKit

class SettingV: UIView {

    /// 设置标题
    fileprivate lazy var setLabell: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: commonMargin, width: self.Width, height: self.Height * 0.15))
        d.image = #imageLiteral(resourceName: "setLabel")
        d.contentMode = .scaleAspectFit
        return d
    }()
    
    lazy var bgImgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "bgAlphaV")
        return d
    }()

    /// 音乐开关按钮
    lazy var musicBtn: UIImageView = {
        var d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width / 1.8, y: self.Height * 0.4 , width: self.Width * 0.3, height: 12 * screenScale))
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",localSave.object(forKey: "musicOpen") as Any)
        
        d.contentMode = UIViewContentMode.scaleAspectFit
        d.isUserInteractionEnabled = true
        let getTure = UITapGestureRecognizer.init(target: self, action: #selector(openMusicSwitch))
        d.addGestureRecognizer(getTure)
        return d
    }()
    
    /// 音效开关按钮
    lazy var musicalBtn: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width / 1.8, y: self.musicImg.BottomY + commonMargin * screenScale , width: self.Width * 0.3, height: 12 * screenScale))
        d.contentMode = UIViewContentMode.scaleAspectFit
        
        d.isUserInteractionEnabled = true
        let getTure = UITapGestureRecognizer.init(target: self, action: #selector(openMusicalSwitch))
        d.addGestureRecognizer(getTure)
        
        return d
    }()
    
    /// 音乐
    lazy var musicImg: UIImageView = {
        
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.15, y: self.Height * 0.4, width: self.Width * 0.2, height: 12 * screenScale))
        d.image = #imageLiteral(resourceName: "music")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    lazy var musicalImg: UIImageView = {
        
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.15, y: self.musicImg.BottomY + commonMargin * screenScale, width: self.Width * 0.2, height: 12 * screenScale))
        d.image = #imageLiteral(resourceName: "musiccal")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    
    /// 标记是否音乐打开
    var musicMark : Int = 1
    
    /// 标记是否音效打开
    var musicalMark : Int = 1
    
    @objc fileprivate func openMusicSwitch() -> Void {
        if localSave.object(forKey: "musicOpen") != nil {
            musicMark = localSave.object(forKey: "musicOpen") as! Int
            musicMark += 1
        } else {
            musicMark += 1
        }
        
        if musicMark % 2 == 1 {
            self.musicBtn.image = #imageLiteral(resourceName: "on")
            
            MusicTool.shared.backgroundMusic(soundName: "nn_bg_music", withType: "mp3")
        } else {
            self.musicBtn.image = #imageLiteral(resourceName: "off")
            MusicTool.shared.pauseMusic(filename: "nn_bg_music", withType: "mp3")
            
        FTIndicator.showToastMessage("当前暂无音乐播放")
        }
        
        localSave.set(musicMark, forKey: "musicOpen")
        localSave.synchronize()
    }
    
    @objc fileprivate func openMusicalSwitch() -> Void {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        if localSave.object(forKey: "musicalOpen") != nil {
            musicalMark = localSave.object(forKey: "musicalOpen") as! Int
            musicalMark += 1
        } else {
            musicalMark += 1
        }
        
        if musicalMark % 2 == 1 {
            self.musicalBtn.image = #imageLiteral(resourceName: "on")
        } else {
            self.musicalBtn.image = #imageLiteral(resourceName: "off")
        }
        
        localSave.set(musicalMark, forKey: "musicalOpen")
        localSave.synchronize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bgImgV)
        addSubview(setLabell)
        addSubview(musicBtn)
        addSubview(musicalBtn)
        addSubview(musicImg)
        addSubview(musicalImg)
        
        /// 检查音乐是否保存设置
        if localSave.object(forKey: "musicOpen") != nil {
            let dd = localSave.object(forKey: "musicOpen") as! Int
            musicMark = dd
            
            if dd % 2 == 1 {
                self.musicBtn.image = #imageLiteral(resourceName: "on")
            } else {
                self.musicBtn.image = #imageLiteral(resourceName: "off")
            }
        } else {
            self.musicBtn.image = #imageLiteral(resourceName: "on")
        }
        
        /// 检查音效是否保存设置
        if localSave.object(forKey: "musicalOpen") != nil {
            let dd = localSave.object(forKey: "musicalOpen") as! Int
            musicMark = dd
            
            if dd % 2 == 1 {
                self.musicalBtn.image = #imageLiteral(resourceName: "on")
            } else {
                self.musicalBtn.image = #imageLiteral(resourceName: "off")
            }
        } else {
            self.musicalBtn.image = #imageLiteral(resourceName: "on")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
