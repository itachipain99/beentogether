//
//  CalculateViewcell2.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/12/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit

class CalculateViewcell2: UICollectionViewCell {

    @IBOutlet weak var label_days: UILabel!
    @IBOutlet weak var text_month1: UITextField!
    @IBOutlet weak var text_month2: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let current = ci!.datepicker!
        let dateformater = DateFormatter()
        dateformater.dateFormat = "MMM dd,yyyy"
        let dateString = dateformater.string(from: current)
        label_days.text = "\(ci!.daylove!) days"
        text_month1.text = dateString
        text_month2.text = dateString
    }

}
