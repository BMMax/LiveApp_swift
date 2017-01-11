//
//  MBLiveViewController.swift
//  LiveApp
//
//  Created by user on 17/1/11.
//  Copyright © 2017年 mobin. All rights reserved.
//

import UIKit

class MBLiveViewController: UIViewController {
   
    fileprivate lazy var capture: MBLiveCaptureTool = MBLiveCaptureTool()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

 //MARK: -  Capture
extension MBLiveViewController{
    
    func initialCapture() {
        capture.preView = view
        capture.requestAccessForVideo()
        capture.requestAccessForAudio()
    }
}

 //MARK: - 点击事件
extension MBLiveViewController{

    
    /// 美颜效果
    @IBAction func swichBeauty(_ sender: UIButton) {
        
        
        
    }
    
    /// 切换摄像头
    @IBAction func switchCamera(_ sender: UIButton) {
        
        
        
    }
    
    
    /// 开始直播
    @IBAction func startLive(_ sender: UIButton) {
        
        
        
        
    }
    
    
    
    
   }




