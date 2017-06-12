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
    
    // MARK: - 游戏类型 1： 六人牛牛  通比牛牛
    var gameType : String = "1"
    
    // MARK: - 六人牛牛玩法模式
    var sixGameType : String = "1"
    
    // MARK: - 游戏局数 10 、 20 、 30
    var gameRounds : String = "10"
    
    // MARK: - 是否可以作弊
    var canCheat = false
    
    // MARK: - 当前局数
    var currentRounds : String = "0"
    
    // MARK: - 开始规定的游戏人数
    var limitedPlayersNum : Int = 3
    
    // MARK: - 当前房间所在人数
    var currentPersonInRoom : Int = 0
    
    // MARK: - 积分
    var wantCoins : String = "5"
    
    // MARK: - 支付方式 : 房主平摊、房主结算
    var payType : String = "1"
    
    // MARK: - 用户ID
    var userId : [String] = []
    
    // MARK: - 准备人员数量
    var readPlayerCount : Int = 0
    
    // MARK: - 游戏是否开始
    var isGameBegin = false
    
    // MARK: - 是否抢庄
    var isRobRoomOwner = true
    
    // MARK: - 是否显示波纹
    var isShowWave = false
    
    // MARK: - 是否离线
    var isOffLine = false
    
    // MARK: - 是否庄主
    var isOwner = false
    
    // MARK: - 是否准备好
    var isPrepared = false
    
    // MARK: - 是否完成比牌
    var isCardsChoosed = false
    
    // MARK: - 是否邀请朋友
    var isInvitedFri = false
    
    // MARK: - 开局所用分数
    var scoreCount : String!
    
    // MARK: - 房间号
    var roomNumber : Int!
    
    // MARK: - 加入房间使用的房间号
    var joinRoomNumber : [String] = []
    
    // MARK: - 名字字典
    var userName : [String] = []
    var nameStr = [Int : String]()
    
    // MARK: - 处理过的名字
    var nameStrDealed : [String] = []
    
    // MARK: - 头像字典
    fileprivate var headURLArray : [String] = []
    var headUrlDic = [Int : String]()
    
    // MARK: - 修改后的头像数组
    var headURLArrayDealed : [String] = []
    
    // MARK: - 分数字典
    var userScore : [String] = []
    
    // MARK: - 用户原始的分数
    var userScoreCalued : [String] = []
    
    var userScoreDic = [Int : String]()
    
    
    // MARK: - 准备
    var prepareArray : [String] = []
    
    // MARK: - 整理过的准备
    var prepareArrayDealed : [String] = []
    
    
    var prepareDic = [Int : String]()
    
    
    // MARK: - xml 当前游戏(还未开始的游戏房间的数据)
    var currentRoomPlayInfo : String = "" {
        didSet {
            self.xmlAnalyse(xmlStr: currentRoomPlayInfo)
        }
    }
    
    fileprivate func xmlAnalyse(xmlStr : String) -> Void {
        //获取xml文件内容
        let data = xmlStr.data(using: String.Encoding.utf8)
        
        //构造XML文档
        let doc = try! DDXMLDocument(data: data!, options:0)
        
        //利用XPath来定位节点（XPath是XML语言中的定位语法，类似于数据库中的SQL功能）
        let users = try! doc.nodes(forXPath: "//M/tg") as! [DDXMLElement]
        for user in users {
            
            /// 游戏类型
            if user.attribute(forName: "gt") != nil {
                let gameType = user.attribute(forName: "gt")!.stringValue!
                
                self.sixGameType = gameType
                
                if gameType < "5" {
                    self.gameType = "六人牛牛"
                } else {
                    self.gameType = "通比牛牛"
                }
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
            
            
            print("====房间号",self.roomNumber)
            
            print("=====self.gameType",self.gameType)
            
            print("=====self.wantCoins",self.wantCoins)
            
            print("====== 支付方式",self.payType)
            
            print("====== 总局数",self.gameRounds)
            
            print("====== 当前局数",self.currentRounds)
            
            print("====== 当前房间在线人数",self.currentPersonInRoom)
            
            print("====== 拟定创建好房间的总人数",self.limitedPlayersNum)
        }
        
        let _users = try! doc.nodes(forXPath: "//M/ty/u") as! [DDXMLElement]
        
        /// 重新执行,就重写操作时清空，因为持续的操作不会释放内存
        self.userName = []
        
        self.headURLArray = []
        self.userScore = []
        
        
        self.prepareArray = []
        
        self.userId = []
        
        self.userScoreCalued = []
        self.prepareArrayDealed = []
        self.nameStrDealed = []
        self.headURLArrayDealed = []
        
        for user in _users {
            
            /// 解析用户ID
            ///=========================== 准备
            if user.attribute(forName: "id") != nil {
                let userUID = user.attribute(forName: "id")?.stringValue
                
                if userUID != nil {
                    self.userId.append(userUID!)
                }
            }
           
            ///=========================== 名字解析成字典供后面使用,展示使用
            if user.attribute(forName: "n") != nil {
                let resultStr = user.attribute(forName: "n")?.stringValue
                
                if resultStr != nil {
                    self.userName.append(resultStr!)
                } else {
                    if userName.count == RoomModel.shared.currentPersonInRoom {

                        nameStrDealed.insert(userName[GetCurrenIndex.shared.getCurrentIndex()], at: 0)
                        
                        var idex = 0
                        for calue in userName {
                            
                            idex += 1
                            
                            if idex != GetCurrenIndex.shared.getCurrentIndex() + 1 {
                                
                                nameStrDealed.append(calue)
                            }
                        }
                    }
                }
                /// =========================索引
                var index = 0
                
                
                for ddd in self.userName {
                    
                    if ddd.characters.count == 0 {
                        nameStr.updateValue("  ", forKey: index)
                    } else {
                        nameStr.updateValue(ddd, forKey: index)
                    }
                    
                    
                    index += 1
                }
            }
            ///=========================== 分数
            let scoreStr = user.attribute(forName: "g")?.stringValue
            
            if scoreStr != nil {
                self.userScore.append(scoreStr!)
                
                /// 添加当前局数的用户的原始分数
                if self.userScore.count == currentPersonInRoom {
                    
                    if userScore.count == GetCurrenIndex.shared.getCurrentIndex() {
                        userScoreCalued.insert(userScore[GetCurrenIndex.shared.getCurrentIndex()], at: 0)
                        
                        var idex = 0
                        for calue in userScore {
                            idex += 1
                            if idex != GetCurrenIndex.shared.getCurrentIndex() + 1 {
                                userScoreCalued.append(calue)
                                if userScoreCalued.count == currentPersonInRoom {
                                    
                                    UserDefaults.standard.set(userScoreCalued, forKey: "用户原始分数")
                                    UserDefaults.standard.synchronize()
                                    /// 发通知，显示分数文字
                                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ShowScoretext"), object: nil)
                                    
                                }
                            }
                        }
                    }
                }
            }
            
            
            
            ///=========================== 准备
            if user.attribute(forName: "re") != nil {
                let prepareStr = user.attribute(forName: "re")?.stringValue
                
                if prepareStr != nil {
                    self.prepareArray.append(prepareStr!)
                    
                    /// 进行当前正确的准备投放
                    if prepareArray.count == RoomModel.shared.currentPersonInRoom {
                        prepareArrayDealed.insert(prepareArray[GetCurrenIndex.shared.getCurrentIndex()], at: 0)
                        
                        var idex = 0
                        for calue in prepareArray {
                            
                            idex += 1
                            if idex != GetCurrenIndex.shared.getCurrentIndex() + 1 {
                                prepareArrayDealed.append(calue)
                                print("=====",prepareArrayDealed)
                                
                                
                                if prepareArrayDealed.count == RoomModel.shared.currentPersonInRoom {
                                    
                                    /// 发通知、显示玩家准备状态-prepared
                                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "prepared"), object: nil)
                                }
                            }
                        }
                    }
                }
            }
            
            var prepareIndex = 0
            
            for ddd in self.prepareArray {
                
                prepareDic.updateValue(ddd, forKey: prepareIndex)
                
                prepareIndex += 1
                
                CardNameModel.shared.isShowP1Front = false
            }
            
            
            
            
            ///=========================== 头像地址
            if user.attribute(forName: "h") != nil {
                let headUrlStr = user.attribute(forName: "h")?.stringValue
                
                if headUrlStr != nil {
                    self.headURLArray.append(headUrlStr!)
                    
                    if userName.count == RoomModel.shared.currentPersonInRoom {
                        
                        
                        headURLArrayDealed.insert(headURLArray[GetCurrenIndex.shared.getCurrentIndex()], at: 0)
                        
                        var idex = 0
                        for calue in headURLArray {
                            
                            idex += 1
                            
                            if idex != GetCurrenIndex.shared.getCurrentIndex() + 1 {
                                
                                headURLArrayDealed.append(calue)
                                print("头像===========",headURLArrayDealed)
                                
                                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "currentPersonInRoom"), object: nil, userInfo: ["nameStr" : nameStrDealed])
                            }
                        }
                    }
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
                
                var scoreIndex = 0
                
                for ddd in self.userScore {
                    
                    if ddd.characters.count == 0 {
                        userScoreDic.updateValue("----", forKey: headURLIndex)
                    } else {
                        userScoreDic.updateValue(ddd, forKey: headURLIndex)
                    }
                    
                    scoreIndex += 1
                }
                
            }

        }
    }
}


