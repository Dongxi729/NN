//
//  GamingVC.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/11.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  游戏界面

import UIKit

// MARK: - 游戏控制器
class GamingVC: UIViewController {
    
    fileprivate lazy var addChartBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(addChartV), for: .touchUpInside)
        return d
    }()
    
    /// 左上角信息视图
    lazy var leftInfoV: GameLeftCornerMsg = {
        let d : GameLeftCornerMsg = GameLeftCornerMsg.init(frame: CGRect.init(x: 0, y: 0, width: SW / 7, height: SH * 0.3))
        
        return d
    }()
    
    @objc fileprivate func addChartV() -> Void {
        let f : ChatV = ChatV.init(frame: CGRect.init(x: 100, y: SH * 0.2, width: SW * 0.5, height: SH * 0.8))
        f.backgroundColor = UIColor.gray
        f.center = view.center
        
        view.addSubview(f)
    }
    
    lazy var bgV: GameBgV = {
        let d : GameBgV = GameBgV.init(frame: self.view.bounds)
        return d
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(bgV)
    }
}

// MARK: - 游戏背景图片
class GameBgV: UIView {
    
    /// 准备按钮
    lazy var prepareBtn: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.42, y: self.Height * 0.55, width: self.Width * 0.15, height: self.Height * 0.15))
        d.image = #imageLiteral(resourceName: "beginBtn")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 背景按钮
    lazy var bgVImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "gamePrepareBgV")
        
        return d
    }()
    
    ///
    lazy var P4: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: 0.45 * self.Width, y: 0.13 * self.Height, width: self.Width * 0.18, height: self.Height * 0.15))
        return d
    }()
    
    lazy var P3: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.06, y: self.Height * 0.35, width: self.Width * 0.18, height: self.Height * 0.15))
        return d
    }()
    
    lazy var P2: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.06, y: self.Height * 0.56, width: self.Width * 0.18, height: self.Height * 0.15))
        return d
    }()
    
    lazy var P1: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.45, y: self.Height * 0.8, width: self.Width * 0.18, height: self.Height * 0.15))
        
        return d
    }()
    
    lazy var P5: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.8, y: self.Height * 0.35, width: self.Width * 0.18, height: self.Height * 0.15))
        return d
    }()
    
    lazy var P6: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.8, y: self.Height * 0.55, width: self.Width * 0.18, height: self.Height * 0.15))
        return d
    }()
    
    /// 右上角按钮组
    lazy var rightV: RightV = {
        let d : RightV = RightV.init(frame: CGRect.init(x: self.Width * 0.9, y: 0, width: self.Width * 0.1, height: self.Height * 0.1))
        d.delegate = self
        return d
    }()
    
    
    
    /// 右下角视图
    fileprivate lazy var rightDownV: RightDownV = {
        let d : RightDownV = RightDownV.init(frame: CGRect.init(x: self.Width * 0.87, y: self.Height * 0.788, width: self.Width - self.Width * 0.87, height: self.Height - self.Height * 0.794))
        d.layer.borderWidth = 2
        d.layer.borderColor = UIColor.red.cgColor
        d.delegate = self
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgVImg)
        addSubview(prepareBtn)
        
        /// 添加玩家位置
        addSubview(P4)
        addSubview(P3)
        addSubview(P2)
        addSubview(P1)
        addSubview(P5)
        addSubview(P6)
        
        /// 右上角按钮
        addSubview(rightV)
        
        addSubview(rightDownV)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        let touchPoint: CGPoint? = touch?.location(in: self)
        print("\((touchPoint?.x)! / self.Width)==\((touchPoint?.y)! / self.Height)")
        let stringFloat = Int((touchPoint?.x)!)
        let stringFloat1 = Int((touchPoint?.y)!)
        print("\(stringFloat)\(stringFloat1)")
    }
    
    lazy var oBgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: self.Width * 0.2, height: self.Width * 0.2))
        d.image = #imageLiteral(resourceName: "pushToSend")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
}


// MARK: - 右上角事件
extension GameBgV : RightVDelegate {
    func righExitSEL(sender: UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.frame)
    }
    
    func rightSetSEL(sender: UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.frame)
    }
}

// MARK: - 左上角事件
extension GameBgV : RightDownVDelegate {
    
    func msgSEL(sender: UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",sender.frame)
    }
    
    func voiceSEL(gesture: UILongPressGestureRecognizer) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        if gesture.state == .began {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n","长按事件")
            AvdioTool.shared.creatSession()
            AvdioTool.shared.startRecord()
            
            oBgV.center = self.center
            ///  创建录音视图
            addSubview(oBgV)
        } else {
            
            AvdioTool.shared.stopRecord()
            
            AvdioTool.shared.convertWavToAmr()
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n","结束")
            /// 移除录音视图
        }
        
        if gesture.state.rawValue == 3 {
            oBgV.removeFromSuperview()
        }
        
    }
}



// MARK: - 右上角视图绘制
/// 右上角按钮代理方法
protocol RightVDelegate {
    /// 设置
    func rightSetSEL(sender : UIButton)
    
    /// 退出
    func righExitSEL(sender : UIButton)
}

/// 右上角视图
class RightV: UIView {
    
    var delegate : RightVDelegate?
    
    fileprivate lazy var setBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: self.Width * 0.5, height: self.Height))
        d.addTarget(self, action: #selector(rightSetSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    fileprivate lazy var exitBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.Width * 0.5, y: 0, width: self.Width * 0.5, height: self.Height))
        d.addTarget(self, action: #selector(rightExitSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    @objc fileprivate func rightExitSEL(sender : UIButton) {
        self.delegate?.righExitSEL(sender: sender)
    }
    
    @objc fileprivate func rightSetSEL(sender : UIButton) {
        self.delegate?.rightSetSEL(sender: sender)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(setBtn)
        addSubview(exitBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/// 个人信息
class PeronheadInfoV: UIView {
    
    /// 名字
    lazy var nameLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: self.Width * 0.5, y: 2 * screenScale, width: self.Width * 0.5, height: self.Height * 0.4))
        d.text = "AJJJJ"
        d.textAlignment = .center
        d.font = UIFont(name: "SimHei", size: 8 * screenScale)
        d.textColor = UIColor.white

        return d
    }()
    
    /// coinsLabel
    lazy var coinsLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: self.Width * 0.5, y: self.nameLabel.BottomY + 2 * screenScale, width: self.Width * 0.5, height: self.Height * 0.4))
        d.text = "2000"
        d.textAlignment = .center
        d.font = UIFont(name: "SimHei", size: 8 * screenScale)
        d.textColor = UIColor.white
        return d
    }()
    
    
    /// 头像
    lazy var headImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 3 * screenScale, y: 1 * screenScale, width: self.Width * 0.43, height: self.Width * 0.42))
        d.backgroundColor = UIColor.gray
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 整体背景
    lazy var hhhh: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "headInfoBgV")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headImg)
        addSubview(hhhh)
        addSubview(nameLabel)
        addSubview(coinsLabel)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - 右下角事件
protocol RightDownVDelegate {
    /// 声音
    func voiceSEL(gesture : UILongPressGestureRecognizer)
    
    /// 信息
    func msgSEL(sender : UIButton)
}

/// 右下角视图
class RightDownV: UIView {
    /// 长按录音
    lazy var lpButton: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.Width * 0.5, y: 0, width: self.Width * 0.5, height: self.Height * 0.5))
        //
        let longTap = UILongPressGestureRecognizer.init(target: self, action: #selector(longSEL(gesture:)))
        
        d.addGestureRecognizer(longTap)
        
        //        d.addTarget(self, action: #selector(voiceControl(sender:)), for: .touchUpInside)
        d.backgroundColor = UIColor.gray
        return d
    }()

    
    @objc fileprivate func longSEL(gesture : UILongPressGestureRecognizer) -> Void {
        
        self.delegate?.voiceSEL(gesture: gesture)
        
        
    }
    
    /// 消息按钮
    fileprivate lazy var msgBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: self.Height * 0.5, width: self.Width , height: self.Height * 0.5))
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(sendMsg(sender:)), for: .touchUpInside)
        
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(lpButton)
        addSubview(msgBtn)
    }
    
    var delegate : RightDownVDelegate?
    
    
    /// 消息事件
    @objc fileprivate func sendMsg(sender : UIButton) {
        self.delegate?.msgSEL(sender: sender)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
