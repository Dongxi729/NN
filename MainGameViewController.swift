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
    
    lazy var tetsInviteV: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: SH - 50, width: 50, height: 50))
        d.setTitle("测试邀请", for: .normal)
        d.addTarget(self, action: #selector(inviteSEL), for: .touchUpInside)
        return d
    }()
    
    
    
    @objc fileprivate func backToSEL() -> Void {
        backToSEL()
    }
    
    /// 分数视图
    fileprivate lazy var scoreTableView: ScoreView = {
        let d : ScoreView = ScoreView.init(frame: CGRect.init(x: 5, y: 5, width: SW - commonMargin, height: SH - commonMargin))
        
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
//            testServer()
//        }
//    }
    
    
    
    @objc fileprivate func inviteSEL() -> Void {
        let f : InviteV = InviteV.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.42, height: SW * 0.42))
        f.center = self.view.center
        
        view.addSubview(f)
    }
    
    /// 显示离线视图
    func showOffLineV() -> Void {
        let d = OffLineV.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.7, height: SH * 0.75))
        d.backgroundColor = UIColor.randomColor()
        
        view.addSubview(d)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "offLineSEL"), object: nil)
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n","离线通知")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        /// 接收离线通知
        NotificationCenter.default.addObserver(self, selector: #selector(showOffLineV), name: NSNotification.Name(rawValue: "offLineSEL"), object: nil)
        
        let add = UIButton.init(frame: CGRect.init(x: 30, y: 30, width: 100, height: 100))
        add.backgroundColor = UIColor.red
        
       
        add.addTarget(self, action: #selector(presenrView), for: .touchUpInside)
       
        view.addSubview(bgImg)
        
        view.addSubview(mainView)

        view.addSubview(boradCastBgV)
        
        let d = OffLineV.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.6, height: SH * 0.75))
        d.backgroundColor = UIColor.randomColor()
        d.center = view.center
        
        view.addSubview(d)
    }
    
    /// 广播栏目
    fileprivate lazy var boradCastBgV: BroadCastV = {
        let d : BroadCastV = BroadCastV.init(frame: CGRect.init(x: SW * 0.25, y: SH * 0.2 - commonMargin, width: SW * 0.5, height: 15 * screenScale))
        return d
    }()
    
    func dismissRoomSEL() -> Void {
        dismissRoomSocketEvent()
    }

    
    
    func reconnect() -> Void {
        
        let connectAlert : UIAlertController = UIAlertController.init(title: "提示", message: "已断开连接,是否重新连接", preferredStyle: .alert)
        connectAlert.addAction(UIAlertAction.init(title: "好的", style: .default, handler: { (alert) in
            testServer()
        }))
        
        connectAlert.addAction(UIAlertAction.init(title: "取消", style: .default, handler: { (alert) in
            
        }))
        
        UIApplication.shared.keyWindow?.rootViewController?.present(connectAlert, animated: true, completion: nil)
    }
    
    func presenrView() -> Void {
        view.addSubview(presentView)
        
        presentView.center = view.center
    }

}


/// 滚动文字条
class BroadCastV: UIView {
    
    lazy var bgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "hall_03")
        return d
    }()
    
    /// 滚动文字
    var showText : [String] = ["撒旦立刻精神看到就撒大声地就拉上记录数卡机的"]
    
    /// 文本label
    lazy var broadCastText: ScrollText = {
        let d : ScrollText = ScrollText.init(frame: CGRect.init(x: self.Width * 0.1, y: 0, width: self.Width, height: self.Height), withBackGroundColor: UIColor.clear, withTitleColor: UIColor.white)
        d.titleArray = self.showText
        d.sizeToFit()
        return d
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgV)
        addSubview(broadCastText)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


