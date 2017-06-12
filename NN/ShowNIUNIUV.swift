//
//  ShowNIUNIUV.swift
//  hangge_646_2
//
//  Created by 郑东喜 on 2017/6/8.
//  Copyright © 2017年 hangge. All rights reserved.
//  显示牛牛视图

import UIKit


class ShowNIUNIUV: UIView {

    // MARK: - 隐藏当前视图
    @objc fileprivate func hideSELF(sender : UIButton) -> Void {
        self.removeFromSuperview()
        
        /// 发出通知，通知下一局开始
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NextRoundStart"), object: nil)
    }

    // MARK: - 显示牛牛的歌词名字
    var niuniuSongsName : [String] = [] {
        didSet {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",niuniuSongsName)
            NotificationCenter.default.addObserver(self, selector: #selector(listenPlayEnded), name: NSNotification.Name(rawValue: "PlayEnded"), object: nil)
            playMusicSongs(index: playINdex)
        }
    }
    
    
    // MARK: - 位置坐标
    var rects : [CGRect] = [CGRect.init(x: SW * 0.15, y: SH * 0.8, width: SW * 0.18, height: SH * 0.15),
                            CGRect.init(x: SW * 0.06, y: SH * 0.56, width: SW * 0.18, height: SH * 0.15),
                            CGRect.init(x: SW * 0.06, y: SH * 0.35, width: SW * 0.18, height: SH * 0.15),
                            CGRect.init(x: 0.45 * SW, y: 0.13 * SH, width: SW * 0.18, height: SH * 0.15),
                            CGRect.init(x: SW * 0.8, y: SH * 0.35, width: SW * 0.18, height: SH * 0.15),
                            CGRect.init(x: SW * 0.8, y: SH * 0.55, width: SW * 0.18, height: SH * 0.15)]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
    }
    
    // MARK: - 添加的分数图标
    var scoreImg = ScoreV()
    
    // MARK: - 播放分数
    func playScore() {

        DispatchQueue.main.async {
            
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "showScoreNotifi"), object: nil)
            
            var index = 0
            
            for _ in self.rects {
                guard let xxx = UserDefaults.standard.object(forKey: "用户剩余分数") as? [String] else {

                    return
                }
                
                var type = 0
                if Int(xxx[index])! > 0 {
                    type = 1
                } else {
                    type = 2
                }
                
                self.scoreImg = ScoreV.init(frame: self.rects[index])
                self.scoreImg.backgroundColor = UIColor.randomColor()
                self.scoreImg.abc(abc: xxx[index], scoreType: type)
                self.addSubview(self.scoreImg)
                index += 1
            
                if index == RoomModel.shared.currentPersonInRoom {
                    break
                }
            }
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 播放的索引
    var playINdex : Int = 0
    
    // MARK: - 牛牛图标
    var imgs : CommonNNImg!
    
    @objc fileprivate func listenPlayEnded() -> Void {
        
        
//        [CGRect.init(x: SW * 0.3, y: SH * 0.75, width: SW * 0.4, height: SH * 0.15),
//                                            CGRect.init(x: SW * 0.25 - SW * 0.05, y: SH * 0.56, width: SW * 0.4, height: SH * 0.15),
//                                            CGRect.init(x: SW * 0.25 - SW * 0.05, y: SH * 0.35, width: SW * 0.4, height: SH * 0.15),
//                                            CGRect.init(x: SW * 0.5 - SW * 0.05, y: SH * 0.13, width: SW * 0.4, height: SH * 0.15),
//                                            CGRect.init(x: SW * 0.6 - SW * 0.05, y: SH * 0.35, width: SW * 0.4, height: SH * 0.15),
//                                            CGRect.init(x: SW * 0.6 - SW * 0.05, y: SH * 0.55, width: SW * 0.4, height: SH * 0.15)]
        /// 绘制牛牛纸牌的位置
        
        var rect = CGRect.init()
        
        switch playINdex {
        case 1:
            ///         let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.3, y: self.Height * 0.75, width: self.Width * 0.4, height: self.Height * 0.2))
            rect = CGRect.init(x: SW * 0.3, y: SH * 0.75, width: SW * 0.4, height: SH * 0.15)
            break
        case 2:
            rect = CGRect.init(x: SW * 0.25 - SW * 0.05, y: SH * 0.56, width: SW * 0.4, height: SH * 0.15)
 
            break
        case 3:
            rect = CGRect.init(x: SW * 0.25 - SW * 0.05, y: SH * 0.35, width: SW * 0.4, height: SH * 0.15)
     
            break
        case 4:
            rect = CGRect.init(x: SW * 0.5 - SW * 0.05, y: SH * 0.13, width: SW * 0.4, height: SH * 0.15)
            break
        case 5:
            rect = CGRect.init(x: SW * 0.6 - SW * 0.05, y: SH * 0.35, width: SW * 0.4, height: SH * 0.15)

            break
        case 6:
            rect = CGRect.init(x: SW * 0.6 - SW * 0.05, y: SH * 0.55, width: SW * 0.4, height: SH * 0.15)

            break

        default:
            print("\((#file as NSString).lastPathComponent):(\(#line))\n")
            break
        }
        
        imgs = CommonNNImg.init(frame: rect)
        imgs.image = UIImage.init(named: songsNameConvertToNNImgName(songsName: niuniuSongsName[playINdex - 1]))

        
//        imgs.backgroundColor = UIColor.green
        self.addSubview(imgs)
        
        self.playMusicSongs(index: playINdex)
    }
    
    /// 播放音乐
    @objc fileprivate func playMusicSongs(index : Int) -> Void {
        
        if index < niuniuSongsName.count {
            MusicTool.shared.playNiuNiuMusic(soundName: niuniuSongsName[index], withType: "mp3")
            playINdex += 1
        }
        
    }

}

extension ShowNIUNIUV {
    func songsNameConvertToNNImgName(songsName : String) -> String {
        var str : String = ""
        
        switch songsName {
        case "f0_nn0":
            str = "niu0"
            break
        case "f0_nn1":
            str = "niu1"
            break
        case "f0_nn2":
            
            str = "niu2"
            break
        case "f0_nn3":
            str = "niu3"
            break
        case "f0_nn4":
            str = "niu4"
            break
        case "f0_nn5":
            str = "niu5"
            break
        case "f0_nn6":
            str = "niu6"
            break
        case "f0_nn7":
            str = "niu7"
            break
        case "f0_nn8":
            str = "niu8"
            break
        case "f0_nn9":
            str = "niu9"
            break
        case "f0_nn10":
            str = "niu10"
            break
        case "f0_nn103":
            str = "niu12"
            break
        case "f0_nn105":
            str = "niu11"
            break
            
        default:
            break
        }
        
        return str
    }
}

class CommonNNImg : UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentMode = UIViewContentMode.scaleAspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

