//
//  MarketV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/11.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  商城

import UIKit

class MarketV: UIView {
    
    
    /// 文字
    var dataSource : [String] = ["60","210","330","550","1150"]
    
    
    /// 九宫格
    lazy var collV: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
//        layout.itemSize = CGSize.init(width: (self.frame.width - 30) / 2, height: 40)
        
        let spacing:CGFloat = commonMargin
        
        //列数
        let columnsNum = 3
        //整个view的宽度
        let collectionViewWidth = self.bounds.width
        //计算单元格的宽度
//        let itemWidth = (collectionViewWidth - spacing * CGFloat(columnsNum-1))
//            / CGFloat(columnsNum)
        
        let itemWidth = self.bounds.width / 3 - 2 * commonMargin
        //设置单元格宽度和高度
        layout.itemSize = CGSize(width:itemWidth, height:itemWidth * 1.2)
    
        /// 设置大小出错///
        let d : UICollectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        
        d.backgroundColor = UIColor.white
        
        d.dataSource = self
        d.delegate = self
        
        d.register(MarketCollectCell.self, forCellWithReuseIdentifier: "MarketCollectCell")
        
        return d
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(collV)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MarketV : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarketCollectCell", for: indexPath) as! MarketCollectCell
        
        cell.labelll.text = dataSource[indexPath.row]
        
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 2 * commonMargin, left: commonMargin + commonMargin * 0.8, bottom: commonMargin * 2, right: 2 * commonMargin)
    }
    
}

class MarketCollectCell: UICollectionViewCell {
    
    lazy var labelll: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: 0, y: 0, width: self.Width * 0.3, height: self.Width * 0.3))
        d.backgroundColor = UIColor.randomColor()
        return d
    }()
    
    /// 文本
    lazy var bgImg: UIImageView = {
        let bgImg : UIImageView = UIImageView.init(frame: CGRect.init(x: 50, y: commonMargin, width: SW * 0.05, height: SW * 0.05))
        bgImg.backgroundColor = UIColor.randomColor()
        return bgImg
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderWidth = 1
        prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareUI() -> Void {
        addSubview(bgImg)
    }
    
}
