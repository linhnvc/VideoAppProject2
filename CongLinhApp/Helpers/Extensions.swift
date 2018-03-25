//
//  Extensions.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 04/03/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(displayP3Red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(displayP3Red: displayP3Red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

//dinh nghia addConstraints
extension UIView{
    func addConstraintsWithFormat(format: String, views: UIView...){
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

//tao vung dem cache de luu tam thoi anh, tranh phai load lai anh khi truot len xuong collectionview
let imageCache = NSCache<AnyObject, AnyObject>() //let imageCache = NSCache()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {
        let url = NSURL(string: urlString)
        
        image = nil //hien thi khoang trang khi chua load duoc anh
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
            self.image = imageFromCache
            return
        }
        URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) in
            if error != nil {
                print("error")
                return
            }

            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
            }
            
        }).resume()
    }
}



