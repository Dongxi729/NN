//
//  RecorderVC.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/25.
//  Copyright © 2017年 郑东喜. All rights reserved.
//


import UIKit
import AVFoundation

class RecorderVC: UIViewController {
    
    var tool = AvdioTool.init()
    
    var audioRecorder: AVAudioRecorder? // 录音
    var audioPlayer: AVAudioPlayer? // 播放
    
    fileprivate var startRecordBt: UIButton = {
        let button: UIButton = UIButton(frame: CGRect(x: 60.0, y: 100.0, width: 200.0, height: 50.0))
        button.setTitle("开始录音", for: UIControlState.normal)
        button.setTitleColor(UIColor.gray, for: UIControlState.selected)
        button.backgroundColor = UIColor.red
        return button
    }()
    
    fileprivate var stopRecordBt: UIButton = {
        let button: UIButton = UIButton(frame: CGRect(x: 60.0, y: 200.0, width: 200.0, height: 50.0))
        button.setTitle("结束录音", for: UIControlState.normal)
        button.setTitleColor(UIColor.gray, for: UIControlState.selected)
        button.backgroundColor = UIColor.red
        return button
    }()
    
    fileprivate var startPlayBt: UIButton = {
        let button: UIButton = UIButton(frame: CGRect(x: 60.0, y: 300.0, width: 200.0, height: 50.0))
        button.setTitle("播放录音", for: UIControlState.normal)
        button.setTitleColor(UIColor.gray, for: UIControlState.selected)
        button.backgroundColor = UIColor.red
        return button
    }()
    
    fileprivate var stopPlayBt: UIButton = {
        let button: UIButton = UIButton(frame: CGRect(x: 60.0, y: 400.0, width: 200.0, height: 50.0))
        button.setTitle("结束播放录音", for: UIControlState.normal)
        button.setTitleColor(UIColor.gray, for: UIControlState.selected)
        button.backgroundColor = UIColor.red
        return button
    }()
    
    fileprivate var transformBt: UIButton = {
        let button: UIButton = UIButton(frame: CGRect(x: 60.0, y: 500.0, width: 200.0, height: 50.0))
        button.setTitle("格式转换", for: UIControlState.normal)
        button.setTitleColor(UIColor.gray, for: UIControlState.selected)
        button.backgroundColor = UIColor.red
        return button
    }()
    
    
    
    
    fileprivate var mp3Path: String?
    fileprivate var cafPath: String?
    fileprivate var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()

        AvdioTool.shared.creatSession()
    }
    
    func initViews()
    {
        self.view.addSubview(startRecordBt)
        self.view.addSubview(startPlayBt)
        self.view.addSubview(stopRecordBt)
        self.view.addSubview(stopPlayBt)
        self.view.addSubview(transformBt)
        
        startRecordBt.addTarget(self, action: #selector(startRecord), for: UIControlEvents.touchUpInside)
        startPlayBt.addTarget(self, action: #selector(startPlaying), for: UIControlEvents.touchUpInside)
        stopRecordBt.addTarget(self, action: #selector(stopRecord), for: UIControlEvents.touchUpInside)
        stopPlayBt.addTarget(self, action: #selector(playMp3), for: UIControlEvents.touchUpInside)
        transformBt.addTarget(self, action: #selector(toMP3), for: UIControlEvents.touchUpInside)
    }
    
    
    let recordSettings = [
        AVSampleRateKey : NSNumber(value: Float(4000)),
        
        AVNumberOfChannelsKey : NSNumber(value: Int32(1)),
        AVEncoderAudioQualityKey :
            NSNumber(value: Int32(AVAudioQuality.medium.rawValue))]

    
    // 开始录音
    func startRecord(sender: AnyObject) {

        AvdioTool.shared.startRecord()
    }
    
    // 停止录音
    func stopRecord(sender: AnyObject)
    {

        AvdioTool.shared.stopRecord()
    }
    
    // 开始播放
    func startPlaying(sender: AnyObject)
    {

//        AvdioTool.shared.startRecord()
    }
    
    // 暂停播放
    func pausePlaying(sender: AnyObject)
    {

        AvdioTool.shared.pushPlaying()
        
        
    }
    
    func toMP3() {

//        AvdioTool.shared.toMP3()
        AvdioTool.shared.convertWavToAmr()
    }
    
    func playMp3()
    {

        AvdioTool.shared.playMp3()
    }
}

