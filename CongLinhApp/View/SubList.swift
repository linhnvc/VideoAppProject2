//
//  SubList.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 20/04/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//

import UIKit

class SubList: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let line1: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.rgb(displayP3Red: 183, green: 183, blue: 183)
        return line
    }()
    
    let subscribeLable: UILabel = {
        let label = UILabel()
        label.text = "Subscribes"
        label.textColor = UIColor.darkGray
        return label
    }()
    
    let cellId = "id"
    lazy var collectSubList: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let colectSub = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colectSub.backgroundColor = UIColor.white
        colectSub.delegate = self
        colectSub.dataSource = self
        return colectSub
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        collectSubList.register(SubListCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectSubList)
        addSubview(line1)
        addSubview(subscribeLable)
        addConstraintsWithFormat(format: "H:|-4-[v0]-5-[v1(1000)]", views: subscribeLable, line1)
        addConstraintsWithFormat(format: "V:|-14-[v0(1)]", views: line1)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectSubList)
        addConstraintsWithFormat(format: "V:|[v0][v1]|", views: subscribeLable, collectSubList)
        
        

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    let imageNames = ["profile_Huong_Tram", "CongLinh", "EmGaiMua", "TaConThuocVeNhau", "profile_Huong_Tram", "CongLinh"]
    let channelNames = ["Huong Tram", "CLVevo", "Zero9", "HoaBanFood", "CelineDion", "Adele"]
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectSubList.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SubListCell
        cell.profileImage.image = UIImage(named: imageNames[indexPath.item])
        cell.channelName.text = channelNames[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




class SubListCell: BaseCell {
    
    let profileImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "CongLinh")
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = 25
        return imgView
    }()
    
    let channelName: UILabel = {
        let name = UILabel()
        name.text = "Cong Linh"
        name.font = UIFont.systemFont(ofSize: 12)
        return name
    }()
    
    override func setupViews() {
        addSubview(profileImage)
        addSubview(channelName)
        addConstraintsWithFormat(format: "H:[v0(50)]", views: profileImage)
        addConstraintsWithFormat(format: "H:[v0]", views: channelName)
        addConstraintsWithFormat(format: "V:|-10-[v0(50)]-5-[v1]", views: profileImage, channelName)
        
        addConstraint(NSLayoutConstraint(item: profileImage, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: channelName, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
    }
}






