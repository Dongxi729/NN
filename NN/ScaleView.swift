//
//  ScaleView.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/2.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  发牌效果

import UIKit

class ScaleView: UIViewController {
    
    let scaleRate : CGFloat = 1.5
    
    let cards : [Int] = [1,2,3,4,5]
    
    
    var timer : Timer?
    
    var counter : CGFloat = 0
    
    var ountTingArray : Int = 1
    
    /// 当前的牌
    var labelTitle = UILabel()
    
    /// 别人的牌
    var otherCards = UILabel()

    lazy var card1: UIView = {
        let d : UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        d.backgroundColor = UIColor.randomColor()
        return d
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        timer = Timer.init(timeInterval: 0.2, target: self, selector: #selector(addCard), userInfo: nil, repeats: true)
        
        timer?.fire()
        RunLoop.main.add(timer!, forMode: RunLoopMode.commonModes)
        
        card1.center = self.view.center
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",self.counter)
    }
    
    
    
    func addCard() -> Void {
        self.counter += 0.5
        
        ountTingArray += 1
        
        if counter == 3 {
            timer?.invalidate()
            return
        }

        /// 当前的牌
        self.labelTitle = UILabel(frame: CGRect(x: 70 * ountTingArray, y: 200, width: 30, height: Int(30.0)))
        
        self.labelTitle.backgroundColor = UIColor.randomColor()
        
        spring(addToV: self.labelTitle, tovalue: CGPoint.init(x: 70 * CGFloat(ountTingArray), y: UIScreen.main.bounds.height * 0.75))
        
        self.view.addSubview(self.labelTitle)
        
        /// 别人的牌
        self.otherCards = UILabel(frame: CGRect(x: Int(UIScreen.main.bounds.width * 0.125 * CGFloat(ountTingArray)), y: 100, width: 30, height: Int(60.0)))

        self.otherCards.backgroundColor = UIColor.randomColor()
        
        spring(addToV: self.otherCards, tovalue: CGPoint.init(x: 35 * CGFloat(ountTingArray), y: UIScreen.main.bounds.height * 0.5))
        
        self.view.addSubview(self.otherCards)
    }
}
