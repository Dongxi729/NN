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
    lazy var alertBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.Width * 0.75, y: 2 * screenScale, width: self.Width * 0.25, height: self.Height * 0.5))
        d.setImage(#imageLiteral(resourceName: "roomAlert"), for: .normal)
        d.addTarget(self, action: #selector(alertSEL), for: .touchUpInside)
        return d
    }()
    
    /// 提示
    lazy var showCardBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.Width * 0.75, y: self.alertBtn.BottomY, width: self.Width * 0.25, height: self.Height * 0.5))
        d.setImage(#imageLiteral(resourceName: "roomShowCard"), for: .normal)
        d.addTarget(self, action: #selector(showSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        /// 根据游戏状态隐藏提示、亮牌按钮
        addSubview(alertBtn)
        addSubview(showCardBtn)
        
        
        
    }
    
    ///////交互事件
    /// 提示
    @objc fileprivate func alertSEL() {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        
        /// 亮牌
        showCardsFunc()
    }
    
    /// 显示
    @objc fileprivate func showSEL(sender : UIButton) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        /// 提示
        //        将结尾的两张牌反过来
    }
    
    /// 摆放纸牌
    
    /// [3: "pb3", 2: "pbJ", 4: "pc3", 0: "pb4", 1: "pa7"]
    func addCards(cardsArray : [String]) -> Void {
        
        var index : Int = 0
        
        for value in cardsArray {
            
            cardImgs = UIImageView.init(frame: CGRect.init(x: CGFloat(index) * self.Width * 0.15 , y: 2 * screenScale, width: self.Width * 0.15, height: self.Height - screenScale * 3))
            
            cardImgs.image = UIImage.init(named: value)
            
            index += 1
            addSubview(cardImgs)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isUserInteractionEnabled = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
