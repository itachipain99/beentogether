//
//  ViewController.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/3/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit
import SCLAlertView

class ViewController: UIViewController {
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        collectionview.register(UINib(nibName: "CollectionViewCellImage", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCellImage")
        let layout = UICollectionViewFlowLayout() // bố cục của collection view
               layout.minimumInteritemSpacing = 0 //  khoảng cách giữa 2 hàng
               layout.minimumLineSpacing = 0 // khoảng cách giữa 2 cột
               layout.sectionInset = UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5) // khoang cach cell trai phai tren duoi trong collection view
               layout.scrollDirection = .horizontal // tay đổi hướng của scroll
               layout.itemSize = CGSize(width: view.frame.width, height: collectionview.frame.height) // can chinh size của item
               collectionview.collectionViewLayout = layout // gắn các thuộc tính của layout vào collection view
               collectionview.showsHorizontalScrollIndicator = false // co show srcoll k
               collectionview.isPagingEnabled = true // lật trang
               collectionview.bounces = true // hiệu ứng
               collectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "item")
               collectionview.reloadData()
    }
    
    @IBAction func but_getstarted(_ sender: Any) {
//        let sb = UIStoryboard.init(name: "Main", bundle: nil)
//        let sp = sb.instantiateViewController(withIdentifier: "SlideMenu") as? SlideMenu
//        self.present(sp!,animated: true,completion: nil)
    }
    
    
}
extension ViewController : UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
            
        }
        else{
            guard let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellImage", for: indexPath) as? CollectionViewCellImage else {
                return UICollectionViewCell()
            }
            return cell
        }
    }
}
extension ViewController : UICollectionViewDelegate{
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pagenumber = round(scrollView.contentOffset.x/scrollView.frame.size.width)
        pagecontrol.currentPage = Int(pagenumber)
    }
}


