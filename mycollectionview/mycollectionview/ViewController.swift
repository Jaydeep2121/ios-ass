//
//  ViewController.swift
//  mycollectionview
//
//  Created by DCS on 26/11/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    private let collectionview = UICollectionView()
//    private var cityarray = ["berlin","denver","helsini","moscow","nairo","oslo","rio","tokyo"]
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        title="custom collection view"
//        view.addSubview(collectionview)
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        collectionview.frame = CGRect(x: 0, y:view.safeAreaInsets.top , width: view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.top
//            - view.safeAreaInsets.bottom)
//    }
//
//}
//
//extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return cityarray.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionview.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
//        cell.setupCityCellWith(title: cityarray[indexPath.row])
//        return cell
//    }
//
//
//    private func setuptableview(){
//        collectionview.dataSource = self
//        collectionview.delegate = self
//        collectionview.register(UIViewController.self, forCellWithReuseIdentifier: <#T##String#>)
//        //collectionview.register(CityCell.self, forCellReuseIdentifier: "CityCell")
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
//        cell.setupCityCellWith(title: cityarray[indexPath.row])
//        return cell
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
    
}
