//
//  CollectionViewCell.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/3/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit
var ci : daystart?
class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBOutlet weak var label_days: UILabel!
    @IBOutlet weak var segDate: UISegmentedControl!
    
    var checkFrom : Bool = false
    var days : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        segmeday()
        setdaystart(daylove: days, datepicker: DatePicker.date)
        print(ci?.datepicker)
        label_days.text = "\(days) days"
    }
    
    func setdaystart (daylove : Int,datepicker : Date){
        ci = daystart(daylove: daylove ,datepicker: datepicker ,nameperson1: "Person 1",nameperson2: "Person 2",changetitle: "Been Together",changeBottom: "Today",passswich: 1)
    }
    
    func segmeday() {
        if(segDate.selectedSegmentIndex == 0){
            checkFrom = false
            days = 1
        }
        else{
            checkFrom = true
            days = 0
        }
    }
   
    @IBAction func changedate(_ sender: UIDatePicker) {
            let daynow = Date()
            let dateform = DateFormatter()
            dateform.dateFormat = "dd/MM/YYYY"
        days = Calendar.current.dateComponents([.day], from: sender.date, to: daynow).day!
        if(!checkFrom){
            days = days + 1
        }
        setdaystart(daylove: days, datepicker: DatePicker.date)
        print(ci?.datepicker)
        label_days.text = "\(days) days"
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
        setdaystart(daylove: days, datepicker: DatePicker.date)
        print(ci?.daylove)
        label_days.text = "\(days) days"
    }
}

