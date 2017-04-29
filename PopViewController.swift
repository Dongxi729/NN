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
    
    
    func addTarget(_ ios: UIView) {
        // 执行动画 改变透明度
        let alpha = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
        alpha?.toValue = (1.0)
        alpha?.duration = 0.3
//        UIImageView.pop_add(alpha, forKey: nil)
        // 缩放回弹
        let scale = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scale?.fromValue = NSValue(cgSize: CGSize(width: CGFloat(1.75), height: CGFloat(1.75)))
        scale?.toValue = NSValue(cgSize: CGSize(width: CGFloat(1.0), height: CGFloat(1.0)))
        scale?.dynamicsTension = 1000
        scale?.dynamicsMass = 1.3
        scale?.dynamicsFriction = 10.3
        scale?.springSpeed = 20
        scale?.springBounciness = 15.64
        scale?.delegate = self
        ios.layer.pop_add(scale, forKey: nil)
    }

}

