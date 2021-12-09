//
//  ViewController.swift
//  practicle
//
//  Created by DCS on 22/10/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //step 1
    private let myprogressview:UIProgressView = {
        let progressview = UIProgressView()
        progressview.setProgress(0.0, animated: true)
        return progressview
    }()
    /*
        private let pickerview = UIPickerView()
        private let pickerData1 = ["One","Two","Three"]
        private let pickerData2 = ["four","five","six"]
     */
    /*
        private let myImageView:UIImageView = {
            let imageview = UIImageView()
            imageview.contentMode = .scaleAspectFill
            imageview.clipsToBounds = true
            imageview.image = UIImage(named:"abc")
            return imageview
        }()
     */
    
    /*
        private let myslider:UISlider = {
            let slider=UISlider()
            slider.minimumValue = 0
            slider.maximumValue = 10
            slider.addTarget(self, action: #selector(handleslider), for: .valueChanged)
            return slider
        }()
     */	
//
//    @objc func handleslider(){
//        print(myslider.value)
//    }
//    private let myswitch:UISwitch = {
//        let switcher = UISwitch()
//        switcher.addTarget(self, action:#selector(handleswitch), for: .valueChanged)
//        return switcher
//    }()
//
//    @objc func handleswitch(){
//        print(myswitch.isOn)
//    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 10.0){
            self.myprogressview.setProgress(1.0, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // step 2
        //view.addSubview(myslider)
        //view.addSubview(myImageView)
        /*
         view.addSubview(pickerview)
         pickerview.dataSource = self
         pickerview.delegate = self
        */
        view.addSubview(myprogressview)
    }

    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        //step 3
//        myslider.frame = CGRect(x:20,y:60,width:view.frame.size.width-40,height: 30)
         //myImageView.frame = CGRect(x: 60, y: 200, width: 200, height: 200)
        //pickerview.frame = CGRect(x: 80, y: 200, width: 200, height: 100)
        myprogressview.frame = CGRect(x: 40, y: 200, width: view.frame.size.width - 80 , height: 40)
    }
}
/*
extension ViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return pickerData1.count
        }else{
            return pickerData2.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return pickerData1[row]
        }else{
            return pickerData2[row]
        }
    }
}
*/
