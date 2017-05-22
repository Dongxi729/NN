//
//  GamingVC.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/11.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  游戏界面

import UIKit

// MARK: - 游戏控制器
class GamingVC: UIViewController {
    
    fileprivate lazy var addChartBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        d.backgroundColor = UIColor.randomColor()
        d.addTarget(self, action: #selector(addChartV), for: .touchUpInside)
        return d
    }()
    
    /// 左上角信息视图
    lazy var leftInfoV: GameLeftCornerMsg = {
        let d : GameLeftCornerMsg = GameLeftCornerMsg.init(frame: CGRect.init(x: 0, y: 0, width: SW / 7, height: SH * 0.3))
        
        return d
    }()
    
    
    
    @objc fileprivate func addChartV() -> Void {
        let f : ChatV = ChatV.init(frame: CGRect.init(x: 100, y: SH * 0.2, width: SW * 0.5, height: SH * 0.8))
        f.backgroundColor = UIColor.gray
        f.center = view.center
        
        view.addSubview(f)
    }
    
    /// 背景视图
    fileprivate lazy var bgV: GameBgV = {
        let d : GameBgV = GameBgV.init(frame: self.view.bounds)
        return d
    }()
    
    
    /// 倒数计时视图
    fileprivate lazy var countDown: ClockCountDown = {
        let d : ClockCountDown = ClockCountDown.init(frame: CGRect.init(x: 0, y: 0, width: SW * (0.531702891640041 - 0.46875), height: SW * (0.531702891640041 - 0.46875)))
        
        return d
    }()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    //////////// 抢庄
    fileprivate lazy var robV: RobRoomOwner = {
        let d : RobRoomOwner = RobRoomOwner.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.3, height: SH * 0.1))
        
        return d
    }()
    
    /// 非庄家压分
    fileprivate lazy var getCoins: MarkChoose = {
        let d : MarkChoose = MarkChoose.init(frame: CGRect.init(x: 0, y: 0, width: SW * 0.3, height: SH * 0.1))
        
        return d
    }()
    
//    func reconnectSEL() -> Void {
//        
//        var reconnectStr : String = "<M><Nn id='123456' tk='asldkfjwieoskldfksdhf' ty='1'/></M>"
//        
//        
//        //获取xml文件内容
//        let data = reconnectStr.data(using: String.Encoding.utf8)
//        
//        //构造XML文档
//        let doc = try! DDXMLDocument(data: data!, options:0)
//        
//        //利用XPath来定位节点（XPath是XML语言中的定位语法，类似于数据库中的SQL功能）
//        let users = try! doc.nodes(forXPath: "//M/Nn") as! [DDXMLElement]
//        
//        for user in users {
//            let gameType = user.attribute(forName: "id")!.stringValue!
//            
//            print(gameType)
//        }
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
//        reconnectSEL()
        
        view.backgroundColor = UIColor.white
        
        RoomModel.shared.currentPersonInRoom = 4
        view.addSubview(bgV)
        bgV.showGameTypeMark = 3
        
        bgV.isGaming = false
        bgV.showprepareBtnMark = false
        
        
        countDown.center = view.center
        
        /// 抢庄
        robV.center = view.center
        view.addSubview(robV)
        
        //        view.addSubview(getCoins)
        
        /// 倒计时
        //        countDown.countDown = 60
        //        view.addSubview(countDown)
        
        //        RoomModel.shared.scoreCount = "222"
        //
        //        let d : ScoreV = ScoreV.init(frame: CGRect.init(x: 0, y: 0, width: SW / 4, height: SH * 0.2))
        //        d.abc(abc: RoomModel.shared.scoreCount, scoreType: 2)
        //        view.addSubview(d)
        //        print(d)
        
    }
}
