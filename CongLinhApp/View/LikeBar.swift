//
//  LikeBar.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 18/04/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//

//  Thanh tuy chon trong Video Player View: Like, Dislike,...

import UIKit

class LikeBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //cv.backgroundColor = UIColor.red
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    let imageNames = ["home", "trending", "subscriptions", "account", "trending"]
    let titles = ["509K", "32K", "Chia sẻ", "Tải xuống", "Thêm vào"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(LikeCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LikeCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])
        cell.title.text = titles[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/5, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class LikeCell: BaseCell {
    
    let likeButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Like", for: .normal)
        //btn.tintColor = .black
        return btn
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "trending")
        iv.tintColor = UIColor.rgb(displayP3Red: 183, green: 183, blue: 183)
        return iv
    }()
    
    let title: UILabel = {
        let lbl = UILabel()
        lbl.text = "Like"
        lbl.textColor = UIColor.darkGray
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    

    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.white
        
        addSubview(imageView)
        addSubview(title)
        addConstraintsWithFormat(format: "H:[v0(30)]", views: imageView)
        addConstraintsWithFormat(format: "H:[v0]", views: title)
        addConstraintsWithFormat(format: "V:[v0(30)][v1]", views: imageView, title)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: title, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        

    }
}







