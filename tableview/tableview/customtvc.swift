//
//  customtvc.swift
//  tableview
//
//  Created by DCS on 26/11/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class customtvc: UIViewController {
        private let mytableview = UITableView()
        private var cityarray = ["berlin","denver","helsini","moscow","nairo","oslo","rio","tokyo"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title="cutome table view"
        view.addSubview(mytableview)
        setuptableview()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mytableview.frame = CGRect(x: 0, y:view.safeAreaInsets.top , width: view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.top
        - view.safeAreaInsets.bottom)
    }
}
extension customtvc:UITableViewDataSource,UITableViewDelegate{
    
    private func setuptableview(){
        mytableview.dataSource = self
        mytableview.delegate = self
        mytableview.register(CityCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CityCell
        cell.setupCityCellWith(title: cityarray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
