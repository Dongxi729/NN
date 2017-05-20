//
//  GameBgV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/18.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

// MARK: - 游戏背景图片
class GameBgV: UIView {
    
    /// 准备按钮
    fileprivate lazy var startGameBtn: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: self.Width * 0.42, y: self.Height * 0.55, width: self.Width * 0.15, height: self.Height * 0.15))
        d.addTarget(self, action: #selector(beginGameSEL(sender:)), for: .touchUpInside)
        d.setImage(#imageLiteral(resourceName: "beginBtn"), for: .normal)
        d.setImage(#imageLiteral(resourceName: "beingGameSelected"), for: .selected)
        return d
    }()
    
    /// 邀请朋友
    lazy var inviteFriendsBtn: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: self.Width * 0.42, y: self.Height * 0.55, width: self.Width * 0.15, height: self.Height * 0.15))
        d.addTarget(self, action: #selector(inviteFriSEL(sender:)), for: .touchUpInside)
        d.setImage(#imageLiteral(resourceName: "intviteFriends"), for: .normal)
        return d
    }()
    
    /// 作弊按钮
    fileprivate lazy var cheatBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.Width * 0.42, y: self.Height * 0.55, width: self.Width * (0.15 / 2), height: self.Height * 0.15))
        d.addTarget(self, action: #selector(cheatSEL(sender:)), for: .touchUpInside)
        d.setImage(#imageLiteral(resourceName: "cheatBtn"), for: .normal)
        
        return d
    }()
    
    /// 背景按钮
    fileprivate lazy var bgVImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "gamePrepareBgV")
        
        return d
    }()
    
    /// 显示创建按钮标识
    var showprepareBtnMark = false
    
    /// 是否游戏中
    var isGaming = RoomModel.shared.isGameBegin

    
    /// 显示房间人员位置
    fileprivate lazy var P4: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV()
        
        return d
    }()
    
    fileprivate lazy var P3: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.06, y: self.Height * 0.35, width: self.Width * 0.18, height: self.Height * 0.15))
        return d
    }()
    
    fileprivate lazy var P2: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.06, y: self.Height * 0.56, width: self.Width * 0.18, height: self.Height * 0.15))
        return d
    }()
    
    fileprivate lazy var P1: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV()
        return d
    }()
    
    fileprivate lazy var P5: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.8, y: self.Height * 0.35, width: self.Width * 0.18, height: self.Height * 0.15))
        return d
    }()
    
    fileprivate lazy var P6: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.8, y: self.Height * 0.55, width: self.Width * 0.18, height: self.Height * 0.15))
        return d
    }()
    
    
    
    /// 右上角按钮组
    fileprivate lazy var rightV: RightV = {
        let d : RightV = RightV.init(frame: CGRect.init(x: self.Width * 0.9, y: 0, width: self.Width * 0.1, height: self.Height * 0.1))
        d.delegate = self
        return d
    }()
    
    var playersNum : Int!
    
    /// 房间号
    fileprivate lazy var roomNoImgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: self.Width * 0.08, height: self.Height * 0.065))
        d.image = #imageLiteral(resourceName: "roomName")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 当前时间
    fileprivate lazy var currentTime: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0.0665760869565217 * self.Height, width: SW * 0.134, height: SH * 0.05))
        d.textColor = UIColor.white
        d.textAlignment = .center
        d.layer.borderWidth = 1
        d.font = UIFont(name: "SimHei", size: 9 * screenScale)
        return d
    }()
    
    /// 房间号
    fileprivate lazy var rooID: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: self.roomNoImgV.RightX, y: 0, width: self.Width * 0.073, height: self.roomNoImgV.Height))
        d.font = UIFont(name: "SimHei", size: 8 * screenScale)
        
        d.textAlignment = .left
        
        d.textColor = UIColor.colorWithHexString("713600")
        d.text = "1468"
        return d
    }()
    

    /// 右下角视图
    fileprivate lazy var rightDownV: RightDownV = {
        let d : RightDownV = RightDownV.init(frame: CGRect.init(x: self.Width * 0.87, y: self.Height * 0.788, width: self.Width - self.Width * 0.87, height: self.Height - self.Height * 0.794))
        d.layer.borderWidth = 2
        d.layer.borderColor = UIColor.red.cgColor
        d.delegate = self
        return d
    }()
    
    /// 局数
     fileprivate lazy var roundsNumLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: self.Height * 0.13, width: self.Width * 0.1, height: self.Height * 0.045))
        d.layer.borderWidth = 1
        d.text = String(15) + "/" + String(20)
        d.textAlignment = .center
        d.adjustsFontSizeToFitWidth = true
        d.font = UIFont(name: "SimHei", size: 9 * screenScale)
        d.textColor = UIColor.white
        return d
    }()
    
    /// 默认0 显示六人牛牛
    /// 1 显示通比牛牛
    var showGameTypeMark : Int = RoomModel.shared.readPlayerCount
    
    /// 牌子牛牛
    fileprivate lazy var gameType: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0.12 * self.Width, width: self.currentTime.Width, height: self.Height * (0.181159420289855 - 0.13768115942029)))
        d.image = #imageLiteral(resourceName: "liuCow")
        d.layer.borderWidth = 1
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    override func layoutSubviews() {
        
        
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",RoomModel.shared.isGameBegin)
        
        super.layoutSubviews()
        /// 根据状态显示六人牛牛还是通比牛牛
        if showGameTypeMark == 0 {
            self.gameType.image = #imageLiteral(resourceName: "liuCow")
        } else {
            self.gameType.image = #imageLiteral(resourceName: "commonCow")
        }
        
        if showprepareBtnMark {
            self.startGameBtn.isHidden = false
        } else {
            self.startGameBtn.isHidden = true
        }

        print("\((#file as NSString).lastPathComponent):(\(#line))\n",RoomModel.shared.currentPersonInRoom)
        
        /// 根据当前人数以及游戏状态显示
        switch RoomModel.shared.currentPersonInRoom {
        case 1:
            P1.samllCardsShowLeftOrRight = -1
            
            addSubview(P1)
            break
        case 2:
            P1.samllCardsShowLeftOrRight = -1

            P2.samllCardsShowLeftOrRight = 1
            P2.isShowBottomCardLayout = true

            addSubview(P1)
            addSubview(P2)
            break
        case 3:
            P1.samllCardsShowLeftOrRight = -1
            P2.samllCardsShowLeftOrRight = 1
            P3.samllCardsShowLeftOrRight = 1
            
            P2.isShowBottomCardLayout = true
            P3.isShowBottomCardLayout = true
            addSubview(P1)
            addSubview(P2)
            addSubview(P3)
            break
        case 4:
            P1.samllCardsShowLeftOrRight = -1
            P2.samllCardsShowLeftOrRight = 1
            P3.samllCardsShowLeftOrRight = 1
            P4.samllCardsShowLeftOrRight = -1
            
            P2.isShowBottomCardLayout = true
            P3.isShowBottomCardLayout = true
            P4.isShowBottomCardLayout = true
            
            addSubview(P1)
            addSubview(P2)
            addSubview(P3)
            addSubview(P4)
            break
        case 5:
            P1.samllCardsShowLeftOrRight = -1
            P2.samllCardsShowLeftOrRight = 1
            P3.samllCardsShowLeftOrRight = 1
            P4.samllCardsShowLeftOrRight = -1
            P5.samllCardsShowLeftOrRight = -1
            
            P2.isShowBottomCardLayout = true
            P3.isShowBottomCardLayout = true
            P4.isShowBottomCardLayout = true
            P5.isShowBottomCardLayout = true
            
            addSubview(P1)
            addSubview(P2)
            addSubview(P3)
            addSubview(P4)
            addSubview(P5)
            break
        case 6:
            P1.samllCardsShowLeftOrRight = -1
            P2.samllCardsShowLeftOrRight = 1
            P3.samllCardsShowLeftOrRight = 1
            P4.samllCardsShowLeftOrRight = -1
            P5.samllCardsShowLeftOrRight = -1
            P6.samllCardsShowLeftOrRight = -1
            
            P2.isShowBottomCardLayout = true
            P3.isShowBottomCardLayout = true
            P4.isShowBottomCardLayout = true
            P5.isShowBottomCardLayout = true
            P6.isShowBottomCardLayout = true
            
            addSubview(P1)
            addSubview(P2)
            addSubview(P3)
            addSubview(P4)
            addSubview(P5)
            addSubview(P6)
            break
        default:
            
            break
        }
        
        /// 是否在游戏中
        if RoomModel.shared.isGameBegin {
            /// 改变游戏1、4玩家的位置
        
            P1 = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.15, y: self.Height * 0.8, width: self.Width * 0.18, height: self.Height * 0.15))
            P4 = PeronheadInfoV.init(frame: CGRect.init(x: 0.6 * self.Width, y: 0.13 * self.Height, width: self.Width * 0.18, height: self.Height * 0.15))

        } else {
            
            P1 = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.45, y: self.Height * 0.8, width: self.Width * 0.18, height: self.Height * 0.15))
            P4 = PeronheadInfoV.init(frame: CGRect.init(x: 0.45 * self.Width, y: 0.13 * self.Height, width: self.Width * 0.18, height: self.Height * 0.15))
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgVImg)
        addSubview(startGameBtn)
        
        addSubview(roomNoImgV)
        addSubview(cheatBtn)
        
        P4.showCompleteMark = true
        P3.showPrepareMark = true
        
        
        addSubview(gameType)
        
        addSubview(rooID)
        
        addSubview(roundsNumLabel)
        
        DispatchQueue.main.async {
            self.addSubview(self.currentTime)
            self.refreshTime()
        }
        
        /// 右上角按钮
        addSubview(rightV)
        
        addSubview(rightDownV)
        
        addSubview(inviteFriendsBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        let touchPoint: CGPoint? = touch?.location(in: self)
        print("\((touchPoint?.x)! / self.Width)==\((touchPoint?.y)! / self.Height)")
        let stringFloat = Int((touchPoint?.x)!)
        let stringFloat1 = Int((touchPoint?.y)!)
        print("\(stringFloat)\(stringFloat1)")
    }
    
    lazy var oBgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: self.Width * 0.2, height: self.Width * 0.2))
        d.image = #imageLiteral(resourceName: "pushToSend")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 利用屏幕刷新率才刷新时间
    // 创建表盘
    // 添加一个定时器
    
    private func refreshTime() -> Void {
        let displayLink = CADisplayLink.init(target: self, selector: #selector(updateTime))
        
        displayLink.add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)
    }
    
    /// 开始游戏
    @objc fileprivate func beginGameSEL(sender : UIButton) {
        sender.isHidden = true
        print("===")
        self.cheatBtn.isHidden = true
    }
    
    /// 邀请微信好友
    @objc fileprivate func inviteFriSEL(sender : UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n","inviteFriSEL")
    }
    
    /// 作弊按钮事件
    @objc fileprivate func cheatSEL(sender : UIButton) {
        sender.isHidden = true
    }
    
    
    /// 时间刷新常量
    var hours: CGFloat = 0.0
    var min: CGFloat = 0.0
    var sec: CGFloat = 0.0
}

// MARK: - 刷新时间
extension GameBgV {
    // MARK: - 每一秒调用60次
    func updateTime()  {
        
        // 获取当前的日期
        let calendar = Calendar.current
        // 获取日历中的组件:秒,分,时,天
        // NSCalendarUnit:获取哪个时间
        let cmp: DateComponents? = calendar.dateComponents([.second, .minute, .hour, .nanosecond], from: Date())
        // 小时
        hours = CGFloat((cmp?.hour)!)
        self.currentTime.text = String(format: "%02.0lf:%02.0lf", hours, min)
        // 分钟
        min = CGFloat((cmp?.minute)!)
    }
    
}

// MARK: - 右上角事件
extension GameBgV : RightVDelegate {
    func righExitSEL(sender: UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.frame)
    }
    
    func rightSetSEL(sender: UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.frame)
    }
}

// MARK: - 左上角事件
extension GameBgV : RightDownVDelegate {
    
    func msgSEL(sender: UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.frame)
    }
    
    func voiceSEL(gesture: UILongPressGestureRecognizer) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        if gesture.state == .began {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n","长按事件")
            AvdioTool.shared.creatSession()
            AvdioTool.shared.startRecord()
            
            oBgV.center = self.center
            ///  创建录音视图
            addSubview(oBgV)
        } else {
            
            AvdioTool.shared.stopRecord()
            
            AvdioTool.shared.convertWavToAmr()
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n","结束")
            /// 移除录音视图
        }
        
        if gesture.state.rawValue == 3 {
            oBgV.removeFromSuperview()
        }
        
    }
}

