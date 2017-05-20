//
//  CommonBtn.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/19.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class CommonBtn: UIButton {
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect.init(x: 0, y: 0, width: self.Width, height: self.Height)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
