//
//  SlideMenuViewController.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/6/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit

class SlideMenuViewController2: UIViewController {

    @IBOutlet weak var tableviewLeft: UITableView!
    let arrLeft = ["Been Together","Calculate Date","Themes","Get Free Photobook"]
    let arrman = ["MainViewController","manCalculate","manThemes"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewLeft.dataSource = self
        tableviewLeft.delegate = self
        tableviewLeft.register(UINib(nibName: "LeftTableViewCell", bundle: nil), forCellReuseIdentifier: "LeftTableViewCell")
      //  self.view.backgroundColor = UIColor.red
    }

}

extension SlideMenuViewController2 : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableviewLeft.dequeueReusableCell(withIdentifier: "LeftTableViewCell") as? LeftTableViewCell else {
            return UITableViewCell()
        }
        cell.initCell(label: arrLeft[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let si = sb.instantiateViewController(withIdentifier: arrman[indexPath.row])
        slideMenuController()?.changeMainViewController(mainViewController: si, close: true)
    }
}

extension SlideMenuViewController2 : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
