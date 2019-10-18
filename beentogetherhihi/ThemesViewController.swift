//
//  ThemesViewController.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/11/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit

class ThemesViewController: UIViewController {

    @IBOutlet weak var tableviewThemes: UITableView!
    let arrThemes = ["BeenTogether 2018","BeenTogether 2017","BeenTogether 2016","BeenTogether 2015",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewThemes.dataSource = self
        tableviewThemes.delegate = self
        tableviewThemes.register(UINib(nibName: "ThemesViewcell", bundle: nil), forCellReuseIdentifier: "ThemesViewcell")
        tableviewThemes.register(UINib(nibName: "LabelThemesCell", bundle: nil), forCellReuseIdentifier: "LabelThemesCell")
    }
    
    @IBAction func butThemes(_ sender: Any) {
        slideMenuController()?.openSlideMenuLeft()
    }
}

extension ThemesViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrThemes.count 
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row != arrThemes.count-1){
            guard let cell = tableviewThemes.dequeueReusableCell(withIdentifier: "ThemesViewcell") as? ThemesViewcell else{
                return UITableViewCell()
            }
            cell.initcellThemes(label: arrThemes[indexPath.row])
            return cell
        }
        else{
            guard let cell = tableviewThemes.dequeueReusableCell(withIdentifier: "LabelThemesCell") as? LabelThemesCell else{
                return UITableViewCell()
            }
            return cell
        }
    }
    
}

extension ThemesViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
