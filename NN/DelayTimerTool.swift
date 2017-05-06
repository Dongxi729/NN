//
//  DelayTimerTool.swift
//  TouchID
//
//  Created by 郑东喜 on 2017/4/28.
//  Copyright © 2017年 ShaoFeng. All rights reserved.
//

import Foundation

public typealias handle = () -> Void

func delay(_ interval: TimeInterval, handle: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(interval * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: handle)
}
