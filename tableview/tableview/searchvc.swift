//
//  searchvc.swift
//  tableview
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class searchvc: UIViewController{
    private let stateArray = ["Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Goa","Gujarat","Rajkot","Vadodra","Valsad","Navsari"]
    
    private let myTableview = UITableView()
    
    private let mysearchbar = UISearchBar()
    
    private var searching = false
    
    private var searchdata = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myTableview)
        view.addSubview(mysearchbar)
        setuptableview()
        mysearchbar.delegate=self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mysearchbar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 50)
        myTableview.frame = CGRect(x: 0, y: mysearchbar.bottom, width: view.width, height: view.height-view.safeAreaInsets.top - view.safeAreaInsets.bottom-50)
    }
}

extension searchvc:UITableViewDataSource,UITableViewDelegate{
    private func setuptableview(){
        myTableview.dataSource=self
        myTableview.delegate=self
        myTableview.register(UITableViewCell.self, forCellReuseIdentifier: "StateCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchdata.count
        }else{
            return stateArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell",for: indexPath)
        if searching {
            cell.textLabel?.text = searchdata[indexPath.row]
        }else{
            cell.textLabel?.text = stateArray[indexPath.row]
        }
        return cell
    }
}
extension searchvc:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            searching = false
        }else{
            searching = true
            searchdata = stateArray.filter({ $0.lowercased().hasPrefix(searchText.lowercased())})
        }
        myTableview.reloadData()
    }
}
