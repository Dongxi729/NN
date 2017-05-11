//
//  CommCowDownV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/11.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class CommCowDownV: UIView {
    
    
    /// 文字
    var dataSource : [String] = ["房费平摊","房主结算"]
    var secSource : [String] = ["25分","20分","15分","10分","5分"]
    
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
        
        d.register(CommonSixCowDownVCollectCell.self, forCellWithReuseIdentifier: "commonsixDown")
        
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

extension CommCowDownV : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "commonsixDown", for: indexPath) as! CommonSixCowDownVCollectCell
        
        
        
        if indexPath.section == 0 {
            cell.labelll.text = dataSource[indexPath.row]
        } else {
            cell.labelll.text = secSource[indexPath.row]
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize.init(width: (self.frame.width - 30) / 2, height: 40)
        } else {
            return CGSize.init(width: (self.frame.width - 30) / 3, height: 40)

        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return dataSource.count
        } else {
            return secSource.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

class CommonSixCowDownVCollectCell: UICollectionViewCell {
    
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
