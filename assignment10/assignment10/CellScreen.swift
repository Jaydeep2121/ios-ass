//
//  CellScreen.swift
//  assignment10
//
//  Created by DCS on 11/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class CellScreen: UIViewController {
    private var dataarray = [String]()
    private var tableview = UITableView()
    private let toolbar:UIToolbar = {
        let toolbar = UIToolbar()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
        toolbar.items = [space,add]
        return toolbar
    }()
    private let logout:UIButton = {
        let button = UIButton()
        button.setTitle("LogOut", for: .normal)
        button.addTarget(self, action: #selector(logoutclk), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(toolbar)
        view.addSubview(tableview)
        view.addSubview(logout)
        view.backgroundColor = .white
        setUptableview()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataarray = FMS.getfiles()
        tableview.reloadData()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    func setUptableview(){
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let toolbarHGeight:CGFloat = view.safeAreaInsets.top + 20.0
        logout.frame = CGRect(x: 10, y: 25, width: 80, height: 30)
        toolbar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width, height:toolbarHGeight)
        tableview.frame = CGRect(x: 0, y: toolbar.bottom+10, width:view.frame.size.width, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}
extension CellScreen:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataarray.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let filepath = FMS.getDocDir().appendingPathComponent(dataarray[indexPath.row] + ".text")
        do{
            try FileManager.default.removeItem(at:filepath)
            self.dataarray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            print("delete")
        }catch{
            print("Error")
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = dataarray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = AddNewFiles()
        cell.f = dataarray[indexPath.row]
        navigationController?.pushViewController(cell, animated: true)
    }
    @objc func handleAdd(){
        let vc = AddNewFiles()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func logoutclk(){
        UserDefaults.standard.setValue(nil, forKey: "uname")
        self.dismiss(animated: true)
        let sc = LoginPage()
        navigationController?.pushViewController(sc, animated: true)
    }
}
