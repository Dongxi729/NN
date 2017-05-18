//
//  GameBgV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/18.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

// MARK: - 游戏背景图片
class GameBgV: UIView {
    
    /// 准备按钮
    fileprivate lazy var prepareBtn: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.42, y: self.Height * 0.55, width: self.Width * 0.15, height: self.Height * 0.15))
        d.image = #imageLiteral(resourceName: "beginBtn")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    

    
    /// 背景按钮
    fileprivate lazy var bgVImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "gamePrepareBgV")
        
        return d
    }()
    
    /// 显示创建按钮标识
    var showprepareBtnMark = false
    
    
    
    
    /// 显示房间人员位置
    fileprivate lazy var P4: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: 0.45 * self.Width, y: 0.13 * self.Height, width: self.Width * 0.18, height: self.Height * 0.15))
        
        return d
    }()
    
    fileprivate lazy var P3: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.06, y: self.Height * 0.35, width: self.Width * 0.18, height: self.Height * 0.15))
        return d
    }()
    
    fileprivate lazy var P2: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.06, y: self.Height * 0.56, width: self.Width * 0.18, height: self.Height * 0.15))
        return d
    }()
    
    fileprivate lazy var P1: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.45, y: self.Height * 0.8, width: self.Width * 0.18, height: self.Height * 0.15))
        
        return d
    }()
    
    fileprivate lazy var P5: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.8, y: self.Height * 0.35, width: self.Width * 0.18, height: self.Height * 0.15))
        return d
    }()
    
    fileprivate lazy var P6: PeronheadInfoV = {
        let d : PeronheadInfoV = PeronheadInfoV.init(frame: CGRect.init(x: self.Width * 0.8, y: self.Height * 0.55, width: self.Width * 0.18, height: self.Height * 0.15))
        return d
    }()
    
    /// 右上角按钮组
    fileprivate lazy var rightV: RightV = {
        let d : RightV = RightV.init(frame: CGRect.init(x: self.Width * 0.9, y: 0, width: self.Width * 0.1, height: self.Height * 0.1))
        d.delegate = self
        return d
    }()
    
    /// 房间号
    fileprivate lazy var roomNoImgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 5, y: 5, width: self.Width * 0.065, height: self.Height * 0.045))
        d.image = #imageLiteral(resourceName: "roomNo")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 当前时间
    fileprivate lazy var currentTime: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0.0665760869565217 * self.Height, width: SW * 0.134, height: SH * 0.05))
        d.textColor = UIColor.white
        d.textAlignment = .center
        d.layer.borderWidth = 1
        d.font = UIFont(name: "SimHei", size: 9 * screenScale)
        return d
    }()
    
    /// 房间号
    fileprivate lazy var rooID: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: self.roomNoImgV.RightX, y: 5, width: self.Width * 0.073, height: self.Height * 0.045))
        d.font = UIFont(name: "SimHei", size: 9 * screenScale)
        
        d.textAlignment = .left
        
        d.textColor = UIColor.colorWithHexString("713600")
        d.text = "1468"
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
    
    /// 局数
     fileprivate lazy var roundsNumLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: self.Height * 0.13, width: self.Width * 0.1, height: self.Height * 0.045))
        d.layer.borderWidth = 1
        d.text = String(15) + "/" + String(20)
        d.textAlignment = .center
        d.adjustsFontSizeToFitWidth = true
        d.font = UIFont(name: "SimHei", size: 9 * screenScale)
        d.textColor = UIColor.white
        return d
    }()
    
    /// 默认0 显示六人牛牛
    /// 1 显示通比牛牛
    var showGameTypeMark : Int = 1
    
    /// 牌子牛牛
    fileprivate lazy var gameType: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0.12 * self.Width, width: self.currentTime.Width, height: self.Height * (0.181159420289855 - 0.13768115942029)))
        d.image = #imageLiteral(resourceName: "liuCow")
        d.layer.borderWidth = 1
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        /// 根据状态显示六人牛牛还是通比牛牛
        if showGameTypeMark == 0 {
            self.gameType.image = #imageLiteral(resourceName: "liuCow")
        } else {
            self.gameType.image = #imageLiteral(resourceName: "commonCow")
        }
        
        if showprepareBtnMark {
            self.prepareBtn.isHidden = false
        } else {
            self.prepareBtn.isHidden = true
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgVImg)
        addSubview(prepareBtn)
        
        addSubview(roomNoImgV)
        
   
        
        P4.showCompleteMark = true
        P3.showPrepareMark = true
        
        
        addSubview(gameType)
        
        addSubview(rooID)
        
        addSubview(roundsNumLabel)
        
        DispatchQueue.main.async {
            self.addSubview(self.currentTime)
            self.refreshTime()
        }
        
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
    
    /// 利用屏幕刷新率才刷新时间
    // 创建表盘
    // 添加一个定时器
    
    private func refreshTime() -> Void {
        let displayLink = CADisplayLink.init(target: self, selector: #selector(updateTime))
        
        displayLink.add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)
    }
    
    
    /// 时间刷新常量
    var hours: CGFloat = 0.0
    var min: CGFloat = 0.0
    var sec: CGFloat = 0.0
}

// MARK: - 刷新时间
extension GameBgV {
    // MARK: - 每一秒调用60次
    func updateTime()  {
        
        // 获取当前的日期
        let calendar = Calendar.current
        // 获取日历中的组件:秒,分,时,天
        // NSCalendarUnit:获取哪个时间
        let cmp: DateComponents? = calendar.dateComponents([.second, .minute, .hour, .nanosecond], from: Date())
        // 小时
        hours = CGFloat((cmp?.hour)!)
        self.currentTime.text = String(format: "%02.0lf:%02.0lf", hours, min)
        // 分钟
        min = CGFloat((cmp?.minute)!)
    }
    
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
