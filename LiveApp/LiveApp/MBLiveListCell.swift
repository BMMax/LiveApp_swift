//
//  MBLiveListCell.swift
//  LiveApp
//
//  Created by user on 17/1/12.
//  Copyright © 2017年 mobin. All rights reserved.
//

import UIKit

class MBLiveListCell: UITableViewCell {
    
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var liveImage: UIImageView!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var nick: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
