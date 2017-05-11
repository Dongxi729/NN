////: Playground - noun: a place where people can play
//
import UIKit
//


var sss = "asdsd"
var ddd = "asdsad"




class Test : NSObject {
    
    static let shared = Test()
    
    var aaa : String = "57049219"
    var ccc : String = "da5945f432b741c0ad4880c488fd9a0f"
}

let a11 = "<M><Nn id=\"\(Test.shared.aaa)\" tk=\"\(Test.shared.ccc)\"/></M>"

var sendXMLDATA = "<M><Nn id=\"\(Test.shared.aaa)\" tk=\"\(Test.shared.ccc)\"/></M>"



/// 文字转Data
let datacc : NSMutableData = NSMutableData()

let dddd = sendXMLDATA.data(using: String.Encoding.utf8)

var it1 = dddd?.count;

/// 添加发送的文字
datacc.append(&it1, length: 4)

datacc.append(dddd!)

/// 转为Data进行添加类型
var sendData : Data = datacc as Data

sendData.insert(254, at: 4)

print("sendData :",sendData)

for byte in sendData {
    print(byte)
}

//for i in 0..<5 {
//    sendData.remove(at: 0)
//}
//

let dataStr = String.init(data: sendData, encoding: String.Encoding.utf8)

print(dataStr)
