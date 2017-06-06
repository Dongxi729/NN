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
    
    /// 是否显示亮牌
    var isShowCardArray : [String] = []
    
    /// 是否亮牌
    var isShowed = false
    
//    <M>
//    <ty type="5">
//    <u id="512798" bb="false"/>
//    <u id="464393" bb="true"/>
//    <u id="534986" bb="false"/>
//    <u id="562155" bb="false"/>
//    <u id="0"/>
//    <u id="0"/>
//    </ty>
//    </M>

    fileprivate func xmlAnalyse(xmlStr : String) -> Void {
        //获取xml文件内容
        let data = xmlStr.data(using: String.Encoding.utf8)
        
        //构造XML文档
        let doc = try! DDXMLDocument(data: data!, options:0)
        
        //利用XPath来定位节点（XPath是XML语言中的定位语法，类似于数据库中的SQL功能）
        let users = try! doc.nodes(forXPath: "//M/ty/u") as! [DDXMLElement]
        
        for user in users {
            if user.attribute(forName: "dd") != nil {
                let xxx = user.attribute(forName: "dd")!.stringValue!
                
                isShowCardArray.append(xxx)
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",self.isShowCardArray)
               
                /// 判断添加进去是否达到房间人数
                if self.isShowCardArray.count == RoomModel.shared.currentPersonInRoom {
                    for value in self.isShowCardArray {
                        if value == "false" {
                            self.isShowed = false
                        } else {
                            self.isShowed = true
                        }
                        
                        print("\((#file as NSString).lastPathComponent):(\(#line))\n",self.isShowed)
                    }
                }
            }
        }
    }
}
