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
    var currentRounds : String = "0"
    
    /// 游戏人数 3/6人
    /// 开始规定的游戏人数
    var limitedPlayersNum : Int = 3 {
        didSet {
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n")
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
    
    /// 用户名
    var userName : [String] = []
    
    /// 是否准备
    var isReady = false
    
    /// 准备人员数量
    var readPlayerCount : Int = 0
    
    /// 游戏是否开始
    var isGameBegin = false
    
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
        //<tg gt="1" ii="10" tii="0" rn="3" py="1" pyn="25" rnw="1"/>
        //<t>
        //<u id="51615751" h="" n="黯" g="0" bks="false" sc="0"/>
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
            
            if gameType == "1" {
                self.gameType = "六人牛牛"
            } else {
                self.gameType = "通比牛牛"
            }
            
            /// 拟定积分
            self.wantCoins = user.attribute(forName: "pyn")!.stringValue!
            
            /// 支付方式
            self.payType = user.attribute(forName: "py")!.stringValue!
            
            /// 总局数
            self.gameRounds = user.attribute(forName: "ii")!.stringValue!
            
            /// 当前局数
            self.currentRounds = user.attribute(forName: "tii")!.stringValue!
            
            /// 当前游戏人数
            self.currentPersonInRoom = Int(user.attribute(forName: "rnw")!.stringValue!)!
            
            /// 拟定开好房间的总人数
            self.limitedPlayersNum = Int(user.attribute(forName: "rn")!.stringValue!)!
            
            print("=====self.gameType",self.gameType)
            
            print("=====self.wantCoins",self.wantCoins)
            
            print("====== 支付方式",self.payType)
            
            print("====== 总局数",self.gameRounds)
            
            print("====== 当前局数",self.currentRounds)
            
            print("====== 当前房间在线人数",self.currentPersonInRoom)
            
            print("====== 拟定创建好房间的总人数",self.limitedPlayersNum)
            
        }
        
        let _users = try! doc.nodes(forXPath: "//M/t/u") as! [DDXMLElement]
        
        for user in _users {
            /// 游戏类型
            if user.attribute(forName: "n") != nil {
                self.userName.append((user.attribute(forName: "n")?.stringValue)!)
                print("self.userName",self.userName)
            }
            
            
            /// 游戏类型
            if user.attribute(forName: "id") != nil {
                self.userId.append((user.attribute(forName: "id")?.stringValue)!)
                print("self.userId",self.userId)
            }
            
            /// 是否准备
            if user.attribute(forName: "bks") != nil {
                let ready = user.attribute(forName: "bks")!.stringValue!
                if ready == "false" {
                    self.isReady = false
                } else {
                    self.isReady = true
                }
                print("======self.isReady",self.isReady)
            }
        }
    }
}
