//
//  PersonMsgView.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/24.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  个人信息视图

import UIKit

class PersonMsgView: UIView {
    
    
    
    /// 个人头像
    lazy var personImgView: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: commonMargin / 2, y: commonMargin / 2, width: 30 * screenScale, height: 30 * screenScale))
        d.backgroundColor = UIColor.gray
        
        d.layer.cornerRadius = 30 * screenScale / 2
        
        d.image = #imageLiteral(resourceName: "presonHeadBg")
        
        return d
    }()
    
    lazy var personHeadImgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: commonMargin / 2 + 2.5, y: commonMargin / 2 + 2.5, width: 30 * screenScale - 5, height: 30 * screenScale - 5))
        d.backgroundColor = UIColor.gray
        
        d.layer.cornerRadius = 30 * screenScale / 2
        d.clipsToBounds = true
        
        if (LoginModel.shared.headImgURL != nil) {
            downImgWith(url: LoginModel.shared.headImgURL!, toView: d)
        } else {
            downImgWith(url: "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1987683146,3571917101&fm=117&gp=0.jpg", toView: d)
        }
        
        return d
    }()
    
    lazy var nameBgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.personImgView.RightX + commonMargin, y: commonMargin / 2 , width: 75 * screenScale, height: 12 * screenScale))
        d.image = #imageLiteral(resourceName: "suqareBgWithCir")
        
        return d
    }()
    
    /// 砖石背景
    lazy var diaBgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.personImgView.RightX + commonMargin, y: self.nameBgV.BottomY + commonMargin, width: 35 * screenScale, height: 12 * screenScale))
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
        let d : CommonLabel = CommonLabel.init(frame: CGRect.init(x: self.nameBgV.RightX - self.nameBgV.Width * 0.6, y:3 * screenScale, width: self.Width * 0.15, height: 15 * screenScale))
        
        d.layer.borderWidth = 1
        if LoginModel.shared.uid != nil {
            d.text = "ID:" + LoginModel.shared.uid!
        } else {
            d.text = "ID:123456"
        }
        
        d.sizeToFit()
        return d
    }()
    
    
    
    /// 砖石数量
    lazy var coinsLabel: CommonLabel = {
        let d :CommonLabel = CommonLabel.init(frame: CGRect.init(x: self.personImgView.RightX + commonMargin, y: self.nameBgV.BottomY + 5 * screenScale, width: self.Width * 0.15, height: 12 * screenScale))
        
        d.textAlignment = .center
        
        if LoginModel.shared.wealth != nil {
            d.text = LoginModel.shared.wealth
        } else{
            d.text = "2000"
        }
        d.font = UIFont(name: "SimHei", size: 8 * screenScale)
        
        return d
    }()
    
    
    
    /// 昵称
    lazy var nameLabel: CommonLabel = {
        let d : CommonLabel = CommonLabel.init(frame: CGRect.init(x: self.personImgView.RightX + commonMargin, y: 5, width: self.nameBgV.Width * 0.4, height: 12 * screenScale))
        
        
        if LoginModel.shared.nickname != nil {
            d.text = LoginModel.shared.nickname
            
        } else {
            d.text = "阿东"
        }
        
        d.textColor = UIColor.white
        
        return d
    }()
    
    /// 加入房间
    lazy var joinRoom: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: SW * 0.5, y: SH * 0.25, width: SW * 0.5, height: SW * 0.4))
        d.image = #imageLiteral(resourceName: "joinRoom")
        d.contentMode = .scaleAspectFit
        /// addJoinRoom
        d.isUserInteractionEnabled = true
        let getTap = UITapGestureRecognizer.init(target: self, action: #selector(addJoinRoom))
        d.addGestureRecognizer(getTap)
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
        d.isUserInteractionEnabled = true
        let getTap = UITapGestureRecognizer.init(target: self, action: #selector(createRoom))
        d.addGestureRecognizer(getTap)
        
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

        addSubview(nameBgV)
        
        addSubview(diaBgV)
        
        addSubview(nameLabel)
        
        addSubview(IDLabel)
        addSubview(coinsLabel)
        
        addSubview(joinRoom)
        
        addSubview(makeRoom)
        addSubview(marketBtn)
        addSubview(personImgView)
        addSubview(personHeadImgV)
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
        let f : MarketV = MarketV.init(frame: CGRect.init(x: 100, y: SH * 0.2, width: SW * 0.65, height: SW * 0.5))
        
        f.center = self.center
        
        if marketVISExist.count < 1 {
            addToView(customView: f)
            marketVISExist.append(f)
        }
        
    }
    

    /// 加入房间视图
    fileprivate lazy var joinRooV: JoinRoomView = {
        let d : JoinRoomView = JoinRoomView.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.42, height: SW * 0.42))
        return d
    }()
    
    /// 加入房间
    @objc fileprivate func addJoinRoom() -> Void {
    
        joinRooV.center = self.center
        
        addSubview(dismissJoinRoom)
        
        addToView(customView: joinRooV)
    }
    
    /// 创建房间视图
    lazy var creatRoomV: CreateV = {
        let d : CreateV = CreateV.init(frame: CGRect.init(x: 100, y: SH * 0.2, width: (SH * 0.98) * (650 / 480), height: SH * 0.98))
        return d
    }()
    
    /// 隐藏
    lazy var dismissCreatV: UIButton = {
        let d : UIButton = UIButton.init(frame: self.bounds)
        d.addTarget(self, action: #selector(dismissCreatRommV), for: .touchUpInside)
        return d
    }()
    
    /// 创建房间
    @objc fileprivate func createRoom() -> Void {
        
        addSubview(self.dismissCreatV)
        self.creatRoomV.center = self.center
        addToView(customView: self.creatRoomV)
    }
    
    @objc fileprivate func dismissCreatRommV() -> Void {
        self.dismissCreatV.removeFromSuperview()
        self.creatRoomV.removeFromSuperview()
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
        scale?.dynamicsTension = 20
        scale?.dynamicsMass = 1.3
        scale?.dynamicsFriction = 10.3
        scale?.springSpeed = 20
        scale?.springBounciness = 2
        scale?.delegate = UIApplication.shared.keyWindow?.rootViewController
        customView.layer.pop_add(scale, forKey: nil)
        
        addSubview(customView)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        
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
        if shareViewISExist.count > 0 {
            
            //购物断网刷新
            if NSStringFromClass((self.subviews.last?.classForCoder)!).contains("ShareView") {
                
                self.subviews.last?.removeFromSuperview()
                
                /// 清空记录数组
                shareViewISExist.removeAll()
            }
        }
        
        
        /// 创建房间
        if howPlayISExist.count > 0  {
            
            //购物断网刷新
            if NSStringFromClass((self.subviews.last?.classForCoder)!).contains("HowToPlayV") {
                
                self.subviews.last?.removeFromSuperview()
                
                /// 清空记录数组
                howPlayISExist.removeAll()
            }
        }
    }
    
    
    /// 分享视图
    fileprivate lazy var shareV: ShareView = {
        let v : ShareView = ShareView.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.45, height: SH * 0.45))
        v.backgroundColor = UIColor.clear
        v.delegate = self
        return v
    }()
    
    /// 玩法视图
    fileprivate lazy var playTyV: HowToPlayV = {
        let v : HowToPlayV = HowToPlayV.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.8, height: SH * 0.8))
        
        return v
    }()
    
    
    
    /// 设置视图
    fileprivate lazy var setView: SettingV = {
        let d : SettingV = SettingV.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.45, height: SH * 0.45))
        
        return d
    }()
    
    /// 让设置视图消失
    fileprivate lazy var dismissSetV: UIButton = {
        let d : UIButton = UIButton.init(frame: self.bounds)
        d.addTarget(self, action: #selector(dismissSEL), for: .touchUpInside)
        return d
    }()
    
    fileprivate lazy var dismissJoinRoom: UIButton = {
        let d : UIButton = UIButton.init(frame: self.bounds)
        d.addTarget(self, action: #selector(dismissJoinRoomSEL), for: .touchUpInside)
        
        return d
    }()
    
    
    /// 移除设置视图
    func dismissSEL() -> Void {
        self.dismissSetV.removeFromSuperview()
        self.setView.removeFromSuperview()
    }
    
    /// 移除加入房间视图
    func dismissJoinRoomSEL() -> Void {
        self.joinRooV.removeFromSuperview()
        self.dismissJoinRoom.removeFromSuperview()
    }
}

// MARK: - 右上角按钮代理方法
extension PersonMsgView : HoolRightBtnsDelegate {
    func setFunc(sender: UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.currentTitle as Any)
        
        addSubview(dismissSetV)
        
        setView.center = self.center
        addToView(customView: setView)
        setViewISExist.append(setView)
    }
    
    func playTypeFunc(sender: UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.currentTitle as Any)
        
        playTyV.center = self.center
        addToView(customView: playTyV)
        howPlayISExist.append(playTyV)
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
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.currentTitle!)
    }
    
    func wxSharFri(sender: UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.currentTitle!)
    }
}

class CommonLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.textColor = .white
        
        self.font = UIFont(name: "SimHei", size: 9 * screenScale)
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
        return d
    }()
    
    /// 分享
    lazy var shareBtn: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: self.playType.RightX, y: 5, width: self.Width / 4,height: self.Width / 4))
        d.setImage(#imageLiteral(resourceName: "shareNormal"), for: .normal)
        d.setImage(#imageLiteral(resourceName: "shareSelected"), for: .highlighted)
        d.addTarget(self, action: #selector(shareFunction(sender:)), for: .touchUpInside)

        return d
    }()
    
    /// 分数
    lazy var scoreBtn: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: self.shareBtn.RightX, y: 5, width: self.Width / 4, height: self.Width / 4))
        d.setImage(#imageLiteral(resourceName: "scoreNormal"), for: .normal)
        d.setImage(#imageLiteral(resourceName: "scoreSelected"), for: .highlighted)
        d.addTarget(self, action: #selector(scoreFunction(sender:)), for: .touchUpInside)
       
        return d
    }()
    
    /// 设置
    lazy var setBtn: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: self.scoreBtn.RightX, y: 5, width: self.Width / 4, height: self.Width / 4))
        d.setImage(#imageLiteral(resourceName: "setBtnNormal"), for: .normal)
        d.setImage(#imageLiteral(resourceName: "setNormalSelected"), for: .highlighted)
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
        self.delegate?.playTypeFunc(sender: sender)
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



