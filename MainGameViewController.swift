//
//  MainGameViewController.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/24.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  游戏主界面

import UIKit

class MainGameViewController: UIViewController {
    
    /// 解散房间
    lazy var dismissRoom: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 200, y: 100, width: 100, height: 100))
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(dismissRoomSEL), for: .touchUpInside)
        d.setTitle("解散房间", for: .normal)
        return d
    }()
    
    lazy var bgImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.view.bounds)
        d.image = #imageLiteral(resourceName: "holl_bg")
        return d
    }()
    
    /// 个人视图
    lazy var mainView: PersonMsgView = {
        let d : PersonMsgView = PersonMsgView.init(frame: self.view.bounds)
        
        return d
    }()
    
    lazy var presentView: UIView = {
        let d :UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 300))
        d.backgroundColor = UIColor.blue
        
        
        return d
    }()
    
    
    lazy var sendRoomType: UIButton = {
        let d : UIButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(sendRoomTypeSEL), for: .touchUpInside)
        return d
    }()
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        /// 开始上报用户信息,传socket
//        AvdioTool.shared.creatSession()
//        
//        /// 开启链接服务器
//        DispatchQueue.global(qos: .default).async {
//            
//            testServer()
//        }
//    }
    
    /// 发送房间类型
    @objc fileprivate func sendRoomTypeSEL() -> Void {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addScrollText()
        
        let add = UIButton.init(frame: CGRect.init(x: 30, y: 30, width: 100, height: 100))
        add.backgroundColor = UIColor.red
        
       
        add.addTarget(self, action: #selector(presenrView), for: .touchUpInside)
       
        view.addSubview(bgImg)
        
        view.addSubview(mainView)

        
        

    }
    
    func dismissRoomSEL() -> Void {
        dismissRoomSocketEvent()
    }

    
    func presenrView() -> Void {
        view.addSubview(presentView)
        
        presentView.center = view.center
    }
    
    lazy var ringTong: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: SW * 0.24, y: SH * 0.18, width: 20 * screenScale, height: 20 * screenScale))
        d.image = #imageLiteral(resourceName: "broadCastRingIcon")
        return d
    }()
    
    /// 添加滚动文字
    func addScrollText() -> Void {
        
        
        let scText = ScrollText.init(frame: CGRect.init(x: SW * 0.25, y: SH * 0.2, width: SW * 0.5, height: 15 * screenScale), withBackGroundColor: UIColor.clear, withTitleColor: UIColor.white)
        
        let scrolBgV = UIImageView.init(frame: CGRect.init(x: SW * 0.25, y: SH * 0.2, width: SW * 0.5, height: 12 * screenScale))
        
        scrolBgV.image = #imageLiteral(resourceName: "broadCastbg")
        
        let dd = ["撒旦立刻精神看到就撒大声地就拉上记录数卡机的"]
        
        scText?.titleArray = dd
        
        view.addSubview(scrolBgV)
        view.addSubview(scText!)
        
        /// 添加铃铛
        view.addSubview(ringTong)
    }
    
}
