//
//  SubList.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 20/04/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//

import UIKit

class SubList: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId = "id"
    lazy var collectSubList: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let colectSub = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colectSub.backgroundColor = UIColor.blue
        colectSub.delegate = self
        colectSub.dataSource = self
        return colectSub
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.red
        collectSubList.register(SubListCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectSubList)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectSubList)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectSubList)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectSubList.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SubListCell
        cell.backgroundColor = UIColor.darkGray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.height, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
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
        addConstraintsWithFormat(format: "V:|-10-[v0(50)][v1]", views: profileImage, channelName)
        
        addConstraint(NSLayoutConstraint(item: profileImage, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: channelName, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
    }
}






