//
//  Notes.swift
//  DataBase
//
//  Created by DCS on 13/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class liststud: UIViewController {
    private let myTable = UITableView()
    private let notice:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "NoticeBoard"
        label.textColor = .green
        label.font = UIFont.italicSystemFont(ofSize: 15)
        label.font = UIFont(name: "HelveticaNeue-UltraBold", size: 15)
        return label
    }()
    private let studlabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "New Student"
        label.textColor = .green
        label.font = UIFont.italicSystemFont(ofSize: 15)
        label.font = UIFont(name: "HelveticaNeue-UltraBold", size: 15)
        return label
    }()
    private let toolBar:UIToolbar = {
        let toolBar = UIToolbar()
        let item1 = UIBarButtonItem(barButtonSystemItem: .add, target:self, action: #selector(add_note))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [space, space,item1]
        return toolBar
    }()
    private let toolBarnotice:UIToolbar = {
        let toolBar = UIToolbar()
        let item1 = UIBarButtonItem(barButtonSystemItem: .add, target:self, action: #selector(add_notice))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [item1,space, space]
        return toolBar
    }()
    private var notes = [stud]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(myTable)
        view.addSubview(toolBar)
        view.addSubview(toolBarnotice)
        view.addSubview(notice)
        view.addSubview(studlabel)
        myTable.dataSource = self
        myTable.delegate = self
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       toolBar.frame = CGRect(x: 0, y: 20, width: view.width, height: 40)
        toolBarnotice.frame = CGRect(x: 0, y: 20, width: view.width-50, height: 40)
        notice.frame = CGRect(x: 10, y: 20, width: view.width-200, height: 40)
        studlabel.frame = CGRect(x: 100, y: 20, width: view.width, height: 40)
        myTable.frame = CGRect(x: 0,y: toolBar.bottom + 10, width: view.frame.size.width,
                               height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        notes = SqliteHandler.shared.fetch()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        myTable.reloadData()
    }
    @objc func add_note()
    {
        let vc = Regpage()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func add_notice(){
        let sc = NoticeVC()
        navigationController?.pushViewController(sc, animated: true)
    }
    
}
extension liststud: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let emp = notes[indexPath.row]
        cell.textLabel?.text = "\(emp.name) \t | \t \(emp.email) \t | \t \(emp.gen)  \t | \t \(emp.cour)"
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Regpage()
        vc.Student = notes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let id = notes[indexPath.row].spid
        SqliteHandler.shared.delete(for: id) { (success) in
            if success {
                print("Deleted in VC")
                self.notes.remove(at: indexPath.row)
                self.myTable.deleteRows(at: [indexPath], with: .automatic)
            } else {
                print(id)
                print("not Deleted in VC")
            }
        }
    }
    
}
