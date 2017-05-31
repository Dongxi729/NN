//
//  TestMusicVC.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/31.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  测试音乐播放器

import UIKit

class TestMusicVC: UIViewController {

    lazy var playBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        d.addTarget(self, action: #selector(playSEl), for: .touchUpInside)
        d.backgroundColor = UIColor.randomColor()
        d.setTitle("播放", for: .normal)
        return d
    }()
    
    lazy var pauseBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 110, y: 0, width: 100, height: 100))
        d.setTitle("暂停", for: .normal)
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(pauseSEL), for: .touchUpInside)
        return d
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(playBtn)
        view.addSubview(pauseBtn)
        
        view.addSubview(playBtn)
        view.addSubview(pauseBtn)
    }
    
    func playSEl(sender : UIButton) -> Void {
        MusicTool.shared.playNiuNiuMusic(soundName: "f0_nn6", withType: "mp3")
    }
    
    
    func pauseSEL(sender : UIButton) -> Void {
        MusicTool.shared.pauseMusic(filename: "f0_nn6", withType: "mp3")
    }
}
