//
//  PasswordViewController.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/22/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var textpass: UITextField!
    @IBOutlet weak var textpassrepeat: UITextField!
    @IBOutlet weak var label_warning: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func but_Go(_ sender: Any) {
        if textpass.text!.isEmpty || textpassrepeat.text!.isEmpty{
            label_warning.text = "Mời nhập đầy đủ thông tin"
        }
        else{
            if textpass.text != textpassrepeat.text{
                label_warning.text = "Sai mật khẩu nhập lại"
            }
            else{
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
