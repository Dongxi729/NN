//
//  ScoreImgShowTool.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/20.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  分数图片工具

import Foundation

/// 适用于减法的时候的图片
func inMinusScore(xxx : String) -> [String] {
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
            
            correctImg.append("p00")
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

/// 适用于加法的时候的图片
func inPlusScore(xxx : String) -> [String] {
    var correctImg : [String] = []
    for chas in xxx.characters {
        switch chas {
        case "+":
            
            correctImg.append("m+")
            break
            
        case "-":
            
            correctImg.append("pminus")
            break
            
        case "0":
            
            correctImg.append("m0")
            break
            
        case "1":
            
            correctImg.append("m1")
            break
            
        case "2":
            
            correctImg.append("m2")
            break
            
        case "3":
            
            correctImg.append("m3")
            break
        case "4":
            
            correctImg.append("m4")
            break
            
        case "5":
            
            correctImg.append("m5")
            break
            
        case "6":
            
            correctImg.append("m6")
            break
            
        case "7":
            
            correctImg.append("m7")
            break
            
        case "8":
            
            correctImg.append("m8")
            break
            
        case "9":
            
            correctImg.append("m9")
            break
        default:
            break
        }
        
        
    }
    return correctImg
}
