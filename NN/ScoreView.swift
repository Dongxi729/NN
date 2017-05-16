//
//  ScoreView.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/16.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  成绩

import UIKit

class ScoreView: UIView {
    
    
    /// 退出按钮
    lazy var exitBtn: CommonBtn = {
        let d :CommonBtn = CommonBtn.init(frame: CGRect.init(x: self.Width - 15 * screenScale - 2 * commonMargin, y: commonMargin, width: 15 * screenScale, height: 15 * screenScale))
        d.setImage(#imageLiteral(resourceName: "exitNormal"), for: .normal)
        d.setImage(#imageLiteral(resourceName: "exitSelected"), for: .highlighted)
        d.contentMode = .scaleAspectFit
        d.addTarget(self, action: #selector(exitCurrentView), for: .touchUpInside)
        return d
    }()
    
    
    /// 标题图片
    lazy var titleImg: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: -5, width: SW, height: SH * 0.15))
        d.image = #imageLiteral(resourceName: "scoreTitle")
        d.contentMode = .scaleAspectFit
        
        return d
    }()
    
    fileprivate var ddd : [String] = ["asds","asdsad","asdsadsad","asdsaddsad","asds","asdsad","asdsadsad","asdsaddsad","asds","asdsad","asdsadsad","asdsaddsad"]
    
    /// 背景图片
    lazy var tbBgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.bounds)
        d.image = #imageLiteral(resourceName: "bgAlphaV")
        
        return d
    }()
    
    /// 表格
    fileprivate lazy var tbV: UITableView = {
        let d : UITableView = UITableView.init(frame: CGRect.init(x: 5, y: SH / 6, width: SW - commonMargin, height: SH * 0.75))
        d.delegate = self;
        d.dataSource = self;
        d.separatorStyle = .none
        d.register(ScoreCell.self, forCellReuseIdentifier: "xxx")
        //        d.backgroundView = UIImageView.init(image: #imageLiteral(resourceName: "bgAlphaV"))
        
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tbV.backgroundColor = UIColor.clear
        
        
        
        addSubview(tbBgV)
        
        addSubview(tbV)
        
        addSubview(titleImg)
        addSubview(exitBtn)
        
    }
    
    @objc fileprivate func exitCurrentView() -> Void {
        self.removeFromSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ScoreView : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "xxx") as! ScoreCell
        
        
        cell.backgroundColor = UIColor.clear
        
        cell.nameLabel.text = ddd[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SH / 5.5 + commonMargin
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ddd.count
    }
}

class ScoreCell: UITableViewCell {
    
    /// 房间IDlabel
    lazy var roomIDLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: SW / 11.5, y: 0, width: 50 * screenScale, height: SH / 15))
        d.text = "21212"
        d.font = UIFont.systemFont(ofSize: 8 * screenScale)
        d.textColor = UIColor.brown
        return d
    }()
    
    /// 时间label
    lazy var timeLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: SW * 0.75, y: 0, width: SW / 5 , height: SH / 15))
        d.text = "时间: " + "2017-3-16"
        d.textColor = UIColor.brown
        d.font = UIFont.systemFont(ofSize: 8 * screenScale)
        
        return d
    }()
    
    /// 名字label
    lazy var nameLabel: UILabel = {
        let d : UILabel = UILabel.init(frame: CGRect.init(x: commonMargin * screenScale, y: self.Height * 0.42, width: self.Width / 4, height: SH / 10))
        d.font = UIFont.systemFont(ofSize: 10 * screenScale)
        d.textAlignment = .center
        return d
    }()
    
    /// cell 的背景图片
    lazy var scoreCell: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 5, y: 0, width: SW - 3 * commonMargin, height: SH / 5.5))
        d.image = #imageLiteral(resourceName: "roomBV")
        return d
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        
        addSubview(scoreCell)
        addSubview(nameLabel)
        addSubview(roomIDLabel)
        addSubview(timeLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
