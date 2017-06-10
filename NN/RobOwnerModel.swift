//
//  RobOwnerModel.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/5.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  抢庄

import UIKit

class RobOwnerModel: NSObject {
    
    static let shared = RobOwnerModel()
    
    var receiveStr : String? {
        didSet {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",receiveStr as Any)
            
            self.xmlAnalyse(xmlStr: receiveStr!)
        }
    }
    
    /// 存放抢庄标
    var isRobedArray : [Int] = []
    
    /// 是否准备
    var isPrepare = false
    
    /// 是否抢庄开始
    var isRobOrNot = false
    
    ///  <M>
    //    <ty type="1">
    //    <u id="47636852" bk="0"/>
    //    <u id="46911756" bk="0"/>
    //    <u id="0"/>
    //    </ty>
    //    <Nn/>
    //    </M>
    
    /// 解析的xml字符串1
    fileprivate func xmlAnalyse(xmlStr : String) -> Void {
        
        /// 初始化
        isRobedArray = []
        
        //获取xml文件内容
        let data = xmlStr.data(using: String.Encoding.utf8)
        
        //构造XML文档
        let doc = try! DDXMLDocument(data: data!, options:0)
        
        //利用XPath来定位节点（XPath是XML语言中的定位语法，类似于数据库中的SQL功能）
        let users = try! doc.nodes(forXPath: "//M/ty/u") as! [DDXMLElement]
        for user in users {
            if user.attribute(forName: "bk") != nil {
                let xxx = user.attribute(forName: "bk")!.stringValue!
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",xxx)
                
                /// 存入数组
                self.isRobedArray.append(Int(xxx)!)
                
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",self.isRobedArray)
                
                /// 判断添加进去是否达到房间人数
                if self.isRobedArray.count == RoomModel.shared.currentPersonInRoom {
                    print("\((#file as NSString).lastPathComponent):(\(#line))\n",self.isRobedArray)
                    
                    /// 取出当前的是否抢庄
                    print("\((#file as NSString).lastPathComponent):(\(#line))\n",self.isRobedArray[GetCurrenIndex.shared.currentUserIndex])
                    
                    /// 判断是否是当前用户的枪庄标识
                    /// 0 - 没开始抢
                    /// 1 - 不抢
                    /// 2 - 抢
                    let ddd = self.isRobedArray[GetCurrenIndex.shared.currentUserIndex]
                    
                    if ddd == 0 {
                       
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "isRobOrNot"), object: nil)
                        
                        self.isRobOrNot = false
                        
                    } else {
                        self.isRobOrNot = true
                    }
                }
                

            }
        }
    }
}
