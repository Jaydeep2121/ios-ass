//
//  LoginViewController.swift
//  MyUserDefault
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    private let loginbutton:UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.addTarget(self, action: #selector(logintapped), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .green
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(loginbutton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginbutton.frame = CGRect(x: 40, y: 200, width: view.frame.size.width-80, height: 40)
    }	
    
    @objc func logintapped(){
        print("go to")
        UserDefaults.standard.setValue("Jaydeep", forKey:"username")
        self.dismiss(animated: true)
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
        present(vc,animated: true,completion:nil)
    }
}
