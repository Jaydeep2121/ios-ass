//
//  Regpage.swift
//  Ass11
//
//  Created by DCS on 14/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Regpage: UIViewController {
    var Student:stud?
    let temp = SqliteHandler.shared
    private let titlelabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Add Student"
        label.font = UIFont.italicSystemFont(ofSize: 30)
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
        return label
    }()
    private let spidtextfield:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter SPID"
        textfield.layer.borderWidth = 1
        let img = UIImageView(frame: CGRect(x: 20, y: 50, width: 40, height: 20))
        img.contentMode = .scaleAspectFit
        img.image = #imageLiteral(resourceName: "id")
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.rightView = img
        textfield.rightViewMode = .always
        return textfield
    }()
    private let nametextfield:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter Name"
        let img = UIImageView(frame: CGRect(x: 20, y: 50, width: 40, height: 20))
        img.contentMode = .scaleAspectFit
        img.image = #imageLiteral(resourceName: "contact")
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.rightView = img
        textfield.rightViewMode = .always
        textfield.layer.borderWidth = 1
        return textfield
    }()
    private let emailtextfield:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter Email"
        textfield.layer.borderWidth = 1
        let img = UIImageView(frame: CGRect(x: 20, y: 50, width: 40, height: 20))
        img.contentMode = .scaleAspectFit
        img.image = #imageLiteral(resourceName: "email")
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.rightView = img
        textfield.rightViewMode = .always
        return textfield
    }()
    private let passtextfield:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter Password"
        let img = UIImageView(frame: CGRect(x: 20, y: 50, width: 40, height: 20))
        img.contentMode = .scaleAspectFit
        img.image = #imageLiteral(resourceName: "key")
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.rightView = img
        textfield.rightViewMode = .always
        textfield.layer.borderWidth = 1
        return textfield
    }()
    private let mysegment : UISegmentedControl = {
       let sg = UISegmentedControl()
        sg.insertSegment(withTitle: "Male", at: 0, animated: true)
        sg.insertSegment(withTitle: "Female", at: 1, animated: true)
        sg.insertSegment(withTitle: "Other", at: 2, animated: true)
        return sg
    }()
    private let mysegment1 : UISegmentedControl = {
        let sg = UISegmentedControl()
        sg.insertSegment(withTitle: "Bcom", at: 0, animated: true)
        sg.insertSegment(withTitle: "BCA", at: 1, animated: true)
        sg.insertSegment(withTitle: "BBA", at: 2, animated: true)
        sg.insertSegment(withTitle: "BSc", at: 3, animated: true)
        sg.insertSegment(withTitle: "CA", at: 4, animated: true)
        return sg
    }()
    private let savebutton:UIButton = {
        let button = UIButton()
        button.setTitle("SAVE", for: .normal)
        button.addTarget(self, action: #selector(savenote), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .green
        button.layer.cornerRadius = 6
        return button
    }()
    override func viewDidLoad() {
        view.addSubview(titlelabel)
        view.addSubview(spidtextfield)
        view.addSubview(nametextfield)
        view.addSubview(emailtextfield)
        view.addSubview(passtextfield)
        view.addSubview(mysegment)
        view.addSubview(mysegment1)
        view.addSubview(savebutton)
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titlelabel.frame = CGRect(x: 10, y: 20, width: view.width-10, height: 100)
        spidtextfield.frame = CGRect(x: 30, y: titlelabel.bottom+20, width: view.width-60, height: 40)
        nametextfield.frame = CGRect(x: 30, y: spidtextfield.bottom + 20, width: view.width-60, height: 40)
        emailtextfield.frame = CGRect(x: 30, y: nametextfield.bottom + 20, width: view.width-60, height: 40)
        mysegment.frame = CGRect(x: 30, y: emailtextfield.bottom+10, width: view.width-60, height: 30)
        passtextfield.frame = CGRect(x: 30, y: mysegment.bottom+10, width: view.width-60, height: 40)
        mysegment1.frame = CGRect(x: 30, y: passtextfield.bottom+10, width: view.width-60, height: 30)
        savebutton.frame = CGRect(x: 30, y: mysegment1.bottom+30, width: view.width-60, height: 40)
    }
}
extension Regpage{
    @objc func savenote(){
        print("click")
    }
}
