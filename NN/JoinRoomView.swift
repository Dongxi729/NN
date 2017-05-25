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

        
        addSubview(bgImgV)
        self.addSubview(collV)
        
        
        /// 加入房间
        addSubview(titleLabel)
        
        addSubview(tfPassBgV)
    }
    
    lazy var tfPassBgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: commonMargin * 2, y: self.Height * 0.15, width: self.Width - 4 * commonMargin, height: self.Height * 0.15))
        d.image = #imageLiteral(resourceName: "joinKey")
        return d
    }()
    
    
    fileprivate lazy var tfPass: UITextField = {
        let d : UITextField = UITextField.init(frame: CGRect.init(x: commonMargin, y: self.Test.BottomY + commonMargin, width: 100, height: 50))
        return d
    }()
    
    fileprivate lazy var Test: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 30, y: self.titleLabel.BottomY + commonMargin, width: 100, height: 30))
        d.backgroundColor = UIColor.gray
        d.addTarget(self, action: #selector(enjoyRoom), for: .touchUpInside)
        d.setTitle("进入房间", for: .normal)
        return d
    }()
    
    
    fileprivate lazy var bgImgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.frame)
        d.image = #imageLiteral(resourceName: "joinRoomBg")
        return d
    }()
    
    @objc fileprivate func enjoyRoom() -> Void {
    }
    
    /// 标题
    lazy var titleLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.width, height: 30))
        d.textAlignment = .center
        return d
    }()
    
    /// 九宫格
    lazy var collV: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        
        //列数
        let columnsNum = 3
        
        //整个view的宽度
        let collectionViewWidth = self.bounds.width
        
        //计算单元格的宽度
        let itemWidth = self.bounds.width / 3 - 1.6 * commonMargin * screenScale
        
        //设置单元格宽度和高度
        layout.itemSize = CGSize(width:itemWidth * 0.77, height:itemWidth * 0.55)
        
        
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        /// 设置大小出错///
        let d : UICollectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: self.tfPassBgV.BottomY + commonMargin, width: self.frame.width, height: self.frame.width), collectionViewLayout: layout)
        
        d.backgroundColor = UIColor.clear
        
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
    
    
    var texIndex : Int = 0
    
    
    /// 记录密码
    var valueRecord : [String] = [] {
        didSet {
            
        }
    }
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top:0, left: commonMargin * screenScale * 2, bottom: 0, right: 2 * commonMargin * screenScale)
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
        
        let d = addLabelView.init(frame: CGRect.init(x: CGFloat(self.Width / 4 * CGFloat(texIndex)), y: self.Height * 0.12, width: self.frame.width / 4, height: 64))
        
        
        
        if selecttext == "删除" {
            self.texIndex = dddd.count
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n",texIndex)
            
            if dddd.count > 0 {
                self.subviews.last?.removeFromSuperview()
                
                dddd.removeLast()
                valueRecord.removeLast()
                
                
                if texIndex > 0 {
                    texIndex -= 1
                }
                
            }
            
            return
        } else {
            /// 索引
            texIndex += 1
            
            
            if texIndex <= 4 && dddd.count < 4 {
                
                if selecttext != "充数" {
                    d.labelText(dd: selecttext)
                    
                    self.addSubview(d)
                    dddd.append(d)
                    valueRecord.append(selecttext)
                    
                    if valueRecord.count == 4 {
                        
                        var passPord : String = ""
                        
                        for ddd in valueRecord {

                            passPord.append(ddd)
                        }
                        
             
                        
                        /// 加入房间接口对接
                        joinRoomWithPass(roomPass: passPord)
                        
                    }
                } else {
                    for index : UIView in dddd {
                        
                        index.removeFromSuperview()
                        
                        dddd.removeAll()
                        valueRecord.removeAll()
                        
                        /// 重新计数
                        texIndex = 0
                    }
                }
            }
        }
        
        if selecttext == "充数" {
            for index : UIView in dddd {
                
                index.removeFromSuperview()
                
                dddd.removeAll()
                
                valueRecord.removeAll()
                
                /// 重新计数
                texIndex = 0
                
            }
            
        }
        
        
        if texIndex >= 4 {
            
            texIndex = 0
            return
        }
        
        
        
    }
    
}



class addLabelView: UIView {
    
    lazy var la: UILabel = {
        let d : UILabel = UILabel.init(frame: self.bounds)
        d.textAlignment = .center
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


    
