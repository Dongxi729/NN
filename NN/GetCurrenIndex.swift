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
}
