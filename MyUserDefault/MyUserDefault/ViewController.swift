//
//  ViewController.swift
//  MyUserDefault
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let usernamelabel:UILabel = {
       let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.backgroundColor = .gray
        label.font = .boldSystemFont(ofSize:20)
        return label
    }()
    
    private let logoutbutton:UIButton = {
        let button = UIButton()
        button.setTitle("LogOut", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(logoutTrapped), for: .touchUpInside)
        button.backgroundColor = .green
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(usernamelabel)
        view.addSubview(logoutbutton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chkauth()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernamelabel.frame = CGRect(x: 40, y: 90, width: view.frame.size.width-80, height: 40)
        logoutbutton.frame = CGRect(x: 40, y: 170, width: view.frame.size.width-80, height: 40)
    }

    private func chkauth(){
        if let uname = UserDefaults.standard.string(forKey: "username"){
            usernamelabel.text = "welcome\(uname)"
        }else{
            print("not logged in")
        }
    }
    
    @objc private func logoutTrapped(){
        UserDefaults.standard.setValue(nil, forKey: "username")
        chkauth()
    }
}

