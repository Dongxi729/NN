//
//  CardsLayout.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/19.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  纸牌布局

import UIKit

//纸牌布局
class CardsLayout : CommonV {
    
    var cardImgs : UIImageView!
    
    /// 传入的纸牌 --- 背面为0
    var cardCards = [1,2,2,12,12]
    
    
    /// 纸牌背景视图
    fileprivate lazy var cardsBgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "cardsBgV")
        return d
    }()
    
    /// 拼接
    ///
    /// - Parameter prefix: 图片前缀
    private func contactName(prefix : String) -> [String] {
        let names = cardCards.map {
            prefix + String($0)
        }
        return names
    }
    
    /// 亮牌
    fileprivate lazy var alertBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.Width * 0.75, y: 2 * screenScale, width: self.Width * 0.25, height: self.Height * 0.5))
        d.layer.borderWidth = 1
        
        d.setImage(#imageLiteral(resourceName: "roomAlert"), for: .normal)
        d.addTarget(self, action: #selector(alertSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    /// 提示
    fileprivate lazy var showCardBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.Width * 0.75, y: self.alertBtn.BottomY, width: self.Width * 0.25, height: self.Height * 0.5))
        d.setImage(#imageLiteral(resourceName: "roomShowCard"), for: .normal)
        d.addTarget(self, action: #selector(showSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    
    ///////交互事件
    /// 提示
    @objc fileprivate func alertSEL(sender : UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
    }
    
    /// 显示
    @objc fileprivate func showSEL(sender : UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
    }
    
    /// 摆放纸牌
    private func addCards(cardsArray : [String]) -> Void {
        var dixName = [Int : String]()
        
        var index : Int = 0
        
        for aaa in cardsArray {
            print(index)
            
            dixName.updateValue(aaa, forKey: index)
            
            cardImgs = UIImageView.init(frame: CGRect.init(x: CGFloat(index) * self.Width * 0.15 , y: 2 * screenScale, width: self.Width * 0.15, height: self.Height - screenScale * 3))
            
            cardImgs.image = UIImage.init(named: dixName[index]!)
            
            index += 1
            addSubview(cardImgs)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cardsBgV)
        addCards(cardsArray: contactName(prefix: "pa"))
        addSubview(alertBtn)
        addSubview(showCardBtn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
