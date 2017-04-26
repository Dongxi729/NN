//
//  PersonMsgView.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/24.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  个人信息视图

import UIKit

@IBDesignable

class PersonMsgView: UIView {
    
    
    
    /// 个人头像
    lazy var personImgView: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: commonMargin, y: commonMargin, width: 40 * screenScale, height: 40 * screenScale))
        d.backgroundColor = UIColor.gray
        return d
    }()
    
    
    /// ID
    lazy var IDLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: self.nameLabel.RightX + commonMargin, y:commonMargin, width: 37, height: 20))
        d.text = "ID:" + "123232"
        
        d.sizeToFit()
        return d
    }()
    
    /// coinsNumLabel
    lazy var coinsLabel: UILabel = {
        let d :UILabel = UILabel.init(frame: CGRect.init(x: self.personImgView.RightX + commonMargin, y: self.nameLabel.BottomY + commonMargin * 0.5, width: 80, height: 20))
        d.backgroundColor = UIColor.gray
        d.textAlignment = .center
        d.text = "6"
        return d
    }()
    
    /// 名字
    lazy var nameLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: self.personImgView.RightX + commonMargin, y: commonMargin, width: 37, height: 20))
        d.text = "sdassadasd"
        d.sizeToFit()
        return d
    }()
    
    /// 设置按钮
    lazy var setBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: UIScreen.main.bounds.width - commonMargin - 40 * screenScale, y: commonMargin, width: 40, height: 40))
        d.backgroundColor = UIColor.gray
        d.setTitle("设置", for: .normal)
        return d
    }()
    
    /// 加入房间
    lazy var joinRoom: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: UIScreen.main.bounds.width * 0.5 + UIScreen.main.bounds.width * 0.05, y: 100, width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.width * 0.35))
        
        d.setTitle("创建房间", for: .normal)
        d.backgroundColor = UIColor.gray
        return d
    }()
    
    /// 创建房间
    lazy var makeRoom: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: UIScreen.main.bounds.width * 0.1, y: 100, width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.width * 0.35))
        d.setTitle("创建房间", for: .normal)
        d.backgroundColor = UIColor.gray
        return d
    }()
    
    /// 按钮数量
    let btnNum : Int = 4

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(personImgView)
        
        addSubview(nameLabel)
        
        addSubview(IDLabel)
        
        addSubview(coinsLabel)

        addSubview(setBtn)
        
        addSubview(joinRoom)
        
        addSubview(makeRoom)
    }

    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
