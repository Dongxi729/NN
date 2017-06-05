//
//  MarkChoose.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/22.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  非庄家分数选择

import UIKit

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
        
        self.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
