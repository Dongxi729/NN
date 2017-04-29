//
//  CaptureScreenTool.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/27.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  截图工具

import Foundation

extension UIView {
    
    /**
     Get the view's screen shot, this function may be called from any thread of your app.
     
     - returns: The screen shot's image.
     */
    func screenShot() -> UIImage? {
        
        ///  屏幕宽度、高度不为0
        guard frame.size.height > 0 && frame.size.width > 0 else {
            
            return nil
        }
        
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //(5)保存到相册
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        
        return image
    }
}
