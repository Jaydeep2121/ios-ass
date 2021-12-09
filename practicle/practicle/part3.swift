//
//  part3.swift
//  practicle
//
//  Created by DCS on 29/10/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class part3: UIViewController {
    private let toolBars:UIToolbar = {
        let toolBar = UIToolbar()
        /*
         let item1 = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(handlecompose))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,target: nil,action: nil)
        let item2 = UIBarButtonItem(barButtonSystemItem: .camera, target:self, action: #selector(handlecamera))
        toolBar.items = [item1,space,item2]
         */
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,target: nil,action: nil)
        let gallery = UIBarButtonItem(barButtonSystemItem: .organize,target: self,action: #selector(handlegallery))
        let camera = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action:#selector(handlecamera))
        toolBar.items = [space,gallery,camera]
        return toolBar
    }()
    
    @objc private func handlegallery(){
        print("gallery called")
    }
    
    @objc private func handlecamera (){
        print("Camera Called")
    }
    private let myimageview:UIImageView = {
       let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds=true
        imageview.image = UIImage(named:"abc")
        return imageview
    }()
    private let imagepicker:UIImagePickerController = {
        let ip = UIImagePickerController()
        ip.allowsEditing = false
        return ip
    }()
        
    /*
    private let tabBar:UITabBar = {
        let tabbar = UITabBar()
        let item1 = UITabBarItem(tabBarSystemItem:.history,tag:1)
        let item2 = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        tabbar.items=[item1,item2]
        return tabbar
    }()
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(toolBars)
        
        //view.addSubview(toolBar)
        view.addSubview(myimageview)
        //imagepicker.delegate = self
        //view.addSubview(tabBar)
        //tabBar.delegate=self
    }
    
    override func viewDidLayoutSubviews() {
        
        let toolbarheight:CGFloat = view.safeAreaInsets.top + 40.0
        toolBars.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: toolbarheight)
        //myimageview.frame = CGRect(x: 20, y: toolBar.bottom+40, width: view.frame.size.width-40, height: 200)
        /*
         let tabbarheight:CGFloat = view.safeAreaInsets.bottom + 49.0
         tabBar.frame = CGRect(x: 0, y: view.frame.size.height-tabbarheight, width: view.frame.size.width, height: tabbarheight)
        */
    }
}
/*
extension part3 : UITabBarDelegate{
    func tabBar(_tabBar:UITabBar,didSelect item:UITabBarItem){
        print(item.tag)
    }
}
*/
