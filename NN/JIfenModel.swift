//
//  JIfenModel.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/5.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  积分模型

import UIKit

class JIfenModel: NSObject {
    
    static let shared = JIfenModel()
    
    var receiveStr : String? {
        didSet {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",receiveStr as Any)
            
            self.xmlAnalyse(xmlStr: receiveStr!)
        }
    }
    
    /// 存放抢庄标
    var isJifenArray : [Int] = []
    
    /// 显示积分
    var isShowJifenV = false
    
    /// 是否抢庄开始
    var isRobOrNot = false
    
//    <M>
//    <ty type="3">
//    <u id="47636852" sc="0"/>
//    <u id="46911756" sc="0"/>
//    <u id="0"/>
//    </ty>
//    <Nn/>
//    </M>
    
    /// 解析的xml字符串1
    fileprivate func xmlAnalyse(xmlStr : String) -> Void {
        
        self.isJifenArray = []
        //获取xml文件内容
        let data = xmlStr.data(using: String.Encoding.utf8)
        
        //构造XML文档
        let doc = try! DDXMLDocument(data: data!, options:0)
        
        //利用XPath来定位节点（XPath是XML语言中的定位语法，类似于数据库中的SQL功能）
        let users = try! doc.nodes(forXPath: "//M/ty/u") as! [DDXMLElement]
        for user in users {
            if user.attribute(forName: "sc") != nil {
                let xxx = user.attribute(forName: "sc")!.stringValue!
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",xxx)
                
                /// 存入数组
                self.isJifenArray.append(Int(xxx)!)
                
                
                
                /// 判断添加进去是否达到房间人数
                if self.isJifenArray.count == RoomModel.shared.currentPersonInRoom {
                    var index = 0
                    for value in self.isJifenArray {
                        if value == 0 {
                            index += 1
                        }
                    }
                    
                    print("\((#file as NSString).lastPathComponent):(\(#line))\n",index)
                    
                    print("\((#file as NSString).lastPathComponent):(\(#line))\n",self.isJifenArray)
                    
                    /// 如果取出压分的值都为0 的话，说明压根就没选分数过，但是还是不知道房主是谁
                    if index == RoomModel.shared.currentPersonInRoom {
                        self.isShowJifenV = true
                    } else {
                        self.isShowJifenV = false
                    }
                }
            }
        }
    }
}
