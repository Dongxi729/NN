//
//  CardNameModel.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/23.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  处理纸牌的模型

import UIKit

class CardNameModel: NSObject {
    /// 暂存纸牌的数组
    fileprivate var P1CardsArrray : [String] = []
    fileprivate var P2CardsArrray : [String] = []
    fileprivate var P3CardsArrray : [String] = []
    fileprivate var P4CardsArrray : [String] = []
    fileprivate var P5CardsArrray : [String] = []
    fileprivate var P6CardsArrray : [String] = []
    
    static let shared = CardNameModel()
    
    
    var isShowP1Front = false
    
    var P1Array : [String] = []
    
    var P2Array : [String] = []
    var P3Array : [String] = []
    var P4Array : [String] = []
    var P5Array : [String] = []
    var P6Array : [String] = []
    
    // 背面纸牌
    var backCardsName : [String] = ["p0",
                                    "p0",
                                    "p0",
                                    "p0",
                                    "p0",
                                    "p0"]
    
    // 当前玩家默认隐藏2张
    var currentUbackCardsName : [String] = []
    
    /// 牛牛数组
    var niuniuArray : [String] = []
    
    
    
    /// 是否收到结算分数标识
    var isreceivedCountScore = "false"
    
    var receiverStr : String = "" {
        didSet {

            self.xmlAnalyse(xmlStr: receiverStr)
        }
    }
    
    
    /// 用户1
    var currentUserIndex = 0
    
    /// 当前用户的索引
    func currentUserIndexSEL() -> [String] {
        
        let cardsArray : [String] = []
        
        /// 返回当前用户的分数位置(用户1)
        var userIndex1 = 0
        
        for value in RoomModel.shared.userId {
            
            /// 当前用户的
            if value == LoginModel.shared.uid {
                currentUserIndex = userIndex1
                break
            }
            
            userIndex1 += 1
        }
        
        switch userIndex1 {
        case 0:
            return P1Array
            
        case 1:
            return P2Array
            
        case 2:
            return P3Array
            
        case 3:
            return P4Array
            
        case 4:
            return P5Array
            
        case 5:
            return P6Array
            
        default:
            break
        }
        
        return cardsArray
    }
    
    /// 当前用户的索引
    func rightCurrentIndexCards() -> [String] {
        
        let cardsArray : [String] = []
        
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
        
        
        switch userIndex1 {
        case 0:
            return P1Array
            
        case 1:
            return P2Array
            
        case 2:
            return P3Array
            
        case 3:
            return P4Array
            
        case 4:
            return P5Array
            
        case 5:
            return P6Array
            
        default:
            break
        }
        
        return cardsArray
    }
    
    fileprivate func xmlAnalyse(xmlStr : String) -> Void {
        
        currentUbackCardsName = []
        
        P1CardsArrray = []
        P2CardsArrray = []
        P3CardsArrray = []
        P4CardsArrray = []
        P5CardsArrray = []
        P6CardsArrray = []
        
        
        niuniuArray = []
        
        
        self.isreceivedCountScore = "false"
        
        //获取xml文件内容
        let data = xmlStr.data(using: String.Encoding.utf8)
        
        //构造XML文档
        let doc = try! DDXMLDocument(data: data!, options:0)
        
        let marks = try! doc.nodes(forXPath: "//M/ty") as! [DDXMLElement]
        
        for _user in marks {
            if _user.attribute(forName: "type")?.stringValue != nil {
                self.isreceivedCountScore = (_user.attribute(forName: "type")?.stringValue!)!
                
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",self.isreceivedCountScore)
            }
        }
        
        
        let users = try! doc.nodes(forXPath: "//M/ty/u") as! [DDXMLElement]
        
        
        for user in users {
            
            
            if user.attribute(forName: "p1")?.stringValue != nil {
                P1CardsArrray.append((user.attribute(forName: "p1")?.stringValue)!)
            }
            
            if user.attribute(forName: "p2")?.stringValue != nil {
                P2CardsArrray.append((user.attribute(forName: "p2")?.stringValue)!)
            }
            
            if user.attribute(forName: "p3")?.stringValue != nil {
                P3CardsArrray.append((user.attribute(forName: "p3")?.stringValue)!)
            }
            
            if user.attribute(forName: "p4")?.stringValue != nil {
                P4CardsArrray.append((user.attribute(forName: "p4")?.stringValue)!)
            }
            
            if user.attribute(forName: "p5")?.stringValue != nil {
                P5CardsArrray.append((user.attribute(forName: "p5")?.stringValue)!)
            }
            
            if user.attribute(forName: "p6")?.stringValue != nil {
                P6CardsArrray.append((user.attribute(forName: "p6")?.stringValue)!)
            }
            
            
            /// 牛牛
            if user.attribute(forName: "can")?.stringValue != nil {
                niuniuArray.append((user.attribute(forName: "can")?.stringValue)!)
            }
            
            
            
            /// 除了当前用户外的牛牛数组
        }
        
        
        if P1CardsArrray.count > 0 {
            P1Array.append(P1CardsArrray[0])
            P1Array.append(P2CardsArrray[0])
            P1Array.append(P3CardsArrray[0])
            P1Array.append(P4CardsArrray[0])
            P1Array.append(P5CardsArrray[0])
        }
        
        if P1CardsArrray.count > 1 {
            P2Array.append(P1CardsArrray[1])
            P2Array.append(P2CardsArrray[1])
            P2Array.append(P3CardsArrray[1])
            P2Array.append(P4CardsArrray[1])
            P2Array.append(P5CardsArrray[1])
        }
        
        if P1CardsArrray.count > 2 {
            P3Array.append(P1CardsArrray[2])
            P3Array.append(P2CardsArrray[2])
            P3Array.append(P3CardsArrray[2])
            P3Array.append(P4CardsArrray[2])
            P3Array.append(P5CardsArrray[2])
        }
        
        if P1CardsArrray.count > 3 {
            P4Array.append(P1CardsArrray[3])
            P4Array.append(P2CardsArrray[3])
            P4Array.append(P3CardsArrray[3])
            P4Array.append(P4CardsArrray[3])
            P4Array.append(P5CardsArrray[3])
        }
        
        if P1CardsArrray.count > 4 {
            P5Array.append(P1CardsArrray[4])
            P5Array.append(P2CardsArrray[4])
            P5Array.append(P3CardsArrray[4])
            P5Array.append(P4CardsArrray[4])
            P5Array.append(P5CardsArrray[4])
        }
        
        if P1CardsArrray.count > 5 {
            P5Array.append(P1CardsArrray[5])
            P5Array.append(P2CardsArrray[5])
            P5Array.append(P3CardsArrray[5])
            P5Array.append(P4CardsArrray[5])
            P5Array.append(P5CardsArrray[5])
        }
        
        
        /// 游戏状态改为开始
        RoomModel.shared.isGameBegin = true
        
        print(P1Array)
        print(P2Array)
        print(P3Array)
        print(P4Array)
        print(P5Array)
        print(P6Array)
        
        
        
        P1Array = getImgName(sss: P1Array)
        P2Array = getImgName(sss: P2Array)
        P3Array = getImgName(sss: P3Array)
        P4Array = getImgName(sss: P4Array)
        P5Array = getImgName(sss: P5Array)
        P5Array = getImgName(sss: P6Array)
        
        
        
        /// 当前玩家默认只显示前三张纸牌
        currentUbackCardsName = [currentUserIndexSEL()[0],
                                 currentUserIndexSEL()[1],
                                 currentUserIndexSEL()[2],
                                 "p0",
                                 "p0"]

        print("\((#file as NSString).lastPathComponent):(\(#line))\n",currentUbackCardsName)
        
        niuniuArray = contactName(cardsArray: niuniuArray, prefix: "niu")
        
        /// 发通知
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "niuniuArray"), object: nil)
    }
    
    
    /// 拼接
    ///
    /// - Parameter prefix: 图片前缀
    private func contactName(cardsArray : [String],prefix : String) -> [String] {
        let names = cardsArray.map {
            prefix + String($0)
        }
        return names
    }
    
    /// 处理纸牌
    ///
    /// - Parameter cards: 传入要纸牌的名字
    /// - Returns: 带有图片名称的纸牌
    func getImgName(sss : [String]) -> [String] {
        
        var cardsName : String!
        
        var cardsNeArray : [String] = []
        
        
        for imgName in sss {
            
            cardsName = imgName
            
            /// 处理♦
            if imgName.contains("♦") {
                
                cardsName = (cardsName as NSString).replacingOccurrences(of: "♦$", with: "pa")
                cardsNeArray.append(cardsName)
            }
            
            /// 处理♣
            if imgName.contains("♣") {
                
                cardsName = (cardsName as NSString).replacingOccurrences(of: "♣$", with: "pd")
                cardsNeArray.append(cardsName)
            }
            
            /// 处理♥
            if imgName.contains("♥") {
                
                cardsName = (cardsName as NSString).replacingOccurrences(of: "♥$", with: "pc")
                cardsNeArray.append(cardsName)
            }
            
            /// 处理♠
            if imgName.contains("♠") {
                
                cardsName = (cardsName as NSString).replacingOccurrences(of: "♠$", with: "pb")
                cardsNeArray.append(cardsName)
            }
        }
        
        return cardsNeArray
    }
    
    /// 用户2的数据
    func p2ArrayWithoutP1() -> [String] {
    
        
        /// 移除了第一个索引后的值
        var newDic : [String] = []
        
        for (_,v) in RoomModel.shared.headUrlDic {
            
            if v != RoomModel.shared.headUrlDic[currentUserIndex] {
                newDic.append(v)
            }
        }
        
        
        return newDic
    }
}
