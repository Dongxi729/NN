////: Playground - noun: a place where people can play
//
import UIKit
//


var sss = "asdsd"
var ddd = "asdsad"




class Test : NSObject {
    
    static let shared = Test()
    
    var aaa : String = "sss"
    var ccc : String = "sss123"
    
    
    
}

let a11 = "<M><Nn id=\"\(Test.shared.aaa)\" tk=\"\(Test.shared.ccc)\"/></M>"

var dd = "<M><Nn id=\"47607836\" tk=\"9e75b9842c2240b0896cd0b15b87640a\"/></M>"

if dd.contains("\\") {
    let ddStr : NSString = dd.replacingOccurrences(of: "\\", with: "") as NSString
    print(ddStr)
    
    dd = ddStr as String
}

print(dd)

let testStr = "dasdd"

let data = testStr.data(using: String.Encoding.utf8)

let strdata = String.init(data: data!, encoding: String.Encoding.utf8)
