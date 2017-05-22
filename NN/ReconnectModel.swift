
//
//  ReconnectModel.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/22.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  重新连接模型处理
/// "<M><Nn id="123456" tk="asldkfjwieoskldfksdhf" ty="1"/></M>"

import UIKit

class ReconnectModel: NSObject {
    /// xml 当前游戏(还未开始的游戏房间的数据)
//    var reconnectStr : String = "" {
//        didSet {
//            self.xmlAnalyse(xmlStr: currentRoomPlayInfo)
//        }
//    }
    
    var reconnectStr : String = "<M><Nn id='123456' tk='asldkfjwieoskldfksdhf' ty='1'/></M>"

    /// 解析的xml字符串
    fileprivate func xmlAnalyse(xmlStr : String) -> Void {
        //获取xml文件内容
        let data = xmlStr.data(using: String.Encoding.utf8)
        
        //构造XML文档
        let doc = try! DDXMLDocument(data: data!, options:0)

        //利用XPath来定位节点（XPath是XML语言中的定位语法，类似于数据库中的SQL功能）
        let users = try! doc.nodes(forXPath: "//M/Nn") as! [DDXMLElement]
    }

}
