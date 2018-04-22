//
//  AccountCell.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 20/04/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//

import UIKit

class AccountCell: BaseCell {
    
    let coverPhoto: UIImageView = {
        let imageView = UIImageView()
        //imageView.image = UIImage(named: "TaConThuocVeNhau")
        //imageView.contentMode = .scaleAspectFill
        //imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.rgb(displayP3Red: 183, green: 183, blue: 183)
        return imageView
    }()
    
    let buttonAddCoverPhoto: UIButton = {
        let btn = UIButton()
        btn.setTitle("Thêm ảnh bìa", for: .normal)
        btn.titleLabel?.textColor = UIColor.white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return btn
    }()
    
    
    
    let avatar: UIImageView = {
        let avatar = UIImageView()
        avatar.image = UIImage(named: "CongLinh")
        avatar.layer.cornerRadius = 30
        avatar.layer.masksToBounds = true
        return avatar
    }()
    
    let channelName: UILabel = {
        let label = UILabel()
        label.text = "Cong Linh"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let numberOfSubscribes: UILabel = {
        let num = UILabel()
        num.text = "2.089.036 subscribes"
        num.font = UIFont.systemFont(ofSize: 15)
        num.textColor = .darkGray
        return num
    }()
    
    
    
    let subList: SubList = {
        let sublist = SubList()
        return sublist
    }()
    
    let likedVideosList: LikedVideosList = {
        let list = LikedVideosList()
        return list
    }()
    
    let myChannel: MyChannel = {
        let myChannel = MyChannel()
        return myChannel
    }()
    
    override func setupViews() {
        
        addSubview(coverPhoto)
        addSubview(buttonAddCoverPhoto)
        addSubview(avatar)
        addSubview(channelName)
        addSubview(numberOfSubscribes)
        addSubview(subList)
        addSubview(likedVideosList)
        addSubview(myChannel)
        backgroundColor = .clear
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: coverPhoto)
        addConstraintsWithFormat(format: "V:[v0(120)]", views: coverPhoto)
        
        addConstraintsWithFormat(format: "H:|-20-[v0(60)]", views: avatar)
        addConstraintsWithFormat(format: "V:|-90-[v0(60)]-20-[v1(100)]-20-[v2(125)]-20-[v3(125)]", views: avatar, subList, likedVideosList, myChannel)
        
        addConstraintsWithFormat(format: "H:[v0]", views: buttonAddCoverPhoto)
        addConstraint(NSLayoutConstraint(item: buttonAddCoverPhoto, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraintsWithFormat(format: "V:|-50-[v0]", views: buttonAddCoverPhoto)
        
        addConstraintsWithFormat(format: "H:|-90-[v0]", views: channelName)
        addConstraintsWithFormat(format: "H:|-90-[v0]", views: numberOfSubscribes)
        addConstraintsWithFormat(format: "V:|-94-[v0]-6-[v1]", views: channelName, numberOfSubscribes)
        
        addConstraintsWithFormat(format: "H:|-10-[v0]|", views: subList)
        addConstraintsWithFormat(format: "H:|-10-[v0]|", views: likedVideosList)
        addConstraintsWithFormat(format: "H:|-10-[v0]|", views: myChannel)
    }
    
    
}










