//
//  AccountInfomation.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 19/04/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//

import UIKit

class AccountInformation: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "CongLinh")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let line1: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.rgb(displayP3Red: 185, green: 185, blue: 185)
        return line
    }()
    
    let line2: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.rgb(displayP3Red: 185, green: 185, blue: 185)
        return line
    }()
    
    let channelName: UILabel = {
        let name = UILabel()
        name.text = "Cong Linh"
        name.font = UIFont.boldSystemFont(ofSize: 17)
        return name
    }()
    
    let numberOfSubs: UILabel = {
        let num = UILabel()
        num.text = "1.954.084 subscribes"
        num.font = UIFont.systemFont(ofSize: 14)
        num.textColor = UIColor.darkGray
        return num
    }()
    
    let buttonSub: UIButton = {
        let but = UIButton()
        but.setTitle("Subscribe", for: .normal)
        but.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        but.titleLabel?.textColor = UIColor.blue
        but.backgroundColor = .red
        
        //but.setImage(UIImage(named: "trending"), for: .normal)
        return but
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(line1)
        addSubview(line2)
        addSubview(channelName)
        addSubview(numberOfSubs)
        addSubview(buttonSub)
        addConstraintsWithFormat(format: "V:|[v0(1)]-[v1(40)]-[v2(1)]|", views:line1, imageView, line2)
        addConstraintsWithFormat(format: "H:|-10-[v0(40)]-10-[v1(200)]", views: imageView, channelName)
        addConstraintsWithFormat(format: "H:|[v0]|", views: line1)
        addConstraintsWithFormat(format: "H:|[v0]|", views: line2)
        addConstraintsWithFormat(format: "V:|-10-[v0]-3-[v1]", views: channelName, numberOfSubs)
        addConstraintsWithFormat(format: "H:|-60-[v0(200)]|", views: numberOfSubs)
        addConstraintsWithFormat(format: "H:[v0(100)]-10-|", views: buttonSub)
        addConstraintsWithFormat(format: "V:|-15-[v0(30)]|", views: buttonSub)
        
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}







