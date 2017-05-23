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
    client = TCPClient.init(address: "192.168.2.11", port: 8888)
    
    switch client.connect(timeout: 1) {
        
    case .success:
        
        
        while true {
            /// 缓存池数据
            let d = client.read(1024 * 10)
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",d)
            
            /// 绩溪县,.
            if d != nil {
                byteAnalyse(ddd: d!)

                if reportUser == true {
                    reportUID()
                    reportUser = false
                }
                

                
            } else {
                print("\((#file as NSString).lastPathComponent):(\(#line))\n","连接失败")
                
                FTIndicator.showError(withMessage: "连接失败")
                /// 连接异常则关闭连接。
                client.close()
                return
            }
        }
        
        
    case .failure( _):
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n","服务器状态不好或连接不上")
    }
}

// MARK: - 上报用户信息
func reportUID() -> Void {
    
    /// 上报用户信息
    reportTypeWithData(typeInt: 254, str: "<M><Nn id=\"\(LoginModel.shared.uid!)\" tk=\"\(LoginModel.shared.token!)\"/></M>")
}

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
func reportCreateRoomType() -> Void {
    let roomType = "<M><ty gt=\"\(CreateRoomModel.shared.roomType)\" ii=\"\(CreateRoomModel.shared.rounds)\" rn=\"\(CreateRoomModel.shared.players)\" py=\"\(CreateRoomModel.shared.payType)\"/></M>"
    
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
            
            
            print("leng :",leng)
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
    print("\((#file as NSString).lastPathComponent):(\(#line))\n",String.init(data: dd as Data, encoding: String.Encoding.utf8) as Any)
    
    /// 根据类型进行处理
    if typpppp == 8 {
        
        RoomModel.shared.currentRoomPlayInfo = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
    }
    
    
//    if (String.init(data: dd as Data, encoding: String.Encoding.utf8)?.contains("用户连接成功"))! {
//        AppDelegate.startSendAliveMsg()
//    }
//    
    if typpppp == 0 {

        AppDelegate.startSendAliveMsg()
    }
    
    /// 房间无
    if typpppp == 7 {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",String.init(data: dd as Data, encoding: String.Encoding.utf8))
        JoinRoomModel.shared.joinResultStr = String.init(data: dd as Data, encoding: String.Encoding.utf8)!
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
