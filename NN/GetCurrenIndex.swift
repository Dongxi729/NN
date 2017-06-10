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
    
    // MARK: - 用户剩余分数
    fileprivate var leftReplaceScore : [Int] = []
    
    
    // MARK: - 用户增加分数
    fileprivate var userReplaceScoreDic : [Int] = []
    
    // MARK: - 牛牛纸牌
    var niuniuReplaceArray : [String] = []
    

    // MARK: - 获取对应用户所在的索引
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
    
    // MARK: - 用户2的数据
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
    
    // MARK: - 名字
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
    
    
    // MARK: - 重新排序房主ID
    func reverseRoomID() -> [String] {
        var ddd : [String] = []
        
        ddd.append(RoomModel.shared.userId[getCurrentIndex()])
        
        for value in RoomModel.shared.userId {
            if value != RoomModel.shared.userId[getCurrentIndex()] {
                ddd.append(value)
            }
        }
        return ddd
    }
}
