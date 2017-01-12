//
//  MBNetworkTool.swift
//  LiveApp
//
//  Created by user on 17/1/11.
//  Copyright © 2017年 mobin. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}

class MBNetworkTool {

    class func requestData(_ type: MethodType = .GET, urlString: String, parameters: [String : Any]?, callBack: @escaping (_ error: Error?,_ result: Any?) ->())  {
        
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(urlString, method: method, parameters: parameters).responseJSON { (respose) in
            
            guard let result = respose.result.value else {
                
                debugPrint("网络错误")
                callBack(respose.result.error,nil)
                return
            }
            callBack(nil,result)
        }
        
    }
    
    
}
