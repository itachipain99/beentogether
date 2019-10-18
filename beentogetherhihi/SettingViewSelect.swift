//
//  SettingViewSelect.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/18/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit

class SettingViewSelect: UITableViewCell {

    @IBOutlet weak var label_title: UILabel!
    @IBOutlet weak var labeluse: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setlabel(label : String) -> Void{
        label_title.text = label
        var textData = ""
        switch label {
        case "Person 1":
            textData = ci!.nameperson1!
        case "Person 2":
            textData = ci!.nameperson2!
        case "Change Title":
            textData = ci!.changetitle!
        case "Change Bottom text":
            textData = ci!.changeBottom!
        case "Start date":
             let currentdate = ci!.datepicker!
             let dateformater = DateFormatter()
             dateformater.dateFormat = "MMM dd,yyyy"
             let dateString = dateformater.string(from: currentdate)
            textData = dateString
        case "Background Image":
            textData = "Change"
        case "Name Text Color":
            textData = "Name Text Color"
        case "Day Text Color":
            textData = "Day Text Color"
        case "Bar Color":
            textData = "Bar Color"
        case "Language":
            textData = "System Language"
        case "Font":
            textData = "Nanum Pen Script OTF"
        default:
            textData = ""
        }
        labeluse.text = textData
    }
}
