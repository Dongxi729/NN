//
//  JifenV.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/12.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

// MARK: - 积分视图
class JifenV : UIView {
    
    var leftOrRight : Int? {
        didSet {
            self.coinImg = UIImageView.init(frame: CGRect.init(x: CGFloat(self.leftOrRight!), y: 0, width: self.Width * 0.5, height: self.Height))
            self.coinImg.image = #imageLiteral(resourceName: "room_cn01")
            self.coinImg.contentMode = UIViewContentMode.scaleAspectFit
            addSubview(coinImg)
        }
    }
    
    var two : Int? {
        didSet {
            self.jifenNums = UILabel.init(frame: CGRect.init(x: CGFloat(two!) * self.Width * 0.5, y: self.Height * 0.2, width: self.Width * 0.5, height: self.Height * 0.6))
            self.jifenNums.backgroundColor = UIColor.gray
            self.jifenNums.textAlignment = .center
            self.jifenNums.font = UIFont(name: "SimHei", size: 10 * screenScale)
            self.jifenNums.textColor = UIColor.white
            self.jifenNums.layer.cornerRadius = 5
            self.jifenNums.clipsToBounds = true
            
            
            addSubview(jifenNums)
        }
    }
    
    lazy var coinImg: UIImageView = {
        let d : UIImageView = UIImageView.init()
        
        return d
    }()
    
    
    lazy var jifenNums: UILabel = {
        let d : UILabel = UILabel.init()
        
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
