//
//  ThemesViewcell.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/13/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit

class ThemesViewcell: UITableViewCell {

    @IBOutlet weak var label_Themes: UILabel!
    @IBOutlet weak var imageThemes: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initcellThemes(label : String) -> Void{
        label_Themes.text = label
        switch label {
        case "BeenTogether 2018":
            imageThemes.image = UIImage(named: "ico_event")
        case "BeenTogether 2017":
            imageThemes.image = UIImage(named: "ico_heart")
        case "BeenTogether 2016":
            imageThemes.image = UIImage(named: "ico_menu")
        default:
            imageThemes.image = UIImage(named: "ico_share")
        }
    }
}
