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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(bgV)
        bgV.showGameTypeMark = 1
        
        
        bgV.showprepareBtnMark = false
        
        
        countDown.center = view.center
        
        /// 倒计时
//        countDown.countDown = 60
//        view.addSubview(countDown)
        
        
        view.addSubview(cardV)
    }
    
    fileprivate lazy var cardV: CardsLayout = {
        let d : CardsLayout = CardsLayout.init(frame: CGRect.init(x: 0, y: SH * 0.8, width: SW * 0.5, height: SH * 0.2))
        d.backgroundColor = UIColor.red
        return d
    }()
}
//
class CardsLayout : CommonV {
    
    var cardImgs : UIImageView!
    
    var cardCards = [1,2,2,2,5]
    
    func contactName(prefix : String) -> [String] {
         let names = cardCards.map {
            prefix + String($0)
        }
        return names
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tags : Int = 666
//        for nameStr in 0..<contactName(prefix: "pa").count {
//            cardImgs = UIImageView.init(frame: CGRect.init(x: CGFloat(index) * self.Width * 0.15 + 2 * screenScale + CGFloat(index) * screenScale * 2 , y: 2 * screenScale, width: self.Width * 0.15, height: self.Height - screenScale * 3))
//            cardImgs.backgroundColor = UIColor.randomColor()
//            cardImgs.image = UIImage.init(named: imgName)
//            addSubview(cardImgs)
//        }
        
        var dixName = [Int : String]()

        var index : Int = 0
        for aaa in contactName(prefix: "pa") {
            index += 1
            print(index)
            
            
            dixName.updateValue(aaa, forKey: index)

            
            cardImgs = UIImageView.init(frame: CGRect.init(x: CGFloat(index) * self.Width * 0.15 + 2 * screenScale + CGFloat(index) * screenScale * 2 , y: 2 * screenScale, width: self.Width * 0.15, height: self.Height - screenScale * 3))
            cardImgs.backgroundColor = UIColor.randomColor()
            cardImgs.image = UIImage.init(named: dixName[index]!)
            addSubview(cardImgs)
            
            print(dixName[index] as Any)
        }
        
        print(dixName)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class CommonV: UIView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        let touchPoint: CGPoint? = touch?.location(in: self)
        print("\((touchPoint?.x)! / self.Width)==\((touchPoint?.y)! / self.Height)")
        let stringFloat = Int((touchPoint?.x)!)
        let stringFloat1 = Int((touchPoint?.y)!)
        print("\(stringFloat)\(stringFloat1)")
    }
    
}
