//
//  StudentVC.swift
//  Ass11
//
//  Created by DCS on 20/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//
import UIKit
import Foundation
class StudentVC: UIViewController {
    private let studviewbtn:UIButton = {
        let button = UIButton()
        button.setTitle("View Profile", for: .normal)
        button.addTarget(self, action: #selector(viewprofile), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .green
        button.layer.cornerRadius = 6
        return button
    }()
    private let noticeviewbtn:UIButton = {
        let button = UIButton()
        button.setTitle("View NoticeBoard", for: .normal)
        button.addTarget(self, action: #selector(viewnotice), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .green
        button.layer.cornerRadius = 6
        return button
    }()
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(studviewbtn)
        view.addSubview(noticeviewbtn)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        studviewbtn.frame = CGRect(x: 90, y: 200, width: 200, height: 70)
        noticeviewbtn.frame = CGRect(x: 90, y: studviewbtn.bottom+20, width: 200, height: 70)
    }
}
extension StudentVC{
    @objc func viewprofile(){
        let vc = ViewStudentData()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func viewnotice(){
        print("hello view notice")
    }
}
