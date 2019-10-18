//
//  MainViewController.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/3/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit
import SCLAlertView
import SlideMenuDovi

class MainViewController : UIViewController {
    
    @IBOutlet weak var label_days: UILabel!
    @IBOutlet weak var label_name1: UILabel!
    @IBOutlet weak var label_name2: UILabel!
    @IBOutlet weak var label_title: UILabel!
    @IBOutlet weak var label_bottom: UILabel!
    
    
    let appearance = SCLAlertView.SCLAppearance(
         showCloseButton : false
     )
    
    override func viewWillAppear(_ animated: Bool) {
        label_days.text = "\(ci!.daylove!) days"
        label_name1.text = "\(ci!.nameperson1!)"
        label_name2.text = "\(ci!.nameperson2!)"
        label_title.text = "\(ci!.changetitle!)"
        label_bottom.text = "\(ci!.changeBottom!)"
     }
    
    override func viewDidLoad() {
           super.viewDidLoad()
    }
    
    @IBAction func but(_ sender: Any) {
        slideMenuController()?.openSlideMenuLeft()
    }
    
    @IBAction func but_setting(_ sender: Any) {
//        let sb = UIStoryboard.init(name: "Main", bundle: nil)
//        let sp = sb.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController
//        self.present(sp!,animated: true,completion: nil)
        
    }
    
    @IBAction func but_changebackground(_ sender: Any) {
        let de = SCLAlertView(appearance: appearance)
        de.addButton("Change",backgroundColor: .blue){
        }
        de.addButton("Delete Background",backgroundColor: .orange){}
        de.addButton("Cancel",backgroundColor: .orange){}
        de.showInfo("Background Image", subTitle: "", circleIconImage: UIImage.init(named: "ico_photo"))
    }
    @IBAction func but_share(_ sender: Any) {
        let de = SCLAlertView(appearance: appearance)
        de.addButton("Share",backgroundColor: .orange){
        }
        de.addButton("Hide AD for a while",backgroundColor: .orange){}
        de.addButton("Cancel",backgroundColor: .orange){}
        de.showInfo("Share", subTitle: "",circleIconImage: UIImage.init(named: "ico_share"))
    }
    @IBAction func but_name1(_ sender: Any) {
        let de = SCLAlertView(appearance: appearance)
        let text = de.addTextField("Enter name person 1")
        de.addButton("OK"){
            if !text.text!.isEmpty{
                self.label_name1.text = text.text
                ci?.nameperson1 = text.text
            }
            de.hideView()
        }
        de.addButton("Cancel"){
            de.hideView()
        }
        de.showInfo("Name", subTitle: "Person 1")
//        SCLAlertView.addTextField(title : "Enter name person1")
    }
    
    @IBAction func but_name2(_ sender: Any) {
       let alert = SCLAlertView(appearance: appearance)
        let txt = alert.addTextField("Enter name person 2")
        alert.addButton("OK") {
            if !txt.text!.isEmpty{
                self.label_name2.text = txt.text
                ci?.nameperson2 = txt.text
            }
            alert.hideView()
        }
        alert.addButton("Cancel"){
            alert.hideView()
        }
        alert.showInfo("Name", subTitle: "Person 2")
    }
}

extension MainViewController : DayLove {
    func PushDay(dayoflove: Int) {
        label_days.text = "\(dayoflove)"
    }
}


