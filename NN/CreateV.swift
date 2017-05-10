//
//  CreateV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/10.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  创建房间视图

import UIKit

class CreateV: UIView {

    fileprivate lazy var createBrn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 50, y: 50, width: 100, height: 100))
        d.backgroundColor = UIColor.gray
        d.setTitle("创建房间", for: .normal)
        d.addTarget(self, action: #selector(xxxx), for: .touchUpInside)
        return d
    }()
    
    @objc fileprivate func xxxx() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(createBrn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
