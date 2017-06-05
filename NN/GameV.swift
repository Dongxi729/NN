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
    
    /// 开始游戏按钮
    fileprivate lazy var startGameBtn: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: self.Width * 0.42, y: self.Height * 0.55, width: self.Width * 0.15, height: self.Height * 0.15))
        d.addTarget(self, action: #selector(beginGameSEL(sender:)), for: .touchUpInside)
        d.setImage(#imageLiteral(resourceName: "beginBtn"), for: .normal)
        d.setImage(#imageLiteral(resourceName: "beingGameSelected"), for: .selected)
        return d
    }()
    
    /// 房间号
    lazy var roomNumber: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        d.text = String(RoomModel.shared.roomNumber)
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
    
    /// 抢庄视图
    lazy var robOwner: RobRoomOwner = {
        let d : RobRoomOwner = RobRoomOwner.init(frame: CGRect.init(x: self.Width * 0.25, y: self.Height * 0.5 - self.Height * 0.05, width: self.Width * 0.5, height: self.Height * 0.1))
        d.layer.borderWidth = 1
        return d
    }()
    
    /// 显示离线视图
    

    /// 非庄家压分
    fileprivate lazy var getCoins: MarkChoose = {
        let d : MarkChoose = MarkChoose.init(frame: CGRect.init(x: self.Width * 0.5 - self.Width * 0.25, y: self.Height * 0.75 - self.Height * 0.123, width: SW * 0.5, height: SH * 0.25))
        
        return d
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        addSubview(alertAndShowV)
        
        addSubview(roomNumber)
        
        addSubview(alertBtn)
        
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(isRobOrNotSEL), name: NSNotification.Name(rawValue: "isRobOrNot"), object: nil)
        
//        niuniuArray
        NotificationCenter.default.addObserver(self, selector: #selector(isRobOrNotSEL), name: NSNotification.Name(rawValue: "niuniuArray"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(isGameBeginSEL), name: NSNotification.Name(rawValue: "isGameBegin"), object: nil)
        
//        GameOver
        NotificationCenter.default.addObserver(self, selector: #selector(gameverSEL), name: NSNotification.Name(rawValue: "isGameBegin"), object: nil)
        
        /// 判断抢庄
        NotificationCenter.default.addObserver(self, selector: #selector(isRobOrNotSEL), name: NSNotification.Name(rawValue: "beginRob"), object: nil)
        
        /// RoomOwner
        NotificationCenter.default.addObserver(self, selector: #selector(isRobOrNotSEL), name: NSNotification.Name(rawValue: "RoomOwner"), object: nil)
        
        createGamingLayout()
    }
    
    /// 根据选择的房主进行判断
    func chooseOwner() -> Void {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "RoomOwner"), object: nil)
        
        /// 是房主就不显示积分
        if RoomOwner.shared.ownerID != RoomModel.shared.userId[GetCurrenIndex.shared.currentUserIndex] {
            self.getCoins.isHidden = false
        }
    }
    
    /// 游戏结束
    func gameverSEL() -> Void {
        createGamingLayout()
    }
    
    /// 游戏开始时进行的动作
    func isGameBeginSEL() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "isGameBegin"), object: nil)
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        
        /// 显示抢庄
        if RoomModel.shared.isGameBegin {
            self.startGameBtn.isHidden = true
            self.robOwner.isHidden = true
            self.getCoins.isHidden = true
        }
    }
    
    func showniuniuArraySEL() -> Void {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "niuniuArray"), object: nil)
        createGamingLayout()
    }
    
    /// 显示抢庄
    func isRobOrNotSEL() -> Void {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "beginRob"), object: nil)
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        
        
        if RobOwnerModel.shared.isRobOrNot == false {
            self.robOwner.isHidden = false
        }
        
        self.startGameBtn.isHidden = true
        self.getCoins.isHidden = true
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
            
            
            /// 纸牌 不能提前创建，除非模型有值，才能创建
            //////////////////////////////////////////////////
            
            /// 打开才显示
            P2.isShowBottomCardLayout = true
            
            /// 玩家1是否有牌
            if CardNameModel.shared.currentUbackCardsName.count > 0 {
                P1.imgNames = CardNameModel.shared.currentUbackCardsName
                P1.addCards(cardsArray: CardNameModel.shared.currentUbackCardsName)
                P1.isShowBottomCardLayout = false
                
                P2.imgNames = CardNameModel.shared.backCardsName
            } else {
                P1.isShowBottomCardLayout = true
            }
            
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",CardNameModel.shared.currentUbackCardsName)
            
            /// 弹出错误掉网提示框
            if GetCurrenIndex.shared.p2NameLabelWithoutP1().count == 0 {
                let d = OffLineV.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.6, height: SH * 0.75))
                
                d.center = self.center
                
                addSubview(d)
                return
            }
            
            /// 名字
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
        showCardsSEL()
    }
    
    /// 提示
    func alertSEL() {
        CardNameModel.shared.isShowP1Front = true
        
        P1.imgNames = CardNameModel.shared.rightCurrentIndexCards()
        P1.addCards(cardsArray: CardNameModel.shared.rightCurrentIndexCards())
    }
}
