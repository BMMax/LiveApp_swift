//
//  MBLiveCaptureTool.swift
//  LiveApp
//
//  Created by user on 17/1/11.
//  Copyright © 2017年 mobin. All rights reserved.
//

import UIKit
import LFLiveKit
import AVFoundation


class MBLiveCaptureTool: NSObject{

    public var preView: UIView? //采集预览界面
    
    private lazy var session: LFLiveSession = {
        let audioConfiguration = LFLiveAudioConfiguration.default()
        let videoConfiguration = LFLiveVideoConfiguration.default()
        
        let session = LFLiveSession(audioConfiguration: audioConfiguration, videoConfiguration: videoConfiguration)
        session?.delegate = self
        session?.preView = self.preView
        return session!
        
    }()
    
    
    /// 采集视频信息
    public func requestAccessForVideo(){
        
        let status = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        
        switch status {
        case .notDetermined:
            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo, completionHandler: {[weak self] (granted) in
                guard granted else { return}
                DispatchQueue.main.async(execute: {
                    
                    /// 开始采集视频数据
                    self?.session.running = true
                })
                
            })
        case .authorized:
            debugPrint("已经开启授权")
            /// 开始采集视频数据
            self.session.running = true
            
        case.denied:break
        case.restricted:break
            
        }
    }
    
    
    /// 采集音频信息
    public func requestAccessForAudio(){
    
        let status = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeAudio)
        switch status {
        case .notDetermined:
            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo, completionHandler: {[weak self] (granted) in
                guard granted else { return}
                DispatchQueue.main.async(execute: {
                    
                    /// 开始采集视频数据
                    self?.session.running = true
                })
                
            })
        case .authorized:
            debugPrint("已经开启授权")
            /// 开始采集视频数据
            self.session.running = true
            
        case.denied:break
        case.restricted:break
            
        }

    
    }

    
}

 //MARK: - 采集LFLive代理
extension MBLiveCaptureTool: LFLiveSessionDelegate{

    
    internal func liveSession(_ session: LFLiveSession?, liveStateDidChange state: LFLiveState) {
        
        switch state {
            
        case .ready:
            print("未连接")
        case .pending:
            print("连接中...")
        case .start:
            print("开始连接")
        case .stop:
            print("断开链接")
        case.error:
            print("链接错误")
            
        default:break
            
        }
        
    }
    
   internal func liveSession(_ session: LFLiveSession?, debugInfo: LFLiveDebug?) {
        print("debugInfo:\(debugInfo)")
    }
    
   internal func liveSession(_ session: LFLiveSession?, errorCode: LFLiveSocketErrorCode) {
        print("errorCode:\(errorCode)")

    }
    
}
