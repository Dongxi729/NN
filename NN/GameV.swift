//
//  GameV.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/5.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  正在玩游戏的视图

import UIKit

class GameV: UIView {
    
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
    
    
    // MARK: - 提示
    lazy var alertBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: self.Height * 0.7, width: 100, height: 50))
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(testShow), for: .touchUpInside)
        d.setTitle("提示", for: .normal)
        return d
    }()
    
    /// 测试--- 提示
    @objc fileprivate func testShow() {
        
        CardNameModel.shared.isShowP1Front = true
        
        P1.imgNames = CardNameModel.shared.rightCurrentIndexCards()
        P1.addCards(cardsArray: CardNameModel.shared.rightCurrentIndexCards())
    }
    
    
    /// 创建用户位置
    private func createUserPosition() -> Void {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",RoomModel.shared.isGameBegin)

    }
    
    /// 创建布局
    func createGamingLayout() -> Void {
        
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "createGamingLayout"), object: nil)


        
        
        switch RoomModel.shared.currentPersonInRoom {
            
        case 1:
            P1.samllCardsShowLeftOrRight = -1
            
            P1.nameLabel.text = RoomModel.shared.nameStr[0]
            
            
            DispatchQueue.main.async {
                let headStr = RoomModel.shared.headUrlDic[0]
                
                downImgWith(url: headStr!, toView: self.P1.headImg)
            }
            
            
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
            
            /// 六人牛牛的抢庄视图是否显示，当且仅当六人牛牛玩法为抢庄模式的时候显示。
            P2.isShowBottomCardLayout = true
            
            /// 纸牌 不能提前创建，除非模型有值，才能创建
            //////////////////////////////////////////////////
            
            P1.imgNames = CardNameModel.shared.currentUbackCardsName
            P1.addCards(cardsArray: CardNameModel.shared.currentUbackCardsName)
            P1.isShowBottomCardLayout = false
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",CardNameModel.shared.currentUbackCardsName)
            
            P2.imgNames = CardNameModel.shared.backCardsName
            
            /// 下载头像
            DispatchQueue.main.async {
                
                let headStr = RoomModel.shared.headUrlDic[GetCurrenIndex.shared.currentUserIndex]
                let headStr2 = GetCurrenIndex.shared.p2ArrayWithoutP1()[0]
                
                downImgWith(url: headStr!, toView: self.P1.headImg)
                downImgWith(url: headStr2, toView: self.P2.headImg)
            }
            
            break
        default: break
        }

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(alertBtn)
        
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
        
        /// 开始按钮
        addSubview(startGameBtn)
        
        
        DispatchQueue.main.async {
            self.addSubview(self.P1)
            self.addSubview(self.P2)
        }
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(createGamingLayout), name: NSNotification.Name(rawValue: "CardNameModelNotNIll"), object: nil)
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
        
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",RoomModel.shared.isGameBegin)
        
    }
}
