//
//  SingleSCoreV.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/7.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  用户成绩信息视图

import UIKit


class SingleSCoreV: UIView {
    
    var scoreVImg : ScorePersonInfoV!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    /// 显示用户视图的个数
    func showImgs(countInt : Int) -> Void {
        
        var index : Int = 6
        
        var width = self.Width / CGFloat(index)
        
        if countInt <= 3 {
            index = 5
            width = self.Width / CGFloat(index)
        }
        
        
        var valueIndex = 0
        /// 遍历的次数 --- 添加视图
        for value in 0..<countInt {
            
            scoreVImg = ScorePersonInfoV.init(frame: CGRect.init(x: CGFloat(value) * width, y: commonMargin, width: width, height: self.Height))
            addSubview(scoreVImg)
            
            /// 显示总成绩
            scoreVImg.showCoinsLabel.text = FinialScoreModel.shared.cjArray[valueIndex]
            
            /// 显示通杀
            scoreVImg.tsCountLabel.text = FinialScoreModel.shared.txArray[valueIndex]
            
            /// 显示通赔
            scoreVImg.tpCountLabel.text = FinialScoreModel.shared.tpArray[valueIndex]
            
            /// 胜利
            scoreVImg.winCountLabel.text = FinialScoreModel.shared.slArray[valueIndex]
            
            /// 牛牛此时
            scoreVImg.niuniuCountLabel.text = FinialScoreModel.shared.nnCishuArray[valueIndex]
            
            /// 玩家
            scoreVImg.userName.text = FinialScoreModel.shared.yhmArray[valueIndex]
            
            /// 玩家ID
            scoreVImg.playerIDLabel.text = FinialScoreModel.shared.playerIDArray[valueIndex]
            
            /// 头像
            downImgWith(url: FinialScoreModel.shared.headImgURLArray[valueIndex], toView: scoreVImg.headImg)
            
            /// 判断显示房主图标
            if FinialScoreModel.shared.fangzhuArray[valueIndex] == "1" {
                scoreVImg.roomIconImg.isHidden = false
            } else {
                scoreVImg.roomIconImg.isHidden = true
            }
            
            /// 判断显示大赢家
            if FinialScoreModel.shared.yingjiaArray[valueIndex] == "1" {
                scoreVImg.showBigWinner.isHidden = false
            } else {
                scoreVImg.showBigWinner.isHidden = true
            }
            
            valueIndex += 1
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
