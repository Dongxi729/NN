//
//  RoomOwner.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/5.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  房主

//<ty type="2">
//<u id="46911756" bks="true"/>
//</ty>
//<Nn/>
//</M>

//<ty type="2">
//<u id="46911756" bks="true"/>
//</ty>
//<Nn/>
//</M>

import UIKit


/// 房主ID
var ownerID : String?

class RoomOwner: NSObject {
    
    static let shared = RoomOwner()
    
    var receiveStr : String? {
        didSet {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",receiveStr as Any)
            
            self.xmlAnalyse(xmlStr: receiveStr!)
        }
    }
    
//    /// 房主ID
//    var ownerID : String?
    
    ///<M>
    //    <ty type="2">
    //    <u id="46911756" bks="true"/>
    //    </ty>
    //    <Nn/>
    //    </M>
    /// 解析的xml字符串1
    fileprivate func xmlAnalyse(xmlStr : String) -> Void {
        //获取xml文件内容
        let data = xmlStr.data(using: String.Encoding.utf8)
        
        //构造XML文档
        let doc = try! DDXMLDocument(data: data!, options:0)
        
        //利用XPath来定位节点（XPath是XML语言中的定位语法，类似于数据库中的SQL功能）
        let users = try! doc.nodes(forXPath: "//M/ty/u") as! [DDXMLElement]
        
        for user in users {
            if user.attribute(forName: "id") != nil {
                ownerID = user.attribute(forName: "id")!.stringValue!
                
                setFangzhuICON = true
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",ownerID)
                
                /// 发通知，
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "RoomOnwer"), object: nil)
                
                
            }
        }
    }
}
