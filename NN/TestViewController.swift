//
//  TestViewController.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/5.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    lazy var clockV: CountDownBtn = {
        let d : CountDownBtn = CountDownBtn.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        
        d.initwith(superView: self.view, descc: 33)
        d.setImage(#imageLiteral(resourceName: "countDownImg"), for: .normal)
        d.setTitleColor(UIColor.black, for: .normal)
        return d
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let d : PeronheadInfoV = PeronheadInfoV.init(frame: self.view.bounds)
//        view.addSubview(d)
        view.addSubview(clockV)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
