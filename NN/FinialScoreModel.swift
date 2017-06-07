//
//  FinialScoreModel.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/7.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  最后分数统计

import UIKit

class FinialScoreModel: NSObject {
    
    // MARK: - 大赢家
    var yingjiaArray : [String] = []
    
    // MARK: - 房主
    var fangzhuArray : [String] = []
    
    // MARK: - 通杀数组
    var txArray : [String] = []
    
    // MARK: - 通赔数组
    var tpArray : [String] = []
    
    // MARK: - 胜利数组
    var slArray : [String] = []
    
    // MARK: - 牛牛次数
    var nnCishuArray : [String] = []
    
    // MARK: - 成绩数组
    var cjArray : [String] = []
    
    // MARK: - 用户名
    var yhmArray : [String] = []
    
    // MARK: - 头像地址
    var headImgURLArray : [String] = []
    
    // MARK: - 玩家ID
    var playerIDArray : [String] = []
    
    
    
    var receiveStr : String? {
        didSet {
            self.xmlAnalyse(xmlStr: receiveStr!)
        }
    }
    
    static let shared = FinialScoreModel()
    
    
    ///<M>
    //    <ty>
    //    <u id="512798" n="用户名" h="头像地址" tx="通杀次数"  tp="通赔次数" vi="胜利次数" nn="牛牛次数" cj="总成绩" yj ="1大赢家 " fz="1 房主" />
    //    <u id="464393" n="用户名" h="头像地址" tx="通杀次数"  tp="通赔次数" vi="胜利次数" nn="牛牛次数" cj="总成绩" yj ="0不是" fz="0不是房主" />
    //    <u id="534986" n="用户名" h="头像地址" tx="通杀次数"  tp="通赔次数" vi="胜利次数" nn="牛牛次数" cj="总成绩" yj ="0不是" fz="0不是房主" />
    //    <u id="562155" n="用户名" h="头像地址"tx="通杀次数"  tp="通赔次数" vi="胜利次数" nn="牛牛次数" cj="总成绩" yj ="0不是" fz="0不是房主" />
    //    <u id="0"/>
    //    <u id="0"/>
    //    </ty>
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
            /// 赢家
            if user.attribute(forName: "yi") != nil {
                let yj = user.attribute(forName: "yi")!.stringValue!
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",yj)
                
                /// 存入数组
                yingjiaArray.append(yj)
            }
            
            
            /// 房主
            if user.attribute(forName: "fz") != nil {
                let fz = user.attribute(forName: "fz")!.stringValue!
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",fz as Any)
                
                fangzhuArray.append(fz)
                
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",fangzhuArray)
            }
            
            /// 成绩
            if user.attribute(forName: "cj") != nil {
                let fz = user.attribute(forName: "cj")!.stringValue!
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",fz)
                
                cjArray.append(fz)
                
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",cjArray)
            }
            
            
            /// 通杀
            if user.attribute(forName: "tx") != nil {
                let tx = user.attribute(forName: "tx")!.stringValue!
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",tx)
                
                txArray.append(tx)
                
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",txArray)
            }
            
            /// 通赔
            if user.attribute(forName: "tp") != nil {
                let tp = user.attribute(forName: "tp")!.stringValue!
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",tp)
                
                tpArray.append(tp)
                
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",tpArray)
            }
            
            /// 胜利
            if user.attribute(forName: "vi") != nil {
                let vi = user.attribute(forName: "vi")!.stringValue!
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",vi)
                
                slArray.append(vi)
                
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",slArray)
            }
            
            /// 牛牛次数
            if user.attribute(forName: "nn") != nil {
                let nn = user.attribute(forName: "nn")!.stringValue!
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",nn)
                
                nnCishuArray.append(nn)
                
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",nnCishuArray)
            }
            
            /// 玩家名字
            if user.attribute(forName: "n") != nil {
                let name = user.attribute(forName: "n")!.stringValue!
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",name)
                
                yhmArray.append(name)
                
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",yhmArray)
            }
            
            /// 头像地址
            if user.attribute(forName: "h") != nil {
                let headUrl = user.attribute(forName: "h")!.stringValue!
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",headUrl)
                
                headImgURLArray.append(headUrl)
                
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",headImgURLArray)
            }
            
            /// 玩家ID
            if user.attribute(forName: "id") != nil {
                let playerID = user.attribute(forName: "id")!.stringValue!
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",playerID)
                
                playerIDArray.append(playerID)
                
                print("\((#file as NSString).lastPathComponent):(\(#line))\n",playerIDArray)
            }
            
        }
    }
}
