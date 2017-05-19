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
    
    /// 背景视图
    fileprivate lazy var bgV: GameBgV = {
        let d : GameBgV = GameBgV.init(frame: self.view.bounds)
        return d
    }()
    
    
    /// 倒数计时视图
    fileprivate lazy var countDown: ClockCountDown = {
        let d : ClockCountDown = ClockCountDown.init(frame: CGRect.init(x: 0, y: 0, width: SW * (0.531702891640041 - 0.46875), height: SW * (0.531702891640041 - 0.46875)))
        
        return d
    }()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    ////////////
    fileprivate lazy var robV: RobRoomOwner = {
        let d : RobRoomOwner = RobRoomOwner.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.3, height: SH * 0.1))

        return d
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        
        RoomModel.shared.currentPersonInRoom = 4
        view.addSubview(bgV)
        bgV.showGameTypeMark = 3
        
        bgV.isGaming = false
        bgV.showprepareBtnMark = false
        
        
        countDown.center = view.center
        
        robV.center = view.center
        view.addSubview(robV)
        
        /// 倒计时
//        countDown.countDown = 60
//        view.addSubview(countDown)
        
        
    }
}


/// 抢装
class RobRoomOwner: UIView {
    
    /// 抢装
    lazy var robBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: self.Width * 0.4, height: self.Height))
        d.setImage(#imageLiteral(resourceName: "roomRob"), for: .normal)
        return d
    }()
    
    lazy var notRobV: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.robBtn.RightX + self.Width * 0.2, y: 0, width: self.Width * 0.4, height: self.Height))
        d.setImage(#imageLiteral(resourceName: "roomNotRob"), for: .normal)
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderWidth = 1
        
        addSubview(robBtn)
        addSubview(notRobV)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if RoomModel.shared.isGameBegin {
            robBtn.isHidden = true
            notRobV.isHidden = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
