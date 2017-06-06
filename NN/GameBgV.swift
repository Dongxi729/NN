//
//  GameBgV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/18.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

// MARK: - 游戏背景图片
class GameBgV: CommonV {
    
    /// 开始游戏按钮
    fileprivate lazy var startGameBtn: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: self.Width * 0.42, y: self.Height * 0.55, width: self.Width * 0.15, height: self.Height * 0.15))
        d.addTarget(self, action: #selector(beginGameSEL(sender:)), for: .touchUpInside)
        d.setImage(#imageLiteral(resourceName: "beginBtn"), for: .normal)
        d.setImage(#imageLiteral(resourceName: "beingGameSelected"), for: .selected)
        return d
    }()
    
    /// 邀请朋友
    lazy var inviteFriendsBtn: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: self.Width * 0.42, y: self.Height * 0.45, width: self.Width * 0.15, height: self.Height * 0.15))
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
        d.contentMode = UIViewContentMode.scaleAspectFit
        
        return d
    }()
    
    /// 显示创建按钮标识
    var showprepareBtnMark = false
    
    /// 是否游戏中
    var isGaming = RoomModel.shared.isGameBegin
    
    
    /// 显示房间人员位置
    fileprivate lazy var P1: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV()
        return d
    }()
    
    fileprivate lazy var P2: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.06, y: self.Height * 0.56, width: self.Width * 0.18, height: self.Height * 0.15))
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
    
    ////////////////////////////////////////////////////////
    
    /// 测试用--- 亮牌
    lazy var showCards: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: self.Height * 0.5, width: 100, height: 50))
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(showCardsRequest), for: .touchUpInside)
        d.setTitle("亮牌", for: .normal)
        return d
    }()
    
    /// 测试用--- 提示
    lazy var alertBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: self.Height * 0.7, width: 100, height: 50))
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(testShow), for: .touchUpInside)
        d.setTitle("提示", for: .normal)
        return d
    }()
    
    
    /// 右上角按钮组
    fileprivate lazy var rightV: RightV = {
        let d : RightV = RightV.init(frame: CGRect.init(x: self.Width * 0.85, y: 0, width: self.Width * 0.15, height: self.Height * 0.15))
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
        //        d.text = "1468"
        
        if RoomModel.shared.roomNumber != nil {
            d.text = String(RoomModel.shared.roomNumber)
        } else {
            d.text = "1111111"
        }
        return d
    }()
    
    
    /// 右下角视图
    fileprivate lazy var rightDownV: RightDownV = {
        let d : RightDownV = RightDownV.init(frame: CGRect.init(x: self.Width * 0.87, y: self.Height * 0.788, width: self.Width - self.Width * 0.87, height: self.Height - self.Height * 0.794))
        d.delegate = self
        return d
    }()
    
    /// 局数
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
    
    /// 非庄家压分
    fileprivate lazy var getCoins: MarkChoose = {
        let d : MarkChoose = MarkChoose.init(frame: CGRect.init(x: self.Width * 0.5 - self.Width * 0.25, y: self.Height * 0.75 - self.Height * 0.123, width: SW * 0.5, height: SH * 0.25))
        
        return d
    }()
    
    /// 抢庄视图
    fileprivate lazy var robOwner: RobRoomOwner = {
        let d : RobRoomOwner = RobRoomOwner.init(frame: CGRect.init(x: self.Width * 0.25, y: self.Height * 0.5 - self.Height * 0.05, width: self.Width * 0.5, height: self.Height * 0.1))
        d.layer.borderWidth = 1
        return d
    }()
    
    /// 测试--- 亮牌
    @objc fileprivate func showCardsRequest() {
        showCardsFunc()
    }
    
    /// 右上角视图
    lazy var rightImgView: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.85, y: 0, width: self.Width * 0.15, height: self.Height * 0.15))
        d.image = #imageLiteral(resourceName: "room_toprightan")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 设置视图
    fileprivate lazy var setView: SettingV = {
        let d : SettingV = SettingV.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.45, height: SH * 0.45))
        
        return d
    }()
    
    /// 测试--- 提示
    @objc fileprivate func testShow() {
        
//        CardNameModel.shared.isShowP1Front = true
       
//        P1.imgNames = CardNameModel.shared.rightCurrentIndexCards()
//        P1.addCards(cardsArray: CardNameModel.shared.rightCurrentIndexCards())
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /// 商城清除
        if setViewISExist.count > 0  {
            
            //购物断网刷新
            if NSStringFromClass((UIApplication.shared.keyWindow?.rootViewController?.view.subviews.last?.classForCoder)!).contains("SettingV") {
                
                UIApplication.shared.keyWindow?.rootViewController?.view.subviews.last?.removeFromSuperview()
                
                /// 清空记录数组
                setViewISExist.removeAll()
            }
        }
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        
        /// 返回当前用户的分数位置(用户1)
        var userIndex1 = 0
        
        var currentUserIndex = 0
        
        for value in RoomModel.shared.userId {
            
            /// 当前用户的
            if value == LoginModel.shared.uid {
                currentUserIndex = userIndex1
                break
            }
            
            userIndex1 += 1
        }
        
        /// 用户2
        var userIndex2 = 0
        
        var currentUserIndex2 = 0
        
        for (_,value) in RoomModel.shared.nameStr {
            
            /// 当前用户的
            if value == RoomModel.shared.nameStr[1] {
                
                currentUserIndex2 = userIndex2
                break
            }
            userIndex2 += 1
        }
        
        /// 用户3 错误的
        var userIndex3 = 0
        
        var currentUserIndex3 = 0
        
        for (_,value) in RoomModel.shared.nameStr {
            
            
            var xxx = RoomModel.shared.nameStr[currentUserIndex + 2]
            
            if xxx == nil {
               xxx = RoomModel.shared.nameStr[RoomModel.shared.nameStr.count - 1]
            }
            /// 当前用户的
            if value == xxx {
                
                currentUserIndex3 = userIndex3
                break
            }
            userIndex3 += 1
        }
    
        
        /// 用户4
        var userIndex4 = 0
        
        var currentUserIndex4 = 0
        
        for (_,value) in RoomModel.shared.nameStr {
            
            /// 当前用户的
            if value == RoomModel.shared.nameStr[3] {
                
                currentUserIndex4 = userIndex4
                break
            }
            userIndex4 += 1
        }
        
        if RoomModel.shared.gameType == "通比牛牛" {
            /// 准备游戏时，准备按钮隐藏
            if ScoreModel.shared.gamingReciveType == "9" {
                self.startGameBtn.isHidden = true
            }
            
            /// 收到积分结算时，准备按钮显示
            if ScoreModel.shared.gamingReciveType == "7" {
                
                self.startGameBtn.isHidden = false
            }
        }
        
        
        
        /// 根据状态显示六人牛牛还是通比牛牛
        if RoomModel.shared.gameType == "六人牛牛" {
            self.gameType.image = #imageLiteral(resourceName: "liuCow")
        } else {
            self.gameType.image = #imageLiteral(resourceName: "commonCow")
        }
        
        
        /// 准备完成后---是否开始游戏---开始游戏,
        switch RoomModel.shared.currentPersonInRoom {
        case 1:
            P1.samllCardsShowLeftOrRight = -1
            
            P1.nameLabel.text = RoomModel.shared.nameStr[0]
            
            
            DispatchQueue.main.async {
                let headStr = RoomModel.shared.headUrlDic[0]
                
                downImgWith(url: headStr!, toView: self.P1.headImg)
            }
            
            
            addSubview(P1)
            
            /// 显示准备？？？
            if RoomModel.shared.prepareDic[0] != nil {
                /// 取出判断值是否为true
                let xxx = RoomModel.shared.prepareDic[0]
                
                if (xxx?.contains("true"))! {
                    P1.prepareImg.isHidden = false
                } else {
                    P1.prepareImg.isHidden = true
                }
            }
            
            if CardNameModel.shared.currentUbackCardsName.count > 0 {
                
                P1.imgNames = CardNameModel.shared.currentUbackCardsName
                P1.addCards(cardsArray: CardNameModel.shared.currentUbackCardsName)
            }
            
            break
        case 2:
            
            /// 设置摆放纸牌位置
            P1.samllCardsShowLeftOrRight = -1
            
            P2.samllCardsShowLeftOrRight = 1
            
            /// 游戏开始，隐藏邀请好友按钮
            if RoomModel.shared.isGameBegin {
                self.inviteFriendsBtn.isHidden = true
            }
            
            /// 六人牛牛的抢庄视图是否显示，当且仅当六人牛牛玩法为抢庄模式的时候显示。
            P2.isShowBottomCardLayout = true
            
            /// 显示名字
            P1.nameLabel.text = RoomModel.shared.nameStr[currentUserIndex]
            P2.nameLabel.text = RoomModel.shared.nameStr[currentUserIndex]
            
            /// 下载头像
            DispatchQueue.main.async {
                
                let headStr = RoomModel.shared.headUrlDic[currentUserIndex]
                let headStr2 = RoomModel.shared.headUrlDic[currentUserIndex]
                
                downImgWith(url: headStr!, toView: self.P1.headImg)
                downImgWith(url: headStr2!, toView: self.P2.headImg)
            }
            
            
            /// 显示准备？？？
            /// 用户1显示准备
            if RoomModel.shared.prepareDic[0] != nil {
                
                /// 取出判断值是否为true
                let xxx = RoomModel.shared.prepareDic[0]
                
                if (xxx?.contains("true"))! {
                    P1.prepareImg.isHidden = false
                }
            }
            
            
            /// 用户2显示准备
            if RoomModel.shared.prepareDic[1] != nil {
                
                /// 取出判断值是否为true
                let xxx = RoomModel.shared.prepareDic[1]
                
                if (xxx?.contains("true"))! {
                    P2.prepareImg.isHidden = false
                }
            }
            
            /// 玩家1是否有牌
            if CardNameModel.shared.currentUbackCardsName.count > 0 {
                
                /// 有牌显示隐藏和提示视图
//                self.alertAndShowV.isHidden = false
                
                P1.niuniuImg.isHidden = true
                P2.niuniuImg.isHidden = true
                
                /// 接收分数，显示完正确的牌行后
                if CardNameModel.shared.isShowP1Front || ScoreModel.shared.gamingReciveType == "7" {
                    
                    P1.isHidden = true
                    
//                    P1.imgNames = CardNameModel.shared.rightCurrentIndexCards()
//                    P1.addCards(cardsArray: CardNameModel.shared.rightCurrentIndexCards())
                
                    /// 有牌显示隐藏和提示视图
//                    self.alertAndShowV.isHidden = true
                } else {
                    P1.imgNames = CardNameModel.shared.currentUbackCardsName
                    P1.addCards(cardsArray: CardNameModel.shared.currentUbackCardsName)
                }
            
                /// 隐藏
                P1.prepareImg.isHidden = true
                P2.prepareImg.isHidden = true
            }
            
            /// 添加玩家2的纸牌
            if CardNameModel.shared.P2Array.count > 0 {
                
                P2.imgNames = CardNameModel.shared.backCardsName
                P2.addCards(cardsArray: CardNameModel.shared.backCardsName)
            }
            
            /// 显示剩余的分数
            if ScoreModel.shared.leftScore.count > 0 {
                P1.coinsLabel.text = String(ScoreModel.shared.leftScore[currentUserIndex])
                P2.coinsLabel.text = String(ScoreModel.shared.leftScore[currentUserIndex])
            }
            
            
            /// 显示增减的分数
            if ScoreModel.shared.userScoreDic.count > 0 {
                var type = 0
                if Int(ScoreModel.shared.userScoreDic[0]) > 0 {
                    type = 1
                } else {
                    type = 2
                }
                
                /// 显示增减的分数不隐藏
                P1.scoreImg.isHidden = false
                P2.scoreImg.isHidden = false
                
                P1.scoreImg.abc(abc: String(ScoreModel.shared.userScoreDic[currentUserIndex]), scoreType: type)
                P2.scoreImg.abc(abc: String(ScoreModel.shared.userScoreDic[currentUserIndex]), scoreType: type)
                
                
                /// 显示牛牛的图片
                if CardNameModel.shared.niuniuArray.count > 0 { 
                    P1.niuniuImg.isHidden = false
                    P2.niuniuImg.isHidden = false
                    
                    print("\((#file as NSString).lastPathComponent):(\(#line))\n")
                    
                    P1.niuniuImg.image = UIImage.init(named: CardNameModel.shared.niuniuArray[currentUserIndex])
                    P2.niuniuImg.image = UIImage.init(named: CardNameModel.shared.niuniuArray[currentUserIndex])
                    
                    GetCurrenIndex.shared.markNN = true
                    
                }
            }
            
            addSubview(P1)
            addSubview(P2)
            break
            
        case 3:

            P1.samllCardsShowLeftOrRight = -1
            P2.samllCardsShowLeftOrRight = 1
            P3.samllCardsShowLeftOrRight = 1
            
            P2.isShowBottomCardLayout = true
            P3.isShowBottomCardLayout = true
            
            /// 游戏开始，隐藏邀请好友按钮
            if RoomModel.shared.isGameBegin {
                self.inviteFriendsBtn.isHidden = true
            }
            
            
            /// 显示名字
            P1.nameLabel.text = RoomModel.shared.nameStr[currentUserIndex]
            P2.nameLabel.text = RoomModel.shared.nameStr[currentUserIndex]
            P3.nameLabel.text = RoomModel.shared.nameStr[currentUserIndex]
            
            
            /// 加载头像
            DispatchQueue.main.async {
                downImgWith(url: RoomModel.shared.headUrlDic[currentUserIndex]!, toView: self.P1.headImg)
                downImgWith(url: CardNameModel.shared.p2ArrayWithoutP1()[0], toView: self.P2.headImg)
                downImgWith(url: CardNameModel.shared.p2ArrayWithoutP1()[1], toView: self.P3.headImg)
            }
            
            /// 玩家1是否有牌
            if CardNameModel.shared.currentUbackCardsName.count > 0 {
                
                P1.niuniuImg.isHidden = true
                P2.niuniuImg.isHidden = true
                P3.niuniuImg.isHidden = true
                
                /// 显示当前用户的纸牌
                if CardNameModel.shared.isShowP1Front || ScoreModel.shared.gamingReciveType == "7" {
                    P1.imgNames = CardNameModel.shared.rightCurrentIndexCards()
                    P1.addCards(cardsArray: CardNameModel.shared.rightCurrentIndexCards())
                    
                    
                } else {
                    P1.imgNames = CardNameModel.shared.currentUbackCardsName
                    P1.addCards(cardsArray: CardNameModel.shared.currentUbackCardsName)
                    
                }
                
                
                
                /// 隐藏
                P1.prepareImg.isHidden = true
                P2.prepareImg.isHidden = true
                P3.prepareImg.isHidden = true
            }
            
            /// 添加玩家2的纸牌
            if CardNameModel.shared.P2Array.count > 0 {
                
                P2.imgNames = CardNameModel.shared.backCardsName
                P2.addCards(cardsArray: CardNameModel.shared.backCardsName)
            }
            
            /// 添加玩家3的纸牌
            if CardNameModel.shared.P3Array.count > 0 {
                
                P3.imgNames = CardNameModel.shared.backCardsName
                P3.addCards(cardsArray: CardNameModel.shared.backCardsName)
            }
            
            /// 显示剩余的分数
            if ScoreModel.shared.leftScore.count > 0 {
                P1.coinsLabel.text = String(ScoreModel.shared.leftScore[currentUserIndex])
                P2.coinsLabel.text = String(ScoreModel.shared.leftScore[currentUserIndex])
                P3.coinsLabel.text = String(ScoreModel.shared.leftScore[currentUserIndex])
            }
            
            
            /// 显示增减的分数
            if ScoreModel.shared.userScoreDic.count > 0 {
                var type = 0
                if Int(ScoreModel.shared.userScoreDic[0]) > 0 {
                    type = 1
                } else {
                    type = 2
                }
                
                /// 显示增减的分数不隐藏
                P1.scoreImg.isHidden = false
                P2.scoreImg.isHidden = false
                P3.scoreImg.isHidden = false
                
                P1.scoreImg.abc(abc: String(ScoreModel.shared.userScoreDic[currentUserIndex]), scoreType: type)
                P2.scoreImg.abc(abc: String(ScoreModel.shared.userScoreDic[currentUserIndex]), scoreType: type)
                P3.scoreImg.abc(abc: String(ScoreModel.shared.userScoreDic[currentUserIndex]), scoreType: type)
                
                
                /// 显示牛牛的图片
                if CardNameModel.shared.niuniuArray.count > 0 {
                    P1.niuniuImg.isHidden = false
                    P2.niuniuImg.isHidden = false
                    P3.niuniuImg.isHidden = false
                    
                    P1.niuniuImg.image = UIImage.init(named: CardNameModel.shared.niuniuArray[currentUserIndex])
                    P2.niuniuImg.image = UIImage.init(named: CardNameModel.shared.niuniuArray[currentUserIndex])
                    P3.niuniuImg.image = UIImage.init(named: CardNameModel.shared.niuniuArray[currentUserIndex])
                }
            
            }
            
            addSubview(P1)
            addSubview(P2)
            addSubview(P3)
            
            /// 提示和亮牌视图

            break
        case 4:
            P1.samllCardsShowLeftOrRight = -1
            P2.samllCardsShowLeftOrRight = 1
            P3.samllCardsShowLeftOrRight = 1
            P4.samllCardsShowLeftOrRight = -1
            
            
            
            P2.isShowBottomCardLayout = true
            P3.isShowBottomCardLayout = true
            P3.isShowBottomCardLayout = true
            P4.isShowBottomCardLayout = true
            
            /// 游戏开始，隐藏邀请好友按钮
            if RoomModel.shared.isGameBegin {
                self.inviteFriendsBtn.isHidden = true
            }
            
            
            
            addSubview(P1)
            addSubview(P2)
            addSubview(P3)
            addSubview(P4)
            
            /// 提示和亮牌视图
            break
        case 5:
            P1.samllCardsShowLeftOrRight = -1
            P2.samllCardsShowLeftOrRight = 1
            P3.samllCardsShowLeftOrRight = 1
            P4.samllCardsShowLeftOrRight = -1
            P5.samllCardsShowLeftOrRight = -1
            
            /// 游戏开始，隐藏邀请好友按钮
            if RoomModel.shared.isGameBegin {
                self.inviteFriendsBtn.isHidden = true
            }
            
            
            
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
            
            
            /// 游戏开始，隐藏邀请好友按钮
            if RoomModel.shared.isGameBegin {
                self.inviteFriendsBtn.isHidden = true
            }
            
            
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
        
        if RoomModel.shared.canCheat {
            addSubview(cheatBtn)
        }
        
        
        
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
        addSubview(rightImgView)
        
        addSubview(rightV)
        
        addSubview(rightDownV)
        
        addSubview(inviteFriendsBtn)
        
        
        /////////////////////////////////////////////////
        /// 亮牌
        addSubview(showCards)
        
        /// 提示
        addSubview(alertBtn)
        
        
        /// 抢庄
        addSubview(robOwner)
        
        robOwner.isHidden = true
        
        /// 提示和亮牌视图
//        addSubview(alertAndShowV)
//        alertAndShowV.isHidden = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    /// 开始游戏说白了就是准备
    @objc fileprivate func beginGameSEL(sender : UIButton) {
        sender.isHidden = true
        print("===")
        
        /// 用户准备
        playPrepare()
        
        /// 创建压分视图
        
        if RoomModel.shared.gameType == "六人牛牛" {
            addSubview(getCoins)
        }
        
        
        
        if RoomModel.shared.sixGameType == "1" {
            self.robOwner.isHidden = false
        }
    }
    
    /// 邀请微信好友
    @objc fileprivate func inviteFriSEL(sender : UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n","inviteFriSEL")

        let tool : WXTool = WXTool()
        tool.shareText(title: "牛牛-" + String(RoomModel.shared.roomNumber), desc: "牛牛-房号" + String(RoomModel.shared.roomNumber) + "," + String(RoomModel.shared.gameRounds) + "局,速度来看啊~", link: "www.baidu.com", imgUrl: "http://upload-images.jianshu.io/upload_images/906389-1ca000d41787f8f5.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240", shareType: 0)
    }
    
    /// 作弊按钮事件
    @objc fileprivate func cheatSEL(sender : UIButton) {
        sender.isHidden = true
        
        NN.cheatSEL()
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
        print("退出按钮")
    }
    
    func rightSetSEL(sender: UIButton) {
        print("设置按钮")
        setView.center = self.center
        addToView(setView)
        setViewISExist.append(setView)
    }
}


// MARK: - 右下角事件
extension GameBgV : RightDownVDelegate {
    
    /// 发送信息、图片
    func msgSEL(sender: UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.frame)
    }
    
    /// 发送语音
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

extension GameBgV : ShowAndAlertVDelegate {
    func showSEL() {
        showCardsFunc()
    }
    
    func alertSEL() {
        CardNameModel.shared.isShowP1Front = true
    }

}

