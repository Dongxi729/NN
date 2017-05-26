//
//  CurrentRoomUserModel.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/12.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  房间信息(还未开始的游戏房间的数据)


import UIKit

typealias RoomDis = (_ sss : String) -> ()

class RoomModel: NSObject {
    
    static let shared = RoomModel()
    
    /// 游戏类型 1： 六人牛牛  通比牛牛
    var gameType : String = "1"
    
    /// 游戏局数 10 、 20 、 30
    var gameRounds : String = "10"
    
    /// 当前局数
    var currentRounds : String = "0" {
        didSet {
            DispatchQueue.main.async {
                UIApplication.shared.keyWindow?.rootViewController = GamingVC()

//                CardNameModel.shared.niuniuArray = []
                ScoreModel.shared.userScoreDic = []
                
                
            }
        }
    }
    
    /// 游戏人数 3/6人
    /// 开始规定的游戏人数
    var limitedPlayersNum : Int = 3 {
        didSet {
            
            DispatchQueue.main.async {
                UIApplication.shared.keyWindow?.rootViewController = GamingVC()
            }
        }
    }
    
    /// 当前房间所在人数
    var currentPersonInRoom : Int = 0
    
    /// 积分
    var wantCoins : String = "5"
    
    /// 支付方式 : 房主平摊、房主结算
    var payType : String = "1"
    
    /// 用户ID
    var userId : [String] = []
    
    
    
    /// 是否准备
    var isReady = false
    
    /// 准备人员数量
    var readPlayerCount : Int = 0
    
    /// 游戏是否开始
    var isGameBegin = false
    
    /// 是否抢庄
    var isRobRoomOwner = true
    
    /// 是否显示波纹
    var isShowWave = false
    
    /// 是否离线
    var isOffLine = false
    
    /// 是否庄主
    var isOwner = false
    
    /// 是否准备好
    var isPrepared = false
    
    /// 是否完成比牌
    var isCardsChoosed = false
    
    /// 是否邀请朋友
    var isInvitedFri = false
    
    /// 开局所用分数
    var scoreCount : String!
    
    /// 房间号
    var roomNumber : Int!
    
    /// 加入房间使用的房间号
    var joinRoomNumber : [String] = []
    
    /// 名字字典
    fileprivate var userName : [String] = []
    var nameStr = [Int : String]()
    
    /// 头像字典
    
    fileprivate var headURLArray : [String] = []
    var headUrlDic = [Int : String]()
    
    /// 分数字典
    fileprivate var userScore : [String] = []
    var userScoreDic = [Int : String]()
    
    /// 准备
    fileprivate var prepareArray : [String] = []
    var prepareDic = [Int : String]()
    
    /// xml 当前游戏(还未开始的游戏房间的数据)
    var currentRoomPlayInfo : String = "" {
        didSet {
            print("currentRoomPlayInfo",currentRoomPlayInfo)
            self.xmlAnalyse(xmlStr: currentRoomPlayInfo)
        }
    }
    
    /// 解析的xml字符串
    fileprivate func xmlAnalyse(xmlStr : String) -> Void {
        //获取xml文件内容
        let data = xmlStr.data(using: String.Encoding.utf8)
        
        //构造XML文档
        let doc = try! DDXMLDocument(data: data!, options:0)
        
        //<M>
        //        <tg rm="6507" gt="1" ii="10" tii="0" rn="3" py="1" pyn="25" ss="0" rnw="2"/>
        //<t>
        //<u id="51615751" h="" n="黯" g="0" bks="false" sc="0"/>
        //        <u id="50257938" h="http://wx.qlogo.cn/mmopen/Q3auHgzwzM5eia0u1RooDmyq7owxXPicPnibeO3P9NYicZ2IbjNNsXkJicrNGSPEBiaialL9bFia3XXu7PXSeIujp3I90W79Eqh2qfiamLDc8uSZRt0Y/0" n="阿东^_^^_^^_^" g="0" re="false"/>
        
        //<u id="0"/>
        //<u id="0"/>
        //</t>
        //<Nn/>
        //</M>
        //利用XPath来定位节点（XPath是XML语言中的定位语法，类似于数据库中的SQL功能）
        let users = try! doc.nodes(forXPath: "//M/tg") as! [DDXMLElement]
        for user in users {
            
            /// 游戏类型
            let gameType = user.attribute(forName: "gt")!.stringValue!
            
            if gameType < "5" {
                self.gameType = "六人牛牛"
            } else {
                self.gameType = "通比牛牛"
            }
            
            /// 房间号
            self.roomNumber = Int(user.attribute(forName: "rm")!.stringValue!)
            let roomNumber = user.attribute(forName: "rm")!.stringValue!
            self.joinRoomNumber.append(roomNumber)
            
            /// 拟定积分
            self.wantCoins = user.attribute(forName: "pyn")!.stringValue!
            
            /// 支付方式
            self.payType = user.attribute(forName: "py")!.stringValue!
            
            /// 总局数
            self.gameRounds = user.attribute(forName: "ii")!.stringValue!
            
            /// 当前局数
            self.currentRounds = String(Int(user.attribute(forName: "tii")!.stringValue!)! + 1)
            
            
            /// 当前游戏人数
            self.currentPersonInRoom = Int(user.attribute(forName: "rnw")!.stringValue!)!
            
            /// 拟定开好房间的总人数
            self.limitedPlayersNum = Int(user.attribute(forName: "rn")!.stringValue!)!
            
//            
//            
//            print("====房间号",self.roomNumber)
//            
//            print("=====self.gameType",self.gameType)
//            
//            print("=====self.wantCoins",self.wantCoins)
//            
//            print("====== 支付方式",self.payType)
//            
//            print("====== 总局数",self.gameRounds)
//            
//            print("====== 当前局数",self.currentRounds)
//            
//            print("====== 当前房间在线人数",self.currentPersonInRoom)
//            
//            print("====== 拟定创建好房间的总人数",self.limitedPlayersNum)
//            
//            
//            print("====== 所有名字",self.userName)
        }
        
        let _users = try! doc.nodes(forXPath: "//M/ty/u") as! [DDXMLElement]
        
        /// 重新执行,就重写操作时清空，因为持续的操作不会释放内存
        self.userName = []
        
        self.headURLArray = []
        self.userScore = []
        
    
        self.prepareArray = []
        
        for user in _users {
            
            ///=========================== 名字解析成字典供后面使用,展示使用
            let resultStr = user.attribute(forName: "n")?.stringValue
            
            if resultStr != nil {
                self.userName.append(resultStr!)
            }
            /// 索引
            var index = 0
            
            
            for ddd in self.userName {
                
                if ddd.characters.count == 0 {
                    nameStr.updateValue("  ", forKey: index)
                } else {
                    nameStr.updateValue(ddd, forKey: index)
                }
                
                
                index += 1
            }
            
            ///=========================== 头像地址
            let headUrlStr = user.attribute(forName: "h")?.stringValue
            
            if headUrlStr != nil {
                self.headURLArray.append(headUrlStr!)
            }
            
            /// 索引
            var headURLIndex = 0
            
            for ddd in self.headURLArray {
                
                if ddd.characters.count == 0 {
                    headUrlDic.updateValue("https://10.url.cn/eth/ajNVdqHZLLAkicdgzTMWjbuuFd5oRpJKlfdlmymtAuHhzSOBXKENUPzKUO7picLoqFdt5H03dw64k/", forKey: headURLIndex)
                } else {
                    headUrlDic.updateValue(ddd, forKey: headURLIndex)
                }
                
                headURLIndex += 1
            }
            
            ///=========================== 分数
            
            let scoreStr = user.attribute(forName: "sc")?.stringValue
            
            if scoreStr != nil {
                self.userScore.append(scoreStr!)
            }
            var scoreIndex = 0
            
            for ddd in self.userScore {
                
                if ddd.characters.count == 0 {
                    userScoreDic.updateValue("----", forKey: headURLIndex)
                } else {
                    userScoreDic.updateValue(ddd, forKey: headURLIndex)
                }
                
                scoreIndex += 1
            }
            
            ///=========================== 准备
            let prepareStr = user.attribute(forName: "re")?.stringValue
            
            if prepareStr != nil {
                self.prepareArray.append(prepareStr!)
            }
            var prepareIndex = 0
            
            for ddd in self.prepareArray {
                
                prepareDic.updateValue(ddd, forKey: prepareIndex)
                
                prepareIndex += 1
            }
            
        }
    
        
    }
}
