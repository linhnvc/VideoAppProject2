//
//  AccountSetting.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 19/04/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//

// View hien thi cai dat tai khoan: Settings/Login/...

import UIKit

class AccountSettingController: UIViewController {
    
    let coverPhoto: UIImageView = {
        let photo = UIImageView()
        //photo.image = UIImage(named: "TaConThuocVeNhau")
        photo.backgroundColor = UIColor.rgb(displayP3Red: 65, green: 124, blue: 62)
        return photo
    }()

    let profileImage: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "CongLinh")
        photo.layer.cornerRadius = 30
        photo.layer.masksToBounds = true
        return photo
    }()

    let channelName: UILabel = {
        let lbl = UILabel()
        lbl.text = "Cong Linh"
        lbl.textColor = UIColor.white
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        return lbl
    }()

    let numberOfViews: UILabel = {
        let num = UILabel()
        num.text = "1.098.456 subscribes"
        num.textColor = UIColor.darkGray
        num.font = UIFont.systemFont(ofSize: 15)
        return num
    }()

    let subList: SubList = {
        let sL = SubList()
        sL.translatesAutoresizingMaskIntoConstraints = false
        return sL
    }()
    
    let settingAccount: SettingAccount = {
        let cellSetting = SettingAccount()
        cellSetting.translatesAutoresizingMaskIntoConstraints = false
        return cellSetting
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Cong Linh"
        
        view.addSubview(coverPhoto)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: coverPhoto)
        view.addConstraintsWithFormat(format: "V:|[v0(200)]", views: coverPhoto)
        

        
        view.addSubview(profileImage)
        view.addSubview(channelName)
        view.addSubview(numberOfViews)
        //view.addSubview(subList)
        view.addSubview(settingAccount)
        
        view.addConstraintsWithFormat(format: "H:|-20-[v0(60)]|", views: profileImage)
        view.addConstraintsWithFormat(format: "V:|-170-[v0(60)]-10-[v1(500)]", views: profileImage, settingAccount)
        view.addConstraintsWithFormat(format: "H:|-90-[v0]", views: channelName)
        view.addConstraintsWithFormat(format: "V:|-172-[v0]-4-[v1]", views: channelName, numberOfViews)
        view.addConstraintsWithFormat(format: "H:|-90-[v0]", views: numberOfViews)
        view.addConstraintsWithFormat(format: "H:|-10-[v0]|", views: settingAccount)
        
    }
    
    
    //Chuyen man hinh khi chon 1 tuy chon trong Setting Account
    func didSelectCellSetingAccount(x: Int) {
        if x == 1 {
            print("Ban vua chon row thu 2")
            //present(ViewForTest(), animated: true, completion: nil)
            self.navigationController?.pushViewController(ViewForTest(), animated: true)
        }
        
        if x == 5 {
            print("Ban vua chon row thu 6")
            let alert: UIAlertController = UIAlertController(title: "Notification", message: "Ban co chac chan muon dang xuat", preferredStyle: UIAlertControllerStyle.actionSheet)
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alert: UIAlertController = UIAlertController(title: "Ban da dang nhap thanh cong", message: nil, preferredStyle: .alert)
        let buttonOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(buttonOk)
        present(alert, animated: true, completion: nil)
    }
    
}







