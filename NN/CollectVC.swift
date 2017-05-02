//
//  CollectVC.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/29.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  数字键入操作

import UIKit




let gridWidth = (UIScreen.main.bounds.width / 375) * 54


class CollectVC: UIViewController {
    
    
    lazy var collV: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: (UIScreen.main.bounds.width - 30) / 3, height: 40)
        
        
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let d : UICollectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64), collectionViewLayout: layout)
        
        d.backgroundColor = UIColor.white
        
        d.dataSource = self
        d.delegate = self

        d.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        
        return d
    }()
    
    
    var dataSource : [String] = ["1","2","3","4","5","6","7","8","9","充数","0","删除"]
    
    var filltext : [Int:String] = [:]
    
    var dddd :[UIView] = []
    
    var texIndex : Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view.
        
        view.addSubview(collV)
    }
}

extension CollectVC : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
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
        
        let d = addLabelView.init(frame: CGRect.init(x: CGFloat(64 * texIndex), y: 0, width: UIScreen.main.bounds.width / 6, height: 64))
  
        if selecttext == "删除" {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",dddd.count)
            
            if dddd.count > 0 {
                view.subviews.last?.removeFromSuperview()
                
                dddd.removeLast()
                
                texIndex -= 1
            }
            
            return
        } else {
            
//            if selecttext == "充数" {
//                
//            } else {
//                
                /// 索引
                texIndex += 1
                
                d.labelText(dd: selecttext)
                view.addSubview(d)
                dddd.append(d)
                
                if texIndex > 5 {
                    return
                }
//            }
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
