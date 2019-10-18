//
//  SettingViewSwich.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/18/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit

class SettingViewSwich: UITableViewCell {

    @IBOutlet weak var label_title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func settitle(label : String) -> Void {
        label_title.text = label
    }
}
