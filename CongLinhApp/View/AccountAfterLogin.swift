////
////  AccountAfterLogin.swift
////  CongLinhApp
////
////  Created by nguyen van cong linh on 21/04/2018.
////  Copyright © 2018 nguyen van cong linh. All rights reserved.
////
//
//import UIKit
//
//class AccountAfterLogin: UIViewController {
//    let coverPhoto: UIImageView = {
//        let photo = UIImageView()
//        //photo.image = UIImage(named: "TaConThuocVeNhau")
//        photo.backgroundColor = UIColor.orange
//        return photo
//    }()
//    
//    let profileImage: UIImageView = {
//        let photo = UIImageView()
//        photo.image = UIImage(named: "CongLinh")
//        photo.layer.cornerRadius = 30
//        photo.layer.masksToBounds = true
//        return photo
//    }()
//    
//    let channelName: UILabel = {
//        let lbl = UILabel()
//        lbl.text = "Cong Linh"
//        lbl.font = UIFont.boldSystemFont(ofSize: 22)
//        return lbl
//    }()
//    
//    let numberOfViews: UILabel = {
//        let num = UILabel()
//        num.text = "1.098.456 subscribes"
//        num.textColor = UIColor.darkGray
//        num.font = UIFont.systemFont(ofSize: 15)
//        return num
//    }()
//    
//    let subList: SubList = {
//        let sL = SubList()
//        sL.translatesAutoresizingMaskIntoConstraints = false
//        return sL
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = UIColor.white
//        navigationItem.title = "Tài khoản"
//        
//        view.addSubview(coverPhoto)
//        view.addSubview(profileImage)
//        view.addSubview(channelName)
//        view.addSubview(numberOfViews)
//        view.addSubview(subList)
//        view.addConstraintsWithFormat(format: "H:|[v0]|", views: coverPhoto)
//        view.addConstraintsWithFormat(format: "V:|[v0(200)]", views: coverPhoto)
//        view.addConstraintsWithFormat(format: "H:|-20-[v0(60)]|", views: profileImage)
//        view.addConstraintsWithFormat(format: "V:|-170-[v0(60)]-20-[v1(80)]", views: profileImage, subList)
//        view.addConstraintsWithFormat(format: "H:|-90-[v0]", views: channelName)
//        view.addConstraintsWithFormat(format: "V:|-172-[v0]-4-[v1]", views: channelName, numberOfViews)
//        view.addConstraintsWithFormat(format: "H:|-90-[v0]", views: numberOfViews)
//        view.addConstraintsWithFormat(format: "H:|[v0]|", views: subList)
//        
//        
//    }
//}

