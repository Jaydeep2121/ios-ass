//
//  ViewController.swift
//  Ass10
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var emparry = [Employee]()
    
    private var stateArray = ["USA", "India", "Pakistan", "UK", "Australia", "Canada", "SriLanka", "Dubai", "China"]
    private let myTableView = UITableView()
    private let toolbar:UIToolbar = {
        let toolbar = UIToolbar()
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
        toolbar.items = [space,add]
        return toolbar
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emparry = SQLiteHandler.shared.fetch()
        myTableView.reloadData()
    }
    
    @objc func handleAdd(){
        print("Gallery Called")
        let vc = SecondController()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupTableView()
        view.addSubview(toolbar)
        view.addSubview(myTableView)
        
        //for table create
        let temp = SQLiteHandler.shared
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let toolbarHGeight:CGFloat = view.safeAreaInsets.top + 20.0
        toolbar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width, height:toolbarHGeight)
        myTableView.frame = CGRect(x: 0, y: toolbar.bottom, width:view.frame.size.width, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}
extension ViewController :UITableViewDataSource,UITableViewDelegate {
    private func setupTableView()
    {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Statecell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emparry.count
        //return stateArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Statecell", for: indexPath)
//        cell.textLabel?.text = stateArray[indexPath.row]
//        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Statecell", for: indexPath)
        let mydata = emparry[indexPath.row]
        cell.textLabel?.text = "\(mydata.name) | \(mydata.age) | \(mydata.phone)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click")
        let vc = SecondController()
        vc.emp = emparry[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        let id = emparry[indexPath.row].id
//
//        SQLiteHandler.shared.delete(emp:id){
//
//            success in
//            if success{
//                self.emparry.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .automatic)
//            }else{
//                print("unable to delete from vc")
//            }
//        }
    }
}

