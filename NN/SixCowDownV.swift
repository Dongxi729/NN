//
//  SixCowDownV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/11.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class SixCowDownV: UIView {
    
    
    /// 文字
    var dataSource : [String] = ["房费平摊","房主结算","抢庄模式","轮流坐庄","房主坐庄","谁大谁坐庄"]
    
    
    /// 九宫格
    lazy var collV: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: (self.frame.width - 30) / 2, height: 40)
        
        
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        /// 设置大小出错///
        let d : UICollectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        
        d.backgroundColor = UIColor.white
        
        d.dataSource = self
        d.delegate = self
        
        d.register(SixCowDownVCollectCell.self, forCellWithReuseIdentifier: "sixDown")
        
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

extension SixCowDownV : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sixDown", for: indexPath) as! SixCowDownVCollectCell
        
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
    
}

class SixCowDownVCollectCell: UICollectionViewCell {
    
    lazy var labelll: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.05, height: SW * 0.05))
        //        d.backgroundColor = UIColor.randomColor()
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
        prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareUI() -> Void {
        addSubview(labelll)
        addSubview(bgImg)
    }
    
}
