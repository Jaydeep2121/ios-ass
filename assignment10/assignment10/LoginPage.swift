//
//  ViewController.swift
//  assignment10
//
//  Created by DCS on 11/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginPage: UIViewController {
    var user = "Admin"
    var pass = "admin123"
    private let loginlabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Login"
        label.textColor = .green
        label.font = UIFont.italicSystemFont(ofSize: 50)
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 50)
        return label
    }()
    private let usernametextfield:UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.placeholder = "Enter UserName"
        textfield.textAlignment = .center
        textfield.layer.cornerRadius = 15.0
        textfield.backgroundColor = .white
        textfield.layer.borderWidth = 0
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOffset = CGSize(width: 3, height: 3)
        textfield.layer.shadowOpacity = 0.7
        textfield.layer.shadowRadius = 4.0
        return textfield
    }()
    private let passtextfield:UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.placeholder = "Enter Password"
        textfield.textAlignment = .center
        textfield.layer.cornerRadius = 15.0
        textfield.backgroundColor = .white
        textfield.layer.borderWidth = 0
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOffset = CGSize(width: 3, height: 3)
        textfield.layer.shadowOpacity = 0.7
        textfield.layer.shadowRadius = 4.0
        return textfield
    }()
    private let loginbutton:UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.addTarget(self, action: #selector(loginClickbtn), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 0.4, green: 1.0, blue: 0.2, alpha: 0.5)
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.7
        return button
    }()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginlabel.frame = CGRect(x: 80, y: 80, width: 200, height: 100)
        usernametextfield.frame = CGRect(x: 60, y: 200, width: 250, height: 40)
        passtextfield.frame = CGRect(x: 60, y: usernametextfield.frame.origin.y+70, width: 250, height: 40)
        loginbutton.frame = CGRect(x: 60, y: passtextfield.frame.origin.y+70, width: 250, height: 40)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(loginlabel)
        view.addSubview(usernametextfield)
        view.addSubview(passtextfield)
        view.addSubview(loginbutton)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    @objc func loginClickbtn(){
        if usernametextfield.text == user && passtextfield.text == pass {
            UserDefaults.standard.setValue(usernametextfield.text, forKey: "uname")
            self.dismiss(animated: true)
            let sc = CellScreen()
            navigationController?.pushViewController(sc, animated: true)
        }else{
            usernametextfield.text=""
            passtextfield.text=""
            let alert = UIAlertController(title: "Failed to LoggedIn", message: "Incorrect Username OR Password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

