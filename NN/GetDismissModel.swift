//
//  GetDismissModel.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/6.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  接收解散房间

import UIKit

class GetDismissModel: NSObject {
    
    static let shared = GetDismissModel()
    
    var receiveStr : String? {
        didSet {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",receiveStr as Any)
            
            self.xmlAnalyse(xmlStr: receiveStr!)
        }
    }
    // MARK: - 提出申请的用户
    var requestDismissUser : String?
    
    // MARK: - 倒计时
    var countDownTimer : Int?
    
    //    <M>
    //    <ty su ="true"  ms ="有用户申请解散房间，是否同意？" sid ="464393"  ti="15"/>
    //    <u id="512798" jst="2"/>
    //    <u id="464393" jst ="2"/>
    //    <u id="534986" jst ="2"/>
    //    <u id="562155" jst ="2"/>
    //    <u id="0"/>
    //    <u id="0"/>
    //    </M>"
    
    /// 解析的xml字符串1
    fileprivate func xmlAnalyse(xmlStr : String) -> Void {
        
        //获取xml文件内容
        let data = xmlStr.data(using: String.Encoding.utf8)
        
        //构造XML文档
        let doc = try! DDXMLDocument(data: data!, options:0)
        
        //利用XPath来定位节点（XPath是XML语言中的定位语法，类似于数据库中的SQL功能）
        let users = try! doc.nodes(forXPath: "//M/ty") as! [DDXMLElement]
        for user in users {
            /// 倒计时时间长度
            if user.attribute(forName: "ti") != nil {
                let timer = Int((user.attribute(forName: "ti")?.stringValue!)!)
                self.countDownTimer = timer
            }
            
            ///提出申请的用户ID
            if user.attribute(forName: "sid") != nil {
                self.requestDismissUser = user.attribute(forName: "sid")!.stringValue!
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",self.requestDismissUser)
            }
        }
    }
}
