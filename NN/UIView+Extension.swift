//
//  UIView+Extension.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/8.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import Foundation

// MARK:- uiview分类扩展
extension UIView {
    
    var LeftX: CGFloat {
        get {
            return self.frame.origin.x
        }
    }
    var RightX: CGFloat {
        get {
            return self.frame.origin.x + self.bounds.width
        }
    }
    var TopY: CGFloat {
        get {
            return self.frame.origin.y
        }
    }
    var BottomY: CGFloat {
        get {
            return self.frame.origin.y + self.bounds.height
        }
    }
    var Width: CGFloat {
        get {
            return self.bounds.width
        }
    }
    var Height: CGFloat {
        get {
            return self.bounds.height
        }
    }
}
