//
//  CityCell.swift
//  tableview
//
//  Created by DCS on 26/11/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    
    private let myimageview:UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.layer.cornerRadius = 40
        imageview.clipsToBounds = true
        return imageview
    }()
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize : 28)
        return label
    }()
    
    func setupCityCellWith(title name:String){
        contentView.addSubview(myimageview)
        contentView.addSubview(myLabel)
        
        myimageview.frame = CGRect(x: 20, y: 20, width: 80, height: 80)
        myLabel.frame = CGRect(x: myimageview.right+20, y: 20, width: 200, height: 80)
        myimageview.image = UIImage(named: name)
        myLabel.text = name
    }
    
}
