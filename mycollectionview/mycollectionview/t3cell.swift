//
//  t3cell.swift
//  mycollectionview
//
//  Created by DCS on 26/11/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class t3cell: UICollectionViewCell {
    private let imageview:UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFit
        imgview.clipsToBounds = true
        return imgview
    }()
    
    func setupCell(with status:Int) {
        contentView.addSubview(imageview)
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        imageview.frame = CGRect(x: 10, y: 10, width: 80, height: 80)
        
        //circle => O
        //cross => X
        
        let name = (status == 0 ) ? ("zero") : (status == 1 ? "multiply" : "")
        imageview.image = UIImage(named: name)
    }
}
