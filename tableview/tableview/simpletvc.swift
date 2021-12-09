//
//  simpletvc.swift
//  tableview
//
//  Created by DCS on 29/10/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class simpletvc: UIViewController {
    private let citytableview = UITableView()
    private var stateArray = ["Gujarat","Maharastra","Rajasthan","karnataka","jammu-Kashmir","Arunachal Pradesh","Assam","Bihar","Punjab"]
    private var cityarray = ["Berlin","Moscow","Rio","Denver","Tokyo","Helsinki","Oslo","Berlin","Moscow","Rio","Denver","Tokyo","Tokyo","Helsinki","Oslo","Berlin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Table View"
        				
        view.addSubview(citytableview)
        setUpTableview()
    }
    
    func setUpTableview(){
        //link the data
        //citytableview.dataSource = self
        citytableview.dataSource = self
        citytableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        citytableview.frame = CGRect(x: 0,
                                     y: view.safeAreaInsets.top,
                                     width: view.frame.size.width,
                                     height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}
extension simpletvc:UITableViewDataSource,UITableViewDelegate{
    /*
      func numberOfSections(in tableView: UITableView) -> Int {
     
    }*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return stateArray.count
        }else{
            return cityarray.count
        }
        //return cityarray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = stateArray[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = cityarray[indexPath.row]
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(cityarray[indexPath.row])
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "States"
        }else{
            return "Cities"
        }
    }
}
