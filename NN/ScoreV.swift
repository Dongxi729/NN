//
//  ScoreV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/22.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  显示分数视图

import UIKit

/// 显示分数视图(本地图片拼接而成)
class ScoreV: UIView {
    
    //    var score : String = RoomModel.shared.scoreCount
    
    var imgs : UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func abc(abc : String,scoreType : Int) -> Void {
        var index = 0
        
        if scoreType == 1 {
            
            for scoreImgName in inPlusScore(xxx: abc) {
                imgs = UIImageView.init(frame: CGRect.init(x: CGFloat(index) * self.Width / CGFloat(inPlusScore(xxx: abc).count), y: 0, width: self.Width / CGFloat(inPlusScore(xxx: abc).count), height: self.Height))
                imgs.image = UIImage.init(named: scoreImgName)
                
                index += 1
                imgs.contentMode = UIViewContentMode.scaleAspectFit
                
                addSubview(imgs)
                
            }
        }
        
        if scoreType == 2 {
            for scoreImgName in inMinusScore(xxx: abc) {
                imgs = UIImageView.init(frame: CGRect.init(x: CGFloat(index) * self.Width / CGFloat(inMinusScore(xxx: abc).count), y: 0, width: self.Width / CGFloat(inMinusScore(xxx: abc).count), height: self.Height))
                imgs.image = UIImage.init(named: scoreImgName)
                
                index += 1
                imgs.contentMode = UIViewContentMode.scaleAspectFit
                
                addSubview(imgs)
                
            }
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
