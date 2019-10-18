//
//  CalculateViewcell1.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/12/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit

class CalculateViewcell1: UICollectionViewCell {

    @IBOutlet weak var label_cell1: UILabel!
    @IBOutlet weak var textdate_cell1: UITextField!
    @IBOutlet weak var textdays_cell1: UITextField!
    @IBOutlet weak var segday: UISegmentedControl!
    
    var checkFrom : Bool = false
    var days : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let currentdate = ci!.datepicker!
        let dateformater = DateFormatter()
        dateformater.dateFormat = "MMM dd,yyyy"
        let dateString = dateformater.string(from: currentdate)
        label_cell1.text =  dateString
        textdate_cell1.text = dateString
        textdays_cell1.text = "\(ci!.daylove!)"
    }
    
    @IBAction func changeseg(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            checkFrom = false
            days = days + 1
        }
        else{
            checkFrom = true
            days = days - 1
        }
        textdays_cell1.text = "\(ci!.daylove! + days)"
    }
    
}
