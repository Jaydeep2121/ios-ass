//
//  ViewController.swift
//  Ass6
//
//  Created by DCS on 09/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//
//label
//textfield
//button
//
import UIKit

class ViewController: UIViewController {

    private let titlelabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Your Profile"
        label.font = UIFont.italicSystemFont(ofSize: 50)
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 50)
        return label
    }()
    private let dscr:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Log In or sign up to view your complete profile"
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 20)
        return label
    }()
    private let nextbtn:UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.addTarget(self, action: #selector(clickbutton), for: .touchUpInside)
        button.tintColor = .red
        button.backgroundColor = UIColor.black
        //button.backgroundColor = UIColor(red: 0.4, green: 1.0, blue: 0.2, alpha: 0.5)
        button.layer.cornerRadius = 6
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titlelabel)
        view.addSubview(dscr)
        view.addSubview(nextbtn)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titlelabel.frame = CGRect(x: 10, y: 50, width: view.width, height: 100)
        dscr.frame = CGRect(x: 2, y: 150, width: view.width, height: 30)
        nextbtn.frame = CGRect(x: 20, y: 200, width: view.width-35, height: 50)
    }
    @objc func clickbutton(){
        print("hi")
        let sc = nextScreenCollectionViewCell()
        navigationController?.pushViewController(sc, animated: true)
        present(sc, animated: true, completion: nil)
    }
}


