//
//  BreakfastCell.swift
//  Ass7
//
//  Created by DCS on 06/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class BreakfastCell: UITableViewCell {
    private let myimageview:UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        return imageview
    }()
    
    private let mydata:UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 20)
        label.numberOfLines = 8
        return label
    }()
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize : 28)
        return label
    }()
    
    func setupBreakfastCellWiths(title name:String,title data:String){
        contentView.addSubview(myimageview)
        contentView.addSubview(myLabel)
        contentView.addSubview(mydata)
        
        myimageview.frame = CGRect(x: 20, y: 20, width: 120, height: 120)
        myLabel.frame = CGRect(x: myimageview.right+20, y: 20, width: 200, height: 80)
        mydata.frame = CGRect(x: myimageview.frame.origin.x+140, y: 70, width: 200, height: 100)
        myimageview.image = UIImage(named: name)
        myLabel.text = name
        mydata.text = data
    }
}
