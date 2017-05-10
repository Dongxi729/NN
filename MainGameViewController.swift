//
//  MainGameViewController.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/24.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  游戏主界面

import UIKit

class MainGameViewController: UIViewController {

    lazy var mainView: PersonMsgView = {
        let d : PersonMsgView = PersonMsgView.init(frame: self.view.bounds)
        
        return d
    }()
    
    lazy var presentView: UIView = {
        let d :UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 300))
        d.backgroundColor = UIColor.blue
        
        
        return d
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /// 开始上报用户信息,传socket
        
            
            print("连接服务器")
            AvdioTool.shared.creatSession()
            
            /// 开启链接服务器
            DispatchQueue.global(qos: .default).async {
                
                SendMediaTool.shared.testServer()
            }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
  
        
        let add = UIButton.init(frame: CGRect.init(x: 30, y: 30, width: 100, height: 100))
        add.backgroundColor = UIColor.red
        
        add.addTarget(self, action: #selector(presenrView), for: .touchUpInside)

        view.addSubview(mainView)
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",UIScreen.main.bounds.height)
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",UIScreen.main.bounds.width)
        
//        addScrollText()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("----",LoginModel.shared.headImgURL)
    }
    
    func presenrView() -> Void {
        view.addSubview(presentView)
        
        presentView.center = view.center
    }

    /// 添加滚动文字
    func addScrollText() -> Void {
        let scText = ScrollText.init(frame: CGRect.init(x: 0, y: 100, width: SW * 0.5, height: 50), withBackGroundColor: UIColor.gray, withTitleColor: UIColor.purple)
        
        let dd = ["撒旦立刻精神看到就撒大声地就拉上记录数卡机的"]
        
        scText?.titleArray = dd
        
        view.addSubview(scText!)
    }

}
