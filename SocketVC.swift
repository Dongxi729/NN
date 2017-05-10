//
//  SocketVC.swift
//  NN
//
//  Created by 郑东喜 on 2017/5/10.
//  Copyright © 2017年 郑东喜. All rights reserved.
//

import UIKit
import AVFoundation


class SocketVC: UIViewController {
    
    /// 网络IP地址
    //    let host = "192.168.2.13"
    //
    //    /// 端口
    //    let port = 8411
    
    /// 发送信息按钮
    
    
    var index : Int = 0
    
    
    /// 余下的数据
    var resetData : Int = 0
    
    
    var imgview : UIImageView?
    
    
    /// 长按录音
    lazy var lpButton: UIButton = {
        let d : UIButton = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        let longTap = UILongPressGestureRecognizer.init(target: self, action: #selector(longSEL(gesture:)))
        
        d.addGestureRecognizer(longTap)
        d.backgroundColor = UIColor.gray
        return d
    }()
    
    
    
    lazy var sendTfMsg: UITextField = {
        let d : UITextField = UITextField.init(frame: CGRect.init(x: 0, y: 64, width: UIScreen.main.bounds.width, height: 30))
        d.placeholder = "输入发送的文本信息"
        return d
    }()
    
    var cellIcon : [String] = ["开始录音","停止","转换amr","播放","发送文字","发送语音","发送图片"]
    
    /// 表格
    lazy var getMsg: UITableView = {
        let d : UITableView = UITableView.init(frame: CGRect.init(x: 200, y: 0, width: UIScreen.main.bounds.width - 200, height: UIScreen.main.bounds.height))
        //        let d : UITableView = UITableView.init(frame:self.view.bounds)
        d.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        d.delegate = self;
        d.dataSource = self;
        return d
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(sendTfMsg)
        
        
        /// 录音表格
        view.addSubview(getMsg)
        
        /// 长按手势
        view.addSubview(lpButton)
        
        DispatchQueue.main.async {
            
            /// 接收通知、获取传来的值
            NotificationCenter.default.addObserver(self, selector: #selector(self.showDataToController(sender:)), name: NSNotification.Name(rawValue: "receiveData"), object: nil)
        }
        
        
        AvdioTool.shared.creatSession()
        
        /// 开启链接服务器
        DispatchQueue.global(qos: .default).async {
            
            SendMediaTool.shared.testServer()
        }
    }
    
    @objc fileprivate func showDataToController(sender : NSNotification) -> Void {
        print(sender.userInfo!["send"] ?? "")
        
        
        var showMediaData : [UInt8] = sender.userInfo!["send"] as! [UInt8]
        /// 添加类型后总长度增加了1，要减去1
        for i in 0..<1 {
            
            /// 取出第五个UInt8字节、确定发送的类型
            /// 1为文字
            /// 2为图片
            /// 3为语音
            let receiveType = showMediaData.remove(at: 0)
            print(receiveType)
            
            
            /// 剪完1次后为我们要得到的真正数据
            if i == 0 {
                DispatchQueue.main.async {
                    switch receiveType {
                    case 1:
                        
                        let imfDara = NSData.init(bytes: showMediaData, length: showMediaData.count)
                        
                        let sss = String.init(data: imfDara as Data, encoding: .utf8)
                        print("字符串",sss as Any)
                        
                        break
                    case 2:
                        
                        
                        /// 图片
                        let ddd = UIImageView.init(frame: CGRect.init(x: 0, y: self.index, width: 100, height: 100))
                        
                        ddd.backgroundColor = UIColor.blue
                        
                        let imfDara = NSData.init(bytes: showMediaData, length: showMediaData.count)
                        
                        ddd.image = UIImage.init(data: imfDara as Data)
                        
                        self.view.addSubview(ddd)
                        
                        self.index += 100
                        
                        
                        break
                    case 3:
                        
                        
                        let imfDara = NSData.init(bytes: showMediaData, length: showMediaData.count)
                        
                        let savePath = AvdioTool.shared.amrconvertBackWav
                        
                        
                        let dataAsNSData = imfDara
                        dataAsNSData.write(toFile: savePath!, atomically: true)
                        
                        AvdioTool.shared.playMp3()
                        
                        break
                    default:
                        break
                    }
                }
            }
        }
    }
}


// MARK: - 长按手势
extension SocketVC {
    func longSEL(gesture : UILongPressGestureRecognizer) -> Void {
        print("\((#file as NSString).lastPathComponent):(\(#line))\n")
        
        if gesture.state == .began {
            print("\((#file as NSString).lastPathComponent):(\(#line))\n","长按事件")
            
            AvdioTool.shared.startRecord()
        } else {
            
            AvdioTool.shared.stopRecord()
            
            AvdioTool.shared.convertWavToAmr()
            
            
            print("\((#file as NSString).lastPathComponent):(\(#line))\n","结束")
            
        }
    }
}

extension SocketVC : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        cell?.textLabel?.text = cellIcon[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            
        /// 开始录音
        case 0:
            AvdioTool.shared.startRecord()
            
            break
        /// 停止录音
        case 1:
            AvdioTool.shared.stopRecord()
            
            break
        /// 转码
        case 2:
            AvdioTool.shared.convertWavToAmr()
            
            break
        case 3:
            AvdioTool.shared.playMp3()
            break
        ///文字
        case 4:
            SendMediaTool.shared.sendTextFunc(sendText: "asdsadsadsadsadasdsadsad")
            break
            
        ///语音
        case 5:
            SendMediaTool.shared.sendVoice()
            break
            
        ///图片
        case 6:
            SendMediaTool.shared.sendImg(imageName: "cccc")
            break
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellIcon.count
    }
}
