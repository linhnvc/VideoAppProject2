//
//  VideoLauncher.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 09/04/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//  11:30 Ep17

import UIKit
import AVFoundation

//class VideoPlayerView: UIView {
//
//    //Bieu tuong loading giua man hinh
//    let activityIndicatorView: UIActivityIndicatorView = {
//        let act = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
//        act.translatesAutoresizingMaskIntoConstraints = false
//        act.startAnimating()
//        return act
//    }()
//
//    //Nut tam dung video:
//    lazy var pausePlayButton: UIButton = {
//        let button = UIButton()
//        let image = UIImage(named: "trending")
//        button.setImage(image, for: .normal)
//        button.tintColor = .white
//        //button.isHidden = true
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(handlePause), for: .touchUpInside)
//        return button
//    }()
//
//    var isPlaying = false
//
//    //Tam dung video:
//    @objc func handlePause() {
//        if isPlaying {
//            player?.pause()
//            print("Paused")
//            pausePlayButton.setImage(UIImage(named: "subscriptions"), for: .normal) //play
//        } else {
//            player?.play()
//            print("Playing")
//            pausePlayButton.setImage(UIImage(named: "trending"), for: .normal) //pause
//        }
//        isPlaying = !isPlaying
//    }
//
//    // controlsContainerView se la man che o phia tren cua video dang chay
//    let controlsContainerView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor(white: 0, alpha: 0.1)
//        return view
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        setupPlayerView()
//
//        //View nay se o phia tren video dang chay
//        controlsContainerView.frame = frame
//        addSubview(controlsContainerView)
//
//        //Bieu tuong loading giua man hinh
//        controlsContainerView.addSubview(activityIndicatorView)
//        activityIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        activityIndicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//
//        controlsContainerView.addSubview(pausePlayButton)
//        pausePlayButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        pausePlayButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        pausePlayButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        pausePlayButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
//        backgroundColor = .blue
//
//    }
//
//    var player: AVPlayer?
//
//
//    func setupPlayerView() {
//        let urlString = "https://firebasestorage.googleapis.com/v0/b/gameofchats-762ca.appspot.com/o/message_movies%2F12323439-9729-4941-BA07-2BAE970967C7.mov?alt=media&token=3e37a093-3bc8-410f-84d3-38332af9c726"
//        if let url = NSURL(string: urlString) {
//            player = AVPlayer(url: url as URL)
//
//            let playerLayer = AVPlayerLayer(player: player)
//            self.layer.addSublayer(playerLayer)
//            playerLayer.frame = self.frame
//
//            player?.play()
//
//
//            player?.addObserver(self, forKeyPath: key, options: .new, context: nil)
//        }
//    }
//
//    let key: String = "key"
//
//    //Khi load xong video:
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == key {
//            print("Done")
//            activityIndicatorView.stopAnimating()
//            controlsContainerView.backgroundColor = UIColor.clear
//            pausePlayButton.isHidden = false
//            isPlaying = true
//        }
//    }
//
//
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}









class VideoPlayerView: UIView {
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let act = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        act.translatesAutoresizingMaskIntoConstraints = false
        act.startAnimating()
        return act
    }()
    
    lazy var pausePlayButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "trending")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.isHidden = true
        
        button.addTarget(self, action: #selector(handlePause), for: .touchUpInside)
        
        return button
    }()
    
    var isPlaying = false
    
    @objc func handlePause() {
        if isPlaying {
            player?.pause()
            pausePlayButton.setImage(UIImage(named: "subscriptions"), for: .normal)
        } else {
            player?.play()
            pausePlayButton.setImage(UIImage(named: "trending"), for: .normal)
        }
        
        isPlaying = !isPlaying
    }
    
    let videoLengthLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "00:00"
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textAlignment = .right
        return lbl
    }()
    
    let currentTimeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "00:00"
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        return lbl
    }()
    
    lazy var videoSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = UIColor.red
        slider.maximumTrackTintColor = .white
        //slider.setThumbImage(UIImage(named: ""), for: .normal)
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        return slider
    }()
    
    @objc func handleSliderChange() {
        print(videoSlider.value)
        //videoSlider.value = so phan cua slider duoc keo di
        
        if let duration = player?.currentItem?.duration {
            let totalSeconds = CMTimeGetSeconds(duration) //tong do dai video theo don vi giay
            let value = Float64(videoSlider.value) * totalSeconds //thoi diem can chuyen den
            let seekTime = CMTime(value: Int64(value), timescale: 1)
            player?.seek(to: seekTime, completionHandler: { (completedSeek) in
                
            })
        }
        
    }
    
    let controlsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 1)
        return view
    }()
    
    let titleVideoLabel: UILabel = {
        let label = UILabel()
        label.text = "Cong Linh"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleVideo: UILabel = {
        let label = UILabel()
        label.text = "Hương Tràm và Công Linh công khai tình \ncảm"
        label.numberOfLines = 2
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfViews: UILabel = {
        let label = UILabel()
        label.text = "1.098.084 lượt xem"
        label.numberOfLines = 2
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    let chooseMenu: MenuBar = {
//        let cm = MenuBar()
//        return cm
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupPlayerView()
        setupGradientLayer()
        
        controlsContainerView.frame = frame
        addSubview(controlsContainerView)
        addSubview(titleVideo)
        addSubview(numberOfViews)
        //addSubview(chooseMenu)
        
        //chooseMenu.topAnchor.constraint(equalTo: numberOfViews.topAnchor, constant: 5).isActive = true
        //chooseMenu.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        
        titleVideo.topAnchor.constraint(equalTo: controlsContainerView.bottomAnchor, constant: 10).isActive = true
        titleVideo.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        //titleVideo.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        numberOfViews.topAnchor.constraint(equalTo: titleVideo.bottomAnchor, constant: 5).isActive = true
        numberOfViews.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        
        controlsContainerView.addSubview(titleVideoLabel)
        titleVideoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        titleVideoLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        
        
        controlsContainerView.addSubview(activityIndicatorView)
        activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        controlsContainerView.addSubview(pausePlayButton)
        pausePlayButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pausePlayButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pausePlayButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pausePlayButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        controlsContainerView.addSubview(videoLengthLabel)
        videoLengthLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -9).isActive = true
        videoLengthLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        videoLengthLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        videoLengthLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        controlsContainerView.addSubview(currentTimeLabel)
        currentTimeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 9).isActive = true
        currentTimeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        currentTimeLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        currentTimeLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        controlsContainerView.addSubview(videoSlider)
        videoSlider.rightAnchor.constraint(equalTo: videoLengthLabel.leftAnchor).isActive = true
        videoSlider.leftAnchor.constraint(equalTo: currentTimeLabel.rightAnchor).isActive = true
        videoSlider.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        videoSlider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        backgroundColor = .black
    }
    
    var player: AVPlayer?
    
    private func setupPlayerView() {

        let urlString = "https://firebasestorage.googleapis.com/v0/b/gameofchats-762ca.appspot.com/o/message_movies%2F12323439-9729-4941-BA07-2BAE970967C7.mov?alt=media&token=3e37a093-3bc8-410f-84d3-38332af9c726"
        if let url = NSURL(string: urlString) {
            player = AVPlayer(url: url as URL)
            
            let playerLayer = AVPlayerLayer(player: player)
            self.layer.addSublayer(playerLayer)
            playerLayer.frame = self.frame
            
            player?.play()
            
            player?.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
            
            let interval = CMTime(value: 1, timescale: 2)
            player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { (progressTime) in
                
                //Chay thoi gian khi video playing
                let seconds = CMTimeGetSeconds(progressTime)
                let secondsString = String(format: "%02d", Int(seconds) % 60)
                let minutesString = String(format: "%02d", Int(seconds) / 60)
                self.currentTimeLabel.text = "\(minutesString):\(secondsString)"
                
                //Chay slider:
                if let duration = self.player?.currentItem?.duration {
                    let durationSeconds = CMTimeGetSeconds(duration)
                    self.videoSlider.value = Float(seconds / durationSeconds)
                }
            })
        }
    }
    
    //Khi load xong va bat dau play video
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "currentItem.loadedTimeRanges" {
            //print("Done")
            activityIndicatorView.stopAnimating()
            controlsContainerView.backgroundColor = .clear
            pausePlayButton.isHidden = false
            isPlaying = true
            
            //Lay va Hien thi do dai video
            if let duration = player?.currentItem?.duration {
                let seconds = CMTimeGetSeconds(duration)
                let secondsText = Int(seconds) % 60
                //Hien thi so phut voi 2 chu so:
                let minutesText = String(format: "%02d", Int(seconds) / 60)
                videoLengthLabel.text = "\(minutesText):\(secondsText)"

            }
        }
    }
    
    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.7, 1.2]
        controlsContainerView.layer.addSublayer(gradientLayer)
    }
    
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




