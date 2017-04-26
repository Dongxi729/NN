//
//  MainGameViewController.swift
//  NN
//
//  Created by 郑东喜 on 2017/4/24.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
  
        
        let add = UIButton.init(frame: CGRect.init(x: 30, y: 30, width: 100, height: 100))
        add.backgroundColor = UIColor.red
        
        add.addTarget(self, action: #selector(presenrView), for: .touchUpInside)
//        view.addSubview(add)
        
        
        view.addSubview(mainView)
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",UIScreen.main.bounds.height)
        print("\((#file as NSString).lastPathComponent):(\(#line))\n",UIScreen.main.bounds.width)
    }
    
    func presenrView() -> Void {
        view.addSubview(presentView)
        
        presentView.center = view.center
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            
            let orient = UIApplication.shared.statusBarOrientation
            
            switch orient {
            case .portrait:
                print("Portrait")
                
                break
            // Do something
            default:
                print("LandScape")
                // Do something else
                
                break
            }
        }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            print("rotation completed")
        })
//        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        super.viewWillTransition(to: size, with: coordinator)
    }
}
