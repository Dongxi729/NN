//
//  CaptureScreen.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/27.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  截屏操作

import UIKit

class CaptureScreen: UIViewController {

    lazy var CapTureBtn: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        
        d.addTarget(self, action: #selector(captureSEL), for: .touchUpInside)
        d.backgroundColor = UIColor.red
        return d
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        
//        
//        view.backgroundColor = UIColor.red
//        
        let img : UIImageView = UIImageView.init(frame: view.bounds)
        
        img.image = UIImage.init(named: "scree")
        view.addSubview(img)
        
        img.screenShot()
//        
//        let redView             = UIView.init(frame: CGRect.init(x: 40, y: 40, width: 200, height: 200))
//        redView.backgroundColor = UIColor.red
//        
//        view.addSubview(img)
//        view.addSubview(redView)
//        
//        let imageView = UIImageView(image: img.screenShot())
//        view.addSubview(imageView)
    }
    
    func captureSEL() -> Void {
        //代码截屏
        //(1)设置要截屏的图片的大小
        UIGraphicsBeginImageContext(view.frame.size)
        //(2)对哪个视图截图固定大小的图片
        
        //(3)获取截图的图片对象
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        //(4)结束绘制图片
        UIGraphicsEndImageContext()
        //(5)保存到相册
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }

}
