//
//  ShowGuessCoinsView.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/26.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  显示压分视图

import UIKit

class ShowGuessCoinsView: UIView {
    
    lazy var coinsImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "room_cn01")
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(coinsImg)
        
        coinsImg.isHidden = true
    }
    
    func showCoinsPosition(showIndex : Int) -> Void {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
