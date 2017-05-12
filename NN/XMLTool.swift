//
//  XMLTool.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/12.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class XMLTool: NSObject {
    func testXML() {
        //获取xml文件路径
        let file = Bundle.main.path(forResource: "users", ofType: "xml")
        let url = URL(fileURLWithPath: file!)
        //获取xml文件内容
        let xmlData = try! Data(contentsOf: url)
        
        //构造XML文档
        let doc = try! DDXMLDocument(data: xmlData, options:0)
        
        //利用XPath来定位节点（XPath是XML语言中的定位语法，类似于数据库中的SQL功能）
        let users = try! doc.nodes(forXPath: "//R/u/r") as! [DDXMLElement]
        for user in users {

            /******** 扩展后的 *****************/
            let uid = user.attribute(forName: "rid")!.stringValue
            
            print(uid as Any)
            //            let uname = user["name"].stringValue
            //
            //            let mobile = user["tel"]["mobile"].stringValue
            //            let home = user["tel"]["home"].stringValue
        }
    }
}


extension DDXMLElement {
    //通过索引获取子节点
    subscript(key: String) -> DDXMLElement {
        get {
            let r = self.forName(key)
            return r!
        }
    }
}
