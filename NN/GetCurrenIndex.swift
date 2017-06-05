//
//  GetCurrenIndex.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/1.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class GetCurrenIndex: NSObject {
    
    var currentUserIndex = 0
    
    static let shared = GetCurrenIndex()
    
    /// 用户剩余分数
    fileprivate var leftReplaceScore : [Int] = []
    
    
    /// 用户增加分数
    fileprivate var userReplaceScoreDic : [Int] = []
    
    /// 牛牛纸牌
    var niuniuReplaceArray : [String] = []
    
    
    /// 用户增加分数
    func userReplaceScore() -> [Int] {
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        var dic : [Int] = []
        dic = [ScoreModel.shared.userScoreDic.remove(at: getCurrentIndex())]
        return dic
    }
    
    var markNN = true
    
    /// 牛牛纸牌
    func niuniuFunc() -> [String] {
        var dic : [String] = []
        
        DispatchQueue.once(token: "") {
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n")
            
            dic = [CardNameModel.shared.niuniuBackUpArray.remove(at: getCurrentIndex())]
            
        }
        
        
        
        
        
        return dic
    }
    
    /// 用户剩余分数
    func leftReplaceScoreFuns() -> [Int] {
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        var dic : [Int] = []
        dic = [ScoreModel.shared.leftScore.remove(at: getCurrentIndex())]
        return dic
    }
    
    /// 获取对应用户所在的索引
    func getCurrentIndex() -> Int {
        /// 返回当前用户的分数位置(用户1)
        var userIndex1 = 0
        
        for value in RoomModel.shared.userId {
            
            /// 当前用户的
            if value == LoginModel.shared.uid {
                currentUserIndex = userIndex1
                break
            }
            
            userIndex1 += 1
        }
        
        return currentUserIndex
    }
    
    /// 用户2的数据
    func p2ArrayWithoutP1() -> [String] {
        
        
        /// 移除了第一个索引后的值
        var newDic : [String] = []
        
        for (_,v) in RoomModel.shared.headUrlDic {
            
            if v != RoomModel.shared.headUrlDic[currentUserIndex] {
                newDic.append(v)
            }
        }
        
        
        return newDic
    }
    
    /// 名字
    func p2NameLabelWithoutP1() -> [String] {
        /// 移除了第一个索引后的值
        var newDic : [String] = []
        
        for (k,v) in RoomModel.shared.nameStr {
            if k != currentUserIndex {
                newDic.append(v)
            }
        }
        
        return newDic
    }
    
}
