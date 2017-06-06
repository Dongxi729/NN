//

//  GameV.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/5.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  正在玩游戏的视图

import UIKit

class GameV: UIView {
    
    static let shared = GameV()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 是否游戏中
    var isGaming = RoomModel.shared.isGameBegin
    
    
    /// 显示房间人员位置
    fileprivate lazy var P1: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV()
        d.layer.borderWidth = 1
        return d
    }()
    
    fileprivate lazy var P2: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.06, y: self.Height * 0.56, width: self.Width * 0.18, height: self.Height * 0.15))
        d.layer.borderWidth = 1
        return d
    }()
    
    fileprivate lazy var P3: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.06, y: self.Height * 0.35, width: self.Width * 0.18, height: self.Height * 0.15))
        return d
    }()
    
    fileprivate lazy var P4: PeronheadInfoV = {
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
    
    // MARK: - 背景按钮
    fileprivate lazy var bgVImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "gamePrepareBgV")
        
        d.contentMode = UIViewContentMode.scaleAspectFit
        
        return d
    }()
    
    // MARK: - 右上角视图
    lazy var rightImgView: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.85, y: 0, width: self.Width * 0.15, height: self.Height * 0.15))
        d.image = #imageLiteral(resourceName: "room_toprightan")
        
        d.isUserInteractionEnabled = true
        
        let tapGes = UITapGestureRecognizer.init(target: self, action: #selector(dismissSEL))
        d.addGestureRecognizer(tapGes)
        
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    
    // MARK: - 开始游戏按钮
    fileprivate lazy var startGameBtn: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: self.Width * 0.42, y: self.Height * 0.55, width: self.Width * 0.15, height: self.Height * 0.15))
        d.addTarget(self, action: #selector(beginGameSEL(sender:)), for: .touchUpInside)
        d.setImage(#imageLiteral(resourceName: "beginBtn"), for: .normal)
        d.setImage(#imageLiteral(resourceName: "beingGameSelected"), for: .selected)
        return d
    }()
    
    // MARK: - 房间号
    lazy var roomNumber: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        d.text = String(RoomModel.shared.roomNumber) + RoomModel.shared.currentRounds
        return d
    }()
    
    
    // MARK: - 提示
    lazy var alertBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: self.Height * 0.7, width: 100, height: 50))
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(testShow), for: .touchUpInside)
        d.setTitle("提示", for: .normal)
        return d
    }()
    
    // MARK: - 局数
    fileprivate lazy var roundsNumLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: self.Height * 0.13, width: self.Width * 0.1, height: self.Height * 0.045))
        d.layer.borderWidth = 1
        
        
        if !RoomModel.shared.currentRounds.isEmpty && !RoomModel.shared.gameRounds.isEmpty {
            d.text = RoomModel.shared.currentRounds + "/" + RoomModel.shared.gameRounds
        } else {
            d.text = String(15) + "/" + String(20)
        }
        
        d.textAlignment = .center
        d.adjustsFontSizeToFitWidth = true
        d.font = UIFont(name: "SimHei", size: 9 * screenScale)
        d.textColor = UIColor.white
        return d
    }()
    
    
    /// 右下角提示个亮牌小视图
    lazy var alertAndShowV: ShowAndAlertV = {
        let sd : ShowAndAlertV = ShowAndAlertV.init(frame: CGRect.init(x: self.Width * 0.75, y: self.Height * 0.74, width: self.Width * 0.12, height: self.Width * 0.12))
        sd.delegate = self
        return sd
    }()
    
    
    /// 测试--- 提示
    @objc fileprivate func testShow() {
        
        CardNameModel.shared.isShowP1Front = true
        
        P1.imgNames = CardNameModel.shared.rightCurrentIndexCards()
        P1.addCards(cardsArray: CardNameModel.shared.rightCurrentIndexCards())
    }
    
    // MARK: - 抢庄视图
    lazy var robOwner: RobRoomOwner = {
        let d : RobRoomOwner = RobRoomOwner.init(frame: CGRect.init(x: self.Width * 0.25, y: self.Height * 0.5 - self.Height * 0.05, width: self.Width * 0.5, height: self.Height * 0.1))
        d.layer.borderWidth = 1
        return d
    }()
    
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
        //        d.text = "1468"
        
        if RoomModel.shared.roomNumber != nil {
            d.text = String(RoomModel.shared.roomNumber)
        } else {
            d.text = "1111111"
        }
        return d
    }()
    
    
    
    // MARK: - 非庄家压分
    fileprivate lazy var getCoins: MarkChoose = {
        let d : MarkChoose = MarkChoose.init(frame: CGRect.init(x: self.Width * 0.5 - self.Width * 0.25, y: self.Height * 0.75 - self.Height * 0.123, width: SW * 0.5, height: SH * 0.25))
        
        return d
    }()
    
    /// 显示解散视图
    func showXXX() -> Void {
        let d = DismissRoom.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.6, height: SH * 0.75))
        d.center = self.center
        
        DispatchQueue.main.async {
            self.addSubview(d)
        }
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "exitRoomRequest"), object: nil)
    }
    
    /// 显示同意、不同意解散视图
    func showXXX() -> Void {
        let d = DismissRoom.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.6, height: SH * 0.75))
        d.center = self.center
        
        DispatchQueue.main.async {
            self.addSubview(d)
        }
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "AgreeToDismissNoti"), object: nil)
        
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        addSubview(bgVImg)
        
        addSubview(roomNoImgV)
        
        addSubview(currentTime)
        
        addSubview(rooID)
        
        addSubview(roundsNumLabel)
        
        addSubview(alertAndShowV)
        
        addSubview(roomNumber)
        
        addSubview(alertBtn)
        
        addSubview(rightImgView)
        
        /// 抢庄视图
        addSubview(robOwner)
        
        addSubview(getCoins)
        
        RoomModel.shared.isGameBegin = true
        
        /// 根据在线的人员数量进行控制
        /// 准备完成后---是否开始游戏---开始游戏,
        
        
        /// 是否在游戏中
        if RoomModel.shared.isGameBegin {
            /// 改变游戏1、4玩家的位置
            
            P1 = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.15, y: self.Height * 0.8, width: self.Width * 0.18, height: self.Height * 0.15))
            P4 = PeronheadInfoV.init(frame: CGRect.init(x: 0.6 * self.Width, y: 0.13 * self.Height, width: self.Width * 0.18, height: self.Height * 0.15))
            
        } else {
            
            P1 = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.45, y: self.Height * 0.8, width: self.Width * 0.18, height: self.Height * 0.15))
            P4 = PeronheadInfoV.init(frame: CGRect.init(x: 0.45 * self.Width, y: 0.13 * self.Height, width: self.Width * 0.18, height: self.Height * 0.15))
        }
        
        
        addSubview(P1)
        addSubview(P2)
        
        P1.isHidden = true
        P2.isHidden = true
        
        
        ///抢庄视图
        robOwner.isHidden = true
        
        /// 开始按钮
        addSubview(startGameBtn)
        
        NotificationCenter.default.addObserver(self, selector: #selector(createGamingLayout), name: NSNotification.Name(rawValue: "CardNameModelNotNIll"), object: nil)
        
        /// 收到纸牌
        NotificationCenter.default.addObserver(self, selector: #selector(showCardsSEL), name: NSNotification.Name(rawValue: "showCards"), object: nil)
        
        /// 判断抢庄
        NotificationCenter.default.addObserver(self, selector: #selector(isRobOrNotSEL), name: NSNotification.Name(rawValue: "beginRob"), object: nil)
        
        /// RoomOwner 选出房主
        NotificationCenter.default.addObserver(self, selector: #selector(chooseOwnerSEL), name: NSNotification.Name(rawValue: "RoomOwner"), object: nil)
        
        
        /// 是否亮牌 isShowCard
        NotificationCenter.default.addObserver(self, selector: #selector(isShowCardSEL), name: NSNotification.Name(rawValue: "isShowCard"), object: nil)
        
        /// 返回最新用户状态信息
        NotificationCenter.default.addObserver(self, selector: #selector(showUserInfoSEL), name: NSNotification.Name(rawValue: "showUserInfo"), object: nil)
        
        
        /// 解散房间 exitRoomRequest
        NotificationCenter.default.addObserver(self, selector: #selector(showXXX), name: NSNotification.Name(rawValue: "exitRoomRequest"), object: nil)
        
        
        /// 同意 不同意 AgreeToDismissNoti
        NotificationCenter.default.addObserver(self, selector: #selector(AgreeToDismissNotiSEL), name: NSNotification.Name(rawValue: "AgreeToDismissNoti"), object: nil)
        
        createGamingLayout()
    }
    
    // MARK: - 显示同意不同意
    func AgreeToDismissNotiSEL() -> Void {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "AgreeToDismissNoti"), object: nil)
        
        
    }
    
    
    // MARK: - 收到牌，创建布局
    func showCardsSEL() -> Void {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "showCards"), object: nil)
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        
        switch RoomModel.shared.currentPersonInRoom {
        case 1:
            break
        case 2:
            /// 设置摆放纸牌位置
            P1.samllCardsShowLeftOrRight = -1
            
            P2.samllCardsShowLeftOrRight = 1
            
            /// 玩家1是否有牌
            if CardNameModel.shared.currentUbackCardsName.count > 0 {
                
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",CardNameModel.shared.currentUbackCardsName)
                P1.isShowBottomCardLayout = false
                P1.imgNames = CardNameModel.shared.currentUbackCardsName
                P1.addCards(cardsArray: CardNameModel.shared.currentUbackCardsName)
                
                P2.imgNames = CardNameModel.shared.backCardsName
                P2.isShowBottomCardLayout = true
            } else {
                P1.isShowBottomCardLayout = true
            }
            
            
            /// 检查分数数组是否为空
            if RoomModel.shared.userScore.count > 0 {
                
                //                P1.coinsLabel.text = String(RoomModel.shared.userScore[GetCurrenIndex.shared.getCurrentIndex()])
                //                P2.coinsLabel.text = String(GetCurrenIndex.shared.currentUserScore()[0])
                
                var type = 0
                if Int(P1.coinsLabel.text!)! > 0 {
                    type = 1
                } else {
                    type = 2
                }
                
                /// 显示增减的分数不隐藏
                P1.scoreImg.isHidden = false
                P2.scoreImg.isHidden = false
                
                P1.scoreImg.abc(abc: String(P1.coinsLabel.text!), scoreType: type)
                
                var type2 = 0
                if Int(P2.coinsLabel.text!)! > 0 {
                    type2 = 1
                } else {
                    type2 = 2
                }
                
                P2.scoreImg.abc(abc: String(P2.coinsLabel.text!), scoreType: type2)
            }
            
            
            
            
            
            break
        default:
            break
        }
    }
    
    // MARK: - 返回最新用户信息
    func showUserInfoSEL() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "showUserInfo"), object: nil)
        
        self.getCoins.isHidden = true
        /// 摆放正确用户位置
        
        showCardsSEL()
    }
    
    // MARK: - 是否亮牌
    func isShowCardSEL() {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "isShowCard"), object: nil)
        
        /// 亮牌
        if ShowCardModel.shared.isShowed {
            self.P1.isHidden = true
            self.P2.isHidden = true
            self.robOwner.isHidden = true
            self.startGameBtn.isHidden = false
            self.getCoins.isHidden = false
            /// 没亮牌
        } else {
            self.startGameBtn.isHidden = true
            self.robOwner.isHidden = true
            self.getCoins.isHidden = true
        }
    }
    
    /// 根据选择的房主积分显示
    func chooseOwnerSEL() -> Void {
        
        /// 是房主就不显示积分
        if RoomOwner.shared.ownerID != RoomModel.shared.userId[GetCurrenIndex.shared.currentUserIndex] {
            self.getCoins.isHidden = false
        } else {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",RoomOwner.shared.ownerID)
        }
    }
    
    /// 游戏开始时进行的动作
    func isGameBeginSEL() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "isGameBegin"), object: nil)
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        
        if RoomModel.shared.isGameBegin {
            self.startGameBtn.isHidden = true
            self.robOwner.isHidden = true
            self.getCoins.isHidden = true
        }
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",RoomModel.shared.userId[GetCurrenIndex.shared.currentUserIndex])
        
        if RoomOwner.shared.ownerID == RoomModel.shared.userId[GetCurrenIndex.shared.currentUserIndex] {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n")
            self.getCoins.isHidden = true
        } else {
            self.getCoins.isHidden = false
        }
    }
    
    /// 显示抢庄
    func isRobOrNotSEL() -> Void {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "beginRob"), object: nil)
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",RobOwnerModel.shared.isRobOrNot)
        
        /// 没抢庄的话，显示抢庄视图
        if RobOwnerModel.shared.isRobOrNot == false {
            self.robOwner.isHidden = false
            self.startGameBtn.isHidden = true
            
            /// 抢庄的话，显示积分视图
        } else {
            self.getCoins.isHidden = false
        }
    }
}

// MARK: - 创建布局
extension GameV {
    
    func createGamingLayout() -> Void {
        
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "createGamingLayout"), object: nil)
        
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",RoomModel.shared.currentPersonInRoom)
        
        switch RoomModel.shared.currentPersonInRoom {
            
        case 1:
            P1.samllCardsShowLeftOrRight = -1
            
            DispatchQueue.main.async {
                let headStr = RoomModel.shared.headUrlDic[0]
                
                downImgWith(url: headStr!, toView: self.P1.headImg)
            }
            
            if CardNameModel.shared.currentUbackCardsName.count > 0 {
                
                P1.imgNames = CardNameModel.shared.currentUbackCardsName
                P1.addCards(cardsArray: CardNameModel.shared.currentUbackCardsName)
            }
            
            P1.isHidden = false
            break
        case 2:
            
            /// 设置摆放纸牌位置
            P1.samllCardsShowLeftOrRight = -1
            
            P2.samllCardsShowLeftOrRight = 1
            
            
            /// 弹出错误掉网提示框
            if GetCurrenIndex.shared.p2NameLabelWithoutP1().count == 0 {
                let d = OffLineV.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.6, height: SH * 0.75))
                
                d.center = self.center
                
                addSubview(d)
                return
            }
            
            /// 名字
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",RoomModel.shared.userScore)
            
            P1.nameLabel.text = RoomModel.shared.nameStr[GetCurrenIndex.shared.getCurrentIndex()]
            P2.nameLabel.text = GetCurrenIndex.shared.p2NameLabelWithoutP1()[0]
            
            
            
            /// 下载头像
            DispatchQueue.main.async {
                
                let headStr = RoomModel.shared.headUrlDic[GetCurrenIndex.shared.currentUserIndex]
                let headStr2 = GetCurrenIndex.shared.p2ArrayWithoutP1()[0]
                
                downImgWith(url: headStr!, toView: self.P1.headImg)
                downImgWith(url: headStr2, toView: self.P2.headImg)
            }
            
            
            P2.isHidden = false
            P1.isHidden = false
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",RobOwnerModel.shared.isRobOrNot)
            
            break
        default: break
        }
    }
}

// MARK: - 开始按钮事件
extension GameV {
    /// 开始游戏说白了就是准备
    @objc fileprivate func beginGameSEL(sender : UIButton) {
        
        sender.isHidden = true
        
        print("===")
        
        /// 用户准备
        playPrepare()
    }
}

// MARK: - 根据游戏状态,判断玩家1 和玩家4 的位置
extension GameV {
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

// MARK: - 提示和亮牌
extension GameV : ShowAndAlertVDelegate {
    
    /// 亮牌
    func showSEL() {
        showCardsFunc()
    }
    
    /// 提示
    func alertSEL() {
        CardNameModel.shared.isShowP1Front = true
        
        P1.imgNames = CardNameModel.shared.rightCurrentIndexCards()
        P1.addCards(cardsArray: CardNameModel.shared.rightCurrentIndexCards())
    }
}

// MARK: - 申请退出房间
extension GameV {
    func dismissSEL() {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        
        exitRoomEvent()
        //        applierToDismiss()
    }
}
