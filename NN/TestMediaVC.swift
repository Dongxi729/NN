//
//  TestMediaVC.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/12.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  测试发送媒体类

import UIKit

class TestMediaVC: UIView {
    
    fileprivate var sendMsgType : [String] = ["文字","语音","图片"]

    lazy var tbb: UITableView = {
        let dd : UITableView = UITableView.init(frame: self.frame)
        dd.register(UITableViewCell.self, forCellReuseIdentifier: "cccc")
        dd.dataSource = self
        dd.delegate = self;
        return dd
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tbb)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension TestMediaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cccc")
        
        cell?.textLabel?.text = sendMsgType[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sendMsgType.count
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            /// 发送文字
        case 0:
           sendText(sendStr: "测试一下")
            break
            /// 发送语音
        case 1:
            break
            /// 发送图片
        case 2:
            break
        default:
            break
        }
    }
    
}
