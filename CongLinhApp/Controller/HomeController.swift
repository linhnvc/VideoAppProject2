//
//  ViewController.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 04/03/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
//    var videos: [Video] = {
//
//        var congLinhChannel = Channel()
//        congLinhChannel.name = "Cong Linh"
//        congLinhChannel.profileImageName = "CongLinh"
//
//        var huongTramChannel = Channel()
//        huongTramChannel.name = "Huong Tram"
//        huongTramChannel.profileImageName = "profile_Huong_Tram"
//
//
//        var taConThuocVeNhau = Video()
//        taConThuocVeNhau.thumbnailImageName = "TaConThuocVeNhau"
//        taConThuocVeNhau.title = "Ta Con Thuoc Ve Nhau - Ta Con Thuoc Ve Nhau - Ta Con Thuoc Ve Nhau"
//        taConThuocVeNhau.channel = congLinhChannel
//        taConThuocVeNhau.numberOfViews = 1680986
//
//        var emGaiMua = Video()
//        emGaiMua.thumbnailImageName = "EmGaiMua"
//        emGaiMua.title = "Em Gai Mua"
//        emGaiMua.channel = huongTramChannel
//        emGaiMua.numberOfViews = 109097001
//
//        return [taConThuocVeNhau, emGaiMua, taConThuocVeNhau]
//    }()
    
    var videos: [Video]?
    
    func fetchVideos(){
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            if error != nil {
                print("error")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                self.videos = [Video]()
                print(json)
                for dictionary in json as! [[String: AnyObject]]{
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                    
                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
                    
                    let channel = Channel()
                    channel.name = channelDictionary["name"] as? String
                    channel.profileImageName = channelDictionary["profile_image_name"] as? String
                    
                    video.channel = channel
                    self.videos?.append(video)
                }
                
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }

            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchVideos()

        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false

        let titleLabel = UILabel(frame: CGRect(x: 25, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home 😀"
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        
        //day video trong Home xuong duoi NavigationBar
        collectionView?.contentInset = UIEdgeInsetsMake(16, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(16, 0, 0, 0)
        
        setupNavBarButtons()
        setupMenuBar()
        setupLine()
        setupLine2()
        
        }
    
    //Cai dat nut Tim kiem va Them tren NavigationBar
    func setupNavBarButtons(){
        let more = UIBarButtonItem(title: "•••", style: .plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [more]
    }
    
    lazy var settingsLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.homeController = self
        return launcher
    }()
    
    @objc func handleMore(){
        //hien thi menu tuy chon nhanh:
        settingsLauncher.showSttings()
    }
    
    func showControllerForSetting(setting: Setting) {
        //Chuyen sang giao dien moi:
        let dummySettingViewController = UIViewController()
        dummySettingViewController.view.backgroundColor = UIColor.white
        dummySettingViewController.navigationItem.title = setting.name
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        //cai dat mau tieu de tren NavigationBar:
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.red]
        
        navigationController?.pushViewController(dummySettingViewController, animated: true)
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    func setupMenuBar(){
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:[v0(50)]|", views: menuBar)
    }
    
    let line: UIView = {
        let l = UIView()
        l.backgroundColor = UIColor(displayP3Red: 181/255, green: 193/255, blue: 202/255, alpha: 1)
        return l
    }()
    
    func setupLine() {
        view.addSubview(line)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: line)
        view.addConstraintsWithFormat(format: "V:|[v0(1)]", views: line)
    }
    
    let line2: UIView = {
        let l2 = UIView()
        l2.backgroundColor = UIColor(displayP3Red: 181/255, green: 193/255, blue: 202/255, alpha: 1)
        return l2
    }()
    
    func setupLine2() {
        view.addSubview(line2)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: line2)
        view.addConstraintsWithFormat(format: "V:[v0(2)]-50-|", views: line2)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return videos?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        
        cell.video = videos?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9/16
        return CGSize(width: view.frame.width, height: height + 16 + 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


















