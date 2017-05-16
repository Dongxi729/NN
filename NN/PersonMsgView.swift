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
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: commonMargin / 2, y: commonMargin / 2, width: 30 * screenScale, height: 30 * screenScale))
        d.backgroundColor = UIColor.gray
        
        d.layer.cornerRadius = 30 * screenScale / 2

        d.image = #imageLiteral(resourceName: "presonHeadBg")
        
        
        
//        if !(LoginModel.shared.headImgURL != nil) {
//            downImgWith(url: LoginModel.shared.headImgURL!, toView: d)
//        }  

        return d
    }()
    
    lazy var nameBgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.personImgView.RightX + commonMargin, y: commonMargin / 2 , width: 70 * screenScale, height: 12 * screenScale))
        d.image = #imageLiteral(resourceName: "suqareBgWithCir")

        return d
    }()
    
    /// 砖石背景
    lazy var diaBgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.personImgView.RightX + commonMargin, y: self.nameBgV.BottomY + commonMargin, width: 30 * screenScale, height: 12 * screenScale))
        d.image = #imageLiteral(resourceName: "diammand")
        return d
    }()
    
    /// 商城按钮
    lazy var marketBtn: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect(x: self.diaBgV.RightX + commonMargin * 0.65, y: self.nameBgV.BottomY + commonMargin * 0.65, width: 15 * screenScale, height: 15 * screenScale))

        d.isUserInteractionEnabled = true
        let getTure = UITapGestureRecognizer.init(target: self, action: #selector(jumpToShop))
        d.image = #imageLiteral(resourceName: "addDiammand")
        d.contentMode = .scaleAspectFit
        d.addGestureRecognizer(getTure)
        
        return d
    }()
    
    /// ID
    lazy var IDLabel: CommonLabel = {
        let d : CommonLabel = CommonLabel.init(frame: CGRect.init(x: self.nameLabel.RightX + commonMargin, y:commonMargin, width: 37, height: 20))
        
        if LoginModel.shared.uid != nil {
            d.text = "ID:" + LoginModel.shared.uid!
        } else {
            d.text = "123456"
        }
        
        d.sizeToFit()
        return d
    }()
    
    
    
    /// 砖石数量
    lazy var coinsLabel: CommonLabel = {
        let d :CommonLabel = CommonLabel.init(frame: CGRect.init(x: self.personImgView.RightX + commonMargin, y: self.nameLabel.BottomY + commonMargin * 0.5, width: 80, height: 20))
        d.backgroundColor = UIColor.gray
        d.textAlignment = .center
        
        if LoginModel.shared.wealth != nil {
            d.text = LoginModel.shared.wealth
        } else{
            d.text = "2000"
        }
        return d
    }()
    

    
    /// 昵称
    lazy var nameLabel: CommonLabel = {
        let d : CommonLabel = CommonLabel.init(frame: CGRect.init(x: self.personImgView.RightX + commonMargin, y: commonMargin, width: 37, height: 20))
        
        
        if LoginModel.shared.nickname != nil {
            d.text = LoginModel.shared.nickname
            
        } else {
            d.text = "sdassadasd"
        }
    
        d.sizeToFit()
        return d
    }()
    
    /// 加入房间
    lazy var joinRoom: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: SW * 0.5, y: SH * 0.25, width: SW * 0.5, height: SW * 0.4))
        d.image = #imageLiteral(resourceName: "joinRoom")
        d.contentMode = .scaleAspectFit
        
        return d
    }()

    /// 加入房间遮罩按钮
    lazy var joinMaskBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: SW * 0.55, y: SH * 0.7, width: SW * 0.3, height: SW * 0.13))
        d.addTarget(self, action: #selector(addJoinRoom), for: .touchUpInside)
       
        return d
    }()
    
    /// 背景图片
    lazy var bgImgVIew: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.frame)
        
        return d
    }()
    
    /// 创建房间
    lazy var makeRoom: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: SH * 0.25, width: SW * 0.5, height: SW * 0.4))

        d.image = #imageLiteral(resourceName: "createRoom")
        d.contentMode = .scaleAspectFit
        
        return d
    }()
    
    
    /// 创建房间遮罩按钮
    lazy var createMaskBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: SW * 0.15, y: SH * 0.7, width: SW * 0.3, height: SW * 0.13))
        d.addTarget(self, action: #selector(createRoom), for: .touchUpInside)
        
        return d
    }()
    
    lazy var bgViewImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.frame)
        d.image = UIImage.init(named: "mainScreenBg")
        
        return d
    }()
    
    /// 设置按钮
    lazy var rightV: HoolRightBtns = {
        let d : HoolRightBtns = HoolRightBtns.init(frame: CGRect.init(x: SW * 0.7, y: 0, width: SW - SW * 0.7 , height: 30 * screenScale))
        d.delegate = self
        return d
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(rightV)
        
        addSubview(bgViewImg)
        
        addSubview(personImgView)
        
        addSubview(coinsLabel)
        
        addSubview(nameBgV)
        
        addSubview(diaBgV)
        
        addSubview(nameLabel)
        
        addSubview(IDLabel)

        
        addSubview(joinRoom)
        addSubview(self.joinMaskBtn)
        
        addSubview(makeRoom)
        addSubview(self.createMaskBtn)
        
        addSubview(marketBtn)
    }
    
    /// 测试发送媒体信息
    @objc fileprivate func sendMeee() -> Void {
        let f : TestMediaVC = TestMediaVC.init(frame: self.frame)
        f.backgroundColor = UIColor.randomColor()
        f.center = self.center
        
        addToView(customView: f)
    }
    
    /// 商城
    @objc fileprivate func jumpToShop() -> Void {
        let f : MarketV = MarketV.init(frame: CGRect.init(x: 100, y: SH * 0.2, width: 300, height: 300))
        f.backgroundColor = UIColor.randomColor()
        f.center = self.center
        
        if marketVISExist.count < 1 {
            addToView(customView: f)
            marketVISExist.append(f)
        }
        
    }

    /// 加入房间
    @objc fileprivate func addJoinRoom() -> Void {
        
        let f : JoinRoomView = JoinRoomView.init(frame: CGRect.init(x: 100, y: SH * 0.2, width: 300, height: 300))
        f.backgroundColor = UIColor.gray
        f.center = self.center

        if isJoinViewExist.count < 1 {
            addToView(customView: f)
            isJoinViewExist.append(f)
        }
        
    }
    
    /// 创建房间
    @objc fileprivate func createRoom() -> Void {
        let f : CreateRoomBasic = CreateRoomBasic.init(frame: CGRect.init(x: 100, y: SH * 0.2, width: SW * 0.7, height: SH * 0.8))
        f.backgroundColor = UIColor.gray
        f.center = self.center
        
        if createRoomIsExist.count < 1 {
            addToView(customView: f)
            createRoomIsExist.append(f)
        }
        
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isJoinViewExist.count > 0  {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n")
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",self.subviews.last as Any)

            
            //购物断网刷新
            if NSStringFromClass((self.subviews.last?.classForCoder)!).contains("JoinRoomView") {
                
                self.subviews.last?.removeFromSuperview()
                
                /// 清空记录数组
                isJoinViewExist.removeAll()
            }
        
        }
        
        /// 创建房间清除
        if createRoomIsExist.count > 0  {
            
            //购物断网刷新
            if NSStringFromClass((self.subviews.last?.classForCoder)!).contains("CreateRoomBasic") {
                
                self.subviews.last?.removeFromSuperview()
                
                /// 清空记录数组
                createRoomIsExist.removeAll()
            }
        }
        
        /// 商城清除
        if marketVISExist.count > 0  {
            
            //购物断网刷新
            if NSStringFromClass((self.subviews.last?.classForCoder)!).contains("MarketV") {
                
                self.subviews.last?.removeFromSuperview()
                
                /// 清空记录数组
                marketVISExist.removeAll()
            }
        }
        
        /// 创建房间
        if CreateRoomBasicISExist.count > 0  {
            
            //购物断网刷新
            if NSStringFromClass((self.subviews.last?.classForCoder)!).contains("CreateRoomBasic") {
                
                self.subviews.last?.removeFromSuperview()
                
                /// 清空记录数组
                CreateRoomBasicISExist.removeAll()
            }
        }
        
        
        /// 创建房间
        if shareViewISExist.count > 0  {
            
            //购物断网刷新
            if NSStringFromClass((self.subviews.last?.classForCoder)!).contains("ShareView") {
                
                self.subviews.last?.removeFromSuperview()
                
                /// 清空记录数组
                shareViewISExist.removeAll()
            }
        }
    }
    
    
    /// 分享视图
    lazy var shareV: ShareView = {
        let v : ShareView = ShareView.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.45, height: SH * 0.45))
        v.backgroundColor = UIColor.clear
        v.delegate = self
        return v
    }()
}

// MARK: - 右上角按钮代理方法
extension PersonMsgView : HoolRightBtnsDelegate {
    func setFunc(sender: UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.currentTitle as Any)
    }
    
    func playTypeFunc(sender: UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.currentTitle as Any)
    }
    
    func shareFunc(sender: UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.currentTitle as Any)
        
//        if WXApi.isWXAppSupport() && WXApi.isWXAppInstalled() {
            shareV.center = self.center
            addToView(customView: shareV)
            shareViewISExist.append(shareV)
    
//        } else {
//            FTIndicator.showToastMessage("未安装微信")
//        }
        
   
    }
    
    func scoreFunc(sender: UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.currentTitle as Any)

    }
}


// MARK: - 分享视图代理方法
extension PersonMsgView : ShareViewDelegate {
    func wxShar(sender: UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.currentTitle)
    }
    
    func wxSharFri(sender: UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.currentTitle)
    }
}

class CommonLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.textColor = .white
 
        self.font = UIFont.systemFont(ofSize: 10 * screenScale)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


protocol HoolRightBtnsDelegate {
    func setFunc(sender : UIButton)
    func playTypeFunc(sender : UIButton)
    func shareFunc(sender : UIButton)
    func scoreFunc(sender : UIButton)
}

class HoolRightBtns: UIView {
    
    var delegate : HoolRightBtnsDelegate?
    
    
    /// 玩法
    lazy var playType: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: 0, y: 5, width: self.Width / 4, height: self.Width / 4))
        d.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        d.setImage(#imageLiteral(resourceName: "playSelected"), for: .highlighted)
        d.addTarget(self, action: #selector(playTypeFunction(sender:)), for: .touchUpInside)

        d.setTitle("playType", for: .normal)

        return d
    }()
    
    /// 分享
    lazy var shareBtn: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: self.playType.RightX, y: 5, width: self.Width / 4,height: self.Width / 4))
        d.setImage(#imageLiteral(resourceName: "shareNormal"), for: .normal)
        d.setImage(#imageLiteral(resourceName: "shareSelected"), for: .highlighted)
        d.addTarget(self, action: #selector(shareFunction(sender:)), for: .touchUpInside)

        d.setTitle("share", for: .normal)

        return d
    }()
    
    /// 分数
    lazy var scoreBtn: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: self.shareBtn.RightX, y: 5, width: self.Width / 4, height: self.Width / 4))
        d.setImage(#imageLiteral(resourceName: "scoreNormal"), for: .normal)
        d.setImage(#imageLiteral(resourceName: "scoreSelected"), for: .highlighted)
        d.addTarget(self, action: #selector(scoreFunction(sender:)), for: .touchUpInside)

        d.setTitle("score", for: .normal)

        return d
    }()
    
    /// 设置
    lazy var setBtn: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: self.scoreBtn.RightX, y: 5, width: self.Width / 4, height: self.Width / 4))
        d.setImage(#imageLiteral(resourceName: "setBtnNormal"), for: .normal)
        d.setImage(#imageLiteral(resourceName: "setNormalSelected"), for: .highlighted)
        d.setTitle("set", for: .normal)
        d.addTarget(self, action: #selector(setFunction(sender:)), for: .touchUpInside)
        return d
    }()
    
    @objc fileprivate func setFunction(sender : UIButton) {
        self.delegate?.setFunc(sender: sender)
    }
    
    @objc fileprivate func scoreFunction(sender : UIButton) {
        self.delegate?.scoreFunc(sender: sender)
    }
    
    @objc fileprivate func shareFunction(sender : UIButton) {
        self.delegate?.shareFunc(sender: sender)
    }
    
    @objc fileprivate func playTypeFunction(sender : UIButton) {
        self.delegate?.setFunc(sender: sender)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(playType)
        addSubview(shareBtn)
        addSubview(scoreBtn)
        addSubview(setBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class CommonBtn: UIButton {
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect.init(x: 0, y: 0, width: self.Width, height: self.Height)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
