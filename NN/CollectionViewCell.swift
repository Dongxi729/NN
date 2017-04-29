//
//  CollectionViewCell.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/29.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    lazy var labelll: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width / 2, height: 30))
        d.backgroundColor = UIColor.randomColor()
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
        addSubview(labelll)
    }
}
