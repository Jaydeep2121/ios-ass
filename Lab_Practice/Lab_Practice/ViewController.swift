//
//  ViewController.swift
//  Lab_Practice
//
//  Created by DCS on 01/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let tableview = UITableView()
    private let data = ["Yellow","White","Blue","Black","Red","Maroon","Pink","violate"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Table View"
        
        view.addSubview(tableview)
        setUpTableview()
    }
    func setUpTableview(){
        //linking the data
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "celling")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableview.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}
extension ViewController:UITableViewDataSource,UITabBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "celling", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}
