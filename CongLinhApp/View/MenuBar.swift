//
//  MenuBar.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 04/03/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    
    let cellId = "cellId"
    let imageNames = ["home", "trending", "subscriptions", "account"]
//    let labelText = ["home", "trending", "subscriptions", "account"]
    var homeController: HomeController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .rgb(displayP3Red: 182, green: 231, blue: 195)
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        let selectedIndextPath = NSIndexPath(item: 0, section: 0)
        //collectionView.selectItem(at: selectedIndextPath, animated: false, scrollPosition: .none)
        collectionView.selectItem(at: selectedIndextPath as IndexPath, animated: false, scrollPosition: .top)
        
        setupHorizontalBar()

    }
    
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    //Thanh truot duoi tuy chon trong Menu bar
    func setupHorizontalBar() {
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor.rgb(displayP3Red: 65, green: 124, blue: 62)
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
        
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        print(indexPath.item)
//        let x = CGFloat(indexPath.item) * frame.width/4
//        horizontalBarLeftAnchorConstraint?.constant = x
//        
//        //hieu ung dich chuyen horizontal
//        
//        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//            self.layoutIfNeeded()
//        }, completion: nil)
        
        
        
        homeController?.scrollToMenuIndex(menuIndex: indexPath.item)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        //cell.label = UILabel()
        cell.tintColor = UIColor.rgb(displayP3Red: 91, green: 14, blue: 13)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuCell: BaseCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor(displayP3Red: 163/255, green: 163/255, blue: 163/255, alpha: 1)
        return iv
    }()
    
//    let label: UILabel = {
//        let lb = UILabel()
//        return lb
//    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.rgb(displayP3Red: 65, green: 124, blue: 62) : UIColor(displayP3Red: 163/255, green: 163/255, blue: 163/255, alpha: 1)
            //rgb(displayP3Red: 91, green: 14, blue: 13)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.rgb(displayP3Red: 65, green: 124, blue: 62) : UIColor(displayP3Red: 163/255, green: 163/255, blue: 163/255, alpha: 1)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        //addSubview(label)
        addConstraintsWithFormat(format: "H:[v0(28)]", views: imageView)
        //addConstraintsWithFormat(format: "H:[v0(28)]", views: label)
        addConstraintsWithFormat(format: "V:[v0(28)]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))

    }
    
}







