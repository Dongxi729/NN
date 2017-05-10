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
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: commonMargin, y: commonMargin, width: 30 * screenScale, height: 30 * screenScale))
        d.backgroundColor = UIColor.gray
        
        downImgWith(url: LoginModel.shared.headImgURL!, toView: d)
        return d
    }()
    
    
    /// ID
    lazy var IDLabel: CommonLabel = {
        let d : CommonLabel = CommonLabel.init(frame: CGRect.init(x: self.nameLabel.RightX + commonMargin, y:commonMargin, width: 37, height: 20))
        d.text = "ID:" + LoginModel.shared.uid!
        
//        d.text = "ID:" + "123232"
        
        d.sizeToFit()
        return d
    }()
    
    /// 砖石数量
    lazy var coinsLabel: CommonLabel = {
        let d :CommonLabel = CommonLabel.init(frame: CGRect.init(x: self.personImgView.RightX + commonMargin, y: self.nameLabel.BottomY + commonMargin * 0.5, width: 80, height: 20))
        d.backgroundColor = UIColor.gray
        d.textAlignment = .center
        
        
        d.text = LoginModel.shared.wealth
//        d.text = "6"
        return d
    }()
    
    /// 昵称
    lazy var nameLabel: CommonLabel = {
        let d : CommonLabel = CommonLabel.init(frame: CGRect.init(x: self.personImgView.RightX + commonMargin, y: commonMargin, width: 37, height: 20))
        d.text = LoginModel.shared.nickname
//        d.text = "sdassadasd"
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
    
    /// 玩法
    lazy var playStyle: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.setBtn.LeftX + commonMargin, y: commonMargin, width: 40, height: 40))
        d.backgroundColor = UIColor.gray

        return d
    }()
    
    /// 加入房间
    lazy var joinRoom: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: UIScreen.main.bounds.width * 0.5 + UIScreen.main.bounds.width * 0.05, y: SH - SH * 0.65, width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.width * 0.35))
        d.setTitle("加入房间", for: .normal)
        
        d.backgroundColor = UIColor.gray
        return d
    }()
    
    /// 创建房间
    lazy var makeRoom: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: UIScreen.main.bounds.width * 0.1, y: SH - SH * 0.65, width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.width * 0.35))
        d.setTitle("创建房间", for: .normal)
        d.addTarget(self, action: #selector(addJosinView), for: .touchUpInside)
        d.backgroundColor = UIColor.gray
        return d
    }()
    
    lazy var bgViewImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.frame)
        d.image = UIImage.init(named: "mainScreenBg")
        
        return d
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bgViewImg)
        
        addSubview(personImgView)
        
        addSubview(nameLabel)
        
        addSubview(IDLabel)
        
        addSubview(coinsLabel)

        addSubview(setBtn)
        
        addSubview(joinRoom)
        
        addSubview(makeRoom)
    }

    
    func addJosinView() -> Void {
        
        let f : JoinRoomView = JoinRoomView.init(frame: CGRect.init(x: 100, y: SH * 0.2, width: 300, height: 300))
        f.backgroundColor = UIColor.gray
        
        addToView(customView: f)
    }
    
    func addToView(customView : UIView) -> Void {
        // 执行动画 改变透明度
        let alpha = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
        alpha?.toValue = (1.0)
        alpha?.duration = 0.3
        //        UIImageView.pop_add(alpha, forKey: nil)
        // 缩放回弹
        let scale = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scale?.fromValue = NSValue(cgSize: CGSize(width: CGFloat(1.75), height: CGFloat(1.75)))
        scale?.toValue = NSValue(cgSize: CGSize(width: CGFloat(1.0), height: CGFloat(1.0)))
        scale?.dynamicsTension = 1000
        scale?.dynamicsMass = 1.3
        scale?.dynamicsFriction = 10.3
        scale?.springSpeed = 20
        scale?.springBounciness = 15.64
        scale?.delegate = UIApplication.shared.keyWindow?.rootViewController
        customView.layer.pop_add(scale, forKey: nil)
        
        addSubview(customView)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class CommonLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.textColor = .white
 
        self.font = UIFont.systemFont(ofSize: 11)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
