//
//  ShowCardModel.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/6.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  亮牌模型

import UIKit

class ShowCardModel: NSObject {
    var receiveStr : String? {
        didSet {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",receiveStr as Any)
            
            self.xmlAnalyse(xmlStr: receiveStr!)
        }
    }
    
    static let shared = ShowCardModel()
    
    
    //    算分给用户  gg用户最后剩下的游戏币  igg 当局要增减的游戏币
    //    <M>
    //    <ty type="7">
    //    <u id="47636852" igg="100" gg="100"/>
    //    <u id="46911756" igg="-100" gg="-100"/>
    //    <u id="0"/>
    //    </ty>
    //    <Nn/>
    //    </M>
    // MARK: - 用户剩下的分数
    var leftScore : [String] = []
    
    
    // MARK: - 用户增加的分数
    var addScore : [String] = []
    
    fileprivate func xmlAnalyse(xmlStr : String) -> Void {
        
        leftScore = []
        addScore = []
        
        //获取xml文件内容
        let data = xmlStr.data(using: String.Encoding.utf8)
        
        //构造XML文档
        let doc = try! DDXMLDocument(data: data!, options:0)
        
        //利用XPath来定位节点（XPath是XML语言中的定位语法，类似于数据库中的SQL功能）
        let users = try! doc.nodes(forXPath: "//M/ty/u") as! [DDXMLElement]
        
        for user in users {
            
            /// 用增减的分数
            if user.attribute(forName: "igg") != nil {
                let xxx = user.attribute(forName: "igg")!.stringValue!
                
                addScore.append(xxx)
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",self.addScore)
                
                if addScore.count == RoomModel.shared.currentPersonInRoom {
                    
                    /// 发通知，近分数动画展示
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showScoreNotifi"), object: nil)
                    let dformatter = DateFormatter()
                    dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
                    
                    print("当前日期时间：\(dformatter.string(from: Date()))","\((#file as NSString).lastPathComponent):(\(#line))\n",self.addScore)
                }
            }
            
            /// 剩下的分数
            if user.attribute(forName: "gg") != nil {
                let xxx = user.attribute(forName: "gg")!.stringValue!
                
                leftScore.append(xxx)
                
                if leftScore.count == RoomModel.shared.currentPersonInRoom {
                    let dformatter = DateFormatter()
                    dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
                    
                    print("当前日期时间：\(dformatter.string(from: Date()))","\((#file as NSString).lastPathComponent):(\(#line))\n",self.leftScore)
                }
            }
        }
    }
}
