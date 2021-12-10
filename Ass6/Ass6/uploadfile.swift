//
//  uploadfile.swift
//  Ass6
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class uploadfile: UIViewController {
    private let activity : UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.color = .blue
        activity.startAnimating()
        return activity
    }()
    private let progressbar : UIProgressView = {
       let prgs = UIProgressView()
        prgs.setProgress(0.0, animated: true)
        return prgs
    }()
    private let titlelabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Data Uploding............"
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 20)
        return label
    }()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 10.0){
            self.progressbar.setProgress(1.0, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(activity)
        view.addSubview(progressbar)
        view.addSubview(titlelabel)
    }
    override func viewDidLayoutSubviews() {
        activity.frame = CGRect(x: 150, y: 150, width: view.width-300, height: 30)
        progressbar.frame = CGRect(x: 60, y: 200, width: view.width-100, height: 30)
        titlelabel.frame = CGRect(x: 80, y: progressbar.bottom+60, width: view.width-100, height: 30)
    }
}
