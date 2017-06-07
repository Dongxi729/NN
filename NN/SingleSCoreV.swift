//
//  SingleSCoreV.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/7.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  用户成绩信息视图

import UIKit


class SingleSCoreV: UIView {
    
    var scoreVImg : ScorePersonInfoV!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    func showImgs(countInt : Int) -> Void {
        
        var index : Int = 6
        
        var width = self.Width / CGFloat(index)
        
        if countInt <= 3 {
            index = 5
            width = self.Width / CGFloat(index)
        }
        
        
        for value in 0..<countInt {
            
            scoreVImg = ScorePersonInfoV.init(frame: CGRect.init(x: CGFloat(value) * width, y: commonMargin, width: width, height: self.Height))
            scoreVImg.backgroundColor = UIColor.randomColor()
            
            addSubview(scoreVImg)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
