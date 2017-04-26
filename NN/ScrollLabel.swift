//
//  ScrollLabel.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/24.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

class ScrollLabel: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 获取文本
        let string: String = "ScofieldTang文字滚动ScofieldTang文字滚动ScofieldTang文字滚动"
        // 初始化label
        let label = UILabel()
        label.text = string
        label.font = UIFont.systemFont(ofSize: CGFloat(16))
        // 计算尺寸
        let size: CGSize? = label.text?.size(attributes: [NSFontAttributeName : label.font])
        
        //label.frame = [CGPoint.zero, size]
        label.frame = CGRect.init(origin: CGPoint.zero, size: size!)
        // 初始化ScrollView
        let showView = UIScrollView(frame: CGRect(x: CGFloat(100), y: CGFloat(100), width: CGFloat(200), height: CGFloat((size?.height)!)))
        showView.contentSize = size!
        showView.showsHorizontalScrollIndicator = false
        showView.addSubview(label)
        view.addSubview(showView)
        
        
        if (size?.width)! > showView.frame.size.width {
            UIView.animateKeyframes(withDuration: 5, delay: 0, options: [.repeat,.autoreverse], animations: {
                /// 计算移动的距离
                var point : CGPoint = showView.contentOffset
                point.x = (size?.width)! - 200
                showView.contentOffset = point
            }, completion: { (finished) in
                
            })
        }
        
        
        let dd : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.width, width: 300, height: 100))
        dd.backgroundColor = UIColor.gray
        
        view.addSubview(dd)
    }
}
