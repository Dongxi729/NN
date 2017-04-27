//
//  BtnWithLongPress.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/27.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class BtnWithLongPress: UIViewController {

    
    lazy var lpButton: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        let longTap = UILongPressGestureRecognizer.init(target: self, action: #selector(longSEL(gesture:)))

        d.addGestureRecognizer(longTap)
        d.backgroundColor = UIColor.gray
        return d
    }()
    
    func longSEL(gesture : UILongPressGestureRecognizer) -> Void {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        
        if gesture.state == .began {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n","长按事件")
        } else {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n","结束")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(lpButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
