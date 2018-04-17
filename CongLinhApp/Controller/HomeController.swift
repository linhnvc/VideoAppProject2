//
//  ViewController.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 04/03/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//  Ep12. 19:22

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
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
    
    let cellId = "cellId"
    let trendingCellId = "trendingCellId"
    let subscriptionCellId = "subscriptionCellId"
    
    let titles = ["Trang chủ", "Thịnh hành", "Đăng ký", "Tài khoản"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //navigationItem.title = "Cong Linh"
        //navigationController?.navigationBar.isTranslucent = false

        let titleLabel = UILabel(frame: CGRect(x: 25, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "  \("Trang chủ")"
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        navigationItem.titleView = titleLabel
        //navigationItem.largeTitleDisplayMode = .always
        
        setupCollectionView()
        setupNavBarButtons()
        setupMenuBar()
        setupLine()
        setupLine2()
        //navigationController?.navigationBar.prefersLargeTitles = true
        //navigationItem.largeTitleDisplayMode = .always

        }
    
    func setupCollectionView() {
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = UIColor.white
//        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
//        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(TrendingCell.self, forCellWithReuseIdentifier: trendingCellId)
        collectionView?.register(SubscriptionCell.self, forCellWithReuseIdentifier: subscriptionCellId)
        
        //day video trong Home xuong duoi NavigationBar
        collectionView?.contentInset = UIEdgeInsetsMake(16, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(16, 0, 0, 0)
        
        //dich chuyen dung 1 man hinh
        collectionView?.isPagingEnabled = true
    }
    
    let resultController = UICollectionViewController()
    
    //Cai dat nut Tim kiem va Them tren NavigationBar
    func setupNavBarButtons(){
        let more = UIBarButtonItem(title: "•••", style: .plain, target: self, action: #selector(handleMore))
        
        let search = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(handleSearch))
        navigationItem.rightBarButtonItems = [more, search]
        //navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: resultController)
        navigationItem.searchController = searchController
        
        
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
    
    @objc func handleSearch() {
        //navigationController?.pushViewController(SearchView(), animated: true)
    }
    
    //Truot den man hinh co chi so la tham so truyen vao
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: .left, animated: true)
        
        setTitleForIndex(index: menuIndex)
    }
    
    func setTitleForIndex(index: Int) {
        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.text = "  \(titles[index])"
            titleLabel.textColor = UIColor.black
            titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        }
    }
    
    
    func showControllerForSetting(setting: Setting) {
        //Chuyen sang giao dien moi:
        let dummySettingViewController = UIViewController()
        dummySettingViewController.view.backgroundColor = UIColor.blue
        dummySettingViewController.navigationItem.title = setting.name.rawValue
        
        //mau navigationBar man hinh chuyen den
        navigationController?.navigationBar.barTintColor = UIColor.rgb(displayP3Red: 182, green: 231, blue: 195)
        
        //cai dat mau tieu de tren NavigationBar:
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.red]
        
//        if setting.name.rawValue == "Tìm kiếm" {
//            //navigationController?.pushViewController(SearchView(), animated: true)
//        } else {
            navigationController?.pushViewController(dummySettingViewController, animated: true)
//        }
    }
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeController = self
        return mb
    }()
    
    func setupMenuBar(){
        
        //navigationController?.hidesBarsOnSwipe = true
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:[v0(50)]|", views: menuBar)
        
        //menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
    }
    
    let line: UIView = {
        let l = UIView()
        l.backgroundColor = UIColor(displayP3Red: 181/255, green: 193/255, blue: 202/255, alpha: 1)
        return l
    }()
    
    func setupLine() {
        view.addSubview(line)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: line)
        view.addConstraintsWithFormat(format: "V:|[v0(2)]", views: line)
    }
    
    let line2: UIView = {
        let l2 = UIView()
        l2.backgroundColor = UIColor(displayP3Red: 181/255, green: 193/255, blue: 202/255, alpha: 1)
        l2.backgroundColor = .rgb(displayP3Red: 109, green: 207, blue: 135)
        return l2
    }()
    
    func setupLine2() {
        view.addSubview(line2)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: line2)
        view.addConstraintsWithFormat(format: "V:[v0(1)]-50-|", views: line2)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x/4
    }
    
    
    //Lam sang bieu tuong tren menu bar khi truot toi
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: .left)
       
        setTitleForIndex(index: Int(index))
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier: String
        
        //Trending
        if indexPath.item == 1 {
            identifier = trendingCellId
        }
        //Subscription
        else if indexPath.item == 2 {
            identifier = subscriptionCellId
        }
        else {
            identifier = cellId
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
//        let colors: [UIColor] = [UIColor.blue, UIColor.yellow, UIColor.red, UIColor.green]
//        cell.backgroundColor = colors[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 70)
    }


}


















