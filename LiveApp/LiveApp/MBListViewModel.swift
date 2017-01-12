//
//  MBListViewModel.swift
//  LiveApp
//
//  Created by user on 17/1/12.
//  Copyright © 2017年 mobin. All rights reserved.
//

import UIKit

class MBListViewModel{
    
    lazy var liveGroups: [MBLivesModel] = [MBLivesModel]()

}


// MARK: - 请求数据
extension MBListViewModel{
    func requestData(callBack:@escaping ()->()) {
        let urlBase = "http://116.211.167.106/api/live/aggregation?"
        let parame = ["uid": "133825214","interest" : "1"]
        
        MBNetworkTool.requestData(urlString: urlBase, parameters: parame) {(error, result) in
            
            guard let resultDict = result as? [String : NSObject] else{ return}
            //字典转模型
            guard let dataArray = resultDict["lives"] as? [[String : Any]] else{ return}
            for dict in dataArray{
            
                let liveModel = MBLivesModel(dict: dict)
                self.liveGroups.append(liveModel)
            }
            callBack()
        }
    }
}

// MARK: - 赋值给cell
extension MBListViewModel{
    
    class func setCell(tableView:UITableView, identifier: String, data:[MBLivesModel], indexPath:IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! MBLiveListCell
        let model = data[indexPath.row]
        let concernStr = String(describing: model.online_users)
        let nick = model.creators?.nick
        
        cell.nick.text = nick
        cell.city.text = model.city
        let iconString = model.creators?.portrait ?? ""
        cell.countLabel.text = concernStr
        
        cell.liveImage.kf.setImage(with: URL(string: iconString ))
        cell.icon.kf.setImage(with: URL(string: iconString))
        print("人数----\(model.online_users)-----\(model.stream_addr)")
        return cell
    }
}
