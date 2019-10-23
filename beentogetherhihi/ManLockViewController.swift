//
//  ManLockViewController.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/23/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit

class ManLockViewController: UIViewController {
    
    @IBOutlet weak var inputpass: UITextField!
    @IBOutlet weak var label_warninglock: UILabel!
    
    var pass = [password]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pass = ReadData.share.parejson()
        print(pass[0].password!)
    }
    
    @IBAction func but_gobeen(_ sender: Any) {
        let check = inputpass.text!
        var bo : Bool = false
        if  check.isEmpty{
            label_warninglock.text = "Quên pass"
        }
        else {
            pass.forEach{ (passw) in
                if check == passw.password {
                    bo = true
                }
            }
            if bo == false {label_warninglock.text = "Sai pass"}
            else{
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
