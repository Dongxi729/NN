//
//  ImgVC.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/12.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class ImgVC: UIViewController {

    
    ///         let d : UIImageView = UIImageView.init(frame: CGRect.init(x: SW * 0.3, y: SH * 0.75, width: SW * 0.4, height: SH * 0.2))
//    //            rect = CGRect.init(x: SW * 0.3, y: SH * 0.75, width: SW * 0.4, height: SH * 0.2)
//    break
//    case 2:
//    rect = CGRect.init(x: SW * 0.25 - SW * 0.05, y: SH * 0.55, width: SW * 0.4, height: SH * 0.2)
//    
//    break
//    case 3:
//    rect = CGRect.init(x: SW * 0.25 - SW * 0.05, y: SH * 0.46, width: SW * 0.4, height: SH * 0.2)
//    
//    break
//    case 4:
//    rect = CGRect.init(x: SW * 0.5 - SW * 0.05, y: SH * 0.165, width: SW * 0.4, height: SH * 0.2)
//    break
//    case 5:
//    rect = CGRect.init(x: SW * 0.7 - SW * 0.05, y: SH * 0.46, width: SW * 0.4, height: SH * 0.2)
//    
//    break
//    case 6:
//    rect = CGRect.init(x: SW * 0.7 - SW * 0.05, y: SH * 0.68, width: SW * 0.4, height: SH * 0.2)


//    var rects : [CGRect] = [CGRect.init(x: SW * 0.15, y: SH * 0.8, width: SW * 0.18, height: SH * 0.15),
//                            CGRect.init(x: SW * 0.06, y: SH * 0.56, width: SW * 0.18, height: SH * 0.15),
//                            CGRect.init(x: SW * 0.06, y: SH * 0.35, width: SW * 0.18, height: SH * 0.15),
//                            CGRect.init(x: 0.45 * SW, y: 0.13 * SH, width: SW * 0.18, height: SH * 0.15),
//                            CGRect.init(x: SW * 0.8, y: SH * 0.35, width: SW * 0.18, height: SH * 0.15),
//                            CGRect.init(x: SW * 0.8, y: SH * 0.55, width: SW * 0.18, height: SH * 0.15)]
    
    
    // MARK: - 位置坐标
    fileprivate var rects : [CGRect] = [CGRect.init(x: SW * 0.3, y: SH * 0.75, width: SW * 0.4, height: SH * 0.15),
                            CGRect.init(x: SW * 0.25 - SW * 0.05, y: SH * 0.56, width: SW * 0.4, height: SH * 0.15),
                            CGRect.init(x: SW * 0.25 - SW * 0.05, y: SH * 0.35, width: SW * 0.4, height: SH * 0.15),
                            CGRect.init(x: SW * 0.5 - SW * 0.05, y: SH * 0.13, width: SW * 0.4, height: SH * 0.15),
                            CGRect.init(x: SW * 0.6 - SW * 0.05, y: SH * 0.35, width: SW * 0.4, height: SH * 0.15),
                            CGRect.init(x: SW * 0.6 - SW * 0.05, y: SH * 0.55, width: SW * 0.4, height: SH * 0.15)]
    
    var scoreRect : [CGRect] = [CGRect.init(x: SW * 0.15, y: SH * 0.8, width: SW * 0.18, height: SH * 0.15),
                            CGRect.init(x: SW * 0.06, y: SH * 0.56, width: SW * 0.18, height: SH * 0.15),
                            CGRect.init(x: SW * 0.06, y: SH * 0.35, width: SW * 0.18, height: SH * 0.15),
                            CGRect.init(x: 0.45 * SW, y: 0.13 * SH, width: SW * 0.18, height: SH * 0.15),
                            CGRect.init(x: SW * 0.8, y: SH * 0.35, width: SW * 0.18, height: SH * 0.15),
                            CGRect.init(x: SW * 0.8, y: SH * 0.55, width: SW * 0.18, height: SH * 0.15)]
    
    var imgsName = ["niu0","niu1","niu2","niu3","niu4","niu5"]
    
    var score : [String] = ["10","-20","33","729","66"]
    
    var imgs : UIImageView = UIImageView()
    var scoreImg : ScoreV = ScoreV()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        var index = 0
        for value in rects {
            imgs = UIImageView.init(frame: value)
            imgs.image = UIImage.init(named: imgsName[index])
            imgs.contentMode = UIViewContentMode.scaleAspectFit
            
            scoreImg = ScoreV.init(frame: value)
            
            scoreImg.abc(abc: "22", scoreType: 1)
            scoreImg.backgroundColor = UIColor.randomColor()
            view.addSubview(scoreImg)
            
            view.addSubview(imgs)
            index += 1
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
