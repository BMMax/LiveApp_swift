//
//  MBLivesModel.swift
//  LiveApp
//
//  Created by user on 17/1/12.
//  Copyright © 2017年 mobin. All rights reserved.
//

import UIKit
import Kingfisher

class MBCreatorModel: NSObject{
    
    var gender : Int?
    var id : Int?
    var level : Int?
    var nick : String?
    var portrait : String?
    
    
    init(dict: [String : Any]) {
        
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("UndefinedKey \(key) \(value)")
    }

}

class MBLivesModel: NSObject {

    var city : String = ""
    var creator : [String : Any]?{
    
        didSet{
            guard let creator = creator else{ return}
            creators = MBCreatorModel(dict: creator)
        }
    }
    
    var creators: MBCreatorModel?
    var group : Int?
    var id : Int?
    var link : Int?
    var multi : Int?
    var name : String?
    var online_users : Int?
    var optimal : Int?
    var rotate : Int?
    var share_addr : String?
    var slot : Int?
    var stream_addr : String?
    var version : Int?
    
    init(dict: [String : Any]) {
        
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("UndefinedKey \(key) \(value)")
    }
}



