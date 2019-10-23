//
//  SettingViewController.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/14/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit
import SCLAlertView

class SettingViewController: UIViewController {

    @IBOutlet weak var tableviewsetting: UITableView!
    
    let arrselection = ["Name","Date Settings","Background Image","Display","App Settings"]
    let arrcell = [["Person 1","Person 2","Change Title","Change Bottom text"],["Start date","Start from Zero","Show Year, Month, Days"],["Background Image"],["Name Text Color","Day Text Color","Bar Color","Language","Show Bottom Bar","Font"],["Badge","Use passcode lock"]]
    
    let appearance = SCLAlertView.SCLAppearance(showCloseButton : false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewsetting.dataSource = self
        tableviewsetting.delegate = self
        tableviewsetting.register(UINib(nibName: "SettingViewSelect", bundle: nil), forCellReuseIdentifier: "SettingViewSelect")
        tableviewsetting.register(UINib(nibName: "SettingViewSwich", bundle: nil), forCellReuseIdentifier: "SettingViewSwich")
    }
    
//    @IBAction func butdone(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
    
}

extension SettingViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrcell[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let label = arrcell[indexPath.section][indexPath.row]
        if label == "Start from Zero" || label == "Show Year, Month, Days" || label == "Show Bottom Bar" || label == "Badge" || label == "Use passcode lock" {
            guard let cell = tableviewsetting.dequeueReusableCell(withIdentifier: "SettingViewSwich", for: indexPath) as? SettingViewSwich else {
                return UITableViewCell()
            }
            cell.settitle(label : label)
            return cell
        }
        else {
            guard let cell = tableviewsetting.dequeueReusableCell(withIdentifier: "SettingViewSelect", for: indexPath) as? SettingViewSelect else {
                return UITableViewCell()
            }
            cell.setlabel(label : label)
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrselection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrselection[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        setSLC(indexpath: indexPath)
    }
    
    func setSLC(indexpath : IndexPath) -> Void{
        let label = arrcell[indexpath.section][indexpath.row]
        let de = SCLAlertView.init(appearance: appearance)

        var textdata = ""
        var texttitle = ""
        
        switch label {
        case "Person 1":
            textdata = ci!.nameperson1!
            texttitle = "Person 1 Name"
            let textff = de.addTextField(textdata)
            de.addButton("OK"){
                if !textff.text!.isEmpty {
                    ci!.nameperson1! = textff.text!
                    self.tableviewsetting.reloadRows(at: [indexpath], with: .automatic)
                }
                de.hideView()
            }
            de.addButton("Cancel"){de.hideView()}
            de.showInfo(texttitle, subTitle: "")
        case "Person 2":
            textdata = ci!.nameperson2!
            texttitle = "Person 2 Name"
            let textff = de.addTextField(textdata)
            de.addButton("OK"){
                if !textff.text!.isEmpty {
                    ci!.nameperson2 = textff.text!
                    self.tableviewsetting.reloadRows(at: [indexpath], with: .automatic)
                }
            }
            de.addButton("Cancel"){de.hideView()}
            de.showInfo(texttitle, subTitle: "")
        case "Change Title":
            textdata = ci!.changetitle!
            texttitle = "Change Title"
            let textff = de.addTextField(textdata)
            de.addButton("OK"){
                if !textff.text!.isEmpty {
                    ci?.changetitle = textff.text!
                    self.tableviewsetting.reloadRows(at: [indexpath], with: .automatic)
                }
            }
            de.addButton("Cancel"){de.hideView()}
            de.showInfo(texttitle, subTitle: "")
        case "Change Bottom text":
            textdata = ci!.changeBottom!
            texttitle = "Change Bottom text"
            let textff = de.addTextField(textdata)
            de.addButton("OK"){
                if !textff.text!.isEmpty {
                    ci?.changeBottom = textff.text!
                    self.tableviewsetting.reloadRows(at: [indexpath], with: .automatic)
                }
            }
            de.addButton("Cancel"){de.hideView()}
            de.showInfo(texttitle, subTitle: "")
        case "Background Image":
            de.addButton("Change",backgroundColor: .blue){}
            de.addButton("Delete Background",backgroundColor: .orange){}
            de.addButton("Cancel",backgroundColor: .orange){}
            de.showInfo("Background Image", subTitle: "", circleIconImage: UIImage.init(named: "ico_photo"))
            de.showInfo(texttitle, subTitle: "")
        case "Use passcode lock":
            if ci!.passswich == 1 {
                let sb = UIStoryboard.init(name: "Main", bundle: nil)
                let sp = sb.instantiateViewController(withIdentifier: "ManLockViewController") as? ManLockViewController
                self.present(sp!,animated: true,completion: nil)
            }
        default:
            texttitle = ""
        }
    }
}

extension SettingViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
