//
//  CollectVideo.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 19/04/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//

//  View hien thi video lien quan voi video dang chay:

import UIKit

class CollectVideo: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectVideo: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = UIColor.clear
        return cv
    }()
    
    let cellId = "cellId"
    let imageNames = ["EmGaiMua", "TaConThuocVeNhau", "CongLinh", "TaConThuocVeNhau", "EmGaiMua"]
    let titles = ["EM GAI MUA - HUONG TRAM \n(OFFICIAL MV)", "Ta Con Thuoc Ve Nhau - \nHuong Tram \nOfficial Video Music", "EM GAI MUA - HUONG TRAM \n(OFFICIAL MV)", "EM GAI MUA - HUONG TRAM \n(OFFICIAL MV)", "EM GAI MUA - HUONG TRAM \n(OFFICIAL MV)"]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectVideo)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectVideo)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectVideo)
        collectVideo.register(CollectVideoCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectVideo.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectVideoCell
        cell.imageVideo.image = UIImage(named: imageNames[indexPath.item])
        cell.titleVideo.text = titles[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class CollectVideoCell: BaseCell {
    
    let imageVideo: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let titleVideo: UILabel = {
        let lbl = UILabel()
        lbl.text = "Em Gai Mua - Huong Tram"
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.numberOfLines = 3
        return lbl
    }()
    
    let moreInformation: UILabel = {
        let lbl = UILabel()
        lbl.text = "Hong hot Showbiz \n967 Tr views"
        lbl.numberOfLines = 2
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    let moreButton: UIButton = {
        let moreBut = UIButton()
        let image = UIImage(named: "more1")
        
        moreBut.setImage(image, for: .normal)
        return moreBut
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageVideo)
        addSubview(titleVideo)
        addSubview(moreInformation)
        addSubview(moreButton)
        addConstraintsWithFormat(format: "V:|-5-[v0(90)]-5-|", views: imageVideo)
        addConstraintsWithFormat(format: "H:|-10-[v0(160)]", views: imageVideo)
        
        addConstraintsWithFormat(format: "H:|-180-[v0]", views: titleVideo)
        addConstraintsWithFormat(format: "V:|-1-[v0]-1-[v1]", views: titleVideo, moreInformation)
        
        addConstraintsWithFormat(format: "H:|-180-[v0]|", views: moreInformation)
        
        addConstraintsWithFormat(format: "H:[v0(25)]-0-|", views: moreButton)
        addConstraintsWithFormat(format: "V:|-10-[v0(25)]", views: moreButton)
    }
}














