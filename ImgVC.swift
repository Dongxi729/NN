//
//  ImgVC.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/12.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class ImgVC: UIViewController {

    
    // MARK: - 位置坐标
    fileprivate var scoreRect : [CGRect] = [CGRect.init(x: SW * 0.414, y: SH * 0.74, width: SW * 0.15, height: SH * 0.15),
                            CGRect.init(x: SW * 0.3, y: SH * 0.45, width: SW * 0.15, height: SH * 0.15),
                            CGRect.init(x: SW * 0.3, y: SH * 0.35, width: SW * 0.15, height: SH * 0.15),
                            CGRect.init(x: 0.53 * SW, y: 0.24 * SH, width: SW * 0.15, height: SH * 0.15),
                            CGRect.init(x: SW * 0.6, y: SH * 0.24, width: SW * 0.15, height: SH * 0.15),
                            CGRect.init(x: SW * 0.7, y: SH * 0.5, width: SW * 0.15, height: SH * 0.15)]
    
    var imgsName = ["niu0","niu1","niu2","niu3","niu4","niu5"]
    
    var score : [String] = ["10","-20","33","729","66"]
    
    var imgs : UIImageView = UIImageView()
    var scoreImg : ScoreV = ScoreV()
    
    lazy var jifenV: JifenV = {
        let d : JifenV = JifenV.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 50))
        d.layer.borderWidth = 1
        return d
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var index = 0
        for rect in scoreRect {
            jifenV = JifenV.init(frame: rect)
            view.addSubview(jifenV)
            
            switch index {
            case 0:
                jifenV.leftOrRight = -1
                jifenV.two = -1
                jifenV.jifenNums.text = "15"
                
                break
            case 1:
                jifenV.leftOrRight = -1
                jifenV.two = -1
                jifenV.jifenNums.text = "15"
                
                break
            case 2:
                jifenV.leftOrRight = -1
                jifenV.two = -1
                jifenV.jifenNums.text = "15"
                
                break
            case 3:
                jifenV.leftOrRight = -1
                jifenV.two = -1
                jifenV.jifenNums.text = "15"
                
                break
            case 4:
                jifenV.leftOrRight = 1
                jifenV.two = 1
                jifenV.jifenNums.text = "15"
                
                break
            case 5:
                jifenV.leftOrRight = -1
                jifenV.two = -1
                jifenV.jifenNums.text = "15"
                
                break
            default:
                break
            }
            index += 1
        }
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        let touchPoint: CGPoint? = touch?.location(in: self.view)
        print("\((touchPoint?.x)! / SW)==\((touchPoint?.y)! / SH)")
        let stringFloat = Int((touchPoint?.x)!)
        let stringFloat1 = Int((touchPoint?.y)!)
        print("\(stringFloat)\(stringFloat1)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



