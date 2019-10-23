//
//  LeftTableViewCell.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/11/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit

class LeftTableViewCell: UITableViewCell {
    @IBOutlet weak var imageleft: UIImageView!
    @IBOutlet weak var label_left: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func initCell (label : String) -> Void{
        label_left.text = label
        switch label {
            case "Been Together":
                imageleft.image = UIImage(named: "ico_heart")
            case "Calculate Date":
                imageleft.image = UIImage(named: "ico_event")
            case "Themes":
                imageleft.image = UIImage(named: "ico_photolib")
            default:
                imageleft.image = UIImage(named: "ico_photolib")
        }
    }
}
