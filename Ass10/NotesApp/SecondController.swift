//
//  SecondController.swift
//  Ass10
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class SecondController: UIViewController {
    public let myTextField1:UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.backgroundColor = .gray
        textField.textAlignment = .left
        return textField
    }()
    public let myTextField2:UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.backgroundColor = .gray
        textField.textAlignment = .left
        return textField
    }()
    public let myTextField3:UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.backgroundColor = .gray
        textField.textAlignment = .left
        return textField
    }()
    private let MyButton:UIButton={
        let button=UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(OnbtnClick), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.4, green: 1.0, blue: 0.2, alpha: 0.5)
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc func OnbtnClick()
    {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(myTextField1)
        view.addSubview(myTextField2)
        view.addSubview(myTextField3)
        view.addSubview(MyButton)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTextField1.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 10, width: view.width - 40, height: 40)
        myTextField2.frame = CGRect(x: 20, y:myTextField1.bottom + 10, width: view.width - 40, height: 40)
        myTextField3.frame = CGRect(x: 20, y: myTextField2.bottom + 10, width: view.width - 40, height: 40)
        MyButton.frame = CGRect(x: 20, y: myTextField3.bottom + 10, width: view.width - 40, height: 40)
    }
}
