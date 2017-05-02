//
//  ControlVoice.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/2.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  音量控制工具

import UIKit
import MediaPlayer

class ControlVoice: UIView {
    
    var mpVolumeView: MPVolumeView!
    var volumeSlider: UISlider!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        actionVolumPlus()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func actionVolumPlus() {
        if AVAudioSession.sharedInstance().isOtherAudioPlaying {
            do {
                try AVAudioSession.sharedInstance().setActive(false)
            } catch {
            }
        } else {
            do {
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
            }
        }
        
        if (mpVolumeView == nil) {
            
            mpVolumeView = MPVolumeView.init(frame: self.bounds)
            addSubview(mpVolumeView)
            
            for view: UIView in mpVolumeView.subviews {
                if (NSStringFromClass(view.classForCoder) == "MPVolumeSlider") {
                    volumeSlider = view as! UISlider;
                    volumeSlider.sendActions(for: .touchUpInside)
                }
            }
        }
    }
}
