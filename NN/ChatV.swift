//
//  ChatV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/11.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  聊天界面

import UIKit


class ChatV: UIView {
    
    
    /// emoji
    var dataSource : [String] = ["E0","E1","E2","E3","E4","E5","E6","E7","E8","E9","E10","E11","E12","E13"]
    /// 文字
    var secSource : [String] = ["0","1","2","3"]
    
    /// 九宫格
    lazy var collV: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        
        /// 设置大小出错///
        let d : UICollectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        
        d.backgroundColor = UIColor.white
        
        d.dataSource = self
        d.delegate = self
        
        d.register(ChatVCollectCell.self, forCellWithReuseIdentifier: "ChatVCollectCell")
        
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

extension ChatV : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatVCollectCell", for: indexPath) as! ChatVCollectCell
        
        
        if indexPath.section == 0  {
            cell.labelll.image = UIImage.init(named: dataSource[indexPath.row])
        }
        
        if indexPath.section == 0 {
            cell.secImg.isHidden = true
        } else {
            cell.labelll.isHidden = true
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize.init(width: (self.frame.width) / 9, height: 30)
        } else {
            
            //列数
            let columnsNum = 2
            //整个view的宽度
            let collectionViewWidth = collectionView.bounds.width
            //计算单元格的宽度
            let itemWidth = (collectionViewWidth - commonMargin * CGFloat(columnsNum-1))
                / CGFloat(columnsNum)
            //设置单元格宽度和高度
            return CGSize(width:itemWidth, height:itemWidth * 0.2)
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}

class ChatVCollectCell: UICollectionViewCell {
    
    lazy var labelll: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.05, height: SW * 0.05))
        d.layer.borderWidth = 1
        return d
    }()
    
    lazy var secImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect(x: commonMargin, y: commonMargin, width: self.frame.width, height: 30))
        d.backgroundColor = UIColor.randomColor()
        return d
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareUI() -> Void {
        
//        addSubview(bgImg)
        addSubview(labelll)
        addSubview(secImg)
    }
    
}
