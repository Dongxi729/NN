//
//  FinalScoreV.swift
//  NN
//
//  Created by 郑东喜 on 2017/6/7.
//  Copyright © 2017年 郑东喜. All rights reserved.
//  最后成绩视图

import UIKit

class FinalScoreV: CommonV {
    // MARK: - 结算
    lazy var checkupBtn: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 5 * screenScale, width: self.Width, height: self.Height * 0.1))
        d.image = #imageLiteral(resourceName: "checkUp")
        d.contentMode = UIViewContentMode.scaleAspectFit
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(checkupBtn)
        addSubview(shareBtn)
        addSubview(confirmBtm)
        
        addSubview(singleV)
        
        /// 判读模型中是有值--- 显示用户成绩视图个数
        if FinialScoreModel.shared.fangzhuArray.count > 0 {
            singleV.showImgs(countInt: FinialScoreModel.shared.fangzhuArray.count)
        }
        
        
        self.backgroundColor = UIColor.colorWithHexString("7F7F7F", alpha: 0.8)
    }
    
    // MARK: - 确定
    lazy var confirmBtm: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: 0.6 * self.Width, y: 0.86 * self.Height, width: self.Width * 0.3, height: 25 * screenScale))
        d.setImage(#imageLiteral(resourceName: "btn_qd"), for: .normal)
        d.addTarget(self, action: #selector(confirmSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    // MARK: - 分享
    lazy var shareBtn: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: 0.3 * self.Width, y: self.Height * 0.86, width: self.Width * 0.3, height: 25 * screenScale))
        d.setImage(#imageLiteral(resourceName: "btn_fx"), for: .normal)
        d.addTarget(self, action: #selector(shareBtnSEL(sender:)), for: .touchUpInside)
        d.layer.borderWidth = 1
        return d
    }()
    
    
    /// 计算视图
    lazy var singleV: SingleSCoreV = {
        let d : SingleSCoreV = SingleSCoreV.init(frame: CGRect.init(x: 0, y: self.checkupBtn.BottomY, width: self.Width, height: self.Height * 0.65))
        return d
    }()
    
    func confirmSEL(sender : UIButton) -> Void {
        /// 移除当前视图
        self.removeFromSuperview()
        
        /// 返回大厅
//        backToholl()
        UIApplication.shared.keyWindow?.removeFromSuperview()
        
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController = MainGameViewController()
        }
    }
    
    /// 分享按钮事件
    func shareBtnSEL(sender : UIButton) -> Void {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        //        WXTool.shared.shareScoreImg(title: "分享城市", desc: "快蓝看啊", shareType: 1)
        let tool = WXTool()
        tool.shareText(title: "asds", desc: "asdsd", shareType: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




