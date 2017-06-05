//
//  GameOverView.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/3.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  游戏结束视图

import UIKit

class GameOverView: UIView {
    
    lazy var confirmBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.size.width * 0.3, height: self.frame.height * 0.2))
        d.setImage(#imageLiteral(resourceName: "GameOverConfirm"), for: .normal)
        d.addTarget(self, action: #selector(gameOverSEL), for: .touchUpInside)
        return d
    }()
    
    @objc fileprivate func gameOverSEL() -> Void {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.init(red: 111/255, green: 111/255, blue: 111/255, alpha: 0.2)
        
        self.layer.borderWidth = 1
        
        confirmBtn.center = self.center
        
        addSubview(confirmBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
