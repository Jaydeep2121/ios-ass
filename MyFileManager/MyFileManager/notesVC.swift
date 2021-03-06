//
//  notesVC.swift
//  MyFileManager
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class notesVC: UIViewController {
    private let nametextfield:UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.placeholder = "Enter Text"
        textfield.textAlignment = .center
        textfield.backgroundColor = .white
        
        textfield.layer.borderWidth = 1
        return textfield
    }()
    
    private let contenttextview:UITextView = {
        let textview = UITextView()
        textview.text = ""
        textview.textAlignment = .center
        textview.backgroundColor = .gray
        return textview
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
    
    @objc private func savenote(){
        let name = nametextfield.text!
        let content = contenttextview.text!
        let filepath = FMS.getDocDir().appendingPathComponent("\(name).text")
        do{
            try content.write(to: filepath, atomically: true, encoding: .utf8)
        }catch{
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(nametextfield)
        view.addSubview(contenttextview)
        view.addSubview(savebutton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do{
            let filename = FMS.getDocDir().appendingPathComponent("jaydeep.txt")
            let fetcgcontent = try String(contentsOf: filename)
            print(fetcgcontent)
        }catch{
            print(error)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nametextfield.frame = CGRect(x: 40, y: 100, width: view.frame.width - 80, height: 40)
        contenttextview.frame = CGRect(x: 40, y: nametextfield.frame.origin.y + nametextfield.frame.size.height+20, width: view.frame.width-80, height: 160)
        savebutton.frame = CGRect(x: 40, y: 520, width: view.frame.width-80, height: 40)
    }
}
