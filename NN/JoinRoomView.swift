//
//  JoinRoomView.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/9.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  加入房间

import UIKit

class JoinRoomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(collV)
        
        /// 加入房间
        addSubview(titleLabel)
    }
    
    /// 标题
    lazy var titleLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.width, height: 30))
        d.textAlignment = .center
        d.text = "加入房间"
        return d
    }()
    
    /// 九宫格
    lazy var collV: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: (self.frame.width - 30) / 3, height: 40)
        
        
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        /// 设置大小出错///
        let d : UICollectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 64, width: self.frame.width, height: self.frame.width), collectionViewLayout: layout)
        
        d.backgroundColor = UIColor.white
        
        d.dataSource = self
        d.delegate = self
        
        d.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        
        return d
    }()
    
    
    var dataSource : [String] = ["1","2","3","4","5","6","7","8","9","充数","0","删除"]
    
    
    
    var dddd :[UIView] = []
    
    var texIndex : Int = 0
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension JoinRoomView : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CollectionViewCell
        
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
        
        let selecttext = dataSource[indexPath.row]
        
        /// 添加数据
        
        let d = addLabelView.init(frame: CGRect.init(x: CGFloat(self.Width / 4 * CGFloat(texIndex)), y: 0, width: self.frame.width / 4, height: 64))
        
        
        
        if selecttext == "删除" {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",dddd.count)
            
            if dddd.count > 0 {
                self.subviews.last?.removeFromSuperview()
                
                dddd.removeLast()
                
                if texIndex > 0 {
                    texIndex -= 1
                }

            }
            
            return
        } else {
            /// 索引
            texIndex += 1
            
            if texIndex <= 4 && dddd.count < 4 {
                d.labelText(dd: selecttext)
                
                
                self.addSubview(d)
                dddd.append(d)
            }
            
            if texIndex >= 4 {
                texIndex = 0
                return
            }
        }
        
        if selecttext == "充数" {
            for index : UIView in dddd {
                
                index.removeFromSuperview()
                
                dddd.removeAll()
                
                /// 重新计数
                texIndex = 0
                
            }
            
        }
        
    }
    
}



class addLabelView: UIView {
    
    lazy var la: UILabel = {
        let d : UILabel = UILabel.init(frame: self.bounds)
        return d
    }()
    
    func labelText(dd : String) -> Void {
        la.text = dd
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(la)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
