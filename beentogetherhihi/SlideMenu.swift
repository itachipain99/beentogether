//
//  SlideMenu.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/7/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit
import Foundation
import SlideMenuDovi

class SlideMenu: SliderMenuViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let left = sb.instantiateViewController(withIdentifier: "SlideMenuViewController2")
        let main = sb.instantiateViewController(withIdentifier: "MainViewController")
        self.initPanel(mainViewController: main, leftMenuViewController: left)
        // Do any additional setup after loading the view.
    }
}
