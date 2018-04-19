//
//  AccountSetting.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 19/04/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//

import UIKit

class AccountSetting: UIViewController {
    
    let coverPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "TaConThuocVeNhau")
        return photo
    }()
    
    let profileImage: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "CongLinh")
        photo.layer.cornerRadius = 30
        photo.layer.masksToBounds = true
        return photo
    }()
    
    let channelName: UILabel = {
        let lbl = UILabel()
        lbl.text = "Cong Linh"
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        return lbl
    }()
    
    let numberOfViews: UILabel = {
        let num = UILabel()
        num.text = "1.098.456 subscribes"
        num.textColor = UIColor.darkGray
        num.font = UIFont.systemFont(ofSize: 15)
        return num
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = "Tài khoản"
        
        view.addSubview(coverPhoto)
        view.addSubview(profileImage)
        view.addSubview(channelName)
        view.addSubview(numberOfViews)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: coverPhoto)
        view.addConstraintsWithFormat(format: "V:|[v0(200)]", views: coverPhoto)
        view.addConstraintsWithFormat(format: "H:|-10-[v0(60)]|", views: profileImage)
        view.addConstraintsWithFormat(format: "V:|-210-[v0(60)]|", views: profileImage)
        view.addConstraintsWithFormat(format: "H:|-80-[v0]", views: channelName)
        view.addConstraintsWithFormat(format: "V:|-220-[v0][v1]", views: channelName, numberOfViews)
        view.addConstraintsWithFormat(format: "H:|-80-[v0]", views: numberOfViews)
        
        
    }
    
}







