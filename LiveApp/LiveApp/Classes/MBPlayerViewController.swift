//
//  MBPlayerViewController.swift
//  LiveApp
//
//  Created by user on 17/1/12.
//  Copyright © 2017年 mobin. All rights reserved.
//

import UIKit
import IJKMediaFramework


class MBPlayerViewController: UIViewController {

    public var streamAddr: String! //码流地址
    var  ijkLivePlay:IJKFFMoviePlayerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("---------\(streamAddr)")
        loadIjkPlay()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ijkLivePlay.prepareToPlay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension MBPlayerViewController{


    fileprivate func loadIjkPlay(){
        
        ijkLivePlay = IJKFFMoviePlayerController(contentURLString: streamAddr, with: nil)
        ijkLivePlay.view.frame = UIScreen.main.bounds
        view.addSubview(ijkLivePlay.view)
        ijkLivePlay.scalingMode = .aspectFill
    }
}
