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
    
    /// 处理好的纸牌的字典 [ 索引 : 图片名字 ]
    var P1CardsDic : [Int : String] = [:] {
        didSet {
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n")
            DispatchQueue.main.async {
                
                /// 移除在创建
                
                UIApplication.shared.keyWindow?.rootViewController?.view.removeFromSuperview()

                UIApplication.shared.keyWindow?.rootViewController = GamingVC()
            }
        }
    }
    
    
    var P2CardsDic : [Int : String] = [:]
    var P3CardsDic : [Int : String] = [:]
    var P4CardsDic : [Int : String] = [:]
    var P5CardsDic : [Int : String] = [:]
    var P6CardsDic : [Int : String] = [:]
    
    
    var receiverStr : String = "" {
        didSet {
            print("receiverStr",receiverStr)
            
            self.xmlAnalyse(xmlStr: receiverStr)
        }
    }
    
    fileprivate func xmlAnalyse(xmlStr : String) -> Void {
        
        P1CardsDic = [:]
        P2CardsDic = [:]
        P3CardsDic = [:]
        P4CardsDic = [:]
        P5CardsDic = [:]
        
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
        
        // P1牌
        if P1CardsArrray.count > 0 {
            P1CardsDic.updateValue(P1CardsArrray[0], forKey: 0)
            P1CardsDic.updateValue(P2CardsArrray[0], forKey: 1)
            P1CardsDic.updateValue(P3CardsArrray[0], forKey: 2)
            P1CardsDic.updateValue(P4CardsArrray[0], forKey: 3)
            P1CardsDic.updateValue(P5CardsArrray[0], forKey: 4)
        }
        
        // P2牌
        if P1CardsArrray.count > 1 {
            P2CardsDic.updateValue(P1CardsArrray[1], forKey: 0)
            P2CardsDic.updateValue(P2CardsArrray[1], forKey: 1)
            P2CardsDic.updateValue(P3CardsArrray[1], forKey: 2)
            P2CardsDic.updateValue(P4CardsArrray[1], forKey: 3)
            P2CardsDic.updateValue(P5CardsArrray[1], forKey: 4)
        }
        
        // P3牌
        if P1CardsArrray.count > 2 {
            P3CardsDic.updateValue(P1CardsArrray[2], forKey: 0)
            P3CardsDic.updateValue(P2CardsArrray[2], forKey: 1)
            P3CardsDic.updateValue(P3CardsArrray[2], forKey: 2)
            P3CardsDic.updateValue(P4CardsArrray[2], forKey: 3)
            P3CardsDic.updateValue(P5CardsArrray[2], forKey: 4)
        }
        
        // P4牌
        if P1CardsArrray.count > 3 {
            P4CardsDic.updateValue(P1CardsArrray[3], forKey: 0)
            P4CardsDic.updateValue(P2CardsArrray[3], forKey: 1)
            P4CardsDic.updateValue(P3CardsArrray[3], forKey: 2)
            P4CardsDic.updateValue(P4CardsArrray[3], forKey: 3)
            P4CardsDic.updateValue(P5CardsArrray[3], forKey: 4)
        }
        
        // P5牌
        if P1CardsArrray.count > 4 {
            P5CardsDic.updateValue(P1CardsArrray[4], forKey: 0)
            P5CardsDic.updateValue(P2CardsArrray[4], forKey: 1)
            P5CardsDic.updateValue(P3CardsArrray[4], forKey: 2)
            P5CardsDic.updateValue(P4CardsArrray[4], forKey: 3)
            P5CardsDic.updateValue(P5CardsArrray[4], forKey: 4)
        }
        
        // P6牌
        if P1CardsArrray.count > 5 {
            P6CardsDic.updateValue(P1CardsArrray[5], forKey: 0)
            P6CardsDic.updateValue(P2CardsArrray[5], forKey: 1)
            P6CardsDic.updateValue(P3CardsArrray[5], forKey: 2)
            P6CardsDic.updateValue(P4CardsArrray[5], forKey: 3)
            P6CardsDic.updateValue(P5CardsArrray[5], forKey: 4)
        }

        
        print(P1CardsDic)
        print(P2CardsDic)
        print(P3CardsDic)
        print(P4CardsDic)
        print(P5CardsDic)
        print(P6CardsDic)
        
        /// 处理的纸牌名称
        P1CardsDic = resoveCardsName(cards: P1CardsDic)
        P2CardsDic = resoveCardsName(cards: P2CardsDic)
        P3CardsDic = resoveCardsName(cards: P3CardsDic)
        P4CardsDic = resoveCardsName(cards: P4CardsDic)
        P5CardsDic = resoveCardsName(cards: P5CardsDic)
        P6CardsDic = resoveCardsName(cards: P5CardsDic)
        
        print(P1CardsDic)
        print(P2CardsDic)
        print(P3CardsDic)
        print(P4CardsDic)
        print(P5CardsDic)
        print(P6CardsDic)
        
        RoomModel.shared.isGameBegin = true
    
    }
    
    
    /// 处理纸牌
    ///
    /// - Parameter cards: 传入要纸牌的名字
    /// - Returns: 带有图片名称的纸牌
    func resoveCardsName(cards : [Int : String]) -> [Int : String] {
        var cardsName : String!
        
        var cardsNeDic : [Int : String] = [:]
        
        for (index,imgName) in cards {
            
            cardsName = imgName
            /// 处理♦
            if imgName.contains("♦") {
                
                cardsName = (cardsName as NSString).replacingOccurrences(of: "♦$", with: "pa")
            }
            
            /// 处理♣
            if imgName.contains("♣") {
                
                cardsName = (cardsName as NSString).replacingOccurrences(of: "♣$", with: "pd")
            }
            
            /// 处理♥
            if imgName.contains("♥") {
                
                cardsName = (cardsName as NSString).replacingOccurrences(of: "♥$", with: "pc")
            }
            
            /// 处理♠
            if imgName.contains("♠") {
                
                cardsName = (cardsName as NSString).replacingOccurrences(of: "♠$", with: "pb")
            }
            
            cardsNeDic.updateValue(cardsName, forKey: index)
            
        }
        
        return cardsNeDic
    }
}
