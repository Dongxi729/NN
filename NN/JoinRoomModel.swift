//
//  JoinRoomModel.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/23.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  是否加入房间模型
/// 失败
/// <M>
//<Nn su="false" ms="查无此房间"/>
//</M>
/// 成功
//<M>\n  <ty su=\"true\" ms=\"加入成功\"/>\n  <Nn/>\n</M>

import UIKit

class JoinRoomModel: NSObject {
    
    static let shared = JoinRoomModel()
    
    /// 是否加入成功
    var joinResult = false
    
    /// 加入返回结果
    var joinMsg : String!
    
    /// xml 当前游戏(还未开始的游戏房间的数据)
    var joinResultStr : String = "" {
        didSet {
            self.xmlAnalyse(xmlStr: joinResultStr)
        }
    }
    
    /// 解析的xml字符串
    fileprivate func xmlAnalyse(xmlStr : String) -> Void {
        //获取xml文件内容
        let data = xmlStr.data(using: String.Encoding.utf8)
        
        //构造XML文档
        let doc = try! DDXMLDocument(data: data!, options:0)
        
        /// 失败的信息处理
        let failInfo = try! doc.nodes(forXPath: "//M/Nn") as! [DDXMLElement]
        
        if failInfo.count != 0 {
            for user in failInfo {
                
                if user.attribute(forName: "su") != nil  {
                    let succesOFail = user.attribute(forName: "su")!.stringValue
                    
                    if succesOFail == "false" {
                        self.joinResult = false
                    }
                    
                    if user.attribute(forName: "ms") != nil {
                        let joinResult = user.attribute(forName: "ms")!.stringValue!
                        
                        FTIndicator.showToastMessage(joinResult)
                    }
                }
            }
        }
        
        /// 成功的信息处理
        let successInfo = try! doc.nodes(forXPath: "//M/ty") as! [DDXMLElement]
        
        if failInfo.count != 0 {
            for user in successInfo {
                
                if user.attribute(forName: "type") != nil {
                    CardNameModel.shared.isreceivedCountScore = (user.attribute(forName: "su")?.stringValue!)!
                }
                
                if user.attribute(forName: "su") != nil {
                    let succesOFail = user.attribute(forName: "su")!.stringValue
                    
                    
                    if succesOFail == "true" {
                        self.joinResult = true
                    }
                    
                    let joinResult = user.attribute(forName: "ms")!.stringValue!
                    
                    FTIndicator.showToastMessage(joinResult)
                }

            }
        }
    }
}
