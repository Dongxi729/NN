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
//        addSubview(tfPass)
//        addSubview(Test)
    }
    
    lazy var tfPass: UITextField = {
        let d : UITextField = UITextField.init(frame: CGRect.init(x: commonMargin, y: self.Test.BottomY + commonMargin, width: 100, height: 50))
        d.backgroundColor = UIColor.white
        return d
    }()
    
    lazy var Test: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 30, y: self.titleLabel.BottomY + commonMargin, width: 100, height: 30))
        d.backgroundColor = UIColor.gray
        d.addTarget(self, action: #selector(enjoyRoom), for: .touchUpInside)
        d.setTitle("进入房间", for: .normal)
        return d
    }()
    
    @objc fileprivate func enjoyRoom() -> Void {

//        joinRoom(str: tfPass.text!)
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
    
    /// 文字
    var dataSource : [String] = ["1","2","3","4","5","6","7","8","9","充数","0","删除"]
    
    /// 图片
    var imgName : [String] = ["1","2","3","4","5","6","7","8","9","delLastWord","0","clear"]
    
    /// 密码输入视图控制
    var dddd :[UIView] = []
    
    /// 文字输入控制
    var passInput : [Int] = []
    
    var texIndex : Int = 0

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension JoinRoomView : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CollectionViewCell
        
        cell.bgImg.image = UIImage.init(named: imgName[indexPath.row])
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
        
        print(selecttext)
        
        if passInput.count >= 1 {
            for index in passInput {
                print(index)
            }
            
            print(passInput.count)
        }
        
        /// 添加数据
        
        let d = addLabelView.init(frame: CGRect.init(x: CGFloat(self.Width / 4 * CGFloat(texIndex)), y: 0, width: self.frame.width / 4, height: 64))
        
        if selecttext == "删除" {
           
            if dddd.count > 0 {
                self.subviews.last?.removeFromSuperview()
                
                passInput.removeLast()
                
                dddd.removeLast()
                
                passInput.removeLast()
                
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
                
                if !selecttext.contains("充数") {
                    passInput.append(Int(selecttext)!)
                }
            }
            
            if texIndex >= 4 {
                texIndex = 0
                return
            }
        }
        
        if selecttext == "充数" {
            for index : UIView in dddd {
                
                index.removeFromSuperview()
                
                passInput.removeAll()
                dddd.removeAll()
                
                /// 重新计数
                texIndex = 0
                
                if passInput.count > 1 {
                    passInput.removeAll()
                }
            }
        }
        
        if passInput.count > 3 {
            return
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
