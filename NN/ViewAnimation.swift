//
//  ViewAnimation.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/2.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  弹簧效果

import UIKit

class ViewAnimation: UIViewController {

    lazy var view1: UIView = {
        let ddd : UIView = UIView.init(frame: CGRect.init(x: 0, y: -100, width: 100, height: 100))
        ddd.backgroundColor = UIColor.gray
        return ddd
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        view.addSubview(view1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 2.0, delay: 1.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, options: .curveLinear, animations: {
            
            self.view1.frame = CGRect.init(x: 0, y: 0, width: 100, height: 200)
            
        }) { (trur) in
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",trur)
        }
    }

    let kRotationAnimationKey = "com.myapplication.rotationanimationkey" // Any key
    
    func rotateView(view: UIView, duration: Double = 1) {
        if view.layer.animation(forKey: kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
//
//            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float(Double.pi * 2.0)
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = Float.infinity
            
            rotationAnimation.isCumulative = true
    
            view.layer.add(rotationAnimation, forKey: kRotationAnimationKey)
        }
    }
   
}
