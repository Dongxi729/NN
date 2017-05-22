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
    
    //////////// 抢庄
    fileprivate lazy var robV: RobRoomOwner = {
        let d : RobRoomOwner = RobRoomOwner.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.3, height: SH * 0.1))
        
        return d
    }()
    
    fileprivate lazy var getCoins: MarkChoose = {
        let d : MarkChoose = MarkChoose.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.3, height: SH * 0.1))
        
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
        
        /// 抢庄
        robV.center = view.center
        //        view.addSubview(robV)
        
        view.addSubview(getCoins)
        
        /// 倒计时
        //        countDown.countDown = 60
        //        view.addSubview(countDown)
        
//        RoomModel.shared.scoreCount = "222"
//        
//        let d : ScoreV = ScoreV.init(frame: CGRect.init(x: 0, y: 0, width: SW / 4, height: SH * 0.2))
//        d.abc(abc: RoomModel.shared.scoreCount, scoreType: 2)
//        view.addSubview(d)
//        print(d)
        
    }
}



class ScoreV: UIView {
    
    //    var score : String = RoomModel.shared.scoreCount
    
    var imgs : UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func abc(abc : String,scoreType : Int) -> Void {
        var index = 0

        if scoreType == 1 {
            for scoreImgName in inPlusScore(xxx: abc) {
                imgs = UIImageView.init(frame: CGRect.init(x: CGFloat(index) * self.Width / CGFloat(inPlusScore(xxx: abc).count), y: 0, width: self.Width / CGFloat(inPlusScore(xxx: abc).count), height: self.Height))
                imgs.image = UIImage.init(named: scoreImgName)
                
                index += 1
                imgs.contentMode = UIViewContentMode.scaleAspectFit
                
                addSubview(imgs)
            }
        }
        
        if scoreType == 2 {
            for scoreImgName in inMinusScore(xxx: abc) {
                imgs = UIImageView.init(frame: CGRect.init(x: CGFloat(index) * self.Width / CGFloat(inMinusScore(xxx: abc).count), y: 0, width: self.Width / CGFloat(inMinusScore(xxx: abc).count), height: self.Height))
                imgs.image = UIImage.init(named: scoreImgName)
                
                index += 1
                imgs.contentMode = UIViewContentMode.scaleAspectFit
                
                addSubview(imgs)
            }
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}



/// 分数
class MarkChoose: UIView {
    
    /// 分数
    var coinsImg : CommonBtn!
    
    var coinsImgName : [Int : UIImage] = [0 : #imageLiteral(resourceName: "room_aff5"),
                                          1 : #imageLiteral(resourceName: "room_aff10"),
                                          2 : #imageLiteral(resourceName: "room_aff15"),
                                          3 : #imageLiteral(resourceName: "room_aff20"),
                                          4 : #imageLiteral(resourceName: "room_aff25")]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        showCoinImg()
    }
    
    private func showCoinImg() {
        
        for (index,imgName) in coinsImgName {
            coinsImg = CommonBtn.init(frame: CGRect.init(x: self.Width / 5 * CGFloat(index), y: 0, width: self.Width / 5, height: self.Height))
            coinsImg.setImage(imgName, for: .normal)
            
            coinsImg.tag = index + 800
            coinsImg.addTarget(self, action: #selector(coinsSEL(sender:)), for: .touchUpInside)
            addSubview(coinsImg)
        }
    }
    
    @objc fileprivate func coinsSEL(sender : UIButton) {
        print(sender.tag)
        switch sender.tag {
        case 800:

            antiOwnerCoins(coins: 5)
            break
        case 801:
            antiOwnerCoins(coins: 10)
            break
        case 802:
            antiOwnerCoins(coins: 15)
            break
        case 803:
            antiOwnerCoins(coins: 20)
            break
        case 804:
            antiOwnerCoins(coins: 25)
            break
        default:
            break
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

/// 抢装
class RobRoomOwner: UIView {
    
    /// 抢装
    lazy var robBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: self.Width * 0.4, height: self.Height))
        d.setImage(#imageLiteral(resourceName: "roomRob"), for: .normal)
        d.addTarget(self, action: #selector(robSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    ///
    lazy var notRobV: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.robBtn.RightX + self.Width * 0.2, y: 0, width: self.Width * 0.4, height: self.Height))
        d.setImage(#imageLiteral(resourceName: "roomNotRob"), for: .normal)
        d.addTarget(self, action: #selector(notRobSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    /// events事件
    /// 抢庄事件
    @objc fileprivate func robSEL(sender : UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
    }
    
    @objc fileprivate func notRobSEL(sender : UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
    }
    
    
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
