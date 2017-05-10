//
//  DeskCards.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/3.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  桌面座位

import UIKit

let SW = UIScreen.main.bounds.width
let SH = UIScreen.main.bounds.height

class DeskCards: UIViewController {

    var p1 : PlayerView = PlayerView()
    var p2 : PlayerView = PlayerView()
    var p3 : PlayerView = PlayerView()
    var p4 : PlayerView = PlayerView()
    var p5 : PlayerView = PlayerView()
    var p6 : PlayerView = PlayerView()
    
    
    var userPoints : [CGRect] = []
    
    /// 用户
    var players : PlayerView = PlayerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        let backGround = UIView.init(frame: view.bounds)
        backGround.backgroundColor = UIColor.gray
        let ovalView = OvalView.init(frame: CGRect.init(x: 25, y: 25, width: UIScreen.main.bounds.width - 25, height: UIScreen.main.bounds.height - 25))
        
        backGround.addSubview(ovalView)
        
        let imgView = UIImageView.init(image: UIImage.init(named: "sss"))
        
        imgView.frame = ovalView.bounds
        ovalView.addSubview(imgView)
        
        view.addSubview(backGround)
        
        /// 添加座位视图
        addCards(users: 1)
    }
}

extension DeskCards {
    /// 传入玩家数量摆放指定玩家位置坐标
    ///
    /// - Parameter users: 玩家数量
    fileprivate func addCards(users : Int) -> Void {

        let point1 = CGRect.init(x: SW * 0.08, y: SH * 0.8, width: 60, height: 60)
        
        let point2 = CGRect.init(x: SW * 0.12, y: SH * 0.45, width: 60, height: 60)
        
        let point3 = CGRect.init(x: SW * 0.3, y: SH * 0.25, width: 60, height: 60)
        
        let point4 = CGRect.init(x: SW * 0.5, y: SH * 0.2, width: 60, height: 60)
        
        let point5 = CGRect.init(x: SW * 0.7, y: SH * 0.25, width: 60, height: 60)
        
        let point6 = CGRect.init(x: SW * 0.85, y: SH * 0.45, width: 60, height: 60)
        
        userPoints.append(point1)
        userPoints.append(point2)
        userPoints.append(point3)
        userPoints.append(point4)
        userPoints.append(point5)
        userPoints.append(point6)
        
        for _userP in 0..<users {

            print("\((#file as NSString).lastPathComponent):(\(#line))\n",userPoints[_userP])
            
            players = PlayerView.init(frame: userPoints[_userP])
            view.addSubview(players)
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isExist.count > 0  {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n")
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",view.subviews.last as Any)
            
            
            
            //购物断网刷新
            if NSStringFromClass((view.subviews.last?.classForCoder)!).contains("PlayerInfoV") {
                print("\((#file as NSString).lastPathComponent):(\(#line))\n","白喊")
                
                view.subviews.last?.removeFromSuperview()
            }
        }
    }
}

/// 作为共同的背景视图
class PlayerView: UIView {

    /// 个人信息视图
    var presentInfoView = PlayerInfoV()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.randomColor()
        
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(addInfoV))
        
        self.addGestureRecognizer(gesture)
    }
 
    
    func addInfoV() -> Void {
        /// 弹出个人信息视图
        presentInfoView = PlayerInfoV.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        
        presentInfoView.center = (UIApplication.shared.keyWindow?.rootViewController?.view.center)!
        
        addToRootView(presentInfoView)
        
        /// 改变全局数组的值
        isExist.append(presentInfoView)
        
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",isExist)
        
        if isExist.count > 1 {
            return
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


/// 玩家信息视图
class PlayerInfoV: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class OvalView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutOvalMask()
    }
    
    private func layoutOvalMask() {
        let mask = self.shapeMaskLayer()
        let bounds = self.bounds
        if mask.frame != bounds {
            mask.frame = bounds
            mask.path = CGPath(ellipseIn: bounds, transform: nil)
        }
    }
    
    private func shapeMaskLayer() -> CAShapeLayer {
        if let layer = self.layer.mask as? CAShapeLayer {
            return layer
        }
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.black.cgColor
        self.layer.mask = layer
        return layer
    }

}
