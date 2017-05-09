//
//  TimerLabel.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/5.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class TimerLabel: UIViewController {
    
    
    /// 时间表格
    lazy var timerTable: UITableView = {
        let d : UITableView = UITableView.init(frame: self.view.bounds)
        d.delegate = self;
        d.dataSource = self;
        d.register(UITableViewCell.self, forCellReuseIdentifier: "aaa")
        return d
    }()
    
    
    /// 时间数组
    var timerArray : [Int] = [30,8,3,-3]
    
    lazy var yzmBtn: CountDownBtn = {
        let yzmBtn : CountDownBtn = CountDownBtn.init(frame: CGRect(x: Int(UIScreen.main.bounds.width - 100 - 15), y: 45 * 2 + 5, width: 100, height: 35))
        
        yzmBtn.backgroundColor = UIColor.gray
        yzmBtn.setTitle("获取验证码", for: .normal)
        yzmBtn.setTitle("获取验证码", for: .highlighted)
        
        //        yzmBtn.initwith(color: .gray, title: "asdad", superView: self.view, ddd: 2)
        
        yzmBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        yzmBtn.layer.cornerRadius = 8
        yzmBtn.layer.masksToBounds = true
        return yzmBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        view.addSubview(timerTable)
        
        view.addSubview(yzmBtn)
    }
}

extension TimerLabel : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aaa")
        
        cell?.textLabel?.text = String(timerArray[indexPath.row])
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timerArray.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        
        NUMSS = timerArray[indexPath.row]
        
        
        if yzmBtn.isvalidate() == true {
            yzmBtn.canContinue = false
            
            yzmBtn.timer?.invalidate()
            
            yzmBtn.initwith(color: .red, title: "qwqwqe", superView: self.view, descc: NUMSS)
        }
    }
}
