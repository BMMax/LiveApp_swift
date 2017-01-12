//
//  MBListViewController.swift
//  LiveApp
//
//  Created by user on 17/1/12.
//  Copyright © 2017年 mobin. All rights reserved.
//

import UIKit

class MBListViewController: UIViewController {

    fileprivate lazy var liveViewModel = MBListViewModel()
    static let cellID = "cellID"
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: MBListViewController.cellID)
        // 发送网络请求
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}


// MARK: - 网络请求
extension MBListViewController{

    fileprivate func loadData(){
        
        
        liveViewModel.requestData {[weak self] in
            self?.tableView.reloadData()
            
        }
        
    }
}

// MARK: - TableView代理
extension MBListViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return liveViewModel.liveGroups.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
       return MBListViewModel.setCell(tableView: tableView, identifier:MBListViewController.cellID , data: liveViewModel.liveGroups, indexPath: indexPath)
        
    }


    
    /// 点击cell进行拉流
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let player = MBPlayerViewController()
        player.streamAddr = liveViewModel.liveGroups[indexPath.row].stream_addr
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(player, animated: true)
        
    }
    
    
    

}
