//
//  FontVC.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/3.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class FontVC: UIViewController {

    lazy var labbb: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 100))
        d.text = "mmm汉字书写信息"
        d.backgroundColor = UIColor.randomColor()
        d.font = UIFont(name: "Xingkai SC", size: 30)
        return d
    }()
    
    
    lazy var labbb2: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 390, width: 300, height: 100))
        d.text = "mmm汉字书写信息"
        d.backgroundColor = UIColor.randomColor()
        return d
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(labbb)
        view.addSubview(labbb2)

        
        for fontnae in UIFont.familyNames {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",fontnae)
        }
    }
}
