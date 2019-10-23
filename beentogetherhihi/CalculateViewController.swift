//
//  CalculateViewController.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/11/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var calview: UICollectionView!
    @IBOutlet weak var pagecal: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calview.dataSource = self
        calview.delegate = self
        calview.register(UINib(nibName: "CalculateViewcell1", bundle: nil), forCellWithReuseIdentifier: "CalculateViewcell1")
        calview.register(UINib(nibName: "CalculateViewcell2", bundle: nil), forCellWithReuseIdentifier: "CalculateViewcell2")
        let layout = UICollectionViewFlowLayout() // bố cục của collection view
        layout.minimumInteritemSpacing = 0 //  khoảng cách giữa 2 hàng
        layout.minimumLineSpacing = 0 // khoảng cách giữa 2 cột
        layout.sectionInset = UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5) // khoang cach cell trai phai tren duoi trong collection view
        layout.scrollDirection = .horizontal // tay đổi hướng của scroll
        layout.itemSize = CGSize(width: view.frame.width, height: calview.frame.height) // can chinh size của item
        calview.collectionViewLayout = layout // gắn các thuộc tính của layout vào collection view
        calview.showsHorizontalScrollIndicator = false // co show srcoll k
        calview.isPagingEnabled = true// lật trang
        calview.bounces = false // hiệu ứng
        calview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "item")
        calview.reloadData()
    }
    
    @IBAction func butCal(_ sender: Any) {
        slideMenuController()?.openSlideMenuLeft()
    }
}

extension CalculateViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0{
            guard let cell = calview.dequeueReusableCell(withReuseIdentifier: "CalculateViewcell1", for: indexPath) as? CalculateViewcell1 else {
                    return UICollectionViewCell()
            }
            return cell
        }
        else{
            guard let cell = calview.dequeueReusableCell(withReuseIdentifier: "CalculateViewcell2", for: indexPath) as? CalculateViewcell2 else {
                    return UICollectionViewCell()
            }
            return cell
        }
    }
}

extension CalculateViewController : UICollectionViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = round(scrollView.contentOffset.x/scrollView.frame.size.width)
        pagecal.currentPage = Int(page)
    }
}

