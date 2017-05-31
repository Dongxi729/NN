//
//  VoicieControl.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/2.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit
import MediaPlayer


class VoicieControl: UIViewController {

    var mpVolumeView: MPVolumeView!
    var volumeSlider: UISlider!
    var volumeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        let d : UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 300))
        
        view.addSubview(d)
        
        d.center = view.center
        
        let voice = ControlVoice.init(frame: CGRect.init(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 30))
        d.addSubview(voice)
    }
    
    func actionVolumPlus() {
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
            volumeLabel = UILabel(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: 30))
            volumeLabel.textAlignment = NSTextAlignment.center
            self.view.addSubview(volumeLabel)
            
            mpVolumeView = MPVolumeView(frame: CGRect(x: 20, y: 150, width: self.view.frame.width - 40, height: 30))
            self.view.addSubview(mpVolumeView)
            
            for view: UIView in mpVolumeView.subviews {
                if (NSStringFromClass(view.classForCoder) == "MPVolumeSlider") {
                    volumeSlider = view as! UISlider;
                    volumeSlider.sendActions(for: .touchUpInside)
                    volumeSlider.addTarget(self, action: #selector(VoicieControl.actionSliderChanged(_:)), for: UIControlEvents.allTouchEvents)
                    
                    volumeLabel.text = "\(volumeSlider.value)"
                }
            }
        }
    }
    
    func actionSliderChanged(_ sender: UISlider) {
        volumeLabel.text = "\(volumeSlider.value)"
    }
}
