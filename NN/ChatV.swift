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
    var secSource : [String] = ["大家好，很高兴见到各位","快点吧，等到花儿都谢了！","打枪，打枪，打枪","哈哈，全垒打"]
    
    lazy var label: UITextField = {
        let d : UITextField = UITextField.init(frame: CGRect.init(x: commonMargin, y: commonMargin, width: self.frame.width * 0.6, height: 30))
        d.placeholder = "sdasd"
        return d
    }()
    
    
    /// 发送按钮
    lazy var sendBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: self.label.RightX + commonMargin, y: commonMargin, width: self.frame.width - self.label.Width - 2 * commonMargin, height: 30))
        d.setTitle("发送", for: .normal)
        d.backgroundColor = UIColor.randomColor()
        return d
    }()
    
    /// 九宫格
    lazy var collV: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        
        /// 设置大小出错///
        let d : UICollectionView = UICollectionView.init(frame: CGRect.init(x: commonMargin, y: self.frame.height * 0.3, width: self.frame.width - 2 * commonMargin, height: self.frame.height), collectionViewLayout: layout)
        
        d.backgroundColor = UIColor.white
        
        d.dataSource = self
        d.delegate = self
        
        d.register(ChatVCollectCell.self, forCellWithReuseIdentifier: "ChatVCollectCell")
        
        return d
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(collV)
     
        self.addSubview(label)
        
        self.addSubview(sendBtn)
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
        } else {
            cell.sec.text = secSource[indexPath.row]
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
//            return CGSize.init(width: (self.frame.width - 2 * commonMargin) / 9, height: 30)
            
            
            //列数
            let columnsNum = 7
            //整个view的宽度
            let collectionViewWidth = collectionView.bounds.width
            //计算单元格的宽度
            let itemWidth = (collectionViewWidth - commonMargin * CGFloat(columnsNum-1))
                / CGFloat(columnsNum)
            
            
            //设置单元格宽度和高度
            return CGSize(width:itemWidth, height:itemWidth)
        } else {
            
            //列数
            let columnsNum = 2
            //整个view的宽度
            let collectionViewWidth = collectionView.bounds.width
            //计算单元格的宽度
            let itemWidth = (collectionViewWidth - commonMargin * CGFloat(columnsNum-1))
                / CGFloat(columnsNum)
            //设置单元格宽度和高度
            return CGSize(width:itemWidth - commonMargin , height:itemWidth * 0.25)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets.init(top: 10, left: 10, bottom: 20, right: 10)
            
        } else {
            return UIEdgeInsets()
            
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

class ChatVCollectCell: UICollectionViewCell {
    
    lazy var labelll: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.05, height: SW * 0.05))
        d.layer.borderWidth = 1
        return d
    }()
    
    lazy var secImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 1.3 * self.Height))
        
        d.image = UIImage.init(named: "msgBg")
        return d
    }()
    
    
    /// 文字
    lazy var sec: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 1.3 * self.Height))
        d.textColor = UIColor.white
        d.font = UIFont.systemFont(ofSize: 12)
        d.numberOfLines = 0
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
        
        addSubview(secImg)
        
        addSubview(labelll)
        
        addSubview(sec)
        
    }
    
}
