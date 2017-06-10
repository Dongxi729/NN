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

// MARK: - 链接成功
var connectSuccess = false

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
                
                /// 链接成功
                connectSuccess = true
                
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


/// 返回大厅 改变进入房间标识
public func backToholl() {
//    UIApplication.shared.keyWindow?.removeFromSuperview()
    DispatchQueue.main.async {
        UIApplication.shared.keyWindow?.rootViewController = MainGameViewController()
        
        
        ///改变进入房间标识
        dddd = false
    }
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


// MARK: - 退出房间
func exitRoomEvent() -> Void {
    /// <M><ty tc="true"/></M>
    reportTypeWithData(typeInt: 85, str: "<M><ty tc='true'/></M>")
}

// MARK: - 解散房间
func dismissRoomEvent() -> Void {
    /// <M><ty tc="true"/></M>
    reportTypeWithData(typeInt: 85, str: "<M><ty tc='true'/></M>")
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

// MARK: - 发牌状态
var serverSendType = 0

// MARK: - 解析好的赋值操作
func bytesShwoFunc(_over : [Byte]) -> Void {
    
    /// 记录字节流数据
    var bodyData = [Byte]()
    
    bodyData = _over
    
    /// 类型
    let typpppp = bodyData.remove(at: 0)
    
    /// 赋值状态
    serverSendType = Int(typpppp)
    
    let dd = NSData.init(bytes: bodyData, length: bodyData.count)
    print("\((#file as NSString).lastPathComponent):(\(#line))\n",typpppp)
    
    print("\((#file as NSString).lastPathComponent):(\(#line))\n",String.init(data: dd as Data, encoding: String.Encoding.utf8)!)
    
    
    /// 准备游戏
    if typpppp == 9 {
        ScoreModel.shared.gamingReciveType = "9"
    }
    
    /// 接收退出房间
    if typpppp == 85 {
        /// 解析里头的值
        ///  <M>
        //        <Nn/>
        //        <ty su="true" ms="退出成功"/>
        //        </M>
        if AnylasyseWithKey(analayseStr: String.init(data: dd as Data, encoding: String.Encoding.utf8)!, secondNode: "ty", withSepcifiedKey: "su") == "true" {
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n")
            /// 返回大厅
            backToholl()
        }
        
        if AnylasyseWithKey(analayseStr: String.init(data: dd as Data, encoding: String.Encoding.utf8)!, secondNode: "ty", withSepcifiedKey: "ms").contains("申请解散房间") {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n")
            
            DismissRoomModel.shared.receiveStr = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "exitRoomRequest"), object: nil)
        }
    }
    
    /// 申请解散房间
    /// 解散房间
    if typpppp == 86 {
        if AnylasyseWithKey(analayseStr: String.init(data: dd as Data, encoding: String.Encoding.utf8)!, secondNode: "ty", withSepcifiedKey: "ms").contains("有用户申请解散房间，是否同意") {
            GetDismissModel.shared.receiveStr = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
        }
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AgreeToDismissNoti"), object: nil)
    }
    
    /// 收到最后成绩---用户最后统计数据
    if typpppp == 20 {
        
        FinialScoreModel.shared.receiveStr = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "FinialScoreNotifi"), object: nil)
    }
    
    /// 根据类型进行处理
    if typpppp == 8 {
        
        /// 游戏中，发牌
        if testXML(analayseStr: String.init(data: dd as Data, encoding: String.Encoding.utf8)!).contains("4") {
            
            CardNameModel.shared.receiverStr = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
            
            /// 收到牌，证明已经开始游戏，赋值标识
            RoomModel.shared.isGameBegin = true
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showCards"), object: nil)
        }
        
        /// 返回玩家信息状态
        if AnylasyseWithKey(analayseStr:String.init(data: dd as Data, encoding: String.Encoding.utf8)! , secondNode: "ty", withSepcifiedKey: "type").contains("0") {
            
            RoomModel.shared.currentRoomPlayInfo = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n")
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PlayersInRoom"), object: nil)
        }
        
        /// 显示当前用户是否可以作弊
        if canCheat(analayseStr:String.init(data: dd as Data, encoding: String.Encoding.utf8)!) {
            RoomModel.shared.canCheat = true
        } else {
            RoomModel.shared.canCheat = false
        }
        
        /// 判断抢庄
        if testXML(analayseStr: String.init(data: dd as Data, encoding: String.Encoding.utf8)!).contains("1") {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",String.init(data: dd as Data, encoding: String.Encoding.utf8)!)
            
            RobOwnerModel.shared.receiveStr = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
            /// 已经准备
            RobOwnerModel.shared.isPrepare = true
            
            /// 收到牌，证明已经开始游戏，赋值标识
            RoomModel.shared.isGameBegin = false
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "beginRob"), object: nil)
        }
        
        /// 是否有积分
        if testXML(analayseStr: String.init(data: dd as Data, encoding: String.Encoding.utf8)!).contains("3") {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",String.init(data: dd as Data, encoding: String.Encoding.utf8)!)
            
            JIfenModel.shared.receiveStr = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
            
            /// 收到牌，证明已经开始游戏，赋值标识
            RoomModel.shared.isGameBegin = true
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "isGameBegin"), object: nil)
        }
        
        /// 选出房主
        if testXML(analayseStr: String.init(data: dd as Data, encoding: String.Encoding.utf8)!).contains("2") {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",String.init(data: dd as Data, encoding: String.Encoding.utf8)!)
            
            RoomOwner.shared.receiveStr = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
            
            /// RoomOwner
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "RoomOwner"), object: nil)
        }
        
        
        /// 本轮游戏结束
        if testXML(analayseStr: String.init(data: dd as Data, encoding: String.Encoding.utf8)!).contains("6") {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",String.init(data: dd as Data, encoding: String.Encoding.utf8)!)
           
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GameOver"), object: nil)
            /// 改变标识 ，时界面重新刷新
            dddd = false
        }
        
        
        /// 是否亮牌
        if testXML(analayseStr: String.init(data: dd as Data, encoding: String.Encoding.utf8)!).contains("5") {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",String.init(data: dd as Data, encoding: String.Encoding.utf8)!)
            
            RoomModel.shared.isGameBegin = true
            
            ShowCardModel.shared.receiveStr = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
        }
        
        
        /// 比牌完后返回分数
        /// 是否亮牌
        if testXML(analayseStr: String.init(data: dd as Data, encoding: String.Encoding.utf8)!).contains("7") {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",String.init(data: dd as Data, encoding: String.Encoding.utf8)!)
            
            RoomModel.shared.isGameBegin = true
            
            ShowCardModel.shared.receiveStr = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
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

        print("\((#file as NSString).lastPathComponent):(\(#line))\n",String.init(data: dd as Data, encoding: String.Encoding.utf8)!)
        JoinRoomModel.shared.joinResultStr = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
        
    }
    
    /// 断线重连
    if typpppp == 255 {
        
    }
    
    /// 有玩家不同意解散房间
    if typpppp == 87 {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "disagreeToDismiss"), object: nil)
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
        
        /// 创建成功，改变标识，进入游戏主界面
        if AnylasyseWithKey(analayseStr: String.init(data: dd as Data, encoding: String.Encoding.utf8)!, secondNode: "ty", withSepcifiedKey: "ms").contains("创建成功") {
            dddd = false
        }
        
        
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

// MARK: - 亮牌
func showCardsFunc() {
    
    reportTypeWithData(typeInt: 12, str: "<M><ty bb ='true'/></M>")
}

// MARK: - 作弊功能
func cheatSEL() {
    reportTypeWithData(typeInt: 88, str: "<M><ty szz ='true'/></M>")
}


// MARK: - 投票解散房间同意
///<M><ty jst ="1/2"/></M>
func agreeToDismiss() {
    reportTypeWithData(typeInt: 86, str: "<M><ty jst ='2'/></M>")
}

// MARK: - 投票解散房间不同意
///<M><ty jst ="1/2"/></M>
func disagreeToDismiss() {
    reportTypeWithData(typeInt: 86, str: "<M><ty jst ='1'/></M>")
}

// MARK: - 申请人发起申请
///<M><ty jst ="1/2"/></M>
func applierToDismiss() {
    reportTypeWithData(typeInt: 86, str: "<M><ty js ='true'/></M>")
}
