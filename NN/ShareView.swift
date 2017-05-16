//
//  ShareView.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/16.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit

protocol ShareViewDelegate {
    func wxShar(sender : UIButton)
    
    func wxSharFri(sender : UIButton)
}

class ShareView: UIView {
    
    var delegate : ShareViewDelegate?
    
    /// 分享背景视图
    fileprivate lazy var bgV: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: self.frame)
        d.image = #imageLiteral(resourceName: "shareAlphaV")
        return d
    }()
    
    /// 首日分享
    fileprivate lazy var firstShareLine: UIImageView = {
        let d : UIImageView = UIImageView.init(frame: CGRect.init(x: self.Width * 0.125, y: self.frame.height * 0.75, width: self.Width * 0.75, height: self.Height * 0.20))
        d.image = #imageLiteral(resourceName: "getFirstDiammand")
        d.contentMode = .scaleAspectFit
        return d
    }()
    
    
    /// 微信分享
    fileprivate lazy var wxShareBtn: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: self.Width * 0.125, y: self.Height * 0.20, width: self.Width * 0.25, height: self.Width * 0.25))
        d.setImage(#imageLiteral(resourceName: "wxShare"), for: .normal)
        d.setImage(#imageLiteral(resourceName: "wxSSelected"), for: .highlighted)
        d.setTitle("share", for: .normal)
        d.addTarget(self, action: #selector(shareSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    /// 微信朋友圈分享
    fileprivate lazy var wxFriShareBtn: CommonBtn = {
        let d : CommonBtn = CommonBtn.init(frame: CGRect.init(x: self.Width * 0.625, y: self.Height * 0.20, width: self.Width * 0.25, height: self.Width * 0.25))
        d.setImage(#imageLiteral(resourceName: "wxShareFri"), for: .normal)
        d.setImage(#imageLiteral(resourceName: "wxSharePress"), for: .highlighted)
        d.setTitle("shareFriend", for: .normal)
        d.addTarget(self, action: #selector(shareFriSEL(sender:)), for: .touchUpInside)
        return d
    }()
    
    @objc fileprivate func shareSEL(sender : UIButton) {
        self.delegate?.wxShar(sender: sender)
    }
    
    @objc fileprivate func shareFriSEL(sender : UIButton) {
        self.delegate?.wxSharFri(sender: sender)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bgV)
        
        addSubview(wxShareBtn)
        addSubview(wxFriShareBtn)
        addSubview(firstShareLine)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
