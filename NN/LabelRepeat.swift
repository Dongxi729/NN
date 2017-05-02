//
//  LabelRepeat.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/29.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class LabelRepeat: UIViewController {

    lazy var repeatLbl: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: UIScreen.main.bounds.width, y: 64, width: UIScreen.main.bounds.width, height: 30))
        d.text = "傻了都快结束了的控件撒考虑到就死啦的萨拉肯德基拉萨肯德基啦开始了"
        return d
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UIView.animate(withDuration: 6.0) {
            self.repeatLbl.frame = CGRect.init(x: 0, y: 64, width: 2 * UIScreen.main.bounds.width, height: 30)
        }
        
        view.addSubview(repeatLbl)
    }
}
