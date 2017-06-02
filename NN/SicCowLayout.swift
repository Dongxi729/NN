//
//  SicCowLayout.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/17.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  六人牛牛布局

import UIKit


protocol SicCowLayoutDelegate {
    func creatRoomEvent(sender : UIButton)
}

// MARK:- 六人牛牛的布局
class SicCowLayout: UIView {
    
    var delegate : SicCowLayoutDelegate?
    
    /// 圆环按钮
    fileprivate var circleBtn : UIButton!
    
    /// 打钩按钮
    fileprivate var correctBtn : UIButton!
    
    /// 计算按钮
    fileprivate var payBtn : UIButton!
    
    /// 玩法选项按钮
    fileprivate var playTypeBtn : UIButton!
    
    
    /// 创建按钮
    fileprivate lazy var createBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.Width * 0.126, y: self.Height * 0.82, width: self.Width * 0.35, height: self.Height * 0.13))
        
        
        d.addTarget(self, action: #selector(creatRoomSEL(sender:)), for: .touchUpInside)
        return d
    }()
    

    
    /// 六人牛牛右边背景
    fileprivate lazy var bgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "sixCowBgv")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 圆环显示
    lazy var cirOne: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.28, y: 4.5 * screenScale, width: commonMargin * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "circleChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    lazy var cirTwo: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.513, y: 4.5 * screenScale, width: commonMargin * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "circleChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    lazy var cirThree: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.748, y: 4.5 * screenScale, width: commonMargin * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "circleChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 玩法人数打钩图片
    lazy var correctImgOne: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.24, y: self.Height * 0.17, width: 25 * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "correctChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    lazy var correctImgTwo: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.54, y: self.Height * 0.17, width: 25 * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "correctChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 结算方式打钩图片
    lazy var payImgOne: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.24, y: self.Height * 0.3, width: 25 * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "correctChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    lazy var payImgTwo: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.58, y: self.Height * 0.3, width: 25 * screenScale, height: commonMargin * screenScale))
        d.image = #imageLiteral(resourceName: "correctChoose")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    
    /// 玩法选项
    lazy var playTypeImgOne: UIImageView = {
        let f : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.24, y: self.Height * 0.43, width: 25 * screenScale, height: commonMargin * screenScale))
        f.image = #imageLiteral(resourceName: "correctChoose")
        f.contentMode = UIViewContentMode.scaleAspectFit
        return f
    }()
    
    lazy var playTypeImgTwo: UIImageView = {
        let f : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.58, y: self.Height * 0.43, width: 25 * screenScale, height: commonMargin * screenScale))
        f.image = #imageLiteral(resourceName: "correctChoose")
        f.contentMode = UIViewContentMode.scaleAspectFit
        return f
    }()
    
    lazy var playTypeImgThree: UIImageView = {
        let f : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.24, y: self.Height * 0.55, width: 25 * screenScale, height: commonMargin * screenScale))
        f.image = #imageLiteral(resourceName: "correctChoose")
        f.contentMode = UIViewContentMode.scaleAspectFit
        return f
    }()
    
    lazy var playTypeImgFour: UIImageView = {
        let f : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.58, y: self.Height * 0.55, width: 25 * screenScale, height: commonMargin * screenScale))
        f.image = #imageLiteral(resourceName: "correctChoose")
        f.contentMode = UIViewContentMode.scaleAspectFit
        return f
    }()

    
    /// 玩法选项
    /// 1 - 抢庄模式
    /// 2 - 轮流坐庄
    /// 3 - 房主坐庄
    /// 4 - 谁大谁坐庄
    var playTypeIndex : Int = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgV)
        
        /// 局数选择
        roundsChoose()
        
        /// 玩法人数
        playersSet()
        
        /// 结算方式
        payTypeSet()
        
        /// 玩法选项
        playType()
        
        addSubview(createBtn)
    }
    
    /// 玩法选项
    private func playType() -> Void {
        let tag : Int = 400
        
        /// 位置标识
        var posIndex : CGFloat = 0.28
        var YIndex : CGFloat = 0.5
        
        
        for index in 1..<5 {
            
            if index == 1 || index == 3 {
                posIndex = 0.28
            }
            
            if index == 2 || index == 4 {
                posIndex = 0.62
            }
            
            if index == 1 || index == 2 {
                YIndex = 0.43
            }
            
            if index == 3 || index == 4 {
                YIndex = 0.55
            }
            
            
            playTypeBtn = UIButton.init(frame: CGRect.init(x: self.Width * posIndex, y: self.Height * YIndex, width: 40 * screenScale, height: commonMargin * screenScale))
            playTypeBtn.tag = index + tag
            playTypeBtn.addTarget(self, action: #selector(playTypeSEL(sender:)), for: .touchUpInside)
            addSubview(playTypeBtn)
        }
        
        addSubview(playTypeImgOne)
        addSubview(playTypeImgTwo)
        addSubview(playTypeImgThree)
        addSubview(playTypeImgFour)
        
        /// 控制图片显示隐藏
        playTypeImgOne.isHidden = false
        playTypeImgTwo.isHidden = true
        playTypeImgThree.isHidden = true
        playTypeImgFour.isHidden = true
    }
    
    
    /// 玩法选项
    @objc fileprivate func playTypeSEL(sender :UIButton) {
        print(sender.tag)
        
        switch sender.tag {
            /// 抢庄
        case 401:
            playTypeImgOne.isHidden = false
            playTypeImgTwo.isHidden = true
            playTypeImgThree.isHidden = true
            playTypeImgFour.isHidden = true
            
            self.playTypeIndex = 1
            
            break
            /// 轮流
        case 402:
            playTypeImgOne.isHidden = true
            playTypeImgTwo.isHidden = false
            playTypeImgThree.isHidden = true
            playTypeImgFour.isHidden = true
            
            self.playTypeIndex = 2
            break
            /// 房主做东
        case 403:
            playTypeImgOne.isHidden = true
            playTypeImgTwo.isHidden = true
            playTypeImgThree.isHidden = false
            playTypeImgFour.isHidden = true
            
            self.playTypeIndex = 3
            break
            /// 谁大谁作者
        case 404:
            playTypeImgOne.isHidden = true
            playTypeImgTwo.isHidden = true
            playTypeImgThree.isHidden = true
            playTypeImgFour.isHidden = false
            
            self.playTypeIndex = 4
            break
        default:
            break
        }
    
    }
    
    /// 计算
    private func payTypeSet() -> Void {
        
        let tag : Int = 300
        
        var posIndex : CGFloat = 0.28
        
        for index in 1..<3 {
            
            if index == 1 {
                posIndex = 0.28
            } else {
                posIndex = 0.62
            }
            
            payBtn = UIButton.init(frame: CGRect.init(x: self.Width * posIndex, y: self.Height * 0.3, width: 40 * screenScale, height: commonMargin * screenScale))
            payBtn.tag = index + tag
            payBtn.addTarget(self, action: #selector(payTypeSEL(sender:)), for: .touchUpInside)
            
            addSubview(payBtn)
        }
        
        addSubview(payImgOne)
        addSubview(payImgTwo)
        
        /// 设置图片显示样式
        payImgOne.isHidden = false
        payImgTwo.isHidden = true
    }
   
    /// 结算方式
    @objc fileprivate func payTypeSEL(sender : UIButton) -> Void {
        print(sender.tag)
        
        switch sender.tag {
            /// 房主结算
        case 301:
            payImgOne.isHidden = false
            payImgTwo.isHidden = true
            self.py = 1
            break
            /// 房费平摊
        case 302:
            payImgOne.isHidden = true
            payImgTwo.isHidden = false
            self.py = 2
            break
            
        default:
            break
        }
    }
    
    /// 玩法人数
    private func playersSet() -> Void {
        let tag : Int = 200
        
        for index in 1..<3 {
            correctBtn = UIButton.init(frame: CGRect.init(x: self.Width * 0.28 * CGFloat(index), y: self.Height * 0.17, width: 25 * screenScale, height: commonMargin * screenScale))
            correctBtn.tag = index + tag
            correctBtn.addTarget(self, action: #selector(correctChangeImgSEL(sender:)), for: .touchUpInside)
            
            addSubview(correctBtn)
        }
        
        addSubview(correctImgOne)
        addSubview(correctImgTwo)
        
        /// 设置打钩显示隐藏
        correctImgOne.isHidden = false
        correctImgTwo.isHidden = true
    
    }
    
    /// 局数选择
    private func roundsChoose() -> Void {
        
        let tag :Int = 100
        
        /// 局数选择
        for index in 1..<4 {
            circleBtn = UIButton.init(frame: CGRect.init(x: self.Width * 0.25 * CGFloat(index), y: 5 * screenScale, width: 25 * screenScale, height: 10 * screenScale))
            
            circleBtn.tag = tag + index
            circleBtn.addTarget(self, action: #selector(btttn(sender:)), for: .touchUpInside)
            addSubview(circleBtn)
        }
        
        addSubview(cirOne)
        addSubview(cirTwo)
        addSubview(cirThree)
        
        /// 设置默认隐藏2、3
        cirOne.isHidden = false
        cirTwo.isHidden = true
        cirThree.isHidden = true
    
    
    }
    
    /// 人数玩法切换图片
    func correctChangeImgSEL(sender : UIButton) -> Void {
        print(sender.tag)
        switch sender.tag {
            /// 2~3人
        case 201:
            correctImgOne.isHidden = false
            correctImgTwo.isHidden = true
            self.players = 3
            break
            
            /// 4~6人
        case 202:
            correctImgOne.isHidden = true
            correctImgTwo.isHidden = false
            self.players = 6
            break
        default:
            break
        }
    
    }
    
    /// 局数选择事件
    @objc fileprivate func btttn(sender : UIButton) -> Void {
        print(sender.tag)
        
        switch sender.tag {
            /// 10局
        case 101:
            cirOne.isHidden = false
            cirTwo.isHidden = true
            cirThree.isHidden = true
            self.rounds = 10
            break
            /// 20局
        case 102:
            cirOne.isHidden = true
            cirTwo.isHidden = false
            cirThree.isHidden = true
            self.rounds = 20
            break
            /// 30局
        case 103:
            cirOne.isHidden = true
            cirTwo.isHidden = true
            cirThree.isHidden = false
            self.rounds = 30
            break
        default:
            break
        }
    }

    /// 玩法人数
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 局数 默认是10局数
    var rounds : Int = 10
    
    /// 人数 默认3人
    var players : Int = 3
    
    /// 付费类型
    /// 6为
    var py : Int = 1
    
    fileprivate lazy var s: ScoreV = {
        let d : ScoreV = ScoreV.init(frame: CGRect.init(x: self.Width * 0.5, y: 0.7 * self.Height, width: 12 * screenScale, height: commonMargin * screenScale))
        return d
    }()
    
    /// 结算砖石
    @objc fileprivate func creatRoomSEL(sender : UIButton) -> Void {
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",self.rounds)
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",self.players)
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",self.py)
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",self.playTypeIndex)
        
        print(setpayfun(_ii: self.rounds, _rn: self.players, _py: self.py))
        addSubview(scoreImg)
        self.scoreImg.text = String(setpayfun(_ii: self.rounds, _rn: self.players, _py: self.py))
        
        
        
        
        reportCreateRoomTypeWith(roomType: self.playTypeIndex, rounds: self.rounds, players: self.players, payType: self.py)
        
        /// 本地模拟房间
//        reportCreateRoomType()
        
//        let roomType = "<M><ty gt=\"\(CreateRoomModel.shared.roomType)\" ii=\"\(CreateRoomModel.shared.rounds)\" rn=\"\(CreateRoomModel.shared.players)\" py=\"\(CreateRoomModel.shared.payType)\"/></M>"
        
//        六人牛牛
//        <M><ty gt = "游戏类型" ii ="局数" rn="人数" py="付费方式" /> </M>
//        <M><ty gt = "1" ii ="30" rn="6" py="2" /> </M>
        
        

    }
    
    /// 分数
    fileprivate lazy var scoreImg: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: self.Width * 0.5, y: 0.7 * self.Height, width: 12 * screenScale, height: commonMargin * screenScale))
        d.font = UIFont(name: "SimHei", size: 9 * screenScale)
        d.font = UIFont.boldSystemFont(ofSize: 9 * screenScale)
//        d.backgroundColor = UIColor.red
        d.textColor = UIColor.red
        return d
    }()
}


/// 结算砖石
///
/// - Parameters:
///   - _ii: <#_ii description#>
///   - _rn: 人数
///   - _py: 付费方式
func setpayfun(_ii:Int,_rn:Int,_py:Int) -> Int {
    
    if (_py == 1) {
        //房主付费
        switch _ii {
        case 10:
            //10 局
            if(_rn == 3) {
                //人数  2-3个人
                return 25
            } else if(_rn == 6) {
                //人数  4-6个人
                return 35
            }
            break
        case 20:
            //20 局
            if(_rn == 3) {
                //人数  2-3个人
                return 45
            } else if(_rn == 6) {
                //人数  4-6个人
                return 60
            }
            break
        case 30:
            //30 局
            if(_rn == 3)
            {
                //人数  2-3个人
                return 65
            }
            else if(_rn == 6)
            {
                //人数  4-6个人
                return 80
            }
            break
        default:
            break
        }
    } else if(_py == 2) {
        //平摊付费
        switch _ii {
        case 10:
            //10 局
            return 8
            
        case 20:
            //20 局
            return 15
            
        case 30:
            //30 局
            return  25
            
        default:
            break
        }
    }
    return  -1
}
