//
//  VideoLauncher.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 09/04/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//  11:30 Ep17

import UIKit
import AVFoundation

class VideoPlayerView: UIView {
    
    //Bieu tuong loading giua man hinh
    let activityIndicatorView: UIActivityIndicatorView = {
        let act = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        act.translatesAutoresizingMaskIntoConstraints = false
        act.startAnimating()
        return act
    }()
    
    //Nut tam dung video:
    let pauseButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "pause")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // controlsContainerView se la man che o phia tren cua video dang chay
    let controlsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupPlayerView()
        
        //View nay se o phia tren video dang chay
        controlsContainerView.frame = frame
        addSubview(controlsContainerView)
        
        //Bieu tuong loading giua man hinh
        //controlsContainerView.addSubview(activityIndicatorView)
        //activityIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //activityIndicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        controlsContainerView.addSubview(pauseButton)
        pauseButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pauseButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pauseButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pauseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        backgroundColor = .blue
        
    }
    
    func setupPlayerView() {
        let urlString = "https://firebasestorage.googleapis.com/v0/b/gameofchats-762ca.appspot.com/o/message_movies%2F12323439-9729-4941-BA07-2BAE970967C7.mov?alt=media&token=3e37a093-3bc8-410f-84d3-38332af9c726"
        if let url = NSURL(string: urlString) {
            let player = AVPlayer(url: url as URL)
            
            let playerLayer = AVPlayerLayer(player: player)
            self.layer.addSublayer(playerLayer)
            playerLayer.frame = self.frame
            
            player.play()
            
            
            //player.addObserver(self, forKeyPath: "done", options: .new, context: nil)
        }
    }
    
    //An xoay tron loading giua man hinh khi da load xong video:
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "done" {
//            print("Done")
//            activityIndicatorView.stopAnimating()
//            controlsContainerView.backgroundColor = UIColor.clear
//        }
//    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





class VideoLauncher: NSObject {
    
    //Xu ly khi chon vao 1 video: chuyen sang man hinh moi, chay video
    func showVideoPlayer() {
        print("Showing Video")
        
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = .white
            
            //Dinh dang cho man hinh hien thi video
            view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10)
            
            let videoPlayerFrame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: keyWindow.frame.width * 9 / 16)
            let videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
            view.addSubview(videoPlayerView)
            
            keyWindow.addSubview(view)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view.frame = keyWindow.frame
                
            }, completion: { (completedAnimation) in
                //Tu dong an thanh trang thai khi video duoc chay:
                UIApplication.shared.setStatusBarHidden(true, with: .fade)
            })
        }
    }
}




