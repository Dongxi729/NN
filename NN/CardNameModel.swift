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
    
    static let shared = CardNameModel()
    
    var P1Array : [String] = [] {
        didSet {
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n")
            DispatchQueue.main.async {
                
                /// 移除在创建
                
                UIApplication.shared.keyWindow?.rootViewController?.view.removeFromSuperview()
                
                UIApplication.shared.keyWindow?.rootViewController = GamingVC()
            }
        }
    }

    var P2Array : [String] = []
    var P3Array : [String] = []
    var P4Array : [String] = []
    var P5Array : [String] = []
    
    // 背面纸牌
    var backCardsName : [String] = ["p0",
                                          "p0",
                                          "p0",
                                          "p0",
                                          "p0",
                                          "p0"]
    
    // 当前玩家默认隐藏2张
    var currentUbackCardsName : [String] = []
    
    var receiverStr : String = "" {
        didSet {
            print("receiverStr",receiverStr)
            
            self.xmlAnalyse(xmlStr: receiverStr)
        }
    }
    
    fileprivate func xmlAnalyse(xmlStr : String) -> Void {
        

        currentUbackCardsName = []
        
        P1CardsArrray = []
        P2CardsArrray = []
        P3CardsArrray = []
        P4CardsArrray = []
        P5CardsArrray = []
        
        //获取xml文件内容
        let data = xmlStr.data(using: String.Encoding.utf8)
        
        //构造XML文档
        let doc = try! DDXMLDocument(data: data!, options:0)
        
        
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
        
        
        /// 游戏状态改为开始
        RoomModel.shared.isGameBegin = true
        
        print(P1Array)
        print(P2Array)
        print(P3Array)
        print(P4Array)
        print(P5Array)

        
        
        P1Array = getImgName(sss: P1Array)
        P2Array = getImgName(sss: P2Array)
        P3Array = getImgName(sss: P3Array)
        P4Array = getImgName(sss: P4Array)
        P5Array = getImgName(sss: P5Array)
        
        print(P1Array)
        print(P2Array)
        print(P3Array)
        print(P4Array)
        print(P5Array)
        
        /// 当前玩家默认只显示前三张纸牌
        currentUbackCardsName = [P1Array[0],
                                 P1Array[1],
                                 P1Array[2],
                                 "p0",
                                 "p0"]
        

        
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",P2Array)
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
}
