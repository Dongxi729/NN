//: Playground - noun: a place where people can play

import UIKit

var str = "+-0123456789"



var sss : UIImage!




    
func inStrReturnImg(xxx : String) -> [String] {
    var correctImg : [String] = []
    for chas in xxx.characters {
    print(chas)
    switch chas {
    case "+":
    
    correctImg.append("p+")
    break
    
    case "-":
    
    correctImg.append("pm")
    break
    
    case "0":
    
    correctImg.append("p0")
    break
    
    case "1":
    
    correctImg.append("p1")
    break
    
    case "2":
    
    correctImg.append("p2")
    break
    
    case "3":
    
    correctImg.append("p3")
    break
    case "4":
    
    correctImg.append("p4")
    break
    
    case "5":
    
    correctImg.append("p5")
    break
    
    case "6":
    
    correctImg.append("p6")
    break
    
    case "7":
    
    correctImg.append("p7")
    break
    
    case "8":
    
    correctImg.append("p8")
    break
    
    case "9":
    
    correctImg.append("p9")
    break
    default:
    break
    }

    
    }
    return correctImg
}


//inStrReturnImg(xxx: "+-0123456789")
inStrReturnImg(xxx: "16")

var score = "99"

var index = 0
for scoreImgName in inStrReturnImg(xxx: score) {
    index += 1
    print(index)
}