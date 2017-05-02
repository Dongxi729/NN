//
//  PopViewController.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/27.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class PopViewController: UIViewController {
    
    lazy var animatedView: UIView = {
        let d : UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        d.backgroundColor = UIColor.red
        
        return d
    }()
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.addSubview(animatedView)
        animatedView.center = view.center
        
        addTarget(animatedView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
}

