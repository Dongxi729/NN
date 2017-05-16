//
//  MarketV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/11.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  商城

import UIKit

class MarketV: UIView {
    
    
    
    /// 金额
    var moneyCount : [Int] = [60,210,330,550,1150]
    
    /// 选中的图片
//    var tapSelectedName : [UIImage] = [#imageLiteral(resourceName: "60DiaS"),#imageLiteral(resourceName: "210DiaS"),#imageLiteral(resourceName: "330DiaS"),#imageLiteral(resourceName: "550DiaS"),#imageLiteral(resourceName: "1150S")]
    
    /// 选择的图片
    var tapName : [UIImage] = [#imageLiteral(resourceName: "60Dia"),#imageLiteral(resourceName: "210Dia"),#imageLiteral(resourceName: "330Dia"),#imageLiteral(resourceName: "550Dia"),#imageLiteral(resourceName: "1150Dia")]
    
    
    /// 九宫格
    fileprivate lazy var collV: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
//        layout.itemSize = CGSize.init(width: (self.frame.width - 30) / 2, height: 40)
        
        let spacing:CGFloat = commonMargin
        
        //列数
        let columnsNum = 3
        
        //整个view的宽度
        let collectionViewWidth = self.bounds.width
        
        //计算单元格的宽度
        let itemWidth = self.bounds.width / 3 - 2 * commonMargin
        
        //设置单元格宽度和高度
        layout.itemSize = CGSize(width:itemWidth * 0.75, height:itemWidth * 0.8)
    
        /// 设置大小出错///
        let d : UICollectionView = UICollectionView.init(frame: CGRect.init(x: 5, y: self.titleImg.BottomY + 5, width: self.Width - commonMargin, height: self.Height - self.titleImg.Height - 3 * commonMargin), collectionViewLayout: layout)
        
        d.backgroundColor = UIColor.clear
        
        d.dataSource = self
        d.delegate = self
        
        d.register(MarketCollectCell.self, forCellWithReuseIdentifier: "MarketCollectCell")
        
        return d
    }()
    
    /// 标题
    lazy var titleImg: UIImageView = {
        let d :UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 5, width: self.Width, height: 20 * screenScale))
        d.image = #imageLiteral(resourceName: "marketImg")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    /// 背景图片
    lazy var bgImgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "marketBgV")
        return d
    }()
    
    /// 中间视图
    lazy var centerBgView: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: commonMargin, y: self.titleImg.BottomY + 5, width: self.Width - 2 * commonMargin, height: self.Height - self.titleImg.Height - 2 * commonMargin))
        d.image = #imageLiteral(resourceName: "centerBgV")
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(bgImgV)
        addSubview(centerBgView)
        addSubview(titleImg)
        
        self.addSubview(collV)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MarketV : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarketCollectCell", for: indexPath) as! MarketCollectCell
        
        cell.bgImg.setImage(tapName[indexPath.row], for: .normal)
//        cell.bgImg.setImage(tapSelectedName[indexPath.row], for: .selected)
        
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moneyCount.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",moneyCount[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 * screenScale
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 25, left: commonMargin + commonMargin * 0.8, bottom: 0, right: 2 * commonMargin)
    }
    
}

class MarketCollectCell: UICollectionViewCell {
    
    /// 文本
    lazy var bgImg: CommonBtn = {
        let bgImg : CommonBtn = CommonBtn.init(frame: self.bounds)
        bgImg.isUserInteractionEnabled = false
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
        addSubview(bgImg)
    }
    
}
