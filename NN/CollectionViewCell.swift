//
//  CollectionViewCell.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/29.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    /// 文本
    lazy var labelll: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width / 2, height: 30))
//        d.backgroundColor = UIColor.randomColor()
        return d
    }()
    
    /// 背景图片
    lazy var bgImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 50, y: 50, width: self.frame.width / 3, height: self.frame.width / 3))
        d.contentMode = UIViewContentMode.scaleAspectFill
        d.layer.borderWidth = 1
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareUI() -> Void {
//        addSubview(labelll)
        addSubview(bgImg)
    }
}
