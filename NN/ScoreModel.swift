//
//  ScoreModel.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/25.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class ScoreModel: NSObject {

    /// 分数加减数组
    fileprivate var scoreCountDownScore : Int = 0
    
    /// 剩余分数
    fileprivate var costScore : Int = 0
    
    /// 用户增加分数
    var userScoreDic : [Int] = []
    
    /// 备份的用户增减分数
    var backupUserDic : [Int] = []

    
    /// 用户剩余分数
    var leftScore : [Int] = [] {
        didSet {
            DispatchQueue.main.async {
                UIApplication.shared.keyWindow?.rootViewController = GamingVC()
            }
        }
    }
    
    static let shared = ScoreModel()
    
    /// xmlString
    var xmlStr : String = "" {
        didSet {
            testXML(xmlStr: xmlStr)
        }
    }
    
    private func testXML(xmlStr : String){
        /// 初始化,防止后期添加的分数串起来
        leftScore = []
        userScoreDic = []
        
        //获取xml文件内容
        let data = xmlStr.data(using: String.Encoding.utf8)
        
        //构造XML文档
        let doc = try! DDXMLDocument(data: data!, options:0)
        
        
        let users = try! doc.nodes(forXPath: "//M/ty/u") as! [DDXMLElement]
        
        
        for user in users {
            
            
            if (user.attribute(forName: "igg")?.stringValue!) != nil {
                /// 得分
                self.scoreCountDownScore = Int((user.attribute(forName: "igg")?.stringValue!)!)!
                
                userScoreDic.append(self.scoreCountDownScore)
                backupUserDic.append(self.scoreCountDownScore)
            }
            
            var leftScoreIndex = 0
            if (user.attribute(forName: "gg")?.stringValue!) != nil {
                /// 扣分
                self.costScore = Int((user.attribute(forName: "gg")?.stringValue!)!)!

                leftScoreIndex += 1
                
                leftScore.append(self.costScore)
            }
        }
    }
}
