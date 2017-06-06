//
//  DismissRoomModel.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/6.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  解散房间类型

import UIKit

class DismissRoomModel: NSObject {
    
    static let shared = DismissRoomModel()
    
    var receiveStr : String? {
        didSet {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",receiveStr as Any)
            
            self.xmlAnalyse(xmlStr: receiveStr!)
        }
    }
    
    /// 倒计时
    var countDownTimer : Int?
    
//    <Nn/>
//    <ty su="false" ms="是否申请解散房间"/>
//    </M>
    
    /// 解析的xml字符串1
    fileprivate func xmlAnalyse(xmlStr : String) -> Void {
        
        //获取xml文件内容
        let data = xmlStr.data(using: String.Encoding.utf8)
        
        //构造XML文档
        let doc = try! DDXMLDocument(data: data!, options:0)
        
        //利用XPath来定位节点（XPath是XML语言中的定位语法，类似于数据库中的SQL功能）
        let users = try! doc.nodes(forXPath: "//M/ty") as! [DDXMLElement]
        for user in users {
            if user.attribute(forName: "ti") != nil {
                let timer = Int((user.attribute(forName: "ti")?.stringValue!)!)
                self.countDownTimer = timer
                
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",self.countDownTimer)
            }
        }
    }
}
