//
//  LikedVideosList.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 22/04/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//

import UIKit

class LikedVideosList: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let likedVideosLabel: UILabel = {
        let label = UILabel()
        label.text = "Liked Videos"
        label.textColor = UIColor.darkGray
        return label
    }()
    
    let line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.rgb(displayP3Red: 183, green: 183, blue: 183)
        return line
    }()
    
    lazy var collectLikesVideos: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageVideoNames.count
    }
    
    let cellID = "cell"
    let imageVideoNames = ["TaConThuocVeNhau", "EmGaiMua", "profile_Huong_Tram", "profile_Huong_Tram"]
    let nameOfVideos = ["Ta con thuoc ve nhau", "Em gai mua", "Huong Tram", "aaa"]
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectLikesVideos.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! LikedVideosListCell
        cell.imageVideo.image = UIImage(named: imageVideoNames[indexPath.item])
        cell.nameOfVideo.text = nameOfVideos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: collectLikesVideos.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        collectLikesVideos.register(LikedVideosListCell.self, forCellWithReuseIdentifier: cellID)
        addSubview(likedVideosLabel)
        addSubview(line)
        addSubview(collectLikesVideos)
        
        addConstraintsWithFormat(format: "H:|-4-[v0]-5-[v1(1000)]", views: likedVideosLabel, line)
        addConstraintsWithFormat(format: "V:|[v0]", views: likedVideosLabel)
        addConstraintsWithFormat(format: "V:|-14-[v0(1)]", views: line)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectLikesVideos)
        addConstraintsWithFormat(format: "V:|[v0][v1]|", views: likedVideosLabel, collectLikesVideos)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




class LikedVideosListCell: BaseCell {
    
    let imageVideo: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "TaConThuocVeNhau")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let nameOfVideo: UILabel = {
        let label = UILabel()
        label.text = "Em gai mua"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageVideo)
        addSubview(nameOfVideo)
        
        addConstraintsWithFormat(format: "H:[v0(128)]", views: imageVideo)
        addConstraintsWithFormat(format: "H:[v0]", views: nameOfVideo)
        addConstraintsWithFormat(format: "V:|-10-[v0(72)]-5-[v1]", views: imageVideo, nameOfVideo)
        addConstraint(NSLayoutConstraint(item: imageVideo, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: nameOfVideo, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
    }
}




















