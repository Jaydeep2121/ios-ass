//
//  nextScreenCollectionViewCell.swift
//  Ass6
//
//  Created by DCS on 09/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class nextScreenCollectionViewCell: UIViewController {
    private let titlelabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Registration"
        label.font = UIFont.italicSystemFont(ofSize: 50)
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 50)
        return label
    }()
    private let rember:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "auto login after registration"
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 20)
        return label
    }()
    private let rembrswitch:UISwitch = {
        let swit = UISwitch()
        swit.isOn = false
        swit.onTintColor = .green
        return swit
    }()
    private let nametextfield:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter Email"
        textfield.textAlignment = .center
        textfield.layer.borderWidth = 1
        return textfield
    }()
    private let dob:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "DOB"
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 20)
        return label
    }()
    private let Datepicker : UIDatePicker = {
        let dp = UIDatePicker()
        dp.timeZone = NSTimeZone.local
        dp.datePickerMode = UIDatePicker.Mode.date
        return dp
    }()
    private let mysegment : UISegmentedControl = {
        let sg = UISegmentedControl()
        sg.insertSegment(withTitle: "Male", at: 0, animated: true)
        sg.insertSegment(withTitle: "Female", at: 1, animated: true)
        sg.insertSegment(withTitle: "TransGender", at: 2, animated: true)
        return sg
    }()
    private let slider : UISlider = {
       let slide = UISlider()
        slide.minimumValue = 0
        slide.maximumValue = 10
        slide.minimumTrackTintColor = .green
        return slide
    }()
    private let steplbl:UILabel = {
       let lbl = UILabel()
        lbl.text = "1"
        return lbl
    }()
    private let weit:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Weight"
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 20)
        return label
    }()
    private let mystepper:UIStepper = {
       let steppr = UIStepper()
        steppr.minimumValue = 1
        steppr.maximumValue = 100
        steppr.value = 1
        steppr.addTarget(self, action: #selector(changestep), for: .touchUpInside)
        return steppr
    }()
    
    private let imgpicker = UIImagePickerController()
    
    private let imgview :UIImageView = {
       let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
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
    private let uploaddata:UIButton = {
        let button = UIButton()
        button.setTitle("SUBMIT", for: .normal)
        button.addTarget(self, action: #selector(datauploading), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 0.4, green: 1.0, blue: 0.2, alpha: 0.5)
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    @objc func datauploading(){
        let UP = uploadfile()
        navigationController?.pushViewController(UP, animated: true)
    }
    @objc func changestep(){
        steplbl.text = "\(Int(mystepper.value))"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titlelabel)
        view.addSubview(rembrswitch)
        view.addSubview(rember)
        view.addSubview(nametextfield)
        view.addSubview(dob)
        view.addSubview(Datepicker)
        view.addSubview(mysegment)
        view.addSubview(slider)
        view.addSubview(steplbl)
        view.addSubview(mystepper)
        view.addSubview(weit)
        view.addSubview(imgview)
        imgpicker.delegate = self
        view.addSubview(Upbtn)
        view.addSubview(uploaddata)
    }
    override func viewDidLayoutSubviews() {
        titlelabel.frame = CGRect(x: 10, y: 50, width: view.width, height: 100)
        rembrswitch.frame = CGRect(x: 10, y: titlelabel.frame.origin.y+100, width: view.width-40, height: 30)
        rember.frame = CGRect(x: 0, y: rembrswitch.frame.origin.y+2, width: view.width-40, height: 30)
        nametextfield.frame = CGRect(x: 30, y: rember.bottom+20, width: view.width-60, height: 40)
        dob.frame = CGRect(x: 0, y: nametextfield.bottom+7, width: 50, height: 50)
        Datepicker.frame = CGRect(x: 30, y: nametextfield.bottom+10, width: view.width-60, height: 40)
        mysegment.frame = CGRect(x: 30, y: Datepicker.bottom+10, width: view.width-60, height: 30)
        slider.frame = CGRect(x: 30, y: mysegment.bottom+10, width: view.width-40, height: 30)
        weit.frame = CGRect(x: -15, y: slider.bottom, width: 90, height: 50)
        steplbl.frame = CGRect(x: 180, y: slider.bottom, width: 50, height: 50)
        mystepper.frame = CGRect(x: 60, y: slider.bottom+10, width: view.width-40, height: 30)
        imgview.frame = CGRect(x: 20, y: mystepper.bottom+20, width: 80, height: 100)
        Upbtn.frame = CGRect(x: imgview.left+100, y: mystepper.bottom+80, width: view.width-200, height: 40)
        uploaddata.frame = CGRect(x: 20, y: Upbtn.bottom+30, width: view.width-40, height: 40)
    }
    @objc func Upload(){
        imgpicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imgpicker, animated: true)
        }
    }
}
extension nextScreenCollectionViewCell : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let getimage = info[.originalImage] as? UIImage{
            imgview.image = getimage
        }
        imgpicker.dismiss(animated: true)
    }
}
