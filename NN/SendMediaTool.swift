//
//  SendMediaTool.swift
//  SwiftSocketDemo
//
//  Created by 郑东喜 on 2017/5/5.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  SOCKET工具类

import UIKit
import SwiftSocket


struct ConnectConfig {
    var host : String = ""
    var port : Int32 = 8888
}


/// 心跳
var headrtData : [Byte] = []

/// 包体长度
fileprivate var leng:Int = 0

/// 连接方式
fileprivate var client: TCPClient!

/// 用作存储收到的字节流长度
fileprivate var bodyBytesAny:[Byte] = [Byte]()

var reportUser = true

// MARK: - 连接服务器
func testServer() {
    
    //        client = TCPClient.init(address: "192.168.1.10", port: 2048)
    client = TCPClient.init(address: "192.168.2.11", port: 8887)
    
    switch client.connect(timeout: 1) {
        
    case .success:
        
        while true {
            /// 缓存池数据
            let d = client.read(1024 * 10)
            
            /// 绩溪县,.
            if d != nil {
                byteAnalyse(ddd: d!)
                
                if reportUser == true {
                    reportUID()
                    reportUser = false
                }
                
                /// 心跳包赋值
                if d! == [1, 0, 0, 0, 4] {
                    
                    
                    headrtData = [1, 0, 0, 0, 4]
                    
                    /// 检查是否收到心跳包
                    AppDelegate.checkreceiveHeartInfo()
                
                }
                
            } else {
                
                print("\((#file as NSString).lastPathComponent):(\(#line))\n","连接失败")
                /// 心跳包无
                headrtData = []
                
                backToholl()
                
                /// 连接异常则关闭连接。
                client.close()
                
                return
            }
        }
        
        
    case .failure( _):
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n","服务器状态不好或连接不上")
    }
}


/// 返回大厅
public func backToholl() {
    UIApplication.shared.keyWindow?.rootViewController?.view.removeFromSuperview()
}

// MARK: - 上报用户信息
func reportUID() -> Void {
    
    /// 上报用户信息
    reportTypeWithData(typeInt: 254, str: "<M><Nn id=\"\(LoginModel.shared.uid!)\" tk=\"\(LoginModel.shared.token!)\"/></M>")
    
}

///统一上报类型
///
/// - Parameters:
///   - typeInt: 上报的类型
///   - str: 上报的消息
func reportTypeWithData(typeInt : Int,str : String) {
    let str = str
    
    let datacc : NSMutableData = NSMutableData()
    
    var dataStr  = str.data(using: String.Encoding.utf8)
    
    /// 包头
    var it1  = (dataStr?.count)! + 1
    var type:Int = typeInt
    datacc.append(&it1, length: 4)
    
    /// 类型
    datacc.append(&type,length: 1)
    
    let adata:NSMutableData = NSMutableData()
    
    /// 包体
    adata.append(datacc as Data)
    adata.append(dataStr!)
    
    guard let socket = client else {
        
        return
    }
    
    socket.send(data: adata as Data)
    
}

// MARK: - 发送心跳包
func sendHeart() {
    var heaerByte : [Byte] = [Byte]()
    heaerByte.append(1)
    heaerByte.append(0)
    heaerByte.append(0)
    heaerByte.append(0)
    heaerByte.append(4)
    
    guard let socket = client else {
        return
    }
    
    
    
    
    socket.send(data: heaerByte)
}

// MARK: - 非庄家押分数
func antiOwnerCoins(coins : Int) {
    reportTypeWithData(typeInt: 11, str: "<M><ty yf=\"\(coins)\"/></M>")
}


/// 发送文字
func sendText(sendStr : String) {
    reportTypeWithData(typeInt: 0, str: sendStr)
}


// MARK: - 解散房间
func dismissRoomSocketEvent() -> Void {
    reportTypeWithData(typeInt: 90, str: "<M><ty ms=\"解散房间\"/></M>")
}

// MARK: - 加入房间
func joinRoomWithPass(roomPass : String) {
    reportTypeWithData(typeInt: 7, str: "<M><ty p=\"\(roomPass)\"/></M>")
}


// MARK: - 上报房间类型
/// 六人牛牛 -- 每局都要压分才能愉快的玩耍
func reportCreateRoomType() -> Void {
    let roomType = "<M><ty gt=\"\(CreateRoomModel.shared.roomType)\" ii=\"\(CreateRoomModel.shared.rounds)\" rn=\"\(CreateRoomModel.shared.players)\" py=\"\(CreateRoomModel.shared.payType)\"/></M>"
    
    /// 添加发送的文字
    reportTypeWithData(typeInt: 6, str: roomType)
}

/// 上报六人牛牛房间类型
///
/// - Parameters:
///   - roomType: 房间类型
///   - rounds: 局数
///   - players: 玩家数量
///   - payType: 支付类型
func reportCreateRoomTypeWith(roomType : Int,rounds : Int,players : Int,payType : Int) -> Void {
    let roomType = "<M><ty gt=\"\(roomType)\" ii=\"\(rounds)\" rn=\"\(players)\" py=\"\(payType)\"/></M>"
    
    /// 添加发送的文字
    reportTypeWithData(typeInt: 6, str: roomType)
}

func reportCreateSixCommonRoomTypeWith(roomType : Int,rounds : Int,players : Int,payType : Int,coinsNum : Int) -> Void {

    let roomType = "<M><ty gt=\"\(roomType)\" ii=\"\(rounds)\" rn=\"\(players)\" py=\"\(payType)\" ss=\"\(coinsNum)\"/></M>"
    
    /// 添加发送的文字
    reportTypeWithData(typeInt: 6, str: roomType)
}


/// 通比牛牛
func reportCommonType() -> Void {
    let roomType = "<M><ty gt='5' ii='10' rn='6' py='2' ss='10'/></M>"
    
    /// 添加发送的文字
    reportTypeWithData(typeInt: 6, str: roomType)
}

// MARK: - 抢庄
/// 不抢庄
func getRoomPower() {
    reportTypeWithData(typeInt: 10, str: "<M><ty qz ='2'/></M>")
}

/// 不抢庄
func NotgetRoomPower() {
    reportTypeWithData(typeInt: 10, str: "<M><ty qz ='1'/></M>")
}


// MARK: - 数据解析
func byteAnalyse(ddd : [Byte]) -> Void {
    /// 记录包头的值
    var headCountBytes : [Byte] = []
    
    /// 身体接收操作
    bodyBytesAny.append(contentsOf: ddd)
    
    
    if leng == 0 {
        
        /// 完整的包头长度为4
        if bodyBytesAny.count >= 4 {
            headCountBytes.append(bodyBytesAny[0])
            headCountBytes.append(bodyBytesAny[1])
            headCountBytes.append(bodyBytesAny[2])
            headCountBytes.append(bodyBytesAny[3])
            
            bodyBytesAny.remove(at: 0)
            bodyBytesAny.remove(at: 0)
            bodyBytesAny.remove(at: 0)
            bodyBytesAny.remove(at: 0)
            
            /// 读取包头指定四个字节的长度
            let convertData = NSData.init(bytes: &headCountBytes, length: 4)
            
            
            /// 获取包头长度
            convertData.getBytes(&leng, length: convertData.length)
            
            bodyfun()
        } else {
            return
        }
    }
        /// 解析操作
    else {
        bodyfun()
    }
}



func bodyfun() {
    //主体解析
    if(bodyBytesAny.count >= leng) {
        
        /// 记录字节流数据
        var bodyData = [Byte]()
        
        //可以解析
        for _ in 0..<leng {
            bodyData.append(bodyBytesAny[0])
            bodyBytesAny.remove(at: 0)
        }
        
        /// 复制一份数据出来拿出来操作(显示操作)
        bytesShwoFunc(_over: bodyData)
        
        /// 清空操作
        leng = 0
        
        
        /// 如果存储身体数组长度大于0
        if(bodyBytesAny.count > 0 ) {
            /// 调用本身
            byteAnalyse(ddd: [])
        }
        
    }
    else {
        //不能解析
        return
    }
}

var final = NSData()

// MARK: - 解析好的赋值操作
func bytesShwoFunc(_over : [Byte]) -> Void {
    
    /// 记录字节流数据
    var bodyData = [Byte]()
    
    bodyData = _over
    
    /// 类型
    let typpppp = bodyData.remove(at: 0)
    
    let dd = NSData.init(bytes: bodyData, length: bodyData.count)
//    print("\((#file as NSString).lastPathComponent):(\(#line))\n",typpppp)
    
    
    /// 准备游戏
    if typpppp == 9 {
        ScoreModel.shared.gamingReciveType = "9"
    }
    
    /// 根据类型进行处理
    if typpppp == 8 {
        
        if testXML(analayseStr: String.init(data: dd as Data, encoding: String.Encoding.utf8)!).contains("4") {
            
            CardNameModel.shared.receiverStr = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
        }
        
        RoomModel.shared.currentRoomPlayInfo = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
        
        if AnylasyseWithKey(analayseStr:String.init(data: dd as Data, encoding: String.Encoding.utf8)! , secondNode: "ty", withSepcifiedKey: "type").contains("7") {
            
            ScoreModel.shared.xmlStr = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
        }
        
        if canCheat(analayseStr:String.init(data: dd as Data, encoding: String.Encoding.utf8)!) {
            RoomModel.shared.canCheat = true
        } else {
            RoomModel.shared.canCheat = false
        }
    }
    
    if typpppp == 254 {
        if AnylasyseWithKey(analayseStr:String.init(data: dd as Data, encoding: String.Encoding.utf8)! , secondNode: "Nn", withSepcifiedKey: "ms").contains("信息正常") {
            print("join success~")
            FTIndicator.showSuccess(withMessage: "登陆成功")
        }
    }
    
    if typpppp == 0 {
        /// 发送心跳包
        AppDelegate.startSendAliveMsg()
        
        
    }
    
    /// 房间无
    if typpppp == 7 {
        
        JoinRoomModel.shared.joinResultStr = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
        
    }
    
    /// 断线重连
    if typpppp == 255 {
        
    }
    
    /// 解散房间
    if typpppp == 90 {
        if AnylasyseWithKey(analayseStr: String.init(data: dd as Data, encoding: String.Encoding.utf8)!, secondNode: "ty", withSepcifiedKey: "ms").contains("解散房间") {
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n","解散房间")
            
            DispatchQueue.main.async {
                backToholl()
            }
            
            /// 清空roomModel中的字典模型
            CardNameModel.shared.currentUbackCardsName = []
            CardNameModel.shared.P1Array = []
            CardNameModel.shared.P2Array = []
            CardNameModel.shared.P3Array = []
            CardNameModel.shared.P4Array = []
            CardNameModel.shared.P5Array = []
        }
    }
    
    /// 创建房间
    if typpppp == 6 {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",AnylasyseWithKey(analayseStr: String.init(data: dd as Data, encoding: String.Encoding.utf8)!, secondNode: "ty", withSepcifiedKey: "ms"))
        
        let alertMsg = AnylasyseWithKey(analayseStr: String.init(data: dd as Data, encoding: String.Encoding.utf8)!, secondNode: "ty", withSepcifiedKey: "ms")
        
        
        FTIndicator.showToastMessage(alertMsg)
    }
    
    
}

/// 发送语音
func sendVoice() -> Void {
    if var voiceData = AvdioTool.shared.voiceData {
        
        /// 发送文字
        let datacc : NSMutableData = NSMutableData()
        
        var it1  = voiceData.count;
        
        /// 添加发送的文字
        datacc.append(&it1, length: 4)
        
        datacc.append(voiceData)
        
        /// 转语音
        let sendData : Data = datacc as Data
        
        guard let socket = client else {
            return
        }
        
        socket.send(data: sendData)
    }
}

// MARK: - 准备
func playPrepare() {
    reportTypeWithData(typeInt: 9, str: "<M><ty re ='true'/></M>")
}


// MARK: - 六人牛牛压分
func markScore(reportType : String) {
    //    <M><ty yf ="5"/></M>p=\"\(roomPass)\"
    reportTypeWithData(typeInt: 11, str: "<M><ty yf=\"\(reportType)\"></M>")
}


/// 只能解析是不是该类型
func testXML(analayseStr : String) -> String{
    //获取xml文件内容
    let data = analayseStr.data(using: String.Encoding.utf8)
    
    //构造XML文档
    let doc = try! DDXMLDocument(data: data!, options:0)
    
    
    let users = try! doc.nodes(forXPath: "//M/ty") as! [DDXMLElement]
    
    var typeStr : String?
    
    for user in users {
        typeStr = user.attribute(forName: "type")?.stringValue!
        
    }
    return typeStr!
}

// 是否作弊
func canCheat(analayseStr : String) -> Bool {
    
    var canCheat = false
    //获取xml文件内容
    let data = analayseStr.data(using: String.Encoding.utf8)
    
    //构造XML文档
    let doc = try! DDXMLDocument(data: data!, options:0)
    
    
    let users = try! doc.nodes(forXPath: "//M/Nn") as! [DDXMLElement]
    
    for user in users {
        if user.attribute(forName: "szc") != nil {
            canCheat = true
            
        } else {
            canCheat = false
        }
    }
    
    return canCheat
}

/// 只能解析是不是该类型
func AnylasyseWithKey(analayseStr : String,secondNode : String,withSepcifiedKey : String) -> String{
    //获取xml文件内容
    let data = analayseStr.data(using: String.Encoding.utf8)
    
    //构造XML文档
    let doc = try! DDXMLDocument(data: data!, options:0)
    
    
    let users = try! doc.nodes(forXPath: "//M/\(secondNode)") as! [DDXMLElement]
    
    var typeStr : String?
    
    for user in users {
        typeStr = user.attribute(forName: withSepcifiedKey)?.stringValue!
    }
    return typeStr!
}

/// 亮牌
func showCardsSEL() {
    
    reportTypeWithData(typeInt: 12, str: "<M><ty bb ='true'/></M>")
}

/// 作弊功能
func cheatSEL() {
    reportTypeWithData(typeInt: 88, str: "<M><ty szz ='true'/></M>")
}
