//
//  ScreenShotViewController.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/7.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class ScreenShotViewController: UIViewController {

    lazy var inputuii: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 300))
        return d
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(inputuii)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.inputuii.image = inputuii.screenShot()
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
    }
    
    
}
