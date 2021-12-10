//
//  ViewController.swift
//  Ass9
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let imgpicker = UIImagePickerController()
    
    private let imgview :UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.backgroundColor = .gray
        imgview.image = UIImage(named: "bg_UI")
        imgview.clipsToBounds = true
        return imgview
    }()
    private let Upbtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Select Image", for: .normal)
        btn.backgroundColor = .lightGray
        btn.addTarget(self, action: #selector(Upload), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imgview)
        view.addSubview(Upbtn)
        imgpicker.delegate = self
    }
    
    @objc func Upload(){
        imgpicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imgpicker, animated: true)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imgview.frame = CGRect(x: 20, y:100, width: 80, height: 100)
        Upbtn.frame = CGRect(x: 100, y: view.bottom-50, width: view.width-200, height: 40)
    }
}
extension ViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let getimage = info[.originalImage] as? UIImage{
            imgview.image = getimage
        }
        imgpicker.dismiss(animated: true)
    }
}
