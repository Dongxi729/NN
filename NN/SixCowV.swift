//
//  SixCowV.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/10.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  六人牛牛视图

import UIKit

class SixCowV: UIView {

    
    /// 文字
    var playRound : [String] = ["10局","20局","30局"]
    
    var playersNum : [String] = ["2人","3人","4人","5人","6人"]
    
    
    /// 九宫格
    lazy var collV: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: (self.frame.width - 30) / 3, height: 40)
        
        
//        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 10
        
        /// 设置大小出错///
        let d : UICollectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: self.Width, height: 40 * 2), collectionViewLayout: layout)
        
        d.backgroundColor = UIColor.white
        
        d.dataSource = self
        d.delegate = self
        d.register(SixCollectionViewCell.self, forCellWithReuseIdentifier: "six")
        
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

extension SixCowV : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "six", for: indexPath) as! SixCollectionViewCell
        
        cell.labelll.text = playRound[indexPath.row]
        
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        

            return playRound.count

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SixCollectionViewCell
        
        switch indexPath.section {
        case 0:
            cell.bgImg.image = #imageLiteral(resourceName: "E8")
            print(playRound[indexPath.row])
            break
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        print(indexPath.section)
        
        
        let cell = collectionView.cellForItem(at: indexPath) as! SixCollectionViewCell
        switch indexPath.section {
        case 0:
            cell.bgImg.image = #imageLiteral(resourceName: "E7")
            break
        default:
            break
        }
        
    }
}


class SixCollectionViewCell: UICollectionViewCell {
    
    lazy var labelll: CommonLabell = {
        let d : CommonLabell = CommonLabell.init(frame: CGRect.init(x: self.bgImg.RightX + commonMargin, y: commonMargin, width: SW / 30, height: SW / 30))
        return d
    }()
    
    /// 文本
    lazy var bgImg: UIImageView = {
        let bgImg : UIImageView = UIImageView.init(frame: CGRect.init(x: commonMargin, y: commonMargin, width: SW / 30, height: SW / 30))
        bgImg.backgroundColor = UIColor.randomColor()
//        bgImg.isUserInteractionEnabled = true

        return bgImg
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
        
        
        self.layer.borderWidth = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareUI() -> Void {
        addSubview(labelll)
        addSubview(bgImg)
    }

}
