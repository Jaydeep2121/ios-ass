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
        textfield.textColor = .white
        textfield.placeholder = "Enter Email"
        textfield.textAlignment = .center
        textfield.backgroundColor = .white
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
    }
}
