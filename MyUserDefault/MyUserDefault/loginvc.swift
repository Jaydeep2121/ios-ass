//
//  loginvc.swift
//  MyUserDefault
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class loginvc: UICollectionViewCell {
    private let loginbutton:UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.addTarget(self, action: #selector(logintrapped), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 6
        return button
    }()
    
    
    @objc private func logintrapped() {
        UserDefaults.standard.setValue("Jaydeep", forKey: "username")
        //self.dismiss(animated:true)
    }
}
