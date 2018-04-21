//
//  CellSettingAccount.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 21/04/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//

import UIKit

class SettingAccount: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let id = "cellId"
    let imageNames = ["home", "trending", "subscriptions", "account", "trending"]
    let titles = ["Kenh cua toi", "Chuyen doi tai khoan", "Cai dat", "Dieu khoan va chinh sach bao mat", "Tro giup va phan hoi"]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red

        collectionView.register(SettingAccountCell.self, forCellWithReuseIdentifier: id)
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! SettingAccountCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])
        cell.title.text = titles[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    //Khi chon 1 tuy chon Cai dat
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        let accontSettingController = AccountSettingController()
        accontSettingController.didSelectCellSetingAccount(x: index)
        print(index)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





class SettingAccountCell: BaseCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "trending")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Kenh cua toi"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.rgb(displayP3Red: 229, green: 229, blue: 229)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    
    override func setupViews() {
        addSubview(imageView)
        addSubview(title)
        addSubview(line)
        addConstraintsWithFormat(format: "H:|-5-[v0(30)]-10-[v1]", views: imageView, title)
        addConstraintsWithFormat(format: "V:[v0(30)]", views: imageView)
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        addConstraintsWithFormat(format: "V:[v0(30)]", views: title)
        addConstraint(NSLayoutConstraint(item: title, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: line)
        addConstraintsWithFormat(format: "V:[v0(0.5)]|", views: line)
    }
}








