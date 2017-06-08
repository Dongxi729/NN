//
//  MainGameViewController.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/24.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  游戏主界面

import UIKit

var ddddd = false

class MainGameViewController: UIViewController {
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if connectSuccess == false {
            ConnectModel.shared.connectSEL()
        }
    }
    
    
    // MARK: - 跳出同意退出房间视图
    lazy var exitRoomV: DismissRoom = {
        let d : DismissRoom = DismissRoom.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.6, height: SH * 0.75))
        return d
    }()
    
    @objc fileprivate func inviteSEL() -> Void {
        let f : InviteV = InviteV.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.42, height: SW * 0.42))
        f.center = self.view.center
        
        view.addSubview(f)
    }
    
    /// 显示离线视图
    func showOffLineV() -> Void {
        let d = OffLineV.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.6, height: SH * 0.75))
        view.addSubview(d)
        d.center = view.center
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "offLineSEL"), object: nil)
        print("\((#file as NSString).lastPathComponent):(\(#line))\n","离线通知")
    }
    
    // MARK: - 显示成绩视图
    fileprivate lazy var showFinalScoreV: FinalScoreV = {
        let d : FinalScoreV = FinalScoreV.init(frame: self.view.bounds)
        return d
    }()
    
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
        
        /// 收到通知 PlayersInRoom
        NotificationCenter.default.addObserver(self, selector: #selector(enterGamingVSEL), name: NSNotification.Name(rawValue: "PlayersInRoom"), object: nil)
        
        
        exitRoomV.center = view.center
        view.addSubview(exitRoomV)
        exitRoomV.isHidden = true
        
        /// 显示最后成绩视图
        //        FinialScoreNotifi
        NotificationCenter.default.addObserver(self, selector: #selector(FinialScoreNotifiSEL), name: NSNotification.Name(rawValue: "FinialScoreNotifi"), object: nil)
        /// NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "exitRoomRequest"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(exitRoomRequestSEL), name: NSNotification.Name(rawValue: "exitRoomRequest"), object: nil)
    }
    
    
    // MARK: - 显示成绩视图
    func FinialScoreNotifiSEL(){
        
        DispatchQueue.main.async {
            
            
            UIApplication.shared.keyWindow?.rootViewController = ScoreViewController()
            
        }
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
    }
    
    // MARK: - 解散房间
    func exitRoomRequestSEL() -> Void {
        
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "exitRoomRequest"), object: nil)
        exitRoomV.isHidden = false
        
    }
    
    
    
    /// 进入游戏房间视图
    func enterGamingVSEL() {
        
        /// 移除监听对象
        //        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "PlayersInRoom"), object: nil)
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        
        /// 判断人数是否大于1
        if RoomModel.shared.limitedPlayersNum >= 1 {
            DispatchQueue.main.async {
                
                /// 判断标识，只有为真的时候才可以进入房间
                if ddddd {
                    UIApplication.shared.keyWindow?.rootViewController = GamingVC()
                }
                
                
                print("\((#file as NSString).lastPathComponent):(\(#line))\n")
                
            }
        }
        
    }
    
    
    
    /// 广播栏目
    fileprivate lazy var boradCastBgV: BroadCastV = {
        let d : BroadCastV = BroadCastV.init(frame: CGRect.init(x: SW * 0.25, y: SH * 0.2 - commonMargin, width: SW * 0.5, height: 15 * screenScale))
        return d
    }()
    
    
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


